# Course methods to follow

Use only the style and methods reflected in the course materials.

## Static analysis methods

Allowed:
- IDA graph view.
- IDA text/disassembly view.
- Strings window.
- Xrefs from strings and calls.
- Function naming.
- Comments.
- Identify important logic and ignore compiler boilerplate.
- Identify function signatures:
  - arguments
  - local variables
  - return values
  - caller/callee stack cleanup
- Translate assembly to simple C-like pseudocode.
- Reconstruct conditions and branches.
- For `rect.exe`: convert to real C while preserving calling convention logic.

Do not:
- Try to explain every compiler-generated instruction if not relevant.
- Use decompiler-only reasoning as the sole evidence.
- Use advanced automated binary analysis.

## Dynamic analysis methods

Allowed for Wonderland stages 4 and 5 only:
- Run the program.
- Use breakpoints.
- Observe registers.
- Observe stack.
- Observe memory.
- Observe return addresses.
- Use dynamic evidence to understand behavior.

Forbidden for Wonderland stages 4 and 5:
- Patching code.
- Changing jumps.
- Editing memory.
- Editing registers.
- Applying patches to the executable.
- Bypassing checks by manipulating runtime state.

## Write-up expectations

Every write-up must explain:
1. What was searched first.
2. Which strings/xrefs/functions were relevant.
3. Which function likely implements the stage.
4. What the key branches/conditions are.
5. How assembly became pseudocode.
6. How the final answer follows from the evidence.
