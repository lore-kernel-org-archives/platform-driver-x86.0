Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173824;
	b=JzGIwcFoTeIPQInB7DG7iHqAErl1THmL6fJI91ONTROIlTRqF+QW4gFKnoOUqo2gf5tx
	 HQjYG4NCU/JbrUTbexX3wNDHIZYCMklnwDpHDnR6afEbyGyP3PXb96t8P2NDH4ThkEpLE
	 SdeOqK2BLx8Rn9m/Qq2SFsNFKbkAyucJTuzkc3PdFtNOYHG5T6IG7EF4/TF+TgYa3eaHv
	 q7P3VrsVsfNO71fY65pv1KpM4dQ4A8L4frKLKkL49ftG8C4oV0gxddAAHCXAmWNb1HIuX
	 ErgLHmLOTP10caVZyc/ThFmFtIpDADCP5XTIrRK9cdGhX7wEYKElnMohm86O8exWutQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L8TIOKAK5ZO/AJn4EDKI1sABIjRjRP+HnD9UzsjEV0o=;
	b=qvfS6cszefY/s6P4bsLqnDP8tZbohsdhJWw4PRkO8fOXXnfu4zWvBnr3qNfceMHb1DiP
	 XsGEQ84P86U09PAqzVdWM6rfcWWfCmxOUs1zlPKPaUXTqIsazSVFsTlxA7elr+3fyMen+
	 Xg4gtEAxUIcjYoJfLhyVqx+6mXw/FUa2qPsmQXHVHIlzAkbbccyAOKHC11jlJ1fB6cb4x
	 gTSE6Lv8JfpWjcspb2mT5rA+zEQyU8iuzOOOHeLoCwaa58eLeBf9sRIDo+PQmaGBwtpgH
	 HpPb58KXdZThx4GuZGZW6prodcs++pIHvmyji9zbi7ocpSoVkflckImbV4sUb+ypxhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NHbBpTO1;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EA2606A32A
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2026 21:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93EA2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NHbBpTO1
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so3095645e9.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Nov 2026 13:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173822; x=1794778622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L8TIOKAK5ZO/AJn4EDKI1sABIjRjRP+HnD9UzsjEV0o=;
        b=NHbBpTO1b3sbDBGVHG/0BZgH9TAvD3ll9f/tEk8XtKiBecqfCwkQDhh+l92Hil9Jy6
         17CtBnf+NUOf2d3/0E3X8v5MUcOfQQZvAcg7jxNZz2nOGKh5Wtt3t5kYpee4oGeoXfL1
         fGu5JUCUk6tErdxBuTP+5mr44+RuVMuIbngsBDeWjx9TInwJZd/a6P+wKLFm0Gpf5p3o
         YBjohUKgwo9XKmmlcdj8tJ0PUQO/Bfk4w74fsaA6SP1mfhSLjkRzpLn0vgGDUYBVpoMy
         VZeleUukb7PLU7ibdIq5Rd143jiY6TsULVd3xiNllU0ceUqmymERK2dLVoqAuS8BPXwS
         SVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173822; x=1794778622;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L8TIOKAK5ZO/AJn4EDKI1sABIjRjRP+HnD9UzsjEV0o=;
        b=WuNppkMDzVA1Dz0wg4tQ4SSPVCsx+02k10eMiHMA3ukUtaI2vj1knXbp++0aQscWRl
         rqbStaI4RFlKb6pHt5bDyAF/VghGhbWtW95/31O5urqUaIoqVaWOE/sMIKLLN2/yoYZG
         7cW8qJWo9XHwu1EjgQcSF3zO2rECMI+0YrJWdgm04TUyQNf4Bl2rFxeqFK8n+AiR5tid
         s6KzcG0/oq24rqGAGwsB9sqx3zw7o4KzgK8FKBxXxM15Hbm360oSzx/oxmemwfJVd964
         B4z1+SmHxRmskIoOEE6cfYRabpO0/MnCeAZ5h4Lhk2S44wE5k2DI3SSX9uilCPfFFEvH
         tZRA==
X-Forwarded-Encrypted: i=1; AL+hErGf61gDhEsIv5wwCGH8QiqTBRho2f3865L7Nt+ruKW23dW7SkoB71J/9y5w5oA7Yb9SlVA6eCz8OPxuCE/tqSgujdk2@vger.kernel.org
X-Gm-Message-State: APuU4Z+AWt8Sdunt+uqQbVuZHGOJ2fkutLlqMVKO024jtzKXvuRjVzAB
	NsOVYMgiWubwRFpUEf5ZBY6xPx4ukDDR4WVJKy8lLf9uVOdVrGl8nKUt
X-Gm-Gg: AYBFou2hOxTOWL9mDUEJHcJuftBdcaQYBD4B1Mr3OiJAOVhgx73i8trf+Sxnfvx92bD
	Zg6nXHuDp4F8wSH3kKVDBlfGLntLQJS8w+xhlgN+0kSZcoai05g1A1Q6W7PBSdKbrGTQODkkKkq
	sKDKlT4WoD429NbPc2o5Flob3Pc3LvGgTzFUbUi4thZzxu7/XCkSDeY8J2QcAKF0V+UfuWDBGGH
	zcH/QT8H6Usu6atTV9jc5Nx4rHJqtHZ1E6w+fxjlUu+ixXDSA7PmtvRPZ4MWAc+KvG0wCVPKdVU
	zzTyhG/kXeOcP6uEhtDBq134LOup8wgath1NLo0ugS2tNeH81kYrOA2BOXu6MiFsK2d7EtUBnZJ
	5sBS1Twi4QlbLV4EuvE58hYNXxfsUdNaiW5cEVkPn7flmcRu7bA83GbLhZr5/NFO79tDaBtSikO
	xyICyLAe7Wa1vGWtqNVdo0vT9Xbt+Y6z7JWu1JNl4FSmPVdBmkSw3rr3bPoiwuxzoLv1P05G5L7
	F9h44U41pbV+UIKEm4yaRiqb5gn0RCiWefRy+ZyhsTcv1uu9DeljUTwH94yY5fLQ371TOV9PrKT
	i+ie46zSSFo7YnJMfOgGIzojG8uUcS8SaUcWpg81FvxRb7p6rehikWKQudUv
X-Received: by 2002:a05:600c:6095:b0:4a2:150f:1601 with SMTP id 5b1f17b1804b1-4b960da5640mr43548365e9.12.1794173821866;
        Sun, 08 Nov 2026 13:37:01 -0800 (PST)
Received: from SurfaceArch.localdomain ([207.188.128.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee247e9sm92178595e9.6.2026.11.08.13.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:37:01 -0800 (PST)
From: =?UTF-8?q?Antonio=20V=C3=A1zquez=20Blanco?= <antoniovazquezblanco@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Chen Yu <yu.c.chen@intel.com>
Cc: Sachi King <nakato@nakato.io>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Antonio=20V=C3=A1zquez=20Blanco?= <antoniovazquezblanco@gmail.com>
Subject: [PATCH v2 1/2] Input: soc_button_array - support AMD variant Surface devices
Date: Sun,  8 Nov 2026 22:36:55 +0100
Message-ID: <20261108213656.13031-2-antoniovazquezblanco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108213656.13031-1-antoniovazquezblanco@gmail.com>
References: <20261108213656.13031-1-antoniovazquezblanco@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sachi King <nakato@nakato.io>

The power button on the AMD variants of the Surface Laptop 3 and 4 uses
the same MSHW0040 device ID as the 5th and later generations of Surface
devices, so soc_button_array matches it. The device check then rejects
it, and surfacepro3_button binds instead, which is the wrong driver.

soc_device_check_MSHW0040() evaluates function 2 of the MSHW0040 _DSM,
the OEM Platform Revision, and treats a returned 0 as proof that the
_DSM is not there. That is wrong: 0 is a valid revision. The AMD
variants implement the function and return 0, so the check rejects
exactly the devices it is meant to accept.

What separates the two groups is whether the device implements that
function at all, which function 0 of the same _DSM advertises. Of the 32
Surface models carrying MSHW0040 in the ACPI dumps at [1]:

  fn 0 mask   fn 2 advertised   models
  no _DSM     no                Surface Pro 4
  0x03        no                Surface Book 1
  0x05        yes               Surface Laptop 1, 2
  0x0d        yes               Surface Book 2, Laptop SE, Studio 2
  0x0f        yes               the remaining 25

Only two models do not advertise it, and they are exactly the two that
need surfacepro3_button: the Surface Pro 4, whose MSHW0040 device
carries no _DSM at all, and the Surface Book 1, whose _DSM advertises
functions 0 and 1 only, function 1 there being dGPU base attach
handling.

Use acpi_check_dsm() to make the decision, and keep evaluating the
revision afterwards so that it remains available through dev_dbg().

[1] https://github.com/linux-surface/acpidumps

Fixes: c394159310d0 ("Input: soc_button_array - add support for newer surface devices")
Link: https://lore.kernel.org/all/20211109081125.41410-1-nakato@nakato.io/
Co-developed-by: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Sachi King <nakato@nakato.io>
Co-developed-by: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>
Signed-off-by: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>
---
 drivers/input/misc/soc_button_array.c | 31 +++++++++++++++------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index dbf86ea778e6..75946e18cc80 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -546,9 +546,17 @@ static const struct soc_device_data soc_device_MSHW0028 = {
  * Special device check for Surface Book 2 and Surface Pro (2017).
  * Both, the Surface Pro 4 (surfacepro3_button.c) and the above mentioned
  * devices use MSHW0040 for power and volume buttons, however the way they
- * have to be addressed differs. Make sure that we only load this drivers
- * for the correct devices by checking the OEM Platform Revision provided by
- * the _DSM method.
+ * have to be addressed differs. Make sure that we only load this driver for
+ * the correct devices.
+ *
+ * The OEM Platform Revision _DSM function tells them apart, but its return
+ * value cannot: it is a revision number and 0 is a valid one, which the AMD
+ * variants of the Surface Laptop 3 and 4 report while still needing this
+ * driver. Check whether the function is implemented at all instead, which
+ * function 0 of the same _DSM advertises. The devices that need
+ * surfacepro3_button.c do not advertise it: the Surface Pro 4 has no _DSM on
+ * this device, and the Surface Book 1 has one that advertises functions 0
+ * and 1 only.
  */
 #define MSHW0040_DSM_REVISION		0x01
 #define MSHW0040_DSM_GET_OMPR		0x02	// get OEM Platform Revision
@@ -560,27 +568,22 @@ static int soc_device_check_MSHW0040(struct device *dev)
 {
 	acpi_handle handle = ACPI_HANDLE(dev);
 	union acpi_object *result;
-	u64 oem_platform_rev = 0;	// valid revisions are nonzero
+	u64 oem_platform_rev = 0;
+
+	if (!acpi_check_dsm(handle, &MSHW0040_DSM_UUID, MSHW0040_DSM_REVISION,
+			    BIT(MSHW0040_DSM_GET_OMPR)))
+		return -ENODEV;
 
-	// get OEM platform revision
+	/* Fetch the revision separately, it is only used for debugging. */
 	result = acpi_evaluate_dsm_typed(handle, &MSHW0040_DSM_UUID,
 					 MSHW0040_DSM_REVISION,
 					 MSHW0040_DSM_GET_OMPR, NULL,
 					 ACPI_TYPE_INTEGER);
-
 	if (result) {
 		oem_platform_rev = result->integer.value;
 		ACPI_FREE(result);
 	}
 
-	/*
-	 * If the revision is zero here, the _DSM evaluation has failed. This
-	 * indicates that we have a Pro 4 or Book 1 and this driver should not
-	 * be used.
-	 */
-	if (oem_platform_rev == 0)
-		return -ENODEV;
-
 	dev_dbg(dev, "OEM Platform Revision %llu\n", oem_platform_rev);
 
 	return 0;
-- 
2.56.0

