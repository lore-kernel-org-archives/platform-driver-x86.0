Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B05AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Apr 2022 12:09:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349781AbiDZMMS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Apr 2022 08:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349791AbiDZMMR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Apr 2022 08:12:17 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837C915375F
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Apr 2022 05:09:05 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id p18so16892552edr.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Apr 2022 05:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RvSxsByLcltzpBcFZypXB+3AiJTWvwgSxLOzzlnMlIE=;
        b=X3Sz7rQVbJnPPbncGYm0kQC7hlZnQIUxHmd4AlAQ5zT3LfaFZ6Dk0BQXoimb1iUBvQ
         kjte+U3S11zttmEGZqVdDJkNvRXeDrNbjEuBm0nSyybcMQY/ZT4vlTh4sUloZ+kk1rsC
         nHqxjmG3shFGG7p4ccSY69yquF1N5Y06OMxB68ENqvHGLn3sVCcjELWG+tpyL7vfJax/
         0EX6wVsi/NlDVcagD8vVdp5HyTwv1tafzLLD6rZKS3m/1Apmzqhla5X6GycOCSoy8Njj
         ZzdiIksfXYmmkpyM5Mg+xqBjB9Aee4XkVLrQocY2TND7RYz56vo1Nye5O8L1mKsu2JEC
         WLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RvSxsByLcltzpBcFZypXB+3AiJTWvwgSxLOzzlnMlIE=;
        b=mPSvL3iezG8+CA98kU6V/5NJ46RSs64BLHPE6jhlCOvge2VNPF41yShhujDNgsLs+9
         c9GIH6IEDSSxKrCwagonsfePQINdtsxKIk2ls9QTSemlfVSBwUXjjez5HmEGEkplSNzb
         UuueggHGb+IrwGym5gp4xmqP8xiyrQ6OSYua/z2l9GnzRoHzHjoVcUAPFFHGLQNKqUX3
         H9Dfiiebz9OnUPbtZIWWWHAy7KzG0H66jJCN9h3yw+6rT1TFt8n+1Fcq1Su2kTVSKC2w
         FTKU7GO1+u/db+2S9xKrWoiRxNf175trutdKlcbWbPGCkFVoNYRnffNjN8Hhl7tzJngI
         /6eg==
X-Gm-Message-State: AOAM532oX+qMGziPNnXrOplzpD0X1PqShN26iI0CB74JqFjpXdlnK7qy
        d5nMZX+BWR4YBqtiuTnMXktIHn321wU=
X-Google-Smtp-Source: ABdhPJzWCyWSdL2bRrmmyp+VB3g8zu7ZxE/j37iiUMUQv0R0crPkxgTdRAgAmO9Zhg9awCIesJxcDA==
X-Received: by 2002:a05:6402:3711:b0:425:d3d6:2b65 with SMTP id ek17-20020a056402371100b00425d3d62b65mr17274146edb.328.1650974943794;
        Tue, 26 Apr 2022 05:09:03 -0700 (PDT)
Received: from localhost.localdomain (net-109-116-144-55.cust.vodafonedsl.it. [109.116.144.55])
        by smtp.gmail.com with ESMTPSA id t1-20020a170906178100b006e7edb2c0bdsm4773526eje.15.2022.04.26.05.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 05:09:03 -0700 (PDT)
From:   gabriele.mzt@gmail.com
To:     platform-driver-x86@vger.kernel.org
Cc:     pali@kernel.org, mjg59@srcf.ucam.org,
        Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: [PATCH] platform/x86: dell-laptop: Add quirk entry for Latitude 7520
Date:   Tue, 26 Apr 2022 14:08:27 +0200
Message-Id: <20220426120827.12363-1-gabriele.mzt@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Gabriele Mazzotta <gabriele.mzt@gmail.com>

The Latitude 7520 supports AC timeouts, but it has no KBD_LED_AC_TOKEN
and so changes to stop_timeout appear to have no effect if the laptop
is plugged in.

Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
---
As per the discussion here https://github.com/dell/libsmbios/issues/48,
this is really a BIOS bug. My Latitude 7520 has the latest BIOS
update installed, which was released just few months ago, but the
issue is still there.
---
 drivers/platform/x86/dell/dell-laptop.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index 8230e7a68a5e..1321687d923e 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -80,6 +80,10 @@ static struct quirk_entry quirk_dell_inspiron_1012 = {
 	.kbd_led_not_present = true,
 };
 
+static struct quirk_entry quirk_dell_latitude_7520 = {
+	.kbd_missing_ac_tag = true,
+};
+
 static struct platform_driver platform_driver = {
 	.driver = {
 		.name = "dell-laptop",
@@ -336,6 +340,15 @@ static const struct dmi_system_id dell_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_dell_inspiron_1012,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Latitude 7520",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude 7520"),
+		},
+		.driver_data = &quirk_dell_latitude_7520,
+	},
 	{ }
 };
 
-- 
2.36.0

