Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6232326F29C
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 05:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934057; cv=none; b=hTl9kEdkU6c0PLnXOjeH2fHOM38/Asq0CN2giEMiv4ko4DNQFkcN9LOm1zOnSiLO8AWWI3INAD4jk16abl2DC/OfKTJvd1xc+hGFoM8qNPSnSG9Ma36JrRrP90zZl5eiVNP29uBKGEUE9aaoOklE5O5i6bx2z9WNxCZ36qS5UTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934057; c=relaxed/simple;
	bh=TDBx1RXCJjmWk/1ix+txYz/ykqNUVZmSib0LFXUF/fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LanQzhcLhRyWG65g8Bz8XEJzKyEl44ETgXI1mKag+oHibMThYituTwLkkzT/xuX79XfI+6nbYYxCQDTCd6tkszQxjCoO1ZvH3rF7XU7ujARedqBZ5e5EaJZFQ1iTNB9cCe/tDVJXd9nhJcPrSHAVr+xwNX+NX3m6dU8o8S3CKn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k66sfeqv; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k66sfeqv"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-604fb44270aso1126376137.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 22:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774934055; x=1775538855; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rUNx4He3cIxObk4rmJhTVrPjT2/VZJjTfev4QMFrBE4=;
        b=k66sfeqv27rKK6ghKP9u9yIjW2OHRBc29w4JxKBcTRyoLNAIEsZWLohygvBrRDkceZ
         MxiGIqmNvJs43NMQ8WJUTlvMApvbPYQxq5PCBpWQvQrIQSvWEGRxllv1gC7OdFO/vBiK
         boF96aZGMkTSB5JirOo7GTG5vrwGCT2UqBZ1R7XE7+wzsQrJ8chPnJ6+RMNIbCX2B6HC
         ZU56uiDuLIqn8SGyeE+A/7Hidqx7Ufj5QjdEvdi+foA0NsQl685oziCdXCFjQnbQDXX8
         pElFQ5HEAHC/5G8JkySADBBUT4jkQ/oLK62RxYleYarv4Nzv1SIHmYmr+vmX5dxkjfnB
         0kmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774934055; x=1775538855;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUNx4He3cIxObk4rmJhTVrPjT2/VZJjTfev4QMFrBE4=;
        b=KwgANdL6cYIL08jv8yzliALcaGyX64kDjqUawSGQQ2Fi6HLXzNO5s3ROxITaCp2MSC
         lEd8etw7hc9ZEkEAxriGcboWRekMdkF4VCMIPebIoxWhW4fRzGeaboCBo1kdnShy99CB
         OmiEBJKNJ6P+oeaE4qHVsDDiKYJ2K+f05ncnmqMJ59sTlXkuhmodlMt88wjSugYwccxu
         /ft8Boda63PK0AdXKiOIA/TyGA8AbHUa5RtfdGp9dz3bBgZqvznH+W4JvV5ljRyznalg
         5RgzADz3QpU0vrUPFH03y8cwtmBhueFjxtMs6ZEoWKnnwqwCWGxQXCpjCbpO/fiIbnmR
         dGQw==
X-Gm-Message-State: AOJu0Yx2YRsOBBw6+nmmoRItEGCprvS3bmUALvFFK9vC9HIdkdZ1RCoS
	8oBQa3RljImNEHM3p68v+XarFIN+1TYDCFxd3GT/CNCxqiS2aUr/f0AY
X-Gm-Gg: ATEYQzxDqlx8vIIiQzO9EACcOKM0jOSDw53i7FX/ZIYeY0Lmc9RIiwEEEClcyvCD/pF
	17Ii9zXlRqhKqE4YP8X2590HI3dL26G+kzGGqziHE2dhvyIMBUEEU/ok//Rv6TiRlAri1ccnMpz
	x3C3SXFUT4JWC3Td2EZ3K++RGZxWuw8gNLiqex+uosD6mjjQ0XE/MurPYk5z/+KfRWcOvIxChu6
	30io2mNY/qTuROg2D5G8CR2iNa0iUwNznowcS+r0PprbhOfmHyxWCBxyNYto9v3dUbaGmi8SxJ9
	dIVwU0tbhzaJV6FfQ3SFPsrY8X6Q5oqFM8CezXLp7ngmyuLdcOmgNFXliufRS7gzck96IY+Naqj
	X1Ziyjuow9fAUy29arTgwM9pyhv1dytAoa3j4rPJMpA62+7vBq2UMK9O2+lUak/HjjLtSlLvsK0
	mE914A9kdXbCsVKu5RuPUkZQ==
X-Received: by 2002:a05:6102:3054:b0:5ff:ba2d:17a6 with SMTP id ada2fe7eead31-604f8d77acdmr5447866137.0.1774934055295;
        Mon, 30 Mar 2026 22:14:15 -0700 (PDT)
Received: from [192.168.100.6] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d3a037sm10859187137.9.2026.03.30.22.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:14:14 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Tue, 31 Mar 2026 00:13:55 -0500
Subject: [PATCH v2] platform/x86: alienware-wmi-base: Transition to new WMI
 API
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-aw-new-api-v2-1-3b0d33bf8d22@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/03MQQ6CMBCF4auQWTum0wYDrrwHYVFqC5NIIa0pG
 tK7W3Hj8n/J+3aINrCNcK12CDZx5MWXkKcKzKT9aJHvpUEKeREkFeoNvd1Qr4xkqHEkiJyqoRz
 WYB2/DqzrS08cn0t4H3ai7/pjlBL/TCIkbOuWxOA0Daq5jbPmx9ksM/Q55w+vp55spAAAAA==
X-Change-ID: 20260123-aw-new-api-1c18f1011f35
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2221; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=TDBx1RXCJjmWk/1ix+txYz/ykqNUVZmSib0LFXUF/fw=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJmnI2TtWM6Wl57J/ZjgESLQ5axwrW/fraPrY18nlKoV5
 DxT0F/XUcrCIMbFICumyNKesOjbo6i8t34HQu/DzGFlAhnCwMUpABNZG87IsM71/ZU3rNEZGxg7
 hcX9fk0V+3jM50dwvumXw+ddKntVjRgZZt1tqo3cVOh7Zt+U10HyblHmZ33L86Ye1u9In6zbJ1b
 HBQA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Transition to the new wmi_buffer based WMI API.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
v2:
  - Cast wmi_buffer data to __le32 and then use le32_to_cpu() before
    returning

v1: https://patch.msgid.link/20260330-aw-new-api-v1-1-95910bfa1b38@gmail.com
---
 drivers/platform/x86/dell/alienware-wmi-base.c | 32 +++++++++++++++-----------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index 64562b92314f..9abdc5de8e23 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -9,11 +9,13 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
-#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/dmi.h>
 #include <linux/leds.h>
+
+#include <asm/byteorder.h>
+
 #include "alienware-wmi.h"
 
 MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
@@ -150,23 +152,27 @@ u8 alienware_interface;
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
+	if (out.length < sizeof(*out_data)) {
+		kfree(out.data);
+		return -ENOMSG;
 	}
 
+	*out_data = le32_to_cpu(*(__le32 *)out.data);
+	kfree(out.data);
+
 	return 0;
 }
 

---
base-commit: fab7c51693e95aa874d6d9db22bfae7bd0b23c66
change-id: 20260123-aw-new-api-1c18f1011f35

-- 
Thanks, 
 ~ Kurt

