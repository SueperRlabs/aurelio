/* Presentation hooks only: no storage, scoring, authentication or data writes. */
(()=>{'use strict';
const reduce=matchMedia('(prefers-reduced-motion: reduce)');
const petals=document.querySelector('#roman-petals');let timer;
function celebrate(){if(reduce.matches||document.hidden)return;petals.replaceChildren();for(let i=0;i<12;i++){const p=document.createElement('i');p.className='roman-petal';p.style.left=(18+i*5.6)+'%';p.style.top=(18+(i%4)*9)+'%';p.style.animationDelay=(i*.025)+'s';petals.appendChild(p);}clearTimeout(timer);timer=setTimeout(()=>petals.replaceChildren(),2300);}
// The old fireworks function is exclusively a visual effect; replace its canvas work.
fireworks=celebrate;
const verdict=document.querySelector('#verdict');
new MutationObserver(()=>{const good=verdict.classList.contains('ok');const label=good?'CORRECTO':'RESPUESTA INCORRECTA';if(verdict.textContent!==label)verdict.textContent=label;document.querySelector('#feedback').classList.toggle('roman-correct',good);}).observe(verdict,{childList:true,characterData:true,subtree:true,attributes:true,attributeFilter:['class']});
const fb=document.querySelector('#feedback');new MutationObserver(()=>{if(fb.style.display==='block'&&verdict.classList.contains('ok'))celebrate();}).observe(fb,{attributes:true,attributeFilter:['style']});
const copy=document.querySelector('#master-map');new MutationObserver(()=>{if(copy.textContent.includes('Soy Master.'))copy.textContent=copy.textContent.replace('Soy Master.','Soy QUANTY.');}).observe(copy,{childList:true});
const views=[...document.querySelectorAll('.view')];function activeView(){const v=views.find(v=>v.classList.contains('active'));document.body.dataset.quantyView=v?.id.replace('view-','')||'intro';}
const viewObserver=new MutationObserver(activeView);views.forEach(v=>viewObserver.observe(v,{attributes:true,attributeFilter:['class']}));activeView();
// Reuse real product photography already in the base repository, not CSS drawings.
document.querySelectorAll('.scene-media').forEach((img,i)=>{img.src=i===0?'portada/fijo.webp':i===1?'quanty-master-assets/temple.webp':'quanty-master-assets/cover.webp';img.alt=['Taladro Reviva del módulo de producto','Templo de conocimiento QUANTY','QUANTY MASTER, conocimiento y tecnología'][i];});
document.addEventListener('visibilitychange',()=>{if(document.hidden)petals.replaceChildren();});
})();
