Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C316CC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Mar 2022 20:31:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbiCDUcl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Mar 2022 15:32:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbiCDUc2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Mar 2022 15:32:28 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46BBD1E6EB0
        for <platform-driver-x86@vger.kernel.org>; Fri,  4 Mar 2022 12:31:34 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id f21so7348129qke.13
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Mar 2022 12:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1vszBXgzrVKMW6z2ZUfxpoV283wDEPrPSCguVouQjbc=;
        b=BMGJHa5gGmNi34cFxTDBS3cfQETG6FGcG6SgLbQFPcQ7yjf7Tv8Lt+77JJhy/Mp/aj
         SEDFYqkG751qDyoUr31sLET3exVk6tCqOMpv1++OK0ZSouVjKjAPH/cb6u/XoHSEpFGC
         jropLsTD6E+gQn+nu6r29pwkF/04ynSnXexAro5UDIx2nw+g79WjiGraoCJUlyEMlWKQ
         xo/8+n3HaSFBbDOKn7cd5dtMciiwfChtNvDzVDrqlR1lPGssl0OjJvih/xAgymcwpAyo
         mT6Z0fbfBnlubgBP87HnQo7YGDtDG4E22nkVXEBnTGRw3RAVYlkAsntDnAOUjF98z7na
         f0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1vszBXgzrVKMW6z2ZUfxpoV283wDEPrPSCguVouQjbc=;
        b=zkPaJFABOCdZrxI8NJ8toa0Om4CIDWMlBXSLqrOHXgKHrSGwU4yDB4911wWuqg5eT3
         VVtziNvDCXX0B68kBFFgFRV9itzwYhdeGAzKpT2bRmcijtA8KrI7d+Vjgv0sH99g5oWB
         3dU7aFTepfpkVfJqRqBpwGEnzdq3xv5JgCH5+UTEKcTNtYtaupFzizroTYutDQ/XnHrR
         uyTdCX/WpFnygiyA+rIU4sgo5GpytcF7wxVN9pOEubOyojrzdcpGxBeAXUT3zwnyvk4u
         mxd+0kTTwzlSUk0TUdx1vaBx3kafgFGNJfZaTcOVQEPpPoFLyXudkP0Nkfki9kc4A1rB
         bnrQ==
X-Gm-Message-State: AOAM531As6dXFie4UDSmaRmHJ8TSw6b2flCxmpQj0wVs2YbiIsa3wWNI
        XRGEoCRbHjkLcfPt8PALoFzu3334bd8=
X-Google-Smtp-Source: ABdhPJzsRp6JHbnv39+v2Sk1BEI5pl/Q6vwh4AHB9SV9GYESf4+Y+nXf98h2FEqDfwSDqV4OTLxVkA==
X-Received: by 2002:a37:620d:0:b0:62c:e1eb:2e89 with SMTP id w13-20020a37620d000000b0062ce1eb2e89mr262011qkb.253.1646425893061;
        Fri, 04 Mar 2022 12:31:33 -0800 (PST)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:27a2:529c:40d3:26aa])
        by smtp.gmail.com with ESMTPSA id de18-20020a05620a371200b00662cf4b5631sm2974513qkb.23.2022.03.04.12.31.32
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 12:31:32 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 1/3] Fix SW_TABLET_MODE detection method
Date:   Fri,  4 Mar 2022 14:31:28 -0600
Message-Id: <20220304203130.43150-2-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304203130.43150-1-jorge.lopez2@hp.com>
References: <20220304203130.43150-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The purpose of this patch is to introduce a fix and removal
of the current hack when determining tablet mode status.

Determining the tablet mode status requires reading Byte 0 bit 2
as reported by HPWMI_HARDWARE_QUERY.  The investigation identified the
failure was rooted in two areas: HPWMI_HARDWARE_QUERY failure (0x05)
and reading Byte 0, bit 2 only to determine the table mode status.
HPWMI_HARDWARE_QUERY WMI failure also rendered the dock state value invalid.

The root cause for the TABLET problem is within BIOS. The behaviour shows
that WMI command 0x04 bit 2 values are reversed and do not follow the WMI spec.
At this time, the best solution is to report all notebooks in notebook mode
regardless of the value reported by WMI.  Reporting all notebooks in notebook
mode will permit Linux to behave correctly especially in older platforms.
BIOS team was notified, and the current hack will be removed at a later time.

hp_wmi_hw_state function was split into two functions; hp_wmi_get_dock_state
and hp_wmi_get_tablet_mode.  The new functions separate how dock_state and
tablet_mode is handled in a cleaner manner.

All changes were validated on a HP ZBook Workstation notebook,
HP EliteBook x360, and HP EliteBook 850 G8.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 drivers/platform/x86/hp-wmi.c | 38 +++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 48a46466f086..a19f8b2b629e 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -337,7 +337,7 @@ static int hp_wmi_read_int(int query)
 	int val = 0, ret;
 
 	ret = hp_wmi_perform_query(query, HPWMI_READ, &val,
-				   sizeof(val), sizeof(val));
+				   0, sizeof(val));
 
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -345,14 +345,30 @@ static int hp_wmi_read_int(int query)
 	return val;
 }
 
-static int hp_wmi_hw_state(int mask)
+static int hp_wmi_get_dock_state(void)
 {
 	int state = hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
 
 	if (state < 0)
 		return state;
 
-	return !!(state & mask);
+	if (!(state & HPWMI_DOCK_MASK))
+		return 0;
+
+	return 1;
+}
+
+static int hp_wmi_get_tablet_mode(void)
+{
+	int state = hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
+
+	if (state < 0)
+		return state;
+
+	if (!(state & HPWMI_TABLET_MASK))
+		return 0;
+
+	return 1;
 }
 
 static int omen_thermal_profile_set(int mode)
@@ -568,7 +584,7 @@ static ssize_t als_show(struct device *dev, struct device_attribute *attr,
 static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
-	int value = hp_wmi_hw_state(HPWMI_DOCK_MASK);
+	int value = hp_wmi_get_dock_state();
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -577,7 +593,7 @@ static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
 static ssize_t tablet_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
-	int value = hp_wmi_hw_state(HPWMI_TABLET_MASK);
+	int value = hp_wmi_get_tablet_mode();
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -699,10 +715,10 @@ static void hp_wmi_notify(u32 value, void *context)
 	case HPWMI_DOCK_EVENT:
 		if (test_bit(SW_DOCK, hp_wmi_input_dev->swbit))
 			input_report_switch(hp_wmi_input_dev, SW_DOCK,
-					    hp_wmi_hw_state(HPWMI_DOCK_MASK));
+					    hp_wmi_get_dock_state());
 		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit))
 			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE,
-					    hp_wmi_hw_state(HPWMI_TABLET_MASK));
+					    hp_wmi_get_tablet_mode());
 		input_sync(hp_wmi_input_dev);
 		break;
 	case HPWMI_PARK_HDD:
@@ -780,7 +796,7 @@ static int __init hp_wmi_input_setup(void)
 	__set_bit(EV_SW, hp_wmi_input_dev->evbit);
 
 	/* Dock */
-	val = hp_wmi_hw_state(HPWMI_DOCK_MASK);
+	val = hp_wmi_get_dock_state();
 	if (!(val < 0)) {
 		__set_bit(SW_DOCK, hp_wmi_input_dev->swbit);
 		input_report_switch(hp_wmi_input_dev, SW_DOCK, val);
@@ -788,7 +804,7 @@ static int __init hp_wmi_input_setup(void)
 
 	/* Tablet mode */
 	if (enable_tablet_mode_sw > 0) {
-		val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
+		val = hp_wmi_get_tablet_mode();
 		if (val >= 0) {
 			__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
 			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
@@ -1227,10 +1243,10 @@ static int hp_wmi_resume_handler(struct device *device)
 	if (hp_wmi_input_dev) {
 		if (test_bit(SW_DOCK, hp_wmi_input_dev->swbit))
 			input_report_switch(hp_wmi_input_dev, SW_DOCK,
-					    hp_wmi_hw_state(HPWMI_DOCK_MASK));
+					    hp_wmi_get_dock_state());
 		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit))
 			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE,
-					    hp_wmi_hw_state(HPWMI_TABLET_MASK));
+					    hp_wmi_get_tablet_mode());
 		input_sync(hp_wmi_input_dev);
 	}
 
-- 
2.25.1

