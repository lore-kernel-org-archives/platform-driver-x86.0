Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6771F3A4F39
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Mar 2026 14:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772719780; cv=none; b=KCkTXxCGJhfJLLdqR/TxrUZKV+in6LXeWQvd/ppnBJdzMTBRWtS7dfbZJCUOzKD7fSzqku7M8XHJuidrs0RNiYb0/keTpJdXpH2rL/9YOywrL1A3vu3lpLPfHsFcolPqEuKOf7giVOb1zWKBLbKGIfFiB0Hbhp1XT4oTAcr+7So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772719780; c=relaxed/simple;
	bh=SYTPgJIMbToS+M+v8SRULbIX0ty0nOpASh5a/WdDBoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FqIexGo4O1R9CGsx2imn1WIClQGcIAdT+Oaj8GLlCSt7o5fUbHu8GvQiGYJRSG30Akf1lgI7UNcfBa97saUK3X5JAX1BvHBg5WP2QXvBgcDGTQ1eC8eAXG1DziWOP0dY6LlNcmo7C9gqJgAhtPToKy3gAtY5XJi9I6VsBw7V1lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eTKZb4kL; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eTKZb4kL"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772719773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w1al+li5+WySsGr/Goy2mEZbqDosfso/k9nd6+LsORs=;
	b=eTKZb4kLqI9Y1jeV3JwECTRT1fL/rkYMs8mPD4LN/mCazz655oQZ+EvikmP20mGjhlTeAx
	nYRzyDlKJWMzTPbDpDXVRtq/vetFkgqfdf9vJysV2UXvZR9+SojMuWS0/QYosI7L7DpLFA
	7uKIgihvzsCk+O9cdbnuuCAFsFJvXVo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Prasanth Ksr <prasanth.ksr@dell.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: dell-wmi-sysman: Use sysfs_emit{_at} in show functions
Date: Thu,  5 Mar 2026 15:09:13 +0100
Message-ID: <20260305140912.258090-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace sprintf() with sysfs_emit() and sysfs_emit_at() in sysfs show
functions. sysfs_emit() and sysfs_emit_at() are preferred for formatting
sysfs output because they provide safer bounds checking.

In reset_bios_show(), use sysfs_emit_at() to avoid manual buffer size
accounting.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Use if-else instead of inline ternary operator (Ilpo)
- Link to v1: https://lore.kernel.org/lkml/20260305124126.255026-2-thorsten.blum@linux.dev/
---
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 9dddab6c9397..80820451710b 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -11,6 +11,7 @@
 #include <linux/dmi.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
+#include <linux/sysfs.h>
 #include <linux/wmi.h>
 #include "dell-wmi-sysman.h"
 #include "../../firmware_attributes_class.h"
@@ -143,17 +144,17 @@ int map_wmi_error(int error_code)
  */
 static ssize_t reset_bios_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
-	char *start = buf;
+	ssize_t len = 0;
 	int i;
 
 	for (i = 0; i < MAX_TYPES; i++) {
 		if (i == reset_option)
-			buf += sprintf(buf, "[%s] ", reset_types[i]);
+			len += sysfs_emit_at(buf, len, "[%s] ", reset_types[i]);
 		else
-			buf += sprintf(buf, "%s ", reset_types[i]);
+			len += sysfs_emit_at(buf, len, "%s ", reset_types[i]);
 	}
-	buf += sprintf(buf, "\n");
-	return buf-start;
+	len += sysfs_emit_at(buf, len, "\n");
+	return len;
 }
 
 /**
@@ -194,7 +195,7 @@ static ssize_t reset_bios_store(struct kobject *kobj,
 static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *attr,
 				   char *buf)
 {
-	return sprintf(buf, "%d\n", wmi_priv.pending_changes);
+	return sysfs_emit(buf, "%d\n", wmi_priv.pending_changes);
 }
 
 static struct kobj_attribute reset_bios = __ATTR_RW(reset_bios);
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4

