Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AA6FA3740
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Oct 2022 13:59:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232144AbiJXN7v (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Oct 2022 09:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237000AbiJXN7H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 09:59:07 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F0269F6A
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 05:46:12 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-13b103a3e5dso11705092fac.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 05:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZbgIVSQ8XgPbVH9Q8Dsp65eLaVcafrOLYAAqQNA3Ms=;
        b=svkp4e3b3SUT9ftxU+ZLPImVGkrLdjZmAyL4NTDy8zBkyhJo1e5stHvrAz9NnYp+CP
         AJCGi7A9ny35dbEocVhIsAphKsiD9jZ63/JsrAZueG69IuE95V0TJ6aCnZ+DlNNn13Lm
         831reFgJM1LtLUpK9rtNkyvUYZDd26w6QRWfhKIvwmBIQcQJmYTS+V4i6U7+Z4Lpc4d3
         s0vv4ZqyrCx4Ys2lKyq0BeBUhRZCS490rmEtluTEKpS152uos0ylqsE7d3kzUq0kQqND
         becInYrHn+JiAKLdk4p+qnOcD5r2SuDSv8VLrjEkovHL0yMYiNLipQex+iGsarVfust+
         Uvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZbgIVSQ8XgPbVH9Q8Dsp65eLaVcafrOLYAAqQNA3Ms=;
        b=1pm2rf72Yl+tGM4o+WJ/famJ3+EEgRRHu7sK5c/nxYVoPf/OmDmPRnZZCkhx9sHGVf
         i0qwJ7lYUD4jg3IWsVyJ0rmv8n9YOR8hFV3awCXcLdZmuUxXGkw2ViG2XMbaoHcU1JBP
         IB4KEc6Mv/VaFeACYIvTOdh5HVfn9dbBBSkjVmDx9gjbSVhrXbLip7SB+fl5yyaB5osw
         eoCh+MzlqSy9vQSXLhLkdEy53AgE9b/t1vw58Q8tsQZQtZZob1sJES6JL0Dadvv+XGAs
         Qckfb/nenHxFuWOtAJ9x6/ijmRV/BymQiYMFHqH6F4xQbevpagIIWAnloLDkEtbCfDY2
         NiVA==
X-Gm-Message-State: ACrzQf3DxP7zTdHQi8fz69B1yZ2P4WD0TApcm8frkvjjyrYTHGJ4zOV4
        1JjG9yPS9L9oAe4OEPTs0mAUcK8MrbjJjNBy
X-Google-Smtp-Source: AMsMyM4RUBGzO3rLlIoesY9MV9xSVNvjZ7XRsAYwgRf2MzR+vsTZOlvX93IbLwXDaavbHv/ooxaUtA==
X-Received: by 2002:a17:90a:6405:b0:203:6eaa:4999 with SMTP id g5-20020a17090a640500b002036eaa4999mr73460182pjj.8.1666611484014;
        Mon, 24 Oct 2022 04:38:04 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:38:03 -0700 (PDT)
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
Subject: [PATCH 17/22] platform/x86: thinkpad_acpi: Use acpi_video_get_backlight_types()
Date:   Mon, 24 Oct 2022 20:35:08 +0900
Message-Id: <20221024113513.5205-18-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/thinkpad_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 6a823b850a77..d756d2ce54d1 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3547,7 +3547,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	/* Do not issue duplicate brightness change events to
 	 * userspace. tpacpi_detect_brightness_capabilities() must have
 	 * been called before this point  */
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor) {
+	if (!(acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		pr_info("This ThinkPad has standard ACPI backlight brightness control, supported by the ACPI video driver\n");
 		pr_notice("Disabling thinkpad-acpi brightness events by default...\n");
 
@@ -6983,7 +6983,7 @@ static int __init brightness_init(struct ibm_init_struct *iibm)
 		return -ENODEV;
 	}
 
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor) {
+	if (!(acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		if (brightness_enable > 1) {
 			pr_info("Standard ACPI backlight interface available, not loading native one\n");
 			return -ENODEV;
-- 
2.37.3

