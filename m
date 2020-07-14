From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v2 01/11] lib/string_helpers: Introduce string_upper() and string_lower() helpers
Date: Tue, 14 Jul 2020 15:01:53 +0300
Message-ID: <20200714120203.10352-2-vadimp@mellanox.com>
References: <20200714120203.10352-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200714120203.10352-1-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Provide the helpers for string conversions to upper alnd lower cases.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 include/linux/string_helpers.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index c28955132234..86f150c2a6b6 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_STRING_HELPERS_H_
 #define _LINUX_STRING_HELPERS_H_
 
+#include <linux/ctype.h>
 #include <linux/types.h>
 
 struct file;
@@ -75,6 +76,20 @@ static inline int string_escape_str_any_np(const char *src, char *dst,
 	return string_escape_str(src, dst, sz, ESCAPE_ANY_NP, only);
 }
 
+static inline void string_upper(char *dst, const char *src)
+{
+	do {
+		*dst++ = toupper(*src);
+	} while (*src++);
+}
+
+static inline void string_lower(char *dst, const char *src)
+{
+	do {
+		*dst++ = tolower(*src);
+	} while (*src++);
+}
+
 char *kstrdup_quotable(const char *src, gfp_t gfp);
 char *kstrdup_quotable_cmdline(struct task_struct *task, gfp_t gfp);
 char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
-- 
2.11.0
