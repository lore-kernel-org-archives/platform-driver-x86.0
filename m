Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C51AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Mar 2022 15:30:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351303AbiCXPcA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Mar 2022 11:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351297AbiCXPcA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Mar 2022 11:32:00 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAB8F9F391
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Mar 2022 08:30:27 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id t21so340592oie.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Mar 2022 08:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YzU/OuGTZ7ZZhRK75Z8YEcd1J2gYerFTveOZY0TywMM=;
        b=G82De7A7oNEpKVFX4JdU/362P3CT/f+xqOD1Td+OWNvEghCgVFv8EI+PCQYs4ahiwc
         6vO42uZ42fSuNWGet8eDAepW1DBU1pHQCpcwjRu3HioSvrp3MfEAj8BAqV+Bn0xLk+lh
         BiPpQ0GLuddXSesILH46c//4CsB96HJ515R7CjUK8186RlJa6djgJX4lroWpiUHpPa/y
         WaYB7c7dsBmN4zzkkgQCUMoV7aqkpmtpyQUGv4EdQMQNdDTLqPLXiALz29wRkdFHC6Hj
         u6EZBKbWhbK4y/xnJ0SKUADYOCmD/27BDoYPp4kNk6i8rhfcS1nspW92QE6OtUYKdeF1
         +bUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YzU/OuGTZ7ZZhRK75Z8YEcd1J2gYerFTveOZY0TywMM=;
        b=g36D9jaKpQeKTCnUkz4h8GRMBptvx8KnQcUTfeNAtTEiVrTZE0MDOsDwo+q3UjPF7l
         bktJ1ibkCKBNeQoygf5vkkEBws9b9EunVWBu49PVktjRkEZOj/+6HcrW0fVKXQfCb/Lq
         DxIlhNItMB6zZq1y3LeLIQW/Wz3wzb7d6EytYect/JyzoPIEELewrXILbfDKXH6Je7X0
         zgzTjnkCVF32/SnlHEI0W3LaF1sdRa+R1Mcr4VsWFrjAfKH0e1mmP4L3pRBXIleaW42Q
         eTV1oKs6XAfA5CoFpC4Mawt07POW+RW37/B/sO6rAgMKStxJXmCV7noHfqDQJ9f4in8g
         DK6Q==
X-Gm-Message-State: AOAM530kKsoBNwjC9XSSJ9LYOje5ZjQoD2hkNF5OjQoTryXVNLlg9ya3
        QaQuCmiXSXzMhsbarjyaitrtKfige7U=
X-Google-Smtp-Source: ABdhPJxe/6m0S9O+QJJxNjwl4A8h4/0Yzo2KFdEqTi+vlOHqHBENJMYAyMmlwxxc1N6JfxRl8jgb0Q==
X-Received: by 2002:a54:4d02:0:b0:2ec:94a4:f0a9 with SMTP id v2-20020a544d02000000b002ec94a4f0a9mr2990359oix.200.1648135826756;
        Thu, 24 Mar 2022 08:30:26 -0700 (PDT)
Received: from grumpy-vm.auth.hpicorp.net ([165.225.33.22])
        by smtp.gmail.com with ESMTPSA id n23-20020a056870559700b000d47e9dabf0sm1636265oao.0.2022.03.24.08.30.26
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 08:30:26 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v1] Update hp_wmi_group to simplify feature addition
Date:   Thu, 24 Mar 2022 10:30:24 -0500
Message-Id: <20220324153024.12662-1-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The purpose for this patch is introduce two minor changes.
The first set of changes are style related reported by checkpatch.pl
script.  Lastly, changes were introduced in preparation to submission of
four new features.  The addition of hp_wmi_groups will simplify the
integration of the upcoming driver security features with sysfs.

All changes were validated on a HP ZBook Workstation,
HP EliteBook x360, and HP EliteBook 850 G8 notebooks.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 drivers/platform/x86/hp-wmi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 0e9a25b56e0e..0c7d863b8aab 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -605,6 +605,7 @@ static int hp_wmi_rfkill2_refresh(void)
 	for (i = 0; i < rfkill2_count; i++) {
 		int num = rfkill2[i].num;
 		struct bios_rfkill2_device_state *devstate;
+
 		devstate = &state.device[num];
 
 		if (num >= state.count ||
@@ -625,6 +626,7 @@ static ssize_t display_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	int value = hp_wmi_read_int(HPWMI_DISPLAY_QUERY);
+
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -634,6 +636,7 @@ static ssize_t hddtemp_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	int value = hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
+
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -643,6 +646,7 @@ static ssize_t als_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
 	int value = hp_wmi_read_int(HPWMI_ALS_QUERY);
+
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -652,6 +656,7 @@ static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	int value = hp_wmi_get_dock_state();
+
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -661,6 +666,7 @@ static ssize_t tablet_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	int value = hp_wmi_get_tablet_mode();
+
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -671,6 +677,7 @@ static ssize_t postcode_show(struct device *dev, struct device_attribute *attr,
 {
 	/* Get the POST error code of previous boot failure. */
 	int value = hp_wmi_read_int(HPWMI_POSTCODEERROR_QUERY);
+
 	if (value < 0)
 		return value;
 	return sprintf(buf, "0x%x\n", value);
@@ -733,7 +740,15 @@ static struct attribute *hp_wmi_attrs[] = {
 	&dev_attr_postcode.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(hp_wmi);
+
+static const struct attribute_group hp_wmi_group = {
+	.attrs = hp_wmi_attrs,
+};
+
+static const struct attribute_group *hp_wmi_groups[] = {
+	&hp_wmi_group,
+	NULL,
+};
 
 static void hp_wmi_notify(u32 value, void *context)
 {
@@ -1013,6 +1028,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 		struct rfkill *rfkill;
 		enum rfkill_type type;
 		char *name;
+
 		switch (state.device[i].radio_type) {
 		case HPWMI_WIFI:
 			type = RFKILL_TYPE_WLAN;
-- 
2.25.1

