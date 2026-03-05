Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A4237475C
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Mar 2026 12:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714575; cv=none; b=uGIsMobOpXX5bmZmk0K+alVNiO/PMaErJhviiLFtpoa1fqCfUEUdTon2/kixTatXGN/OjQeYPRuF/cGLV7Zozw5tf7S4+cjBzUVQorocgtBaU6EaCTJ463HVgbsZau+5RlQPiutI/oqN84So/wmJkydK7NbfZNPpviZIvpKamSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714575; c=relaxed/simple;
	bh=6azYBxMK/M2aRJ9a4DZgoKgw9ejS60Y+0aEornJYueY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LnN4GV5aFqktSER4fl6JkkNNuojjMOTJ7yWDxbYoIWoCdfnZ2pCe5zFIHeaBvYRIsKQLyyHZKqMJ7DZE9Q4H97Avu6mZw3mrvUk93KP9NHQ2W/OwsZrXPbY5lGiTJ2IP3bxlJu3MrOETEERgsEFV6dIShXXRaViLJiGqLa/5bG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Vw5fLIkU; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Vw5fLIkU"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772714571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1d9SYvWb+sNYX9Fhk1tLc8SUWkZ/zy4aFtLcquSNK9U=;
	b=Vw5fLIkU3yat4oezt6bV9ia64aczSHzs3QILxBEVdinZvzYPKB5qUbHlguGN1ug84Ec3pj
	57tYhxZg8Dy3zqROu6T3079EPTUSwlmG97LoqD/RzbiEi0YvuiBNETW7CJ9FDDTkf/dlRw
	YNbqahMTuixGVU7EpY0zHCBRjB5pkHA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Prasanth Ksr <prasanth.ksr@dell.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-wmi-sysman: Use sysfs_emit{_at} in show functions
Date: Thu,  5 Mar 2026 13:41:27 +0100
Message-ID: <20260305124126.255026-2-thorsten.blum@linux.dev>
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
 .../platform/x86/dell/dell-wmi-sysman/sysman.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 9dddab6c9397..0f24cecc93fc 100644
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
@@ -143,17 +144,14 @@ int map_wmi_error(int error_code)
  */
 static ssize_t reset_bios_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
-	char *start = buf;
+	ssize_t len = 0;
 	int i;
 
-	for (i = 0; i < MAX_TYPES; i++) {
-		if (i == reset_option)
-			buf += sprintf(buf, "[%s] ", reset_types[i]);
-		else
-			buf += sprintf(buf, "%s ", reset_types[i]);
-	}
-	buf += sprintf(buf, "\n");
-	return buf-start;
+	for (i = 0; i < MAX_TYPES; i++)
+		len += sysfs_emit_at(buf, len, i == reset_option ? "[%s] " : "%s ",
+				     reset_types[i]);
+	len += sysfs_emit_at(buf, len, "\n");
+	return len;
 }
 
 /**
@@ -194,7 +192,7 @@ static ssize_t reset_bios_store(struct kobject *kobj,
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

