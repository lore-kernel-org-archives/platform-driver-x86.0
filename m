Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C780ECAAA1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Oct 2022 11:40:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbiJXLkA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Oct 2022 07:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231414AbiJXLjL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 07:39:11 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C8656E2D6
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 04:38:25 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id i3so8690338pfc.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 04:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTWnIAAWrGsxFWyDKsfKu5xKbLpsLEHl3kQR801HKCo=;
        b=MRe/lYU3QcRg+eNbrdoMjeONSL07r0OuDkWzCVk6tpzA20LxxB9dtVNP6GAZVtqzIg
         /Ydi6DIu3Wy5fZXEZmacOcz+NqXiSg1SXC5+xE40BzARxzxxK4lzIbVbKWJmk00nhUWL
         J95wLECXE4yV76gl9zFLYhn0sUtCfGQd7MZ3fPt+5gVvmN0pleQRDgrqZg3vefZrijSa
         Yr0OxSWw7RuG0IesV0KfRF12UlNsEctSBC+ObKy3MmlA9Ekq0p3IRfhEG3FwtLPaqAOb
         tgPmTvcjcO2SHlUmacRidezoVVwplJ41JEut0A62tZuMt+eaVkdbww0tkfz+m4Yo8zhg
         FlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTWnIAAWrGsxFWyDKsfKu5xKbLpsLEHl3kQR801HKCo=;
        b=i9xb60FSrUSRDzcg5aOLg4kK4IcT/eLTZJgJbb69Vwdz/s2sdkOUSMDV5Try27kHU7
         8nVVVRqni7QLrfTlKBHHsgswFaHHCHkp7nITewcz0P0mAcATAqz28fqQrkXMrkjhbzI2
         EvQnJgwhGnhmmdhXM3bRapQNQ9hArG8M0G9OdyaJw8UUqcehDf7rrRI6YBWR+YiZlzNG
         HUJ/dRXgkyRyz2cQPATFoA/oD4GaQvbNuiUG+s7br99eyhGwc3UBDW7HHNL994o/UMg3
         9LK1+oFlisHoIOID/wk1+ZM1EEXeUtk9rrdhGwnPyUU6e18CRAFAIyGGOa/fcTsMYY5I
         E24w==
X-Gm-Message-State: ACrzQf0+drZbb7SDNiw1kphNfjQJuMXpZKp8ycVw8Le99subTiJYa1Lj
        oDQqRYGcTJ/dchChU+YnXwWsVw==
X-Google-Smtp-Source: AMsMyM4YJ5urGf6JLjky27R9T5sFwrnmf9RBCYrtUNpAE3TI6fc6EtzOOV4rZk9R6ICHsHu1MQHt3A==
X-Received: by 2002:a63:64d:0:b0:46b:158f:102e with SMTP id 74-20020a63064d000000b0046b158f102emr28740541pgg.150.1666611408492;
        Mon, 24 Oct 2022 04:36:48 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:36:47 -0700 (PDT)
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
Subject: [PATCH 08/22] platform/x86: eeepc-laptop: Use acpi_video_get_backlight_types()
Date:   Mon, 24 Oct 2022 20:34:59 +0900
Message-Id: <20221024113513.5205-9-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/eeepc-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index a388a28b6f2a..91dea49f7c3d 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -1400,7 +1400,7 @@ static int eeepc_acpi_add(struct acpi_device *device)
 	if (result)
 		goto fail_platform;
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if ((acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		result = eeepc_backlight_init(eeepc);
 		if (result)
 			goto fail_backlight;
-- 
2.37.3

