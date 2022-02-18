Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9F4C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 18 Feb 2022 16:09:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237445AbiBRQJ3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 18 Feb 2022 11:09:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236768AbiBRQJ1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Feb 2022 11:09:27 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E0A4107D22
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Feb 2022 08:09:10 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id y7so3573416oih.5
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Feb 2022 08:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C15XDU7WXgGOlRwQq9Iy7nzhOmxu8tj8avW1StJvahs=;
        b=ENK32kt0Addg0Vp5mb2t/hb8qqwsruH1KAdlD/ie2TLAz8RuBmVfnPk6ASk69r+jzK
         NBl/u9DCnfdkF264XydzyzWVHgaRUmBlri6llnHkBh5xmhMGkVZO51THAwnHQA93eKZA
         IkuVzr/NNan6iOEnoRoAieib2PoX1Lw3W4brHSeEwSnqmdlVfayosFib8o0OA8bEXl7R
         OxiMCLGyHCKL9ZpL7GtzQzELVBz1lLn8U4Udd3Az3yJFBnVetap56AkO2dEKKzVEaCww
         /RfnjJp1bGMRQHYBNJM6brb5ceRKXvB+cvl7d/pLEZteDDIPzocGM9kgxa0S3SM/2O7L
         MH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C15XDU7WXgGOlRwQq9Iy7nzhOmxu8tj8avW1StJvahs=;
        b=WQ2tsnAGcc681+wWsXLwOcvLMdYsa9neE7bOwA7Jx7yN+luRdQ8+sQ6To56XbKULCb
         aBr2LzSn066Hk6C3DpGobTrtEzP0bXoAHcwbZWJmcajITZURdRxkUgXeFNenW4d383DJ
         uGVdY7E+1KbO/M39IssVoYEie0eIDFvZtc7tmuSux+mn+4AeBpg67VJsQ+6S2VGZ9Bha
         F3RKCMxM2URgthP4h4Hn2pc1Zzis6wOfnZ4KRMtLEnCjVMG4aQ15J7ggj9D/OjG0jnmB
         Y7UbnQ2qAEPiW6FsMa6PhUpGDAiGOafklLSixTVCcLJqnD5TBFm7IXbOVbq7GipQjdN5
         1chA==
X-Gm-Message-State: AOAM533me1TSTKvrN+X4xgJFgHbq9QEQ/Bs+XeWEIF9wPQvfDFTaVeQM
        6IEZWWJHfrl2VGa6Fd+tWUfsikYOK78=
X-Google-Smtp-Source: ABdhPJwMzeF83qOZgXT08Ba703St5aJnqE4cGuNQ/54MROZFVw/6pzxhBiULpsnTy7KnjfjDJZBUJw==
X-Received: by 2002:a05:6808:144d:b0:2d0:70d6:52dc with SMTP id x13-20020a056808144d00b002d070d652dcmr5264836oiv.19.1645200549471;
        Fri, 18 Feb 2022 08:09:09 -0800 (PST)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:e8f4:b8ac:759b:cd87])
        by smtp.gmail.com with ESMTPSA id l1sm1648021otd.18.2022.02.18.08.09.09
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 08:09:09 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 1/3] Fix SW_TABLET_MODE detection method
Date:   Fri, 18 Feb 2022 10:09:05 -0600
Message-Id: <20220218160907.3422-2-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220218160907.3422-1-jorge.lopez2@hp.com>
References: <20220218160907.3422-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The purpose of this patch is to introduce a fix and removal
of the current hack when determining tablet mode status.

Determining the tablet mode status requires reading Byte 0 bit 2 and 3
as reported by HPWMI_HARDWARE_QUERY.  The investigation identified the
failure was rooted in two areas; HPWMI_HARDWARE_QUERY failure (0x05)
and reading Byte 0, bit 2 only to determine the table mode status.
HPWMI_HARDWARE_QUERY WMI failure also rendered the dock state value invalid.

All changes were validated on a ZBook Workstation notebook.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 drivers/platform/x86/hp-wmi.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 48a46466f086..544fce906ce7 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -35,9 +35,6 @@ MODULE_LICENSE("GPL");
 MODULE_ALIAS("wmi:95F24279-4D7B-4334-9387-ACCDC67EF61C");
 MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
 
-static int enable_tablet_mode_sw = -1;
-module_param(enable_tablet_mode_sw, int, 0444);
-MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting (-1=auto, 0=no, 1=yes)");
 
 #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
 #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
@@ -127,6 +124,7 @@ enum hp_wmi_command {
 enum hp_wmi_hardware_mask {
 	HPWMI_DOCK_MASK		= 0x01,
 	HPWMI_TABLET_MASK	= 0x04,
+	HPWMI_DETACHABLE_MASK	= 0x08,
 };
 
 struct bios_return {
@@ -347,12 +345,19 @@ static int hp_wmi_read_int(int query)
 
 static int hp_wmi_hw_state(int mask)
 {
-	int state = hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
+	int state = 0, ret;
 
-	if (state < 0)
-		return state;
+	ret = hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &state,
+				   0, sizeof(state));
 
-	return !!(state & mask);
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+
+	/* determine if Detachable mode is enabled */
+	if (HPWMI_TABLET_MASK == mask)
+		state = (state & HPWMI_DETACHABLE_MASK );
+
+	return (state & mask);
 }
 
 static int omen_thermal_profile_set(int mode)
@@ -781,18 +786,16 @@ static int __init hp_wmi_input_setup(void)
 
 	/* Dock */
 	val = hp_wmi_hw_state(HPWMI_DOCK_MASK);
-	if (!(val < 0)) {
+	if (val > 0) {
 		__set_bit(SW_DOCK, hp_wmi_input_dev->swbit);
 		input_report_switch(hp_wmi_input_dev, SW_DOCK, val);
 	}
 
 	/* Tablet mode */
-	if (enable_tablet_mode_sw > 0) {
-		val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
-		if (val >= 0) {
-			__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
+	val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
+	if (val > 0) {
+		__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
 			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
-		}
 	}
 
 	err = sparse_keymap_setup(hp_wmi_input_dev, hp_wmi_keymap, NULL);
-- 
2.25.1

