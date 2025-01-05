Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68B815539A;
	Sun,  5 Jan 2025 15:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091066; cv=none; b=N386rMEpBP2jK+P3rwZ1DyFS5JbRWWMl1B2ymGQstX/JYc/flggHQr81GzG5WLOj5A6uW4FEbUJANavcJDH68mdozGTObxga38u1DkfottUsa6i8vBv88Gp8w4fFJyBANmJKjQfoTk2YOm5o5R+uEuq1ZnrIGmbpw6utcC+02xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091066; c=relaxed/simple;
	bh=FoGvy+ETozLTWpN9GrlBZXHmiKmKx0RkTR8hL0EcUrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EWnxmW8VRKlOAR3LoshpuW0uLuiczcIVlz7J0CFQ8lgwyV+K9GXr8kWJrv5wqt7Z51tQ73glKa2OzftSGCSh5pkRByeK2KKKUBN+8QLd7ZeSpStB1cVkSTg/cZMPbS/rRnI17dkqknrAneKRXAb7lO7DF1Xeiz32yZF6hUz6pxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4dmpYWp; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4dmpYWp"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afd68271b6so3270968137.0;
        Sun, 05 Jan 2025 07:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091063; x=1736695863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+4HfxaIvl/WE4mt0BxQUVifVPHzIEPHKNUp7DN73t0=;
        b=d4dmpYWp8FvlnoyuMsWUdEguSuyWtKQfSFBiUOVo6F9YcOCQMMN08hBf0NJSEiZzXX
         iYvfh9VG2iyLrbLJcAK7SAQJfuScJ/WCeKmHFETtJYtIepklPzkvzV8TvfHelwwZHIvC
         PtjehTA9GBQls75JAVPiwlR/WJXkmBQfdC2ngr3ZZ5MiVsCO8WgvC/waO7kKrCx7BoKw
         rm1feo0qjZlYGP6rd4eYjVCpzY8AdvZfsa17Xb7KpZI84icSptIPsoHHL7zeIqZYtdLL
         Q7EvaxuTuIClPEbGKaz5dwe4M2W/+S5iPob7/v9dct5o6rxH6YW2i7RnoRCq9Sc7aWuK
         gR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091063; x=1736695863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+4HfxaIvl/WE4mt0BxQUVifVPHzIEPHKNUp7DN73t0=;
        b=OPRfFYTLU2YkRdQ5t/uB7lz/Oa1m05nBC/sxjTRBAUAa4LoaVbxultxVKBhw+PL6e3
         XRuVCfyZduiZlgzG64ZbZW+e5ec3fR5MFskh6sTLD+qsvj1y4AFGRDJedf+H6YT4cVxt
         tSOXTyE6gB6EIlIgY1Mu619JH0UGCjQkdvmGe6DusepIqoVLNPRYgVZWeYEL1LYWFfFh
         nUPjCJ8f0C20+7dbVFG5k2xj5u30/+DpYNbx3cm5NZ6J80k6H4oexnRnffEOO77eHSK3
         yuVy6sD9quU/ktGMMCqiWvI+D7yJkxzq5pQq7nthkUqMNLvhCJQtU4h4eb6mMjv7sZ1p
         q29A==
X-Forwarded-Encrypted: i=1; AJvYcCXf/wBP2WYc//XCrg/b8EF0ZWnt6CbEnUEMjjKDeCFZfqeP1HiGrY8asJePvO7zbVJgsa2YluLuKFUP/b8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrLujX30Y+4IztPSil7ydCY6QfvBuu9DxdJ+YJ65Fd/wNmuX09
	nu9qyjxICPH3j0ChfDoo1tUmq3dEjbOkySOTENsgNQHMoqdnkn4ppQfC8g==
X-Gm-Gg: ASbGncsKVP9fHeayCVLl7TnpuUreZuzrHycv7Bl9+mhmCOhVN9xUdbfIh9uW4EoYGBE
	v6+XCMOiOIPOQmLZl/zeTK7zT15PhBxYFCD525hA3OaClIROGJBNckJZDHcIoHZRtRRQFPc7E4J
	qYISM4TrFw4mfBRSJcCsPuiTfg8G3rkDK/YN/b/3mEEnhRNMAmjZ4lHwEv4Fd40HFLAtWFB/LNK
	SQe8/7NcB0it3wd9wIkTJ3UONSWAtjFHRt8B007WZ3uonp0yUPpYCAWMHQYdNFs
X-Google-Smtp-Source: AGHT+IFORZLVnvcKI8TfkLn2TO/ncvGVNk2GgruGIDrk+tEm8CeYKxKWa3vTGr7F095S99XYOlZ77g==
X-Received: by 2002:a05:6102:41a3:b0:4b2:7446:fc18 with SMTP id ada2fe7eead31-4b2cc4597f3mr45491075137.17.1736091063128;
        Sun, 05 Jan 2025 07:31:03 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:02 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	w_armin@gmx.de,
	mario.limonciello@amd.com,
	hdegoede@redhat.com,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v3 01/20] platform/x86: alienware-wmi: Remove unnecessary check at module exit
Date: Sun,  5 Jan 2025 10:30:01 -0500
Message-ID: <20250105153019.19206-3-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105153019.19206-2-kuurtb@gmail.com>
References: <20250105153019.19206-2-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Module initialization fails if platform device fails to register so it's
always not NULL at exit.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 7b3ee2d6a23d..7212d75396b9 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -1250,12 +1250,10 @@ module_init(alienware_wmi_init);
 
 static void __exit alienware_wmi_exit(void)
 {
-	if (platform_device) {
-		alienware_zone_exit(platform_device);
-		remove_hdmi(platform_device);
-		platform_device_unregister(platform_device);
-		platform_driver_unregister(&platform_driver);
-	}
+	alienware_zone_exit(platform_device);
+	remove_hdmi(platform_device);
+	platform_device_unregister(platform_device);
+	platform_driver_unregister(&platform_driver);
 }
 
 module_exit(alienware_wmi_exit);
-- 
2.47.1

