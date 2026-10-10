Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326884A7C84
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636585; cv=none; b=ghIhoSB3lwXPCif+Tzg+WZ6jyyF5+m1s0DtdAJWoLolUo0/P9mD8P0WnCJS4pTM4d59tivxJPaauf5DdJq7AaJp/0x1CA5aN/gKeAcaY1NvAMZNHkGA4LBNxqg4J2qzUYk0+pYv7QFgFkjftyu/yeLub4j935VAduSjy+adjdqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636585; c=relaxed/simple;
	bh=1kvBvnU1XqG+LB+Mu/IPw77rDx6+TGEn8znDEATvlDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eg1GmU8Veyr8A1WMXK41fPLZ5S1MBAQ8f2xwFE7/cbWmlXx4UV9mWwAWZgYF2Lstt/OqCwbXRoqkl+7icWxgDShZxuqTTQHXTgCi9+Kg1xFErcgF1s2kAZlo7chdPEvBhuHnbIz6Bhinygv+ygYbYWsbslAx7efEKfnd9Ug+k9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoSbUdH4; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoSbUdH4"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1517bda04a0so227909c88.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 05:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791636582; x=1792241382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mthh0Sv1VUOW5+w7XlTGMrRo8ZjYlLW2iXmgZOV9P4Y=;
        b=RoSbUdH4+RXXvTNxJDmJgROevcokfEtlhB+kRQDpI+mDuR9erirySRkE/TvTdTxvMv
         g6ML8zVCrDcUP3LjLYz3g/8GVhBbeWrdDwrhmLZeUVmrfWiI/BQ7Q26qN+dkHkCPm5d2
         Es4AlUBW4zsjfIkwjDIILA0TeyIWk/o6nKGaq1fu8+/bHVhe09Zzlw8BtP63/SLwbvX2
         sGyx1MatHGVAxMMlYGiQR20QBF++ggBoNoW7jG/XtCXuHa9KgYFoZRW1EaXgCMJD9yKB
         e/Q14BIPpq34wFWkxS+bRiscL9OgrORZHjpikBI93v/wiNFj8zxAYVKRZg1VwIoCyYzK
         eOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791636582; x=1792241382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mthh0Sv1VUOW5+w7XlTGMrRo8ZjYlLW2iXmgZOV9P4Y=;
        b=YSFAMb6+rTwlS+nvDq0a9GT3cikh6wqJjNqSSuLgGujv4MXdbRCE+K2f4IvFBXzbr8
         FpxuxbtEpW3Cq0J+Pbs8biyu8oOQsIoaUqqwCKKL+ucoreWz8OYNjGLcCg28D2c1MJvS
         qjKlEfDBNbqhfHCj+TQ6aF0LeFQENw+/f5wH3Db4MOjKiMCNy1etKK5vQvv+t9EJsHIe
         YE65Ccxxs2/i2GMDeIeg/prgcQDtXuxFZZMgEztRCT5H5V+B49J0FceVAXUaSXUU96sI
         wHPLC5Gt+4m9aWDiaIhFfw/SKX8EDoAidIXKm/R7jdSaRnGHPRLD7Cp1LgSvYJlc4LIG
         6odw==
X-Forwarded-Encrypted: i=1; AKwUvBzvvHmT85xnyeQp+UJEZLkmD7xmsCye01eQ0n+7DsNnDU1K9wk5ONkaMf4BWw8/d/XNnyQ6S2ng6psg+AfcoCcyb301@vger.kernel.org
X-Gm-Message-State: AFq9FYLER9kcMiMCkIquyQ2x33uHJ6C+P8CvPuQ7dP4Uctorn4ZtrgLO
	jZzep/3zxHgy2lLBlZ6fU01pAdq6TM6R2pTnJTK7rPfecJrnzr6eMqvFCXOKIA==
X-Gm-Gg: AYBFou19C6iA+FkujouUqX364m9SHTw4MCdQKf9djYfM9oxXGa2T9jQ/+uBdGUINq5y
	vaoS2t8I5OYGY5w0kN2U6c7c9WcUekFtGr1vRfj+S2h3Wa1SCLGpasN9bn24RN+Y70r6JlRtq56
	33qiOSDi6FMpTnSElfuWWyjbmmbUVSNRJgUUbMWVNvl3/7esmiZx2jdFLJq8O1g+McOzoKNXrji
	rylvlniWtpeZfCb3U3w9NUolfYAT997TuJbOfViDAXJz1kjCOJ6Ech3L/YEUWccF53T9MqDvCgw
	J/XwPSedUIH9p1YCoLn0CB4i1ph5M5zXzWl+QVFYVApLIQPO1iTc+M04jiCjKRKQHxdMKqMML4x
	BKNHzjbEvEC/zYRt3k00FGGqKV8mEuAKS1V1bgyQD3KQhv0RTRKRkogh5/LppkyIEmUC5ngs9Bi
	XNcmz6sgDhqSnogz8gbN/Bd4NZNVBBe+fb09dC+UEWTgGA327+qkPdE4HqWU4je2RJrbkIbiTvh
	LceGlAtGY18Ecv+Tv8vEoO5xpM=
X-Received: by 2002:a05:7022:3a81:b0:14c:efa5:ee7 with SMTP id a92af1059eb24-16a5afe51b5mr6320260c88.14.1791636582095;
        Sat, 10 Oct 2026 05:49:42 -0700 (PDT)
Received: from chitransh.. ([2401:4900:c920:95f0:34f7:c1ca:5f91:2fb9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a6021e49sm14204812c88.20.2026.10.10.05.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 05:49:41 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rafael@kernel.org
Cc: lenb@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v5] ACPI: video: force native backlight on Dell OptiPlex AIO 7410 35W
Date: Sat, 10 Oct 2026 18:18:30 +0530
Message-ID: <20261010124830.116750-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
References: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

The Dell OptiPlex AIO 7410 35W (board 01KP8D) declares DELL0501 in its
ACPI DSDT (status = 0x0F) even though no UART scalar board is physically
present. This causes acpi_video_get_backlight_type() to return
acpi_backlight_dell_uart, which makes i915 skip registering
intel_backlight. The dell-uart-backlight driver then times out talking
to the absent board and the probe fails, leaving the machine with zero
backlight control.

A BIOS update fixes this on some models (e.g. OptiPlex 7420, board
0914RT) by setting DELL0501 _STA to 0, but Dell has not shipped a
corrected BIOS for the 7410 even in the latest release (1.37.0,
2026-05-28).

Add a DMI quirk to force native backlight on this model so that i915
registers intel_backlight and brightness control works out of the box.

Tested on:
  - OptiPlex AIO 7410 35W (01KP8D, BIOS 1.37.0) -- confirmed
    acpi_backlight=native produces working intel_backlight (raw,
    max=96000), DMI quirk has the same effect.
  - OptiPlex AIO 7420 35W (0914RT, BIOS 1.27.0) -- DELL0501 absent in
    updated BIOS, intel_backlight works natively (no regression).

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 drivers/acpi/video_detect.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index e3b69f876d24..1af14e04e597 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -883,6 +883,14 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 7770 AIO"),
 		},
 	},
+	{
+	 .callback = video_detect_force_native,
+	 /* Dell OptiPlex AIO 7410 35W */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex AIO 7410 35W"),
+		},
+	},
 
 	/*
 	 * Models which have nvidia-ec-wmi support, but should not use it.
-- 
2.43.0

