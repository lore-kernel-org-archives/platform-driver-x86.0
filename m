Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCED3290C4
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 16:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394271; cv=none; b=QfOF+H1ckujZOKsmgjDmsLdLl65ZyGsfxHba6amRYE/SVnVB78MTK5toaAuAzu+Flu/+nnfjuP3qrEXSGp4MVYid8J3PiEiocZweiadzD+Da0YUpgnNKD5c/6KOI4lPEg/Px+02U8rpsXLebwYd6OfyvpdIwN1mNRfjDc0u6aG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394271; c=relaxed/simple;
	bh=7rjJOYjWmvb2EcF6VUMA/0NaY7hKyw6Z6EWR5pCM3Ic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=f+IizWwa5n7GkzEzLiguB70TBA/NwzhOJ2tMVn/e0wM+nq8hgn/KgfuAutDnqcka3I7fTKhVwuhrZpnLPCp59xzSVSCvv4miP8y2SlqDO5U/eOSDyOEOAk0OQVnjkEpyRngRJNoFjf3Ywjen5f7616kaJJQEL2hoeFo2dRzH6EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhQmKixS; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhQmKixS"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-60fee2fa3b8so3578693137.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 09:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777394268; x=1777999068; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MsGpQQF7zdBC3BAV8PPfxFAulX/0eg85xZIdEP3FacY=;
        b=WhQmKixSe1rJuHQIMdKkiOfmQZh7uSUQ8eyZDb9WQrL8jPTn1opXYO+rQmnvNbvY0b
         C0CTl5sZWaEGzeBTe/bkN3kleMYk4E7YFwJ+mJa8bDCjo9IGXUOKG1mIzoQ1va4lQRvv
         FNjc1DSuxKY26obODrxKpONwvts/CqoKNxqwELi7ggQ9ehhl7on0LobxF3OqVHE1JH6G
         Myq+bURoXXMVKApc8cHx1wE3TRvmBmy/f5HWSDAx2F3pC61rcCi2Ut1pn9UX+E0hJ7t4
         79NBERnGJ6lXjCa0uG/4envJ42lH4z8qrXGcC2nH3WZy/RU4MuHFPiOmE3sjRibr5rD3
         vcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777394268; x=1777999068;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsGpQQF7zdBC3BAV8PPfxFAulX/0eg85xZIdEP3FacY=;
        b=eeY3ykbgzu+m1tRDGTuAUUiuLHeoliZZMD6eT6ubADCFsy2qk1CpLQr1tGTUT0gcMc
         fa5TUNO8AjPzKgfno1TDfxnhPIkrVSQD/Q75xIBA37LD9CZBgxKYZg8LwGD8fG6XYpL3
         436kip70Qi0XgGND28v6Ruz+SLmOEe/Xk+A8VSruQ5K96+a5FLdlwVwJoWm2TX4j13Zi
         F9a4m3hDOp7IsIbCeaXCHkOeEvnQsv7SW4rVBMIcjFB8UAwMNKqT6OQjeD1eL9VVk+uU
         wPbNtBrwrxSI4JiYRusm5bza6aL/d1g7lYCboOg9S/kXLFG8CM6X0a4O2MXLr7O5Exzn
         5IjQ==
X-Gm-Message-State: AOJu0Yz4Se2adkB0ufzdaUbiFC7PgPPlBdaYPDAK+0Igpb8S83v0polv
	OWClaQLP1borzLOCdElkqX4EOrb5flzY8fG3BcD/8TLb3yT7Q9Xuekmn
X-Gm-Gg: AeBDiesCn0vt+ZYqvhcz23jlA3M3im8gu+zmMiB63VGx7aG2zWGzDuKt7S4yAZjYd8P
	iPsmbu66DRBS3iRLOGLtQGODLE6yidhmFh3lx3VPC1wR2eub04E7CHj59hz21ULQZHWHHhAqEYQ
	zQuP4HWUXeWja7g7WB3jADyu3Q/zMd2SSoblqs5+F1AeUx0LhtmttEu05Pp4wlIH+Uw+DFpQWhr
	SsZNjL9qSvmGLZjbLfhV6c1q0El/aRKF/cTVSRJbmzMl0L1JV3sNthHn5C5fqJ9BRqz/ZkuDm4o
	OVrPZoHt86SEjS1YsnzGGigPUGuWjIazIpjYSrzlA0KRjmN1YlEwrdbh38z7JzUKxd4Qhd3AqZO
	no0OrQyzB+otMLZTzMwbe7DnASU4w2eiEnaNtgWdqfMehf1z7kI0sZiC8s8FG6VnrYupChMcFjS
	oR63hQZ3iUWQ/58fqqpdeFSGlYxpZTZXOK
X-Received: by 2002:a05:6102:8096:b0:61c:5310:e9d5 with SMTP id ada2fe7eead31-6280a8b8244mr1876611137.20.1777394268112;
        Tue, 28 Apr 2026 09:37:48 -0700 (PDT)
Received: from [192.168.100.6] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-627f7c24c7asm1488903137.7.2026.04.28.09.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 09:37:47 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Tue, 28 Apr 2026 11:37:29 -0500
Subject: [PATCH v4] platform/x86: alienware-wmi-base: Transition to new WMI
 API
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-aw-new-api-v4-1-d2c06241d7ad@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ6CMBCG4auYrq3pzIABV97DuGhpC03kJ60pG
 sLdLbgBE5ffJM87EwvGOxPY5TAxb6ILru/SyI4HVjWyqw13Om2GAs8CkLgceWdGLgfHoYLCggC
 wlLMEBm+se62x2z3txoVn799rO8Jy/WaIxDYTgQMv8xKEshIUFde6le5xqvqWLZmIWwo7iomSE
 ppI2UIj/lL6TylRYwWpMsux1Luv8zx/AD6WNHMaAQAA
X-Change-ID: 20260123-aw-new-api-1c18f1011f35
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2489; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=7rjJOYjWmvb2EcF6VUMA/0NaY7hKyw6Z6EWR5pCM3Ic=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJkfHgW+Sy9af/j6Q1sBpXqjJxtqDUv3mb00lipdl7hqm
 lxvvdaNjlIWBjEuBlkxRZb2hEXfHkXlvfU7EHofZg4rE8gQBi5OAZjIxwpGhh4p94XSr7yzPsld
 PJW6QZY7+MMabpPeOTvfZ7Zzl+Y17mL4n5G6T8XAaUmBgoen0cLrf3ovn/CYMuvr1fTupaWvNsx
 wYQIA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Transition to the new wmi_buffer based WMI API.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
v4:
  - Rebase to use the new wmidev_invoke_method() with size check

v3: https://patch.msgid.link/20260331-aw-new-api-v3-1-ef03b94529d8@gmail.com
  - Use __free() instead of manual cleanup.
  - Include <linux/types.h>

v2: https://patch.msgid.link/20260331-aw-new-api-v2-1-3b0d33bf8d22@gmail.com
  - Cast wmi_buffer data to __le32 and then use le32_to_cpu() before
    returning

v1: https://patch.msgid.link/20260330-aw-new-api-v1-1-95910bfa1b38@gmail.com
---
 drivers/platform/x86/dell/alienware-wmi-base.c | 31 ++++++++++++++++----------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index 64562b92314f..21d3acfbd73d 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -12,8 +12,13 @@
 #include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/types.h>
 #include <linux/dmi.h>
 #include <linux/leds.h>
+
+#include <asm/byteorder.h>
+
 #include "alienware-wmi.h"
 
 MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
@@ -150,21 +155,23 @@ u8 alienware_interface;
 int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
 			  void *in_args, size_t in_size, u32 *out_data)
 {
-	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
-	struct acpi_buffer in = {in_size, in_args};
-	acpi_status ret;
+	struct wmi_buffer out, in = {
+		.data = in_args,
+		.length = in_size,
+	};
+	int ret;
 
-	ret = wmidev_evaluate_method(wdev, 0, method_id, &in, out_data ? &out : NULL);
-	if (ACPI_FAILURE(ret))
-		return -EIO;
-
-	union acpi_object *obj __free(kfree) = out.pointer;
+	if (out_data)
+		ret = wmidev_invoke_method(wdev, 0, method_id, &in, &out,
+					   sizeof(*out_data));
+	else
+		ret = wmidev_invoke_method(wdev, 0, method_id, &in, NULL, 0);
+	if (ret)
+		return ret;
 
 	if (out_data) {
-		if (obj && obj->type == ACPI_TYPE_INTEGER)
-			*out_data = (u32)obj->integer.value;
-		else
-			return -ENOMSG;
+		__le32 *data __free(kfree) = out.data;
+		*out_data = le32_to_cpu(*data);
 	}
 
 	return 0;

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260123-aw-new-api-1c18f1011f35

-- 
Thanks, 
 ~ Kurt

