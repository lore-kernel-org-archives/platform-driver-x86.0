Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5297E421F1C
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 16:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973040; cv=none; b=l6RoChWJHcLfAblS0qF6asBNY57B9tCaTZT9/NXH1PcjYTnNm+kA7fkwSa+AeThCXb9l9rVjYxMRDmWrjyTPegzSCd1X2IUXLfEZJmQ4eM2ddpJpGd4KcRcrYty2kNwRGs01EpMnIW5fKdEAlViAoSU5+w5IPz9HR6asmqNcH1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973040; c=relaxed/simple;
	bh=ZCrkXDETCpA21aqg5PlKDJZWG3TJkyEp4AYs5BsgfVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E+waUXjCxg7wgTeNNMrvjY5inbS0tofX/0DN+h8AbfpX20BfaTCtJO7KMQBzxM4hU0msw7mmmW+mTe4S+FGj9RY/EjkM+n/TTRqkdHF/jiWnU/Ir2HV5Yxr9lwXaZLqZYpOlhWIJNj/WRfC0NxIVkLMwxOZMgXRGAyZ9zbtzxwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=O50KzSuB; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="O50KzSuB"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774973026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jn8MCJuE3cN7fDwMvTSZWk5jSOj+iSNPS3Lh5oSkVzY=;
	b=O50KzSuB7dt4Hd4+kX1HTUM6lB0zFoSEpbnO0hEF9PU6s5S4hQBvKhKhQeURKvYA/O8JD9
	odaVC4u+MnoiMEz+JoQ7jHhg/LjTEj6MqwOz26dKdpm0B6avQXuEmYByOAdBkcKRBKCv1Z
	bqYApmmBIvun+tQnGvt3OGlKnPJgHqE=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Prasanth Ksr <prasanth.ksr@dell.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: dell-wmi-sysman: Clean up security buffer helpers
Date: Tue, 31 Mar 2026 18:03:11 +0200
Message-ID: <20260331160310.608857-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3629; i=thorsten.blum@linux.dev; h=from:subject; bh=ZCrkXDETCpA21aqg5PlKDJZWG3TJkyEp4AYs5BsgfVM=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJmnP9h1Luu/37Zym5JTqYRE5ds6/wuR/v8323Eu/HT0u +qsOU3TO0pZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAiz3MZGU70Gkbuq09w56lr NtY6dqpmC6t6XEHuEweJ9NQAw4mXfzAynNl908S6LtqQu2QTU7lVm/VJZ86Q3zerljsY+1xPUGr lBgA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

In calculate_security_buffer(), call strlen() once and use ALIGN() to
round up to an even size.

In populate_security_buffer(), also avoid recomputing strlen(), rename
the u32 pointer from 'seclen' to 'seclenp' to avoid confusion with the
new length variable, and drop the memcpy() guard since calling it with
size 0 is a no-op and therefore safe.

Use 'const char *' for the read-only source string in both helpers.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Include headers (Ilpo)
- Link to v1: https://lore.kernel.org/lkml/20260309211811.82403-3-thorsten.blum@linux.dev/
---
 .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |  4 ++--
 .../x86/dell/dell-wmi-sysman/sysman.c         | 22 +++++++++----------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
index 817ee7ba07ca..5278a93fdaf7 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
@@ -189,8 +189,8 @@ void exit_bios_attr_set_interface(void);
 int init_bios_attr_set_interface(void);
 int map_wmi_error(int error_code);
 size_t calculate_string_buffer(const char *str);
-size_t calculate_security_buffer(char *authentication);
-void populate_security_buffer(char *buffer, char *authentication);
+size_t calculate_security_buffer(const char *authentication);
+void populate_security_buffer(char *buffer, const char *authentication);
 ssize_t populate_string_buffer(char *buffer, size_t buffer_len, const char *str);
 int set_new_password(const char *password_type, const char *new);
 int init_bios_attr_pass_interface(void);
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 9dddab6c9397..4ae37a1c77f4 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -7,10 +7,12 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/align.h>
 #include <linux/fs.h>
 #include <linux/dmi.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/string.h>
 #include <linux/wmi.h>
 #include "dell-wmi-sysman.h"
 #include "../../firmware_attributes_class.h"
@@ -72,13 +74,9 @@ size_t calculate_string_buffer(const char *str)
  *
  * Currently only supported type is Admin password
  */
-size_t calculate_security_buffer(char *authentication)
+size_t calculate_security_buffer(const char *authentication)
 {
-	if (strlen(authentication) > 0) {
-		return (sizeof(u32) * 2) + strlen(authentication) +
-			strlen(authentication) % 2;
-	}
-	return sizeof(u32) * 2;
+	return sizeof(u32) * 2 + ALIGN(strlen(authentication), 2);
 }
 
 /**
@@ -88,18 +86,18 @@ size_t calculate_security_buffer(char *authentication)
  *
  * Currently only supported type is PLAIN TEXT
  */
-void populate_security_buffer(char *buffer, char *authentication)
+void populate_security_buffer(char *buffer, const char *authentication)
 {
+	size_t seclen = strlen(authentication);
 	char *auth = buffer + sizeof(u32) * 2;
 	u32 *sectype = (u32 *) buffer;
-	u32 *seclen = sectype + 1;
+	u32 *seclenp = sectype + 1;
 
-	*sectype = strlen(authentication) > 0 ? 1 : 0;
-	*seclen = strlen(authentication);
+	*sectype = !!seclen;
+	*seclenp = seclen;
 
 	/* plain text */
-	if (strlen(authentication) > 0)
-		memcpy(auth, authentication, *seclen);
+	memcpy(auth, authentication, seclen);
 }
 
 /**
