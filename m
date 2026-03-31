Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDE13D75D9
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 16:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774974033; cv=none; b=IUyazSFKvmH6vtDVXTnTNEUx697HRgMkxh/DjynEolMZyolgIzkL7830lB7pqAMrCDQzTvxNBlDVzKfVewiLgM0c19H2ufMxBv2pr4eOBrGRkaR3H431YXco0E0C7HaYtb2/mlZaJuYv0jv2P69yyyTNSTzNUE3GMcgj5Jblhmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774974033; c=relaxed/simple;
	bh=5jlSc4IKKGxsaiNbC5V9mWX4XNKsUtoxWuYQvacYRUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QscoZGZBNZgpSf4Hjbv+lqPHX7ozKC/wBhh1KRc3odTvl/SNU0PpeGXo4HGj+W8GtkFuaTyE+BbcgVbBR8cMWwTWf5ekSt4xHHabmSdlsYIjltksqdetUqPS4yhpxfYfV1FxexQ9Ea1EBDgV3tZ8qcAIqle6/gaqoqHPwsXA18g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1+iZDwQ; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1+iZDwQ"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-604de452750so3345506137.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 09:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774974031; x=1775578831; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OoXTrHNclGZow6kYThreUdfm+RwBdBk95e0klIpPJIY=;
        b=g1+iZDwQyE4KnENtth6llc086Y2Oa+ac1YgRq/gRNEpmvuFIsU9xOsfC4aaUbCRPVW
         JU+X7FX1/LYAifFNn6NOC7DIza/GHpE6uAUTW4N41vP4b1zgTqVaxyH2lUiPFeUCjco/
         TpVZWQwuuEHIwFd0VXMk68iFvtuojxRgKI5cE5bOzdVMrGHIL5VwfutRwsUwzWCOm43n
         uT7H7D/eaM3vhKdevfz/jWTutBUFfbAWbIYe2V86JLXhxdAldqLnQk9KzInEq+RH3RlK
         xTvgnhu1I3ps+mq7FGyxwDNvc02EpjC612UsgR3nRxTokpIIZiAuhn9PnPj2J9vxDiqG
         o4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774974031; x=1775578831;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoXTrHNclGZow6kYThreUdfm+RwBdBk95e0klIpPJIY=;
        b=T84IITlI7rym2BkD+px9BeQ9ESTePcd10FnhP4IDHC13SA6cS9e5/HZ8S1hDl80b4n
         N2uh3lzyPvnS/Q7DP+AkiehhQOV3TEnm7rj/Eir4v/R/A3lme/QjJXM6FHkd7YaQYHol
         koDrWau1PW69iAUOo9CM52yGm/p+n4aVobpFkixHp7ZEhhEmErKPn7sYLK/catyLXwiE
         phiOLNaLkys+Nys9iHlwHluUyazVwsVbdY2RomrpJ9Vxvx8HeKIR0pbMVtED/eDQalul
         8KslDPjLBwOFB3aGrjN/0+BGoGynT4x9BHln/ZlKE9Klw8//Pb6oub5Z6hlGVDojgcta
         hRrA==
X-Gm-Message-State: AOJu0YyfunQZYXVIvN7NrXt4cOvddcN+WLI1U7/6jj/u2nXb5ORyAtmv
	YDJWKeKJbKSDBPeUCNwYHhLbmCShsAn4LgZMW/ND/7YoRhPBtdB/0ehOGB18fg==
X-Gm-Gg: ATEYQzyKM9Cmrl1jXR8ss1xHZqzhj6MGRHo44EdZDUSwf0anYB6TnynULR4OchJP1Sl
	RpBdQWbWIYsxsZywmB3lYEu7B1KOiXVPofZpv71IkGlXLnHOfHFYQ3fpl0E0CVIzB4BqDbjSRGk
	l2eqOtYrUyBxLK/ZKp7OYbsXVoOxJPKCYlt+DeJlLQVNaR1X0hREzozxIzUbq1HKPH3fOF8Gau6
	5SzQKO63sCBucq+EEk/zrPrr+wAzkBgrNoP0O/r8c9x+/NFZu/RSxYsaXmALGy3TD7nXePFXYjk
	fkFTFBJf41yZB54LfH0YQbWt3X+vKCmUAmqQEFaVTzR3SkFaGppntETb/o+5DrGepw7M1JIIiHs
	gWDlv4JSNrc3eSrMI1Yx1zfXiV4Jq+6JF8N3I6+bPkVYgtjYBIrjRU5cKt8yDP/O+2QiCzx9JAE
	fP9oFwyWKyJg80HXVxFknfZA==
X-Received: by 2002:a05:6102:952:b0:602:a4af:5fe with SMTP id ada2fe7eead31-604f90397d7mr7117587137.9.1774974030602;
        Tue, 31 Mar 2026 09:20:30 -0700 (PDT)
Received: from [192.168.100.6] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9539e031a8dsm11619065241.0.2026.03.31.09.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 09:20:30 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Tue, 31 Mar 2026 11:20:14 -0500
Subject: [PATCH v3] platform/x86: alienware-wmi-base: Transition to new WMI
 API
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-aw-new-api-v3-1-ef03b94529d8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1XMyw6CMBCF4VchXTum0wkGXPkexkVLW5hELmlN0
 RDe3YIbXJ6T/N8iogvsorgWiwguceRxyINOhWg6PbQO2OYtlFQXiYpAzzC4GfTEgA1WHiWip1L
 kYArO83vH7o+8O46vMXx2O+H2/hgieWQSAkJd1iiN12iourW95ue5GXuxMUkdU/xLVU7JSEtkf
 GWVOqbrun4B4mEr5t8AAAA=
X-Change-ID: 20260123-aw-new-api-1c18f1011f35
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2339; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=5jlSc4IKKGxsaiNbC5V9mWX4XNKsUtoxWuYQvacYRUA=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJmnv7j+LWqaYVObse9CoajGzmsvzk4N7Ak/J71V2ahsy
 +Wk2ydCOkpZGMS4GGTFFFnaExZ9exSV99bvQOh9mDmsTCBDGLg4BWAiF+4wMlw5vl1vxYTqzv9h
 HWKOQpP9XqmWTuh60X666GLJlumGe3oYfjIqM4l4tK5375DvPvjv+K/mZWVXlF4eEuoQmP3f+rR
 pGhcA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Transition to the new wmi_buffer based WMI API.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
v3:
  - Use __free() instead of manual cleanup.
  - Include <linux/types.h>

v2: https://patch.msgid.link/20260331-aw-new-api-v2-1-3b0d33bf8d22@gmail.com
  - Cast wmi_buffer data to __le32 and then use le32_to_cpu() before
    returning

v1: https://patch.msgid.link/20260330-aw-new-api-v1-1-95910bfa1b38@gmail.com
---
 drivers/platform/x86/dell/alienware-wmi-base.c | 34 ++++++++++++++++----------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index 64562b92314f..38a903734fa3 100644
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
@@ -150,22 +155,25 @@ u8 alienware_interface;
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
+	ret = wmidev_invoke_method(wdev, 0, method_id, &in, out_data ? &out : NULL);
+	if (ret)
+		return ret;
 
-	union acpi_object *obj __free(kfree) = out.pointer;
+	if (!out_data)
+		return 0;
 
-	if (out_data) {
-		if (obj && obj->type == ACPI_TYPE_INTEGER)
-			*out_data = (u32)obj->integer.value;
-		else
-			return -ENOMSG;
-	}
+	__le32 *data __free(kfree) = out.data;
+
+	if (out.length < sizeof(*out_data))
+		return -ENOMSG;
+
+	*out_data = le32_to_cpu(*data);
 
 	return 0;
 }

---
base-commit: fab7c51693e95aa874d6d9db22bfae7bd0b23c66
change-id: 20260123-aw-new-api-1c18f1011f35

-- 
Thanks, 
 ~ Kurt

