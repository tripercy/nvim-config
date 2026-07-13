local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	s(
		"codeforces",
		fmt(
			[[
      #include <bits/stdc++.h>
      #define MULTITEST true
      using namespace std;

      #ifdef LOCAL
      #define dbg(x) cout << "[DBG] " << #x << ": " << (x) << endl
      #define dump(a)                                                              \
        do {{                                                                       \
            cout << "[DBG] " << #a << ": ";                                        \
            for (auto &x : a)                                                      \
                cout << x << " ";                                                  \
            cout << endl;                                                          \
        }} while (0)
      #else
      #define dbg(x)
      #define dump(a)
      #endif

      // #define int long long
      #define ll long long
      using pii = pair<int, int>;

      void solve() {{
          {}
      }}

      int32_t main() {{
          // Fast IO
          ios_base::sync_with_stdio(false);
          cin.tie(nullptr);

          int t = 1;
          int TEST = 1;
          if (!MULTITEST) {{
              solve();
              return 0;
          }}
          cin >> t;
          while (t--) {{
              dbg(TEST);
              TEST++;
              solve();
          }}

          return 0;
      }}
      ]],
			{
				i(1), -- Cursor position inside solve()
			}
		)
	),
}
