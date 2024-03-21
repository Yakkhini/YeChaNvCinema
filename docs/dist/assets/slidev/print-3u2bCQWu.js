import{d as _,_ as h,y as u,b as a,e as t,x as s,A as r,F as f,Z as v,o as n,$ as g,l as x,g as b}from"../modules/vue-BkAWdxgR.js";import{e as y,h as N,c as m,b as k}from"../index-CO0kf7nK.js";import{N as w}from"./NoteDisplay-CXTxhlye.js";import"../modules/shiki-CJh9h4kK.js";const D={id:"page-root"},L={class:"m-4"},T={class:"mb-10"},V={class:"text-4xl font-bold mt-2"},B={class:"opacity-50"},C={class:"text-lg"},H={class:"font-bold flex gap-2"},M={class:"opacity-50"},S=t("div",{class:"flex-auto"},null,-1),A={key:0,class:"border-main mb-8"},F=_({__name:"print",setup($){const{slides:d,total:p}=y();h(`
@page {
  size: A4;
  margin-top: 1.5cm;
  margin-bottom: 1cm;
}
* {
  -webkit-print-color-adjust: exact;
}
html,
html body,
html #app,
html #page-root {
  height: auto;
  overflow: auto !important;
}
`),N({title:`Notes - ${m.title}`});const i=u(()=>d.value.map(o=>{var l;return(l=o.meta)==null?void 0:l.slide}).filter(o=>o!==void 0&&o.noteHTML!==""));return(o,l)=>(n(),a("div",D,[t("div",L,[t("div",T,[t("h1",V,s(r(m).title),1),t("div",B,s(new Date().toLocaleString()),1)]),(n(!0),a(f,null,v(i.value,(e,c)=>(n(),a("div",{key:c,class:"flex flex-col gap-4 break-inside-avoid-page"},[t("div",null,[t("h2",C,[t("div",H,[t("div",M,s(e==null?void 0:e.no)+"/"+s(r(p)),1),g(" "+s(e==null?void 0:e.title)+" ",1),S])]),x(w,{"note-html":e.noteHTML,class:"max-w-full"},null,8,["note-html"])]),c<i.value.length-1?(n(),a("hr",A)):b("v-if",!0)]))),128))])]))}}),Z=k(F,[["__file","/home/yakkhini/Documents/Code/Marp/slidev/node_modules/@slidev/client/pages/presenter/print.vue"]]);export{Z as default};
