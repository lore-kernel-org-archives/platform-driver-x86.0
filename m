Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4176FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Dec 2021 22:29:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232540AbhLTW3W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Dec 2021 17:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbhLTW3W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Dec 2021 17:29:22 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF11C06173E
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Dec 2021 14:29:21 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id l145-20020a25cc97000000b005c5d04a1d52so22097785ybf.23
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Dec 2021 14:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=fksgA1JsDJpYuy0g0e7IGPB8FkPT8ahC676Z+SBk5d0=;
        b=e+5atsRINdfmhMu85Kr/tAJ7TrsaeUuxdCQLTvU0+Xrk4IYm96lVIa+5DRuZfPxMtY
         MNbBAfxGzbhcucB8PMyMvRB7XBftaV5ZXWJxiiAoIqGt6ldQEPwx21iGX9GgZesD9jx3
         htU6B+xl/3DoWdZupBUOHRLqmNnQd+CyigxzAJTFB3ABYke0O50KOencRIXmkEvRbllz
         c6e+a3masCoiLqB33CZbf8dLtOO0/QqbPf9kVrvFEhvs6On0IdSUT53xBiUwh32VDhQK
         SEThbYVuxk6HdFQ+lPeoHPIdaw/WhO4ddxGUTa3fgP/8XEb0Nh39J5sSd3fcFccajl9y
         trkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=fksgA1JsDJpYuy0g0e7IGPB8FkPT8ahC676Z+SBk5d0=;
        b=zqkYrUzz7rwRGfDL2MiCETr7a/21Gec61xd086oED8vLugG62NQ8muoGiSln/F+jKE
         wP5Z03AOESEQn03Fv/eok4ZPftGhB0guPUkW+VawlGFSzK7Grxfafa+VGhoSsWSWGTd4
         r0RZm3EC8Y5eeTCuTPmB0R+R1VCEBbPSo/GN2arGflQyLA0RPKolhHfae5uEebieJCS7
         PF/UaUk2Fu+Hl+HQ3zEwiabFWqjizaYTGwTnwFrn48alYHCB/mGB/GbBTR+CGgel+AUa
         wmwfd1ety4K0zY06eGsdoHDI59AzT+82tWA5ZX5ivaA6pdbhZnXols3eIFQEq3IFFilL
         ohpw==
X-Gm-Message-State: AOAM530fSOndCsOJwPGd+Xi84Pcn+KENyzVEudy8nlYee3dzZ16OI+J1
        XPi60mVR6UFtDMv0o+FLqYYk6gGOISIs
X-Google-Smtp-Source: ABdhPJzrXPMAorJsrHo+Qwly1Bs2XrhOf9wwHctqzTpYT/FCrcPqa8tsV3CcEMZ8RHpJyIAgOErATcevbHqr
X-Received: from rajat2.mtv.corp.google.com ([2620:15c:202:201:f6d7:6572:2e42:ea7d])
 (user=rajatja job=sendgmr) by 2002:a25:3b95:: with SMTP id
 i143mr380252yba.423.1640039360896; Mon, 20 Dec 2021 14:29:20 -0800 (PST)
Date:   Mon, 20 Dec 2021 14:28:28 -0800
In-Reply-To: <20211220222828.2625444-1-rajatja@google.com>
Message-Id: <20211220222828.2625444-3-rajatja@google.com>
Mime-Version: 1.0
References: <20211220222828.2625444-1-rajatja@google.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
Subject: [PATCH v3 3/3] drm/privacy_screen_x86: Add entry for ChromeOS privacy-screen
From:   Rajat Jain <rajatja@google.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Hans de Goede <hdegoede@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Benson Leung <bleung@chromium.org>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, gwendal@google.com,
        seanpaul@google.com, marcheu@google.com, dtor@google.com
Cc:     Rajat Jain <rajatja@google.com>, rajatxjain@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a static entry in the x86 table, to detect and wait for
privacy-screen on some ChromeOS platforms.

Please note that this means that if CONFIG_CHROMEOS_PRIVACY_SCREEN is
enabled, and if "GOOG0010" device is found in ACPI, then the i915 probe
shall return EPROBE_DEFER until a platform driver actually registers the
privacy-screen: https://hansdegoede.livejournal.com/25948.html

Signed-off-by: Rajat Jain <rajatja@google.com>
---
v3: * Remove the pr_info() from detect_chromeos_privacy_screen(), instead
      enhance the one already present in drm_privacy_screen_lookup_init()
v2: * Use #if instead of #elif
    * Reorder the patches in the series.
    * Rebased on drm-tip

 drivers/gpu/drm/drm_privacy_screen_x86.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
index a2cafb294ca6..0fdd2b500e6d 100644
--- a/drivers/gpu/drm/drm_privacy_screen_x86.c
+++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
@@ -47,6 +47,16 @@ static bool __init detect_thinkpad_privacy_screen(void)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_CHROMEOS_PRIVACY_SCREEN)
+static bool __init detect_chromeos_privacy_screen(void)
+{
+	if (!acpi_dev_present("GOOG0010", NULL, -1))
+		return false;
+
+	return true;
+}
+#endif
+
 static const struct arch_init_data arch_init_data[] __initconst = {
 #if IS_ENABLED(CONFIG_THINKPAD_ACPI)
 	{
@@ -58,6 +68,16 @@ static const struct arch_init_data arch_init_data[] __initconst = {
 		.detect = detect_thinkpad_privacy_screen,
 	},
 #endif
+#if IS_ENABLED(CONFIG_CHROMEOS_PRIVACY_SCREEN)
+	{
+		.lookup = {
+			.dev_id = NULL,
+			.con_id = NULL,
+			.provider = "privacy_screen-GOOG0010:00",
+		},
+		.detect = detect_chromeos_privacy_screen,
+	},
+#endif
 };
 
 void __init drm_privacy_screen_lookup_init(void)
@@ -68,7 +88,8 @@ void __init drm_privacy_screen_lookup_init(void)
 		if (!arch_init_data[i].detect())
 			continue;
 
-		pr_info("Found '%s' privacy-screen provider\n",
+		pr_info("Found '%s' privacy-screen provider."
+			"Might have to defer probe for it...\n",
 			arch_init_data[i].lookup.provider);
 
 		/* Make a copy because arch_init_data is __initconst */
-- 
2.34.1.307.g9b7440fafd-goog

