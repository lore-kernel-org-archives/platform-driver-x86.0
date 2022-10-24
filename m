Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9F1FA3741
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Oct 2022 11:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbiJXLju (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Oct 2022 07:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbiJXLjH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 07:39:07 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E08A6E2E2
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 04:38:29 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id g24so3206816plq.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 04:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3flgEAolZn9kn5oClvgduggco3LU3Kao58cYVj8GoE4=;
        b=LFNGam9y4Mzo/GmaRHBG21OM1uk0hOommk74KXR9Ca3TMfQryGTVdhVU5ltrLDq2eZ
         02Sufh/O0mf9igu5dzzr9xfFTvUVJnusR47enfl8COOjleX5fwL6eAZaOwUFpStJHUJi
         hCLqEFuFEiStB87OEfhilZId7gmp5XPzc8feF2PYyJiV+KGbmtv9V+IgrRH+2aqz3DHV
         M+0XmnIQ2XPB2CwxIkAbGWu2tAx/w1WMTphoADzrca9LYFwO0Tc5zvTS7ycemczGbZdY
         uWICIlA0YHCEjqWRpSdtI+n8c9TyFLANwWLT4ZFSjfGAycLhmE5YxuD4ntG1ulSCg1AF
         sMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3flgEAolZn9kn5oClvgduggco3LU3Kao58cYVj8GoE4=;
        b=jFQ+vrJguhE20TjQQEhldWmGLMutdJGoQwZQX0+pj6xzKB7PrOl2NvRzjPJPr/awXb
         QKSndr8DjawwhTDaIfIIeW/cUfRcVNV9rxojqFQmTfFUKQ79z2ycEyU/VqbbURt0DxE9
         hefT4rV86ykVi0o+wzZH3M+UHYsSR+RJIB3qHBVpDGivZx1NUQQ5ZevtAmGgd1U9UDvO
         W/Fyr1Z34Hs3iMHp+HgKKIa0ISybddqoeZnLjQ/3OSKEyple75qh26jxaQEnC56YvwmQ
         OhGOOl1k0fKMLV9nAIH1xrLyYzW3pHDm9aHhcHMm+whOwb+HeeyKaelwQ37Ucr1U4wYX
         luoA==
X-Gm-Message-State: ACrzQf0FkvWBMFZEjGZNZRXXDUadpHQUN9s8cYnCtIyIqpo/urAld0zf
        7LW0sJZOcxWkG4iRI8X+UDe/UA==
X-Google-Smtp-Source: AMsMyM5su6ApWtiy+J/kwO/a0HneChUBGcY0XEPNt6nciHQoDPKXFdF+gj0Vs4qmtnJ6gx8k4rNCKg==
X-Received: by 2002:a17:902:ec8a:b0:185:5462:261a with SMTP id x10-20020a170902ec8a00b001855462261amr32981480plg.160.1666611509068;
        Mon, 24 Oct 2022 04:38:29 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:38:28 -0700 (PDT)
From:   Akihiko Odaki <akihiko.odaki@daynix.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        "Lee, Chun-Yi" <jlee@suse.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Jonathan Woithe <jwoithe@just42.net>,
        Ike Panhc <ike.pan@canonical.com>,
        Daniel Dadap <ddadap@nvidia.com>,
        Kenneth Chan <kenneth.t.chan@gmail.com>,
        Mattia Dongili <malattia@linux.it>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Azael Avalos <coproscefalo@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Robert Moore <robert.moore@intel.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org,
        acpi4asus-user@lists.sourceforge.net,
        ibm-acpi-devel@lists.sourceforge.net, linux-fbdev@vger.kernel.org,
        devel@acpica.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 20/22] platform/x86: intel_oaktrail: Use acpi_video_get_backlight_types()
Date:   Mon, 24 Oct 2022 20:35:11 +0900
Message-Id: <20221024113513.5205-21-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221024113513.5205-1-akihiko.odaki@daynix.com>
References: <20221024113513.5205-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

acpi_video_get_backlight_type() is now deprecated.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/platform/x86/intel/oaktrail.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/oaktrail.c b/drivers/platform/x86/intel/oaktrail.c
index 7c5c623630c1..f44a51dad16a 100644
--- a/drivers/platform/x86/intel/oaktrail.c
+++ b/drivers/platform/x86/intel/oaktrail.c
@@ -330,7 +330,7 @@ static int __init oaktrail_init(void)
 		goto err_device_add;
 	}
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if ((acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		ret = oaktrail_backlight_init();
 		if (ret)
 			goto err_backlight;
-- 
2.37.3

