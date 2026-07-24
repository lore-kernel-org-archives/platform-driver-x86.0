Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B2941E6A0
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jul 2026 12:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784894601; cv=none; b=JHzmJYP+KQs7yx9je4VKZzE/I6axNFXRkB+A2iv8tPYCsAH8/oEQzHo9IvaIIEvJeFH4cwf7eY+LeQhPSLUwn3ibA0bxt0bdseMRQisPL0R78o7wXtfuuqAx6JLHG7SSEjSAqCo7jzKGOXnKF5OuR5xw1rYo74Sv1A7JURUvtUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784894601; c=relaxed/simple;
	bh=gsD0zF524yLUmW2BoyALIJS4IXZnsjOxh093vuvI3fU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SxyCP7/x/1k6VD8R3ekZNQCL4gAIsyC68iJpqTliQ4+J6lzhnLyKAuvG8UkqkR6hcSkZZAOD0RdfieLDSkPX1TrFdgkEzF+Zmyf2AJuhqwRqMCp7NHaVSLDrMFlU4C0WzEGo1x0AFDI+Bpp/r27f81XMxL8UmwMV7vVrxnvsCH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgoR8ZhO; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgoR8ZhO"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so368081a12.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jul 2026 05:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784894600; x=1785499400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBF0vhnEhFTdd9Wn4nN459JljAuFG5Ak7X3KM7z55Og=;
        b=LgoR8ZhO7YfSKVvQudG1zdEVo8WPrfVVMeaxmNdV6CdpVRKPgeLpFsjvwC6AWkHyUQ
         R7Ny3G6lKUu/IHYbABQiHK17yVRQgpkyFYuygZVLc2YpxNf8Enx8F2RcogidqZDmACO+
         YeE+7gUfPgWIhcKwr2CUHk5ZD8UxRFXvKJ5G/GzQygeI+nKIY/qIzfNXo9FS6oZQXapW
         H3TJv7Em5VtRovJcIg5a+V5nyGy7LqPmrVpFzyzbkn2euXnZjM4guqaJr/EFFHLHowhW
         L/XFTXZI3uJjwGadL3o0eVqZqPLYp48UspARnf9F0BgUY/c1Q49dZjwFi/kzqSwjtuKm
         03Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784894600; x=1785499400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hBF0vhnEhFTdd9Wn4nN459JljAuFG5Ak7X3KM7z55Og=;
        b=n2jVZzLL6sfbSXvqxrvXFJKa3xYO9YRXOtqQg3McMqDFHhs639ktQdvxiHb6/fFqCI
         WXXcGY6QgJe4iUUWvWBaPg1hQ0VFRbmpyJJ8F8tN5AYs+uPUnvlBFtRigRdivmRmq2nJ
         5PcV5Mh7O3vBfhZNfKZH2zRdT8uEmabMg3xQMAwgywMDwnHAacBAFDi8HKBt47misaf9
         wPfv136K6npwCrlitE4Gu0hgxoChB0zF76os9X+0PEqpkgNjG0O33AMaa8WWXyOlJ5k4
         9sgC745a6LrOdt8/6LJTACsnxg01Mwr8TxzaxAXvIMjaRcHHrXfbVOJEqzb5epoAFoR9
         5tww==
X-Forwarded-Encrypted: i=1; AHgh+RoLqNx/I1u2r+fXyyJLtje/EtuFOE86yVpGAtWEVG5nMN5dkHuzMAsgdzYv84KJzgtKRJuqf/l8suLltO/1eH9/Gb+7@vger.kernel.org
X-Gm-Message-State: AOJu0YzpmOEtbo8y1UbuH753MQXq6UFpEB9RNeHKCQTv0S6sd7wHcuSo
	Qt8THf/wcdZIdcJuhf1PILg6SsAlx5irCYZWanMsns1UbQLfm9uEfQaqmFY7o2NE
X-Gm-Gg: AR+sD12VFZe79SFmpovBm8gH4cL2hNOGn7k14dArCGdd2MMF8F34/7ms8ZyoyygMshk
	VGTcjhTQy4QQZdbsmYrs6UoMox9lVUM2EDoJG01L1Q+baVopE8dcbkpbVjrTaUREyvPQiLT6+GC
	ysLoeEQSjXEUhovMQex2cQbXvNN6ms/AEvrMm48ccmksKQDiajFlpH6E5hk7HYmdhBBqwFwONJY
	aAkjSI5IqFN48y8jkM3cQIZmCwuMaDhs6yI4jPT9majx5lho0fGj7cM5A9KZzy416xBybkyNOYD
	gMnLIzgGza+w3htTpBCK8bruc7FvK+LpxZws81DJZCFepGxjZ3Sy7NLbidOE4rFlIpbEIXoFlOP
	7EDl2p5FsShwus3b/lX3zoOjU/VTDc2blTtjySx+BpItUHgTq2uWvx1PTyEEGarLqVTYjmEVrQ+
	W3EgFYGddLHj6azR5BVqdIpKWulUXOtkVR7tLa
X-Received: by 2002:a05:6a21:6017:b0:3c4:397a:69aa with SMTP id adf61e73a8af0-3c44b042141mr7909402637.31.1784894599697;
        Fri, 24 Jul 2026 05:03:19 -0700 (PDT)
Received: from archlinux ([2409:40d5:495:95e5:c56b:84d4:ba05:5c42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df0ba0asm27868165eec.18.2026.07.24.05.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:03:19 -0700 (PDT)
From: Suryansh Singh <technosfan14@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: hansg@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suryansh Singh <technosfan14@gmail.com>
Subject: [PATCH v2] platform/x86: hp-wmi: Add OMEN board 8BA9 thermal profile support
Date: Fri, 24 Jul 2026 17:32:55 +0530
Message-ID: <20260724120255.49649-1-technosfan14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <423a8ddd-e93e-8aaf-dcd8-d9d54d9a0600@linux.intel.com>
References: <423a8ddd-e93e-8aaf-dcd8-d9d54d9a0600@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OMEN 16-wd0xxx (board ID: 8BA9) has the same WMI interface
as other Victus S boards, but requires quirks for correctly
switching thermal profile.

Add the DMI board name to hp_wmi_feature_boards[] table
and map it to omen_v1_board_params.

Without this entry, platform profile switching is unavailable,
preventing fan RPM reporting and controlling.

Tested on:
  HP OMEN 16-wd0012TX
  DMI Board Name: 8BA9

It has been confirmed that the platform profile is registered
successfully, and the fan RPMs are readable and controllable.

Signed-off-by: Suryansh Singh <technosfan14@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 5353d997d..c4f67d9b4 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -246,6 +246,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A4D") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BA9") },
+		.driver_data = (void *)&omen_v1_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BAB") },
 		.driver_data = (void *)&omen_v1_board_params,
-- 
2.55.0

