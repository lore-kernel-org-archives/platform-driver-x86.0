Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C294C38A2D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Oct 2022 11:39:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbiJXLjk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Oct 2022 07:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbiJXLjE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 07:39:04 -0400
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A13E6E89C
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 04:38:32 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id d59-20020a17090a6f4100b00213202d77e1so1136731pjk.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 04:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gF1+dr0UmSLKg5C/+t+S2XzPWm1zDrjsbQX8+igR+aM=;
        b=TUaer4HdAj1V1/KvIiqeuDXfW6xDWwEMoGs5n4ogyUIGkys9QMhjDQ+bVY0ELC/Zv7
         bWVD8iLyFzbkfcDLx8DVuEuAt6agWLfXnGroETWUA/WUAxEudlmKwVrZP9YEJ60SqpQO
         uEgVtlcZHMdUxEmxBez2o4LXL4xr7pLMNs2npVpTCCV+56sUo0X53wm7kZWeulN1UxgY
         mJboZRkxMVHWvPMsPje9/uDltkPOywQSfMmTJicM2HoXPo4wyYb1scm4m6G+r2+bzHd8
         Sbxk521dG9VmXqWc9Od5r0OBVoSlAsHO2hUBuwny+NvTx3MjpnZ1sqjNKvam6yq5PSwk
         iKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gF1+dr0UmSLKg5C/+t+S2XzPWm1zDrjsbQX8+igR+aM=;
        b=4fFm7igEWwt5npPCgc/P4P2z7VEAQMg1blzRnwvenoPDDdqqCS/dBAAFtEZsJoaS+S
         RfFKuQ1IoDoQOuv2FojtNhcIYO57n50OougYVgrlDYogx4OGG9e7wKdpR1JUTxgrE4LS
         0iZGj4gtlsNWc1Ll99XTmjV/6nULg4JZ9o2AzghbOzbOkNS/dgPDYEJRLWsPjXLRurTi
         XzUL1EYMkxvG6cwS2RnWshIC/NLUIdmi6Npg5jqmyl+kVRJhoJkrMrbksiSpSnvDsc4r
         QhOJ7sfB2ThPKFAY/61AoK62VxBHERBakS/5HwIlIoRDdUWPGGrci5G0g+Sc0Z8ucjjz
         czLA==
X-Gm-Message-State: ACrzQf2aEpBB7W5eN4fswQrPoXS1GOrud9y8IMtzPegDmfqFl6RfLSgR
        OYbIWKPKvkoCvdzKkVjOQKpwBQ==
X-Google-Smtp-Source: AMsMyM4Z73PEbmFjby7RYhtWBADc72izt8nSu6NGLKgrb37LXlsr13MXJ1blMej/gKuQKEFJb7DSAA==
X-Received: by 2002:a17:90a:29e4:b0:20a:f9d5:c10e with SMTP id h91-20020a17090a29e400b0020af9d5c10emr75009289pjd.132.1666611391524;
        Mon, 24 Oct 2022 04:36:31 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:36:30 -0700 (PDT)
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
Subject: [PATCH 06/22] platform/x86: asus-wmi: Use acpi_video_get_backlight_types()
Date:   Mon, 24 Oct 2022 20:34:57 +0900
Message-Id: <20221024113513.5205-7-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/asus-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 6e8e093f96b3..55cca068f783 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -3259,7 +3259,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		code = ASUS_WMI_BRN_DOWN;
 
 	if (code == ASUS_WMI_BRN_DOWN || code == ASUS_WMI_BRN_UP) {
-		if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+		if ((acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 			asus_wmi_backlight_notify(asus, orig_code);
 			return;
 		}
@@ -3802,7 +3802,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (asus->driver->quirks->xusb2pr)
 		asus_wmi_set_xusb2pr(asus);
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if ((acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		err = asus_wmi_backlight_init(asus);
 		if (err && err != -ENODEV)
 			goto fail_backlight;
-- 
2.37.3

