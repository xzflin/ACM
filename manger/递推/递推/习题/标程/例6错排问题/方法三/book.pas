var n,i,j,x:integer;
    f,g:array[0..20]of int64;
    c:array[0..20,0..20]of int64;
begin
  assign(input,'book.in');
  reset(input);
  assign(output,'book.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do c[i,0]:=1;
  c[1,1]:=1;
  for i:=2 to n do
    for j:=1 to i do c[i,j]:=c[i-1,j-1]+c[i-1,j];
  g[1]:=1;
  for i:=2 to n do g[i]:=g[i-1]*i;
  f[0]:=1;
  for i:=1 to n do begin
    f[i]:=g[i];
    for x:=1 to i do f[i]:=f[i]-c[i,x]*f[i-x]
  end;
  writeln(f[n]);
  close(input);
  close(output);
end.
