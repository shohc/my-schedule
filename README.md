# 我的日程规划表 · 云同步网页版

基于 3.0 版本，保留批量选择、分钟级时间、预设任务、实际时间和 JSON 导入导出。

## 部署步骤

1. 在 Supabase 创建项目，打开 SQL Editor，执行 `schema.sql`。
2. 在 Supabase → Project Settings → API 中找到 Project URL 和 **publishable/anon key**，填写到 `config.js`。**不要放入 service_role / secret key**。
3. 在 Supabase → Authentication → URL Configuration 中，将 Site URL 设为你的正式网页地址，并把该地址加入 Redirect URLs（例如 `https://你的用户名.github.io/你的仓库名/`）。启用 Email 邮件登录。
4. 在 GitHub 新建公开仓库，上传 `index.html`、`config.js`、`schema.sql`（可选）和本 README。
5. 仓库 Settings → Pages → Build and deployment → Deploy from a branch → main / (root)，保存，等待发布。
6. 打开 GitHub Pages 网页，填写邮箱，点击登录邮件里的链接。每台设备用同一个邮箱登录即可。

## 已有数据迁移

先在旧版点击「导出备份」，再在新版通过「导入备份」恢复。登录后如果云端为空，点击「将本地记录覆盖云端」。建议迁移前后都保留 JSON 备份。

## 重要限制

- 云端采用**整份日程快照**保存，适合个人单设备轮流编辑；不要在两台设备同时编辑。检测到版本不一致时会暂停自动同步并提示。极短时间的并发仍可能出现最后写入覆盖。
- 登录成功后才启用云端同步；离线编辑存于浏览器。离线修改后重新登录时，请先备份，再决定采用本地还是云端版本。
- GitHub Pages 为静态网站，数据库由 Supabase 托管；`config.js` 中的 publishable key 可公开，安全依赖数据库 RLS。不要提交私钥。
- 浏览器不一定支持在 `file://` 地址下正常登录；请使用部署后的 HTTPS 地址。
