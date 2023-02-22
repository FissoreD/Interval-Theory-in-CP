// Generated by js_of_ocaml
//# buildInfo:effects=false, use-js-string=false, version=5.0.1+git-adf36c3-dirty
(function
   (globalThis)
   {"use strict";
    var
     runtime=globalThis.jsoo_runtime,
     caml_check_bound=runtime.caml_check_bound,
     caml_js_wrap_meth_callback=runtime.caml_js_wrap_meth_callback,
     caml_jsstring_of_string=runtime.caml_jsstring_of_string,
     caml_string_of_jsbytes=runtime.caml_string_of_jsbytes;
    function caml_call1(f,a0)
     {return f.length == 1?f(a0):runtime.caml_call_gen(f,[a0])}
    function caml_call2(f,a0,a1)
     {return f.length == 2?f(a0,a1):runtime.caml_call_gen(f,[a0,a1])}
    function caml_call3(f,a0,a1,a2)
     {return f.length == 3?f(a0,a1,a2):runtime.caml_call_gen(f,[a0,a1,a2])}
    function caml_call4(f,a0,a1,a2,a3)
     {return f.length == 4
              ?f(a0,a1,a2,a3)
              :runtime.caml_call_gen(f,[a0,a1,a2,a3])}
    var
     global_data=runtime.caml_get_global_data(),
     cst=caml_string_of_jsbytes(""),
     cst$0=caml_string_of_jsbytes("\n}\n"),
     cst_digraph=caml_string_of_jsbytes("digraph{\n"),
     cst_myMathLib=caml_string_of_jsbytes("myMathLib"),
     IntervalTheoryInCP_Parsing_com=
      global_data.IntervalTheoryInCP__Parsing_commands,
     Stdlib_Array=global_data.Stdlib__Array,
     IntervalTheoryInCP_Tree=global_data.IntervalTheoryInCP__Tree,
     IntervalTheoryInCP_Constraints=
      global_data.IntervalTheoryInCP__Constraints_eval,
     Js_of_ocaml_Js=global_data.Js_of_ocaml__Js;
    global_data.CamlinternalOO;
    var
     Stdlib_Printf=global_data.Stdlib__Printf,
     Stdlib=global_data.Stdlib,
     IntervalTheoryInCP_Memory=global_data.IntervalTheoryInCP__Memory,
     Stdlib_Int=global_data.Stdlib__Int,
     Stdlib_Set=global_data.Stdlib__Set,
     Stdlib_Hashtbl=global_data.Stdlib__Hashtbl,
     Set=caml_call1(Stdlib_Set[1],[0,Stdlib_Int[9]]),
     _a_=Set[1],
     x=[0,[0,caml_call2(Stdlib_Hashtbl[1],0,0),[0],_a_,0]],
     op=[0,0],
     dec=[0,3],
     precision=[0,0.1],
     _b_=
      [0,
       [11,
        caml_string_of_jsbytes("subgraph cluster_"),
        [4,
         0,
         0,
         0,
         [11,
          caml_string_of_jsbytes("{style=filled;color=lightpink;\n"),
          [2,0,[11,caml_string_of_jsbytes("}\n"),0]]]]],
       caml_string_of_jsbytes
        ("subgraph cluster_%d{style=filled;color=lightpink;\n%s}\n")],
     _c_=
      [0,
       [11,
        caml_string_of_jsbytes("subgraph cluster_"),
        [4,
         0,
         0,
         0,
         [11,
          caml_string_of_jsbytes("{style=filled;color=lightgrey;\n"),
          [2,0,[11,caml_string_of_jsbytes("}\n"),0]]]]],
       caml_string_of_jsbytes
        ("subgraph cluster_%d{style=filled;color=lightgrey;\n%s}\n")],
     _d_=
      [0,
       [11,
        caml_string_of_jsbytes("subgraph x"),
        [4,
         0,
         0,
         0,
         [11,
          caml_string_of_jsbytes("{\n"),
          [2,0,[11,caml_string_of_jsbytes("}\n"),0]]]]],
       caml_string_of_jsbytes("subgraph x%d{\n%s}\n")];
    function t8(param)
     {var match=x[1],pos$0=match[4],ignore=match[3],l=match[2],mem=match[1];
      if(-1 === pos$0)return Js_of_ocaml_Js[7];
      if(op[1])
       {var
         _l_=caml_check_bound(l,pos$0)[1 + pos$0],
         t=caml_call2(IntervalTheoryInCP_Tree[4],mem,_l_);
        caml_check_bound(l,pos$0)[1 + pos$0] = t;
        var
         ignore$0=
          caml_call2(IntervalTheoryInCP_Constraints[2],precision[1],mem)
           ?caml_call2(Set[4],pos$0,ignore)
           :ignore,
         max=l.length - 1,
         pos=pos$0;
        for(;;)
         {if(caml_call1(Set[22],ignore$0) === max)
           var next_pos=-1;
          else
           {var next=runtime.caml_mod(pos + 1 | 0,max);
            if(caml_call2(Set[3],next,ignore$0)){var pos=next;continue}
            var next_pos=next}
          x[1] = [0,mem,l,ignore$0,next_pos];
          break}}
      else
       {var
         _m_=caml_check_bound(l,pos$0)[1 + pos$0],
         t$0=caml_call2(IntervalTheoryInCP_Tree[3],mem,_m_);
        caml_check_bound(l,pos$0)[1 + pos$0] = t$0}
      var _k_=op[1]?0:1;
      op[1] = _k_;
      return Js_of_ocaml_Js[8]}
    function t7(param){return precision[1]}
    function t6(param,p){precision[1] = p;return 0}
    function t5(param,n){dec[1] = n;return 0}
    function t4(param)
     {var
       match=x[1],
       mem=match[1],
       _g_=
        caml_jsstring_of_string
         (caml_call2(IntervalTheoryInCP_Memory[4],[0,dec[1]],mem)),
       match$0=x[1],
       currentpos=match$0[4],
       ignore=match$0[3],
       t=match$0[2],
       mem$0=match$0[1];
      function _h_(pos,e)
       {var str=caml_call4(IntervalTheoryInCP_Tree[6],0,[0,dec[1]],mem$0,e);
        if(caml_call2(Set[3],pos,ignore))
         return caml_call3(Stdlib_Printf[4],_b_,pos,str);
        if(pos !== currentpos && -1 !== currentpos)
         return caml_call3(Stdlib_Printf[4],_d_,pos,str);
        return caml_call3(Stdlib_Printf[4],_c_,pos,str)}
      var
       _i_=caml_call2(Stdlib_Array[16],_h_,t),
       res=caml_call1(caml_call2(Stdlib_Array[17],Stdlib[28],cst),_i_),
       _j_=caml_call2(Stdlib[28],res,cst$0);
      return runtime.caml_js_from_array
              ([0,
                caml_jsstring_of_string
                 (caml_call2(Stdlib[28],cst_digraph,_j_)),
                _g_])}
    function t3(param,s)
     {var
       _e_=runtime.caml_string_of_jsstring(s),
       match=caml_call1(IntervalTheoryInCP_Parsing_com[1],_e_),
       t=match[2],
       mem=match[1],
       _f_=Set[1];
      x[1] = [0,mem,caml_call1(Stdlib_Array[12],t),_f_,0];
      return 0}
    caml_call2
     (Js_of_ocaml_Js[50],
      cst_myMathLib,
      {"send":caml_js_wrap_meth_callback(t3),
       "get":caml_js_wrap_meth_callback(t4),
       "setdec":caml_js_wrap_meth_callback(t5),
       "setprecision":caml_js_wrap_meth_callback(t6),
       "getprecision":caml_js_wrap_meth_callback(t7),
       "next":caml_js_wrap_meth_callback(t8)});
    var Dune_exe_Myjs=[0];
    runtime.caml_register_global(29,Dune_exe_Myjs,"Dune__exe__Myjs");
    return}
  (globalThis));

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLjAsImZpbGUiOiIubXlqcy5lb2Jqcy9qc29vL2R1bmVfX2V4ZV9fTXlqcy5jbW8uanMiLCJzb3VyY2VSb290IjoiIiwibmFtZXMiOlsieCIsIm9wIiwiZGVjIiwicHJlY2lzaW9uIiwicG9zJDAiLCJpZ25vcmUiLCJsIiwibWVtIiwidCIsImlnbm9yZSQwIiwibWF4IiwicG9zIiwibmV4dF9wb3MiLCJuZXh0IiwidCQwIiwicCIsIm4iLCJjdXJyZW50cG9zIiwibWVtJDAiLCJlIiwic3RyIiwicmVzIiwicyJdLCJzb3VyY2VzIjpbIi93b3Jrc3BhY2Vfcm9vdC9iaW4vbXlqcy5tbCJdLCJtYXBwaW5ncyI6Ijs7Ozs7STs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0lBS087Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7TUFrREUsVUFuRExBLEtBbURLO2dCQUFvQkksTUFrQmY7TUFqQmEsR0EvQ3ZCSDtRQXFENEM7OEJBUDlCSyxFQUFXRjtTQU9OLHdDQVBWRztRQVFFLGlCQVJHRCxFQUFXRixvQkFPVkk7UUFBNkI7U0FHNUI7dURBckRoQkwsYUEyQ1NJO1lBV1Msa0JBWE9ILE1BQVJDOztTQWNOLElBZEdDO1NBbkJFSyxJQW1CU1A7UUFsQjNCO1VBQUcsc0JBMkJjSyxjQTVCS0M7ZUFpQ0xFOztZQTlCZixJQUFJQyxLQUFKLGlCQUhnQkYsWUFBSUQ7WUFJakIscUJBRENHLEtBeUJXSixlQTVCQ0UsSUFHWkU7WUFBSixJQThCZUQsU0E5QlhDO1VBbkNKYixVQW1EU08sSUFBS0QsRUFTQ0csU0FLQUc7OztRQVY2Qjs4QkFKOUJOLEVBQVdGO1NBSU4sMENBSlZHO1FBS0UsaUJBTEdELEVBQVdGLG9CQUlWVTtNQUpWLFFBOUNMYjs7OEJBZ0VrQjtJQXBFZixtQkErQ3NCLE9BeEN6QkUsWUF3Q21DO0lBL0NoQyxrQkE4Q29CWSxHQUFJLGVBQUpBLEVBQUksUUFBYztJQTlDdEMsa0JBNkNjQyxHQUFJLFNBQUpBLEVBQUksUUFBUTtJQTdDMUI7TUFVTDthQVhFaEI7T0FXRjtPQUM4Qjs7VUFBOUIsMkNBTEVFLFFBSUVLO09BSUosUUFmRVA7T0FlRjs7OzttQkFHU1csSUFBSVE7UUFDRyxJQUFOQyxJQUFNLDJDQVpkbEIsUUFRRWdCLE1BR1NDO1FBRUoscUJBRkFSLElBSEdOO1NBTUosdUNBSENNLElBQ0NTO1dBRERULFFBSFdNO1NBV1QsdUNBUkZOLElBQ0NTO1FBS0YsdUNBTkNULElBQ0NTLElBTzhDO01BVHREOzJDQUZPWjtPQWFvQixlQUF4QjtPQUVVLDBCQWRYYTtNQTZCYzs7Z0JBZlU7a0JBQTVCO3FCQWU0RDtJQTVDdkQsa0JBd0NZQztNQUNpQzsyQ0FEakNBO09BQ0c7Ozs7TUFDRixVQURQZixJQUNPLDRCQURGQztNQUNFLFFBQThCO0lBSmhEOzs7Ozs7Ozs7OztVIiwic291cmNlc0NvbnRlbnQiOlsib3BlbiBJbnRlcnZhbFRoZW9yeUluQ1Bcbm9wZW4gSnNfb2Zfb2NhbWxcbm1vZHVsZSBTZXQgPSBTZXQuTWFrZSAoSW50KVxuXG5sZXQgeCA6IChNZW1vcnkudCAqIFRyZWUudHJlZSBhcnJheSAqIFNldC50ICogaW50KSByZWYgPVxuICByZWYgKEhhc2h0YmwuY3JlYXRlIDAsIFt8fF0sIFNldC5lbXB0eSwgMClcblxudHlwZSBvcCA9IFVQIHwgRE9XTlxuXG5sZXQgb3AgPSByZWYgVVBcbmxldCBuZXh0X29wICgpID0gb3AgOj0gbWF0Y2ggIW9wIHdpdGggVVAgLT4gRE9XTiB8IERPV04gLT4gVVBcbmxldCBkZWMgPSByZWYgM1xubGV0IHByZWNpc2lvbiA9IHJlZiAwLjFcblxubGV0IHRvX3N0cl9tZW0gKCkgPVxuICBsZXQgbWVtLCBfLCBfLCBfID0gIXggaW5cbiAgTWVtb3J5LnRvX3N0cmluZyB+ZGVjOiFkZWMgbWVtIHw+IEpzLnN0cmluZ1xuXG5sZXQgdG9fZG90ICgpID1cbiAgbGV0IG1lbSwgdCwgaWdub3JlLCBjdXJyZW50cG9zID0gIXggaW5cbiAgbGV0IHJlcyA9XG4gICAgQXJyYXkubWFwaVxuICAgICAgKGZ1biBwb3MgZSAtPlxuICAgICAgICBsZXQgc3RyID0gVHJlZS50b19kb3QgfmRlYzohZGVjIG1lbSBlIGluXG4gICAgICAgIGlmIFNldC5tZW0gcG9zIGlnbm9yZSB0aGVuXG4gICAgICAgICAgUHJpbnRmLnNwcmludGZcbiAgICAgICAgICAgIFwic3ViZ3JhcGggY2x1c3Rlcl8lZHtzdHlsZT1maWxsZWQ7Y29sb3I9bGlnaHRwaW5rO1xcbiVzfVxcblwiIHBvcyBzdHJcbiAgICAgICAgZWxzZSBpZiBwb3MgPSBjdXJyZW50cG9zIHx8IGN1cnJlbnRwb3MgPSAtMSB0aGVuXG4gICAgICAgICAgUHJpbnRmLnNwcmludGZcbiAgICAgICAgICAgIFwic3ViZ3JhcGggY2x1c3Rlcl8lZHtzdHlsZT1maWxsZWQ7Y29sb3I9bGlnaHRncmV5O1xcbiVzfVxcblwiIHBvcyBzdHJcbiAgICAgICAgZWxzZSBQcmludGYuc3ByaW50ZiBcInN1YmdyYXBoIHglZHtcXG4lc31cXG5cIiBwb3Mgc3RyKVxuICAgICAgdFxuICAgIHw+IEFycmF5LmZvbGRfbGVmdCAoIF4gKSBcIlwiXG4gIGluXG4gIFwiZGlncmFwaHtcXG5cIiBeIHJlcyBeIFwiXFxufVxcblwiIHw+IEpzLnN0cmluZ1xuXG5sZXQgcmVjIGZpbmRfbmV4dCBzIHBvcyBtYXggPVxuICBpZiBTZXQuY2FyZGluYWwgcyA9IG1heCB0aGVuIC0xXG4gIGVsc2VcbiAgICBsZXQgbmV4dCA9IChwb3MgKyAxKSBtb2QgbWF4IGluXG4gICAgaWYgU2V0Lm1lbSBuZXh0IHMgdGhlbiBmaW5kX25leHQgcyBuZXh0IG1heCBlbHNlIG5leHRcblxubGV0IF8gPVxuICBKcy5leHBvcnQgXCJteU1hdGhMaWJcIlxuICAgIChvYmplY3QlanNcbiAgICAgICBtZXRob2Qgc2VuZCBzID1cbiAgICAgICAgIGxldCBtZW0sIHQgPSBQYXJzaW5nX2NvbW1hbmRzLnBhcnNlX3N0cmluZyAoSnMudG9fc3RyaW5nIHMpIGluXG4gICAgICAgICB4IDo9IChtZW0sIEFycmF5Lm9mX2xpc3QgdCwgU2V0LmVtcHR5LCAwKVxuXG4gICAgICAgbWV0aG9kIGdldCA9IFt8IHRvX2RvdCAoKTsgdG9fc3RyX21lbSAoKSB8XSB8PiBKcy5hcnJheVxuICAgICAgIG1ldGhvZCBzZXRkZWMgbiA9IGRlYyA6PSBuXG4gICAgICAgbWV0aG9kIHNldHByZWNpc2lvbiBwID0gcHJlY2lzaW9uIDo9IHBcbiAgICAgICBtZXRob2QgZ2V0cHJlY2lzaW9uID0gIXByZWNpc2lvblxuXG4gICAgICAgbWV0aG9kIG5leHQgPVxuICAgICAgICAgbGV0IG1lbSwgbCwgaWdub3JlLCBwb3MgPSAheCBpblxuICAgICAgICAgaWYgcG9zIDw+IC0xIHRoZW4gKFxuICAgICAgICAgICAobWF0Y2ggIW9wIHdpdGhcbiAgICAgICAgICAgfCBVUCAtPlxuICAgICAgICAgICAgICAgbGV0IHQgPSBUcmVlLmV2YWxfYm90dG9tX3RvcCBtZW0gbC4ocG9zKSBpblxuICAgICAgICAgICAgICAgbC4ocG9zKSA8LSB0XG4gICAgICAgICAgIHwgRE9XTiAtPlxuICAgICAgICAgICAgICAgbGV0IHQgPSBUcmVlLmV2YWxfdG9wX2JvdHRvbSBtZW0gbC4ocG9zKSBpblxuICAgICAgICAgICAgICAgbC4ocG9zKSA8LSB0O1xuICAgICAgICAgICAgICAgbGV0IGlnbm9yZSA9XG4gICAgICAgICAgICAgICAgIGlmIENvbnN0cmFpbnRzX2V2YWwuc3RvcF9jb25kaXRpb24gfnByZWNpc2lvbjohcHJlY2lzaW9uIG1lbVxuICAgICAgICAgICAgICAgICB0aGVuIFNldC5hZGQgcG9zIGlnbm9yZVxuICAgICAgICAgICAgICAgICBlbHNlIGlnbm9yZVxuICAgICAgICAgICAgICAgaW5cbiAgICAgICAgICAgICAgIGxldCBuZXh0X3BvcyA9IGZpbmRfbmV4dCBpZ25vcmUgcG9zIChBcnJheS5sZW5ndGggbCkgaW5cbiAgICAgICAgICAgICAgIHggOj0gKG1lbSwgbCwgaWdub3JlLCBuZXh0X3BvcykpO1xuICAgICAgICAgICBuZXh0X29wICgpO1xuICAgICAgICAgICBKcy5fZmFsc2UpXG4gICAgICAgICBlbHNlIEpzLl90cnVlXG4gICAgZW5kKVxuIl19