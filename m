Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F791FB4
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Sep 2024 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727167274; cv=none; b=cmSBVqvDX2TVcwHGLWIpjCv4A+8Q48X8c4alEGb/M1sNB447oyOKVc2IUta/dSjGsOUnqQ1bQME5wp7grngUt7MQNwpBrq/GZb9NiwAKABtgTks2PSwYJd/gQllh1Mrdv1Ph6Xno3h2fbISu0ahyjYHrukpJ7hQJ8OKG2IWP3pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727167274; c=relaxed/simple;
	bh=4ltDlNqrDGR27ksNZnCiug3GSOdf6tIVfNnAqB0cnUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M7OYtyon3+OysMf4c/QX8MfweNI5+YtV4RiP3+F+I7Qw4e0k9KCtNIfVfZWA5OZfD5ni6KnEXXOxM9sh1w5h1ws700C5Du70nd3iD0s54Pd6Ukl3JN3srDzpa8uifhGTy7/VkKlx0AUEK3sAnpWPGH+QPhDUt6HeY18g4/H7Wwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iSXYAjbG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iSXYAjbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727167271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZZ5Fx0mtQJO1gSt0hL1ASxmxmOaX7Z23At8t63rE11I=;
	b=iSXYAjbGb5arRmo+AKF9b4v1Uhs1pPuCjZw54imgcUhT1VT3xxcolB8Cn2rb8QuxKXzZwy
	GtijRL90bVWehREjRqhE9NDSphOhBIcYXtp9tdV1AQFQr50iKH2pepvLcaiPwnzZOl3Mab
	frCZ0aAK6qf/5DJ9oGdLCuThIVqpoaQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-AV3JiJOuMx6ye5AM-AptLw-1; Tue, 24 Sep 2024 04:41:10 -0400
X-MC-Unique: AV3JiJOuMx6ye5AM-AptLw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3787ea79dceso2030185f8f.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Sep 2024 01:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727167269; x=1727772069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZ5Fx0mtQJO1gSt0hL1ASxmxmOaX7Z23At8t63rE11I=;
        b=VHK+QqNwfpm7rApN9d39OgWPN0j8uSWGgi5Kex79YLr1PAtmdecpd983ADdyS9meFE
         PRKSW5Wfjp43T2gIdwIH3qNTp76pZUk/ULctM4TdTv1S60zGH8cQEayqlgAMaVz/VLh2
         877KGsMKSpEKBpJTpxgMfvOyVCx9mRsRyzpT1wpUYFY7Kl2R+MlW0U9iibeuIiEa43Fs
         stQJudGG1oPc3f9B3WrN5uzPtoz91dS5sX86UL/L7tvVXGkYYuL/UVKxbMF2qjGXyTOI
         NnXyr7txFmPGavN0r3AKOs1jPp9HrW5lQJI5j51xJC7/yS0sDwxCVzFRJrA3XTCiTr0I
         SLfw==
X-Forwarded-Encrypted: i=1; AJvYcCVMWGYB4LUFiPmeB/uDn/3ERx4Cn/ZbqpP3ZfzWsyd0RLymd+bU2LG9iPW+Ac8cV/v9VxBqYTmQHhNCsJdE2xVWpkVs@vger.kernel.org
X-Gm-Message-State: AOJu0YxzQSazOgfvnEuy4QD/WjpueFxD+qvX5anLIAUVeT8LM7AG2wIh
	hU7i8ZuqgxfgKtx1lmEszMeoJUuiPd2FY90q+dd5h5PRoeOzPVFdj9bJ0tyl9F+08zoBzjyo70S
	GU8Uf0PiLpZzK6AO5h9RRpevcQLy2ewRdoSn/bF86MGEPByHZaNX+Z8446d4eOkV9QK6MIgs=
X-Received: by 2002:a5d:434b:0:b0:374:b6f4:d8d1 with SMTP id ffacd0b85a97d-37a4226543amr6838951f8f.13.1727167269371;
        Tue, 24 Sep 2024 01:41:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg2yg6W81UBOHvRHLFJDRDvodAV4WI9aSY+BW2GEqIIxZ8SG9S5WI+REDe8rZ3VTtvckwPAQ==
X-Received: by 2002:a5d:434b:0:b0:374:b6f4:d8d1 with SMTP id ffacd0b85a97d-37a4226543amr6838936f8f.13.1727167268887;
        Tue, 24 Sep 2024 01:41:08 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2f96f6sm958087f8f.87.2024.09.24.01.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 01:41:08 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] platform/x86:intel/pmc: fix IS_ENABLED() check
Date: Tue, 24 Sep 2024 10:40:56 +0200
Message-ID: <20240924084056.48447-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit d7a87891e2f5 ("platform/x86:intel/pmc: fix build regression with
pmtimer turned off") accidentally slips in some CONFIG_CONFIG_X86_PM_TIMER
(note the duplicated CONFIG prefix) in the IS_ENABLED() check.

Fortunately, ./scripts/checkkconfigsymbols.py notices this accident. Fix up
the IS_ENABLED() check with the intended config name.

Fixes: d7a87891e2f5 ("platform/x86:intel/pmc: fix build regression with pmtimer turned off")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/platform/x86/intel/pmc/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 0431a599ba26..4387b5103701 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1546,7 +1546,7 @@ static int pmc_core_probe(struct platform_device *pdev)
 			       pmc_core_adjust_slp_s0_step(primary_pmc, 1));
 
 	map = primary_pmc->map;
-	if (IS_ENABLED(CONFIG_CONFIG_X86_PM_TIMER) &&
+	if (IS_ENABLED(CONFIG_X86_PM_TIMER) &&
 	    map->acpi_pm_tmr_ctl_offset)
 		acpi_pmtmr_register_suspend_resume_callback(pmc_core_acpi_pm_timer_suspend_resume,
 							 pmcdev);
@@ -1563,7 +1563,7 @@ static void pmc_core_remove(struct platform_device *pdev)
 	const struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
 	const struct pmc_reg_map *map = pmc->map;
 
-	if (IS_ENABLED(CONFIG_CONFIG_X86_PM_TIMER) &&
+	if (IS_ENABLED(CONFIG_X86_PM_TIMER) &&
 	    map->acpi_pm_tmr_ctl_offset)
 		acpi_pmtmr_unregister_suspend_resume_callback();
 
-- 
2.46.1

