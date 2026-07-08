Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE273EDE46
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jul 2026 09:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501788; cv=none; b=OzGvTnxCi90/8vkgVpbwmhgZGdOcqjYz3xnaRE/kgXmYoeJmDvBCQJziGqZ8bg99eIxQL3966xVJt9mZqIHESSYJfdLhwghu/RkOkeh4AC2fzF2pHKjrvE0jbd/prg5Ncnvm1XRrb0bTXW6MpmSCtDrrQgFFBza40CiHid4qumo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501788; c=relaxed/simple;
	bh=e5kOipzh1Ml3iPlIV1WObzQBJa6OgQpPMUWyK0IxkBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AuG+5l9Lyr3mlrRSJ3M8gfX/LfYCPfm2CQtLwcmAhrX7CsGfj2UJDFDdpQRc2O4KUlsPfUwJpNAO7yrhlWPBbJirUqeeS93dWhGh6atRFZqjmQXPXM47PscRj9HrkxU0BvQ0YyIhGtWSjbNKMvO6Fx0F4vNnJQwB7hMm0UZK4Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acJOD4ET; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acJOD4ET"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caced6038eso5413205ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jul 2026 02:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783501786; x=1784106586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A4yZP7LJgEPNycbabT+ykQclViHx8C0MIwts6TWJJpU=;
        b=acJOD4ET3NcjqJZdENknNxeFClvKPKItMkkBdicFHwN8flTEEXnhYRk3/B/2RWEWNa
         d82z4D+cXWtLEEGhyXnZ1Q+izeEh0/ZBTA6QGbFqfB2Mc/SD1q7UeWhRdkDojAXwo26j
         +axMFKEk/oOZosgYyC6kkZ0X3a8tP46WlfKoPD8HJkW8uFBGXdCDYVVv2jYVus4gQhvM
         Qu7mRWkxLo2CMVY+A7/JtJhQKrsEVF2x346crhuhhfBobOY1op+q1yk2QSzzFxz/DwEG
         xEG0fOyI8A7nHF6u3KVcXujoCfOBccg7M0VTZvWjseCNR0+a5nbONpZMkGeD3y2g5ByQ
         Ysew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783501786; x=1784106586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4yZP7LJgEPNycbabT+ykQclViHx8C0MIwts6TWJJpU=;
        b=XExRaeD6fMvt11Ph+KF8N9ZKAGc+tqyk/97RO25ltCg50+32tAVfDaQ363DE6FSpFk
         d1YuPuBcEOqS0NI1wQG5o+G0Uecc0aPUDLgI5fxvAnI984Pm+oJc8TVOFDZcBpJteiWw
         0N6BOy5Hr0FohjtR5hf7bt1wLGG8nfxous2Qb3nYBUOLuUKADVQGBZvAYNVBtGd7eFBQ
         bp7MI4BnONMdVyGBw7YJ8pca3H5BxAzZ1TT7I5RkeBsgMILz5Jz41ixzXogd5j8CAJ9v
         uJtRHPmVrmqgf2FKNO07De10Mx+uNtsAmAA2TRTgGyJjIq5O3cJO9EnT41B1IbtZE25j
         mnkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrsYB0I3mLxjornjBz+0oJbt0Z14p3AOaTcUJWeAgWeBgY0cQaUx5DMRgBQwxY9oEAXJ2bYvJ777o8wLFY7y0EUpEGP@vger.kernel.org
X-Gm-Message-State: AOJu0Yydj1S4Ukg1+9O5r6mEyK4GOcb2jsLYE+ILK4NPj0SoVM+wsxvJ
	kOAw0N2fMLCk0WhWaxlV0+lCDo9porhOnGc/oBcJfZ6FFNEdCp3I12Ov
X-Gm-Gg: AfdE7ckbhs6cRnkmXZMjCJOFczPrqrwse6ObdB8HCeHNPh6RNCBL//CTMN1rKHScVBL
	0GKPVcmiv+MjHDgiIXVlyCJZLo+ulCVNkOKjEAECksoxN1XlElHJ/kaKYkwifRk2Qv5wZsk5a6W
	FHBhjchi1tIRrE9eb5FB76BZlvm4Jvm9ouKPkARMmCtkWj3uYKmKZm7cJ7KUJble9lBV1eUoS+n
	yNzjWUAXRp2Dk0mFlqyNipgniWCkWNkPg+zQF+MJfzQ6t+vOh9l5ZHMaexrdUb0nqPdCyQhMKiz
	VVSRuI6jkWrVIL7kjqJJOnTtVKrAk0lVvHrmwsLSrxCaHw6bvBSGCPUZrlYjv7xjv5wpAIeb2kJ
	lSvvHirQBN4vAco2HiUY79mniOGT4MAeHOGI2n8XTW/Ww2ye8YJP835d2h+ZK8y9vyW2bIkssZj
	U5edwd8nC2vw==
X-Received: by 2002:a17:903:2f85:b0:2c9:b2c1:1401 with SMTP id d9443c01a7336-2ccca8c8160mr57507395ad.5.1783501786447;
        Wed, 08 Jul 2026 02:09:46 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5c361sm24671505ad.80.2026.07.08.02.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:09:46 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] platform/x86: hp-bioscfg: fix password encoding bounds check
Date: Wed,  8 Jul 2026 17:09:37 +0800
Message-ID: <20260708090937.740435-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The password PSWD_ENCODINGS parser reads password_obj[elem + pos_values]
while copying the supported password encodings from the ACPI package.

The outer loop only guarantees that elem is within password_obj_count.
The encoding count is bounded by MAX_ENCODINGS_SIZE, but that does not
guarantee that the ACPI package contains enough entries for all
elem + pos_values accesses.

A malformed package can therefore declare a non-zero encoding count
without providing enough string objects, causing the parser to read past
the ACPI package array and pass an out-of-bounds string pointer and
length to hp_convert_hexstr_to_str().

Add the same computed-index bounds check used by the other offset-based
package parsing loops before reading password_obj[elem + pos_values].

Fixes: 8646a3b5ee3a ("platform/x86: hp-bioscfg: passwdobj-attributes")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index 4d79eb8056a5..ae9e701b46bb 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -351,6 +351,11 @@ static int hp_populate_password_elements_from_package(union acpi_object *passwor
 		case PSWD_ENCODINGS:
 			size = min_t(u32, password_data->encodings_size, MAX_ENCODINGS_SIZE);
 			for (pos_values = 0; pos_values < size; pos_values++) {
+				if (elem + pos_values >= password_obj_count) {
+					pr_err("Error elem-objects package is too small\n");
+					return -EINVAL;
+				}
+
 				ret = hp_convert_hexstr_to_str(password_obj[elem + pos_values].string.pointer,
 							       password_obj[elem + pos_values].string.length,
 							       &str_value, &value_len);
-- 
2.43.0

