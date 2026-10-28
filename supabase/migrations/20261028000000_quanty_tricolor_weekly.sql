-- QUANTY MASTER · trivia semanal Tricolor
-- Aplicar en el proyecto Supabase usado por quanty-master-roman.html.
create table if not exists public.quanty_trivia_attempts (
  id uuid primary key default gen_random_uuid(),
  user_key text not null,
  seller_name text not null,
  chain text not null check (chain in ('Easy','Sodimac','Punto Maestro')),
  store_name text not null,
  week_start date not null,
  correct_count integer not null check (correct_count between 0 and 10),
  total_questions integer not null default 10 check (total_questions = 10),
  xp_requested integer not null default 0 check (xp_requested >= 0),
  duration_seconds integer not null default 0 check (duration_seconds >= 0),
  answers jsonb not null default '[]'::jsonb,
  status text not null default 'pendiente' check (status in ('pendiente','aprobado','rechazado')),
  review_note text,
  reviewed_by text,
  reviewed_at timestamptz,
  created_at timestamptz not null default now(),
  unique (user_key, week_start)
);
create index if not exists quanty_trivia_store_week_idx
  on public.quanty_trivia_attempts(chain, store_name, week_start, status);
alter table public.quanty_trivia_attempts enable row level security;
revoke all on public.quanty_trivia_attempts from anon, authenticated;

create or replace function public.quanty_submit_trivia(
  p_user_key text, p_seller_name text, p_chain text, p_store_name text,
  p_week_start date, p_correct_count integer, p_duration_seconds integer, p_answers jsonb
) returns jsonb language plpgsql security definer set search_path = public, pg_temp as $$
declare v_id uuid;
begin
  if coalesce(trim(p_user_key),'')='' or coalesce(trim(p_seller_name),'')='' or coalesce(trim(p_store_name),'')='' then
    raise exception 'Falta vendedor o tienda';
  end if;
  if p_chain not in ('Easy','Sodimac','Punto Maestro') then raise exception 'Cadena no válida'; end if;
  if p_correct_count < 0 or p_correct_count > 10 then raise exception 'Puntaje no válido'; end if;
  insert into public.quanty_trivia_attempts(user_key,seller_name,chain,store_name,week_start,correct_count,total_questions,xp_requested,duration_seconds,answers)
  values (p_user_key,p_seller_name,p_chain,p_store_name,date_trunc('week',coalesce(p_week_start,current_date)::timestamp)::date,p_correct_count,10,p_correct_count*100,p_duration_seconds,coalesce(p_answers,'[]'::jsonb))
  returning id into v_id;
  return jsonb_build_object('id',v_id,'status','pendiente');
exception when unique_violation then
  raise exception 'Ya completaste la trivia de esta semana. Puedes volver a jugar la próxima semana.';
end $$;

create or replace function public.quanty_my_week_status(p_user_key text)
returns table(id uuid, week_start date, status text, review_note text, correct_count integer, total_questions integer, chain text, store_name text, created_at timestamptz)
language sql security definer set search_path = public, pg_temp as $$
  select a.id,a.week_start,a.status,a.review_note,a.correct_count,a.total_questions,a.chain,a.store_name,a.created_at
  from public.quanty_trivia_attempts a
  where a.user_key=p_user_key
    and a.week_start=date_trunc('week',current_date::timestamp)::date
  order by a.created_at desc limit 1
$$;

create or replace function public.quanty_list_trivia(p_pin text, p_status text default 'pendiente')
returns setof public.quanty_trivia_attempts
language plpgsql security definer set search_path = public, pg_temp as $$
begin
  if coalesce(p_pin,'') <> '6060' then raise exception 'Clave de supervisor incorrecta'; end if;
  return query select * from public.quanty_trivia_attempts
    where (p_status='todos' or status=p_status) order by created_at desc;
end $$;

create or replace function public.quanty_review_trivia(p_pin text,p_attempt_id uuid,p_decision text,p_note text default null)
returns jsonb language plpgsql security definer set search_path = public, pg_temp as $$
begin
  if coalesce(p_pin,'') <> '6060' then raise exception 'Clave de supervisor incorrecta'; end if;
  if p_decision not in ('aprobado','rechazado') then raise exception 'Decisión no válida'; end if;
  if p_decision='rechazado' and coalesce(trim(p_note),'')='' then raise exception 'Indica el motivo del rechazo'; end if;
  update public.quanty_trivia_attempts
    set status=p_decision,review_note=nullif(trim(coalesce(p_note,'')),''),reviewed_by='Supervisor Quanty',reviewed_at=now()
    where id=p_attempt_id and status='pendiente';
  if not found then raise exception 'El intento no existe o ya fue revisado'; end if;
  return jsonb_build_object('ok',true,'status',p_decision);
end $$;

create or replace function public.quanty_weekly_ranking(p_pin text,p_week_start date default current_date)
returns table(chain text,store_name text,seller_name text,approved_points bigint,approved_tries bigint,best_score integer)
language plpgsql security definer set search_path = public, pg_temp as $$
declare v_week date := date_trunc('week',coalesce(p_week_start,current_date)::timestamp)::date;
begin
  if coalesce(p_pin,'') <> '6060' then raise exception 'Clave de supervisor incorrecta'; end if;
  return query select a.chain,a.store_name,a.seller_name,sum(a.xp_requested)::bigint,count(*)::bigint,max(a.correct_count)
    from public.quanty_trivia_attempts a where a.week_start=v_week and a.status='aprobado'
    group by a.chain,a.store_name,a.seller_name
    order by a.chain,a.store_name,sum(a.xp_requested) desc,max(a.correct_count) desc;
end $$;

revoke all on function public.quanty_submit_trivia(text,text,text,text,date,integer,integer,jsonb) from public;
revoke all on function public.quanty_my_week_status(text) from public;
revoke all on function public.quanty_list_trivia(text,text) from public;
revoke all on function public.quanty_review_trivia(text,uuid,text,text) from public;
revoke all on function public.quanty_weekly_ranking(text,date) from public;
grant execute on function public.quanty_submit_trivia(text,text,text,text,date,integer,integer,jsonb) to anon, authenticated;
grant execute on function public.quanty_my_week_status(text) to anon, authenticated;
grant execute on function public.quanty_list_trivia(text,text) to anon, authenticated;
grant execute on function public.quanty_review_trivia(text,uuid,text,text) to anon, authenticated;
grant execute on function public.quanty_weekly_ranking(text,date) to anon, authenticated;
