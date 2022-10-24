Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EB5C38A2D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Oct 2022 19:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231979AbiJXTGU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Oct 2022 15:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232004AbiJXTFY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 15:05:24 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417797C754
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 10:45:13 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-13ba9a4430cso3979395fac.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 10:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAzZQL5seIJutOYUjJgcTz5SIcJNiVaULVY/vxMxJ7M=;
        b=bWAkfym/IuAYQQDsk1OCfdE9w9yWPE3crZCufatlU3uyFhSD2FLPPyi4EZX0XKPNNN
         TsT1Mn93d8yM/JN1r6KstPaSr0v2lhHNLAttfYUvsrYDknwH7khxwfUrEhoUBDF6QNvT
         2AoTMSr1l1S7qOR5wF4oY1dCDKpWYBJ8RPjoWCYtuPhEghyQHHePilHd/NADV54vZIGq
         6rdvlz9HJM3z9wu+pJUiXEGORc6v7pwvQYHXmPP9HS48eXejuQAX3z/RDPWeO6o44bSX
         c9msf1NsRp6QE7dLwlbW0UvYtPhluL4+JoPCees4u24dLHSpN6Uh4AbxJOiXkAJfcDlq
         GsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAzZQL5seIJutOYUjJgcTz5SIcJNiVaULVY/vxMxJ7M=;
        b=scI0HAbXZ1ViqbmVNVZYemZSXOWvejDrZzXXmYJzI4F2zOUrgaUmd4PHtsFlYoQX9y
         0M5CyzFM0XAfvKGK6ibtZcaGTl6U4QTkGY9NyW3aQzY1rTsjwFSoz6zirrclxIwB3lpR
         kTCse+tpZG844KdBCc6dyAd6KuFNcYBkE2hm12wyWuzuu3jt+WWey7C6AzQj2dG0/ske
         WY32v/PItkVOc7QXVsZ5SeogpSfgTldsuySeffCd/84dwBtlVqur8gkqXXfmVfrLFs7Z
         NV+4JMWKLhplBTQ5c3ZfkctCo0UGezw8jULqjJAXTBbrCNhNvM2y5z5eZFxXYeEocigi
         eO+Q==
X-Gm-Message-State: ACrzQf10q+1CRBw7C5Y1YUOAlAYpnKgv9ogI9HoQVFdKHRsgQA3RUYKK
        iiJF4sMpTJzosriXXh5y3ZpIMnRmnQ0zIfkf
X-Google-Smtp-Source: AMsMyM518/+LX9D2Z710rX+ZGWrNfx22tav+R9okHqn5RhyI0izm5Jqv1jyaCGbAfBxBtougO+lAKQ==
X-Received: by 2002:a17:90b:4b8f:b0:213:95f:9515 with SMTP id lr15-20020a17090b4b8f00b00213095f9515mr6350162pjb.82.1666611500759;
        Mon, 24 Oct 2022 04:38:20 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:38:20 -0700 (PDT)
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
Subject: [PATCH 19/22] platform/x86: dell-laptop: Use acpi_video_get_backlight_types()
Date:   Mon, 24 Oct 2022 20:35:10 +0900
Message-Id: <20221024113513.5205-20-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/dell/dell-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index e92c3ad06d69..9cfffbe2bd95 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -2230,7 +2230,7 @@ static int __init dell_init(void)
 		micmute_led_registered = true;
 	}
 
-	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
+	if (!(acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR))
 		return 0;
 
 	token = dell_smbios_find_token(BRIGHTNESS_TOKEN);
-- 
2.37.3

