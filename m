Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31E65218B2
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 15:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904551; cv=none; b=TdAWkJIZlN1vKC8Oug5RZiEZ5R2MoaeCpleYCiQlpPqkNaoip88kHyE05lDgWXrO0LflylVezOucUAfRGKZ8IY7vGOkAgQHdVDzbbd0Ol7nhLaFnXM2sv+2THG1zcOkCHaTI5l8ocXSvOpVuYy9ISOBFNqAnzmJgdQLpX0049tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904551; c=relaxed/simple;
	bh=HmGWDDaqG9wgYzaaOhCtIlUpwfVuv7eZAzQKZvw2NO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LnDhfN/O4n4sh4j2UbOM/4Cz0sFR+kWcZnqp27LEoXxQ+Xavm5NqEjB/tKgcyJRWfrlJ7GzzAxp8+wo6Z+g0detqN4fAeUbF7gL33vYXbdUdDtXlXY9gVVKZi6QNrPvBR6u/x0xM0GlwOuWltfBWLHOFjNwKDFkwipMNHtBMDWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=JWEgw3uW; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="JWEgw3uW"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-17bc533fda3so569400c88.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 08:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1791904550; x=1792509350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/4xf9ixNsPOw+XXMk3VwH3ZhfDNhWjYPrvc7VQp0Lc=;
        b=JWEgw3uWTlFOyFtqcJnFR6u07H31+PLkPy6cU/CGAtJbU5mZcWG/erQaX0OraCo+I8
         KgyLtUlXY4e935EWhB6I7wHslhhod5vCwWbjheTL9EsdCfyMIZjPgvVAZ71j+vaCjuUX
         uM/abnVDe7ILe8q4wk/gtBbGDZNZewVXPDnCwMQc/QV7oR1DmqnzqgflL5LjZ02RvQRk
         VUFApJEVwW+2ZCQPAVFuwJFW38PK/ZLGlVoxoca3LXliMdK+iM89WrZF6B96c4I7W0em
         RwUzM+qrrHGnUDSoBqXIgYQ/HqOEyo1Db9t6bMHXKXLDpmGFz/Ns43u7iAWlvu4f6vEs
         HzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904550; x=1792509350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/4xf9ixNsPOw+XXMk3VwH3ZhfDNhWjYPrvc7VQp0Lc=;
        b=CPGg0mdrtchwk/v24snDynCYt8JVqxcVj1gg6KCSqnuqy5kIgAjfxcy499q9cnA+a5
         EBQI4zNZUbUXPL+lx6St0uySAPfC3nT11szMhVL5BFxUSsdmTLYeVPpspT8dWUP6SW7A
         anlmgYwlDtsxfEZpkOqhOw21R/ZiOnGkfeN+dZZU/yAtZVXiIF9X2aRlCPN1K2t6exrV
         9QgWQ7xi+rOdvS1Da94EYJDL6ONqFpJ5aFVBh1lAdyEC3nlWUw6Or9jSIMkUPHWO2k2q
         kG2CkdYLg9rwfL4akLEKn9mwTQi0UWzCeCU53j3HEdCy2t3xjQj2r6VxjdAGSHaUZaWM
         kBiw==
X-Forwarded-Encrypted: i=1; AKwUvBwc8cZZZ93q4Vum+vPIppCXLzVlj1ttKT8oVbETJgs8l5dsApYD9lXrqdbAG+5whJTFaIrQ4Cs3I7UoFAr3J38l3stC@vger.kernel.org
X-Gm-Message-State: AFq9FYJE70rGw1OEPaBQGAN8NMEPLhkeaPGhaCpS/if41HYTAW4I2toI
	7eom6ZQ2Sx2HQ47XJGBOLndrOHUeRBvoRIZMYaaXqAMfGmMGT0AbVCluC8N+83igN7wzDgRPwEE
	MPlHolIg=
X-Gm-Gg: AYBFou24Yp2dJixsCuOxtS0B9HC0MsePAxXYUMuGnhhE3K2nsFj9TyMCo1M34TTbans
	o9apqtzhb2VUKr6ZYSM9tqt6D5wzTDgejUiHbVZWekyTJSjabbjngaqp5QPfeOKOHL56epT/Er8
	4LEn57M5RAT2KOBFFjEJmfkfP1boQQ4z2T5xQsBzV1GPTbpC6L9HZtHIInlj8YvYImm1P2hKTEq
	Q9d4vGc84kmgPUK04/YOweL3E0e4UmW1AMRDTBF2EJ6+oLB6rC9JFhkYx8lCcF6RWDCnzKHheey
	EpxIR9uwoJiWVMYVM+JyMb50hIDivdgmGJBVksrw49w15PCDyCl56iPvP0pPBoyCBL3IxJGQUA4
	W5iScps3KJz3jqAUk1/WFugZiy1Xm+tgiSAE4hxt/DhAXStVGDiMrznuILLYPEuIXkbAvXj5QQl
	T1zkPoPSycnFl/EOJ14pAQWinVHtiIgh1270jDYwsH68njz4ICMJgav7qZV8fFNgnt3yrM29Jqk
	IypYUdZMHWrpE0=
X-Received: by 2002:a05:7022:927:b0:150:c9c5:1ce4 with SMTP id a92af1059eb24-16a56ab133dmr22268863c88.6.1791904549516;
        Tue, 13 Oct 2026 08:15:49 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:49b8:4c98:b3d1:72aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm30691751eec.31.2026.10.13.08.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:15:47 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 13 Oct 2026 16:15:24 +0100
Subject: [PATCH 3/4] Input: mouse: cyapa: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-acpi-input-v1-3-53ad09ba82b7@thegoodpenguin.co.uk>
References: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>
In-Reply-To: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Nick Dyer <nick@shmanahar.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791904532; l=1214;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=HmGWDDaqG9wgYzaaOhCtIlUpwfVuv7eZAzQKZvw2NO0=;
 b=orrWjgwEEFh1FiTF7HQVb9je4Hn8Voxwhgi2CmEj3dj5klRtM2XsKllESdRoEFsFHxl0ERJPf
 mOt99NSkjYeCeABG03IuTSlUlXMnG+AUxvH3Q05qFKuzUV3PACcnUjJ
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/input/mouse/cyapa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/mouse/cyapa.c b/drivers/input/mouse/cyapa.c
index 47000c30e4d8..8a4c78261aeb 100644
--- a/drivers/input/mouse/cyapa.c
+++ b/drivers/input/mouse/cyapa.c
@@ -1463,9 +1463,9 @@ MODULE_DEVICE_TABLE(i2c, cyapa_id_table);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id cyapa_acpi_id[] = {
-	{ "CYAP0000", 0 },  /* Gen3 trackpad with 0x67 I2C address. */
-	{ "CYAP0001", 0 },  /* Gen5 trackpad with 0x24 I2C address. */
-	{ "CYAP0002", 0 },  /* Gen6 trackpad with 0x24 I2C address. */
+	{ .id = "CYAP0000" },  /* Gen3 trackpad with 0x67 I2C address. */
+	{ .id = "CYAP0001" },  /* Gen5 trackpad with 0x24 I2C address. */
+	{ .id = "CYAP0002" },  /* Gen6 trackpad with 0x24 I2C address. */
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cyapa_acpi_id);

-- 
2.53.0

