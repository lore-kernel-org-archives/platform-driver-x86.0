Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC56418A36
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jul 2026 12:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502491; cv=none; b=TGD5vI5vbGh9LdF6XGHeoVyg2O2HwFcv7bybeV72L33qR/F7q6pP/Uu6kdVLnN9F3k4ZNy4/rIu51R8eG4V4VXlegC/3mCNF+XRh8LIjr7CPIYwU14X/IqZQ0HmEdp+G8tARF6UqaKCIfT0SX8lVWqSfWeboqT8uYNYN/G/eKgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502491; c=relaxed/simple;
	bh=gbJ1qqfbF0nBVlSEhwzrkhM234XgVutoSuHcds+hLB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rRp5YWlAVViTFcbkS/152H5Xfg9K7LisbkmlFFjJcX/xlL0CpN2lKco99/asu+TTSJg/dwQt+4SE1dHtHLV7OkBhLpFayz2Igf5unnIPFf/1gSWck6kfgIeokgepYxw9eMwcgEuw7qqbDsEbBmwRUpJ40ytmON4Zq7yEtmI5yzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IglG4UWO; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IglG4UWO"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f71156e1aso522009f8f.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jul 2026 05:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785502488; x=1786107288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X2rvyL9iOnKkYeiEWC78cS0WtI3Ni+/w7Dx0CvVbGto=;
        b=IglG4UWO08tbOgOaLL8hqQamcVvSrJ3BZGtQtLGyhRHS/el7P6BjR2riaMmorQdQuH
         KQgpZVmLeNxeL5RzWPmhCKh1WcWAnNdMaJN2DmQn2AwNqG4+LI7b1ssdox/PyThj4TPE
         IOib+1ARVJUzWS5FjQn9Q/0XDjnP2RIjbvnpQ77mgzSasVc2Jc+mp1rv4UUsgsvTvuUs
         eC3ihrIwCNtMtHSDUAjvEP5t6TaROgeRCUdmRlf0W5p5CyzP5cjq5fR5k1HU8l2DZFWE
         /qd2GEkvoY4XNvR5AbOba9yb9807L1bF5q0KRNFZeW3kEMnPN7dgyCCVXJVuwIDW0E51
         hyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785502488; x=1786107288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X2rvyL9iOnKkYeiEWC78cS0WtI3Ni+/w7Dx0CvVbGto=;
        b=goLX39C12NY5RGqrCCEfTjWv1CkqlneObDA1VGCrEN6Yp+F8P5/gxOsOHRTnx43POt
         r4W+OkSTrWz5aoH+K8ySwe5VIQOsRAboJf9JrKAmVS8U/zu9WHL3rWbf/JAYuk8xV7hn
         LiHmiVpwwP8awPuAz/cqJ8p/f4uVhB5wFkxDUwUJ709vUlhhLO6ZeT0NbvVfKRcoccbY
         AdxHrk7JRv1cTL0osMSRlPWOEd1Wdtj31XTgOucQgMxMWgW93z7yc96t93cryJ818256
         spcedZMc39s1+Dwp7tSYT0E4Vwiao6RAsmiba8G2vrytNNWiwMCHfbap6ozSDZ//ftzj
         kYyg==
X-Forwarded-Encrypted: i=1; AHgh+RreAsI7DphgXPhBVaTe8xIWH/ijG5JoqDPCRv4BNhJE9xxB34R2jMuCtfvBsKDOU7OLn7AYi2zYbajlU0KHvTW5KbPy@vger.kernel.org
X-Gm-Message-State: AOJu0YyMod3LmN3IjJeeMpACNj+ztNavo8fMyPzu+MFORRTvC0w3hF6U
	/1D3aRn3jkRl2hvm5wPsovAo4datxyUz/YPEsBQUP3iE+KoVwAUzV+T3D4JvxXNUCNGKxA==
X-Gm-Gg: AR+sD123TnlK9l02TUUGRnLnlO4YUM2xwIl8YtrO0hCDQbafUyJdBhw8ZfyhZq+go52
	gUnmkbBz5O/KBFuSc7KmDMfv6L63CGFgU0If9ElNI/eBKCq2ODDlYIK8cgNVGe1xu1tR6Dfg9rz
	hTcOAYlwoPfnN3eUQdRZlrUOLKBgY8BSKKRpyJOfppf07gWNtH+kOwUj7iJLnP85O/InqHoETJA
	zS3W2bekuNxIcOLNKy1huQGDchOnqdoQRmkqWwa6mb6lrqgjLuWenhcuA9KIEkDSICC3VO4u7ma
	jYPieP+AxM7u7LL8DDZNyS0iSe4plAKEhbxBRaG0GfEzLFhP4MtCOGX4RRvmbT7+0Oh5GV+RkFW
	GAPGeTu0dEjPX2QyW3wR2lkXo5lTvDedRWZcosLI3yxS7iEE6G4hldQyvUftNnkal/YLALwl3ZP
	tIwU3rTp8mfNtHvNHfSt76uFOiDYHrNwqb1ICekfZyL+C+gGOuNITOn0gW6ZJevsSVwE1MwRI=
X-Received: by 2002:a05:6000:184b:b0:474:57f0:49f8 with SMTP id ffacd0b85a97d-47fd2ab9be0mr4418899f8f.4.1785502488241;
        Fri, 31 Jul 2026 05:54:48 -0700 (PDT)
Received: from cachyos-riky.home ([158.47.229.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm4731621f8f.19.2026.07.31.05.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:54:47 -0700 (PDT)
From: Riccardo Squarcialupi <rikysquarcia@gmail.com>
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Riccardo Squarcialupi <rikysquarcia@gmail.com>
Subject: [PATCH] platform/x86: samsung-galaxybook: Add SAMB430 device ID
Date: Fri, 31 Jul 2026 14:54:31 +0200
Message-ID: <20260731125431.199902-1-rikysquarcia@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Samsung Galaxy Book6 Pro (NP944XJG-KG4IT) exposes its SCAI ACPI
device with HID SAMB430, which is not in the driver's device ID table,
so the driver never binds and none of its features are available.

Add SAMB430 to galaxybook_device_ids[].

Tested on an NP944XJG-KG4IT by forcing the bind via driver_override,
which is equivalent to an ID table match. All driver features probe
successfully: keyboard backlight LED, battery charge control end
threshold, platform profile (low-power/quiet/balanced/performance),
firmware attributes (power_on_lid_open, usb_charging), and the camera
lens cover input switch.

One optional feature probe fails harmlessly on this model:
"failed to execute CSFI; device responded with failure code 0xff".
This does not affect any of the features listed above.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Riccardo Squarcialupi <rikysquarcia@gmail.com>
---
 drivers/platform/x86/samsung-galaxybook.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
index 755cb82bdb60..e350f175b9ee 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -1411,6 +1411,7 @@ static const struct acpi_device_id galaxybook_device_ids[] = {
 	{ "SAM0428" },
 	{ "SAM0429" },
 	{ "SAM0430" },
+	{ "SAMB430" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, galaxybook_device_ids);
-- 
2.55.0

