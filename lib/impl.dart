library cs61a_scheme_impl;

import 'package:cs61a_scheme/cs61a_scheme.dart';
import 'package:cs61a_scheme/cs61a_scheme_extra.dart';

class StaffProjectImplementation extends ProjectInterface
    with UnimplementedAsync {
  Expression read(List<Expression> tokens) {
    // ignore: unused_element
    Expression tail() {
      Expression first = tokens.first;
      if (first is SchemeSymbol && first.value == ')') {
        // TODO: Implementation required; mirrors Problem 1 of project
      } else if (first is SchemeSymbol && first.value == '.') {
        // TODO: Implementation required; mirrors Problem 2 of project
      } else {
        // TODO: Implementation required; mirrors Problem 1 of project
      }
      return null;
    }

    Expression token = tokens.removeAt(0);
    if (token is! SchemeSymbol) return token;
    String value = (token as SchemeSymbol).value;
    switch (value) {
      case "'":
      // TODO: Implementation required; mirrors Problem 7 of project
      case '#':
        throw new SchemeException("Vectors not yet implemented.");
      case '`':
      // TODO: Implementation required
      case ',':
      // TODO: Implementation required
      case ',@':
      // TODO: Implementation required
      case '(':
      // TODO: Implementation required; mirrors Problem 1 of project
      default:
        if (value == '.') {
          throw new SchemeException("Unexpected token: $value");
        }
        return token;
    }
  }

  // Analagous to Frame.define and Frame.lookup in Problem 3
  void defineInFrame(SchemeSymbol symbol, Expression value, Frame env) {
    // TODO: Implementation required; mirrors Problem 3 of project
  }

  Expression lookupInFrame(SchemeSymbol symbol, Frame env) {
    // TODO: Implementation required; mirrors Problem 3 of project
    throw new SchemeException("Unknown identifier: $symbol");
  }

  // Analagous to BuiltinProcedure.apply in Problem 4
  Expression builtinApply(BuiltinProcedure proc, PairOrEmpty args, Frame env) {
    // TODO: Implementation required; mirrors Problem 4 of project
    return null; // replace
  }

  // Analagous to part of scheme_eval implemented in Problem 5
  Expression evalProcedureCall(Expression first, Expression rest, Frame env) {
    // TODO: Implementation required; mirrors Problem 5 of project
    return null; // replace
  }

  // Analagous to Procedure.eval_call in Problem 5
  Expression procedureCall(
      Procedure procedure, PairOrEmpty operands, Frame env) {
    // TODO: Implementation required; mirrors Problem 5 of project
    return null; // replace
  }

  // Analagous to do_define_form in Problems 6 and 10
  Expression doDefineForm(PairOrEmpty expressions, Frame env) {
    checkForm(expressions, 2);
    Expression target = expressions.first;
    if (target is SchemeSymbol) {
      checkForm(expressions, 2, 2);
      // TODO: Implementation required; mirrors Problem 5 of project
      return null; // replace
    } else if (target is Pair && target.first is SchemeSymbol) {
      // TODO: Implementation required; mirrors Problem 10 of project
      return null; // replace
    } else {
      throw new SchemeException("Invalid define form.");
    }
  }

  // Analagous to do_quote_form in Problem 7
  Expression doQuoteForm(PairOrEmpty expressions, Frame env) {
    checkForm(expressions, 1, 1);
    // TODO: Implementation required; mirrors Problem 7 of project
    return null; // replace
  }

  // Analagous to eval_all in Problem 8
  Expression evalAll(PairOrEmpty expressions, Frame env) {
    // TODO: Implementation required; mirrors Problem 8 of project
    return null; // replace
  }

  // Analagous to do_lambda_form in Problem 9
  LambdaProcedure doLambdaForm(PairOrEmpty expressions, Frame env) {
    checkForm(expressions, 2);
    Expression formals = expressions.pair.first;
    checkFormals(formals);
    // TODO: Implementation required; mirrors Problem 9 of project
    return null; // replace
  }

  // Analagous to Frame.make_child_frame in Problem 11
  Frame makeChildOf(Expression formals, Expression vals, Frame parent) {
    Frame child = new Frame(parent, parent.interpreter);
    // TODO: Implementation required; mirrors Problem 11 of project
    return child;
  }

  // Analagous to LambdaProcedure.make_call_frame in Problem 12
  Frame makeLambdaFrame(
      LambdaProcedure procedure, PairOrEmpty args, Frame env) {
    // TODO: Implementation required; mirrors Problem 12 of project
    return null; // replace
  }

  // Analagous to do_and_form and do_or_form in Problem 13
  Expression doAndForm(PairOrEmpty expressions, Frame env) {
    // TODO: Implementation required; mirrors Problem 13 of project
    return null; // replace
  }

  Expression doOrForm(PairOrEmpty expressions, Frame env) {
    // TODO: Implementation required; mirrors Problem 13 of project
    return null; // replace
  }

  // Analagous to part of do_cond_form in Problem 14
  Expression evalCondResult(PairOrEmpty clause, Frame env, Expression test) {
    // TODO: Implementation required; mirrors Problem 14 of project
    return null; // replace
  }

  // Analagous to make_let_frame in Problem 15
  Frame makeLetFrame(PairOrEmpty bindings, Frame env) {
    if (!bindings.isWellFormedList()) {
      throw new SchemeException("Bad bindings list in let form.");
    }
    // TODO: Implementation required; mirrors Problem 15 of project
    return null; // replace
  }

  // Analagous to MuProcedure.make_call_frame in Problem 16
  Frame makeMuFrame(MuProcedure procedure, PairOrEmpty args, Frame env) {
    // TODO: Implementation required; mirrors Problem 16 of project
    return null; // replace
  }

  // Analagous to do_mu_form in Problem 16
  MuProcedure doMuForm(PairOrEmpty expressions, Frame env) {
    checkForm(expressions, 2);
    Expression formals = expressions.pair.first;
    checkFormals(formals);
    // TODO: Implementation required; mirrors Problem 16 of project
    return null; // replace
  }

  // Code here works, but requires modifications for tail call support
  Expression doIfForm(PairOrEmpty expressions, Frame env) {
    checkForm(expressions, 2, 3);
    Expression predicate = expressions.first;
    if (schemeEval(predicate, env).isTruthy) {
      Expression consequent = expressions.elementAt(1);
      return schemeEval(consequent, env);
    } else if (expressions.length == 3) {
      Expression alternative = expressions.last;
      return schemeEval(alternative, env);
    }
    return undefined;
  }

  // Analagous to scheme_optimized_eval with tail=True in Problem 20 (EC)
  Expression tailEval(Expression expr, Frame env) {
    if (env.interpreter.tailCallOptimized) {
      // TODO: Implementation required for TCO. Mirrors Problem 20.
    }
    // If TCO disabled, just call schemeEval
    return schemeEval(expr, env);
  }

  // We're no longer using this EC problem, so I've included the code
  Expression callWithCurrentContinuation(Procedure procedure, Frame env) {
    Continuation cont = new Continuation();
    try {
      return completeEval(procedure.apply(new Pair(cont, nil), env));
    } on Continuation catch (e) {
      if (identical(e, cont)) return cont.result;
      rethrow;
    }
  }

  // We're no longer using this EC problem, so I've included the code
  Expression continuationApply(
      Continuation continuation, PairOrEmpty args, Frame env) {
    if (args.length != 1) {
      throw new SchemeException("Continuation takes a single argument");
    }
    continuation.result = (args as Pair).first;
    throw continuation;
  }

  // Analagous to MacroProcedure.eval_call in Macros EC problem
  Expression macroCall(
      MacroProcedure procedure, PairOrEmpty operands, Frame env) {
    // TODO: Implementation required; mirrors Macros EC on project
    return null; // replace
  }

  // Analagous to do_define_macro in Macros EC problem
  Expression doDefineMacro(PairOrEmpty expressions, Frame env) {
    // TODO: Implementation required; mirrors Macros EC of project
    return null; // replace
  }
}
