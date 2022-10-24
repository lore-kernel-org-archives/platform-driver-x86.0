Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5330FA3745
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Oct 2022 11:39:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbiJXLjg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Oct 2022 07:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbiJXLiq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 07:38:46 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A20752DC4
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 04:37:56 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id g16so3287223pfr.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 04:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3OBF2k1WWtiu/9/W0b3fBEExfrwFAb3nrGZKspwFWo=;
        b=ytZxwj2KO7mqmejMHz4K1suZIYKgKIzkLd7EE+hEIaFueculEZeXax0rPFi0rtL4lr
         7+UX9MXWjbBbOQgBjauyeX2QMEOfr0yZCF6Yw3NwAEtLYr/AzMr4Ggz7FIpB/9yGq8Ci
         CeNajiFIEw4FF3iTA4CXFtGn9bA7DoprnQKeIA0r/AGyzUh0lUH+M9A0yNAdx4uOwaCJ
         5pnLw55cfyxjSf2H2FfT7iT6gF3REqCaachB0bZ+Y5p8FvjdHYs2Vj4mZ7V1Pkvhp4jO
         2xvAEzb4JSHAaQiHka7I4JxM52qtVtkqOhQWV7jRFiYQ4mE4otcRDd17QUh9/ZoY/MYV
         r1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3OBF2k1WWtiu/9/W0b3fBEExfrwFAb3nrGZKspwFWo=;
        b=y8EmyZawGlWHBIv4ZT9tb8EMJswORzQMnuozq7oB4d0bhPusi0QIMIgmWXuIUYHws5
         fZEiljnib/IXfIGJ2HS9myt9hoKx71PQhp0JzcnMl/L4mATcYId1fkN/gnZ6q9KmT22g
         1HzvVFkFzRJU+Mai4mylKpRFUYimapLtOVTY451EEDqOxJmz2DUxv8ypBHou/maBkoc5
         H1ZkaPYvuVUmRU/4z4WVYMQ6El+dcsQG9LzvD/eVnGXOYHe4WgTXGNAgBNLOS+FTLH4N
         X4mOrfHfWsWOEnVvBMFOhtOnKL7R47xroDhcwxgblZTcz1fGxjc0R85oAYKL8JVxCVfT
         qVyw==
X-Gm-Message-State: ACrzQf3b4T4qU8iE0e6njdNwwSUsWA7d6UYtEgONsqG1z7mH7kf6HYJu
        DOdkPu5RQaww6NecEtw8Qj5YSw==
X-Google-Smtp-Source: AMsMyM7gLd2Xh0sfa+tFaHscQUkpHnvkLJ1d0xqmrVl3HqwBIbYxynI67Kp0nGZCTrOWZta1N0QtUA==
X-Received: by 2002:a05:6a00:2288:b0:56b:fe9d:b4b7 with SMTP id f8-20020a056a00228800b0056bfe9db4b7mr1191782pfe.79.1666611475639;
        Mon, 24 Oct 2022 04:37:55 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:37:55 -0700 (PDT)
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
Subject: [PATCH 16/22] platform/x86: sony-laptop: Use acpi_video_get_backlight_types()
Date:   Mon, 24 Oct 2022 20:35:07 +0900
Message-Id: <20221024113513.5205-17-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/sony-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 765fcaba4d12..987942719ba6 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -3201,7 +3201,7 @@ static int sony_nc_add(struct acpi_device *device)
 			sony_nc_function_setup(device, sony_pf_device);
 	}
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor)
+	if ((acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR))
 		sony_nc_backlight_setup();
 
 	/* create sony_pf sysfs attributes related to the SNC device */
-- 
2.37.3

