Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9A2C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Jun 2022 21:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234924AbiFFVEr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Jun 2022 17:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234923AbiFFVEj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Jun 2022 17:04:39 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C43A6E64C0
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jun 2022 13:54:54 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-e656032735so20707553fac.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jun 2022 13:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gX6s7Wh6aEsuXk169Xqvmjed2XHRcZV2BmxZzPYQiQ8=;
        b=VcxVBvi0Z9U60zdAo9s7TR5KpA3qpVoeh+AI0EtWyvFeVjUGwY0y6yvL5I6j9Tt3h8
         Md8Zl87D2hrjrIlzlf1jpBxVfUr2aIKBzEHCh75LoytM8AHOY4Yu2RB226EUk1Orhyvt
         hIFJF84oHS/XnSUeRAvfHdjWu6Rmx/kPfiMw0wHahR6DbYN5HjGAT0KLa1I1+MYq/9R1
         rVcrTOUc9M3NLaX6lNVnCHFOQUFJTB60Z5fsguXhuScppG1Qa6N7bNzHLoDZsvGHR0gQ
         kElLH8lnBwz1KVDdr4lzGYWypqmKqFPv5BP6adPLaOc3pJRpETxXnWwmiHdRtLP5uH9g
         4FBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gX6s7Wh6aEsuXk169Xqvmjed2XHRcZV2BmxZzPYQiQ8=;
        b=RwGA1LWnxVc49jOK8XDluRGNV4c3n67PM/XGF3fNdYyanL5AWdjhitcYA99cAT1ui7
         CpDBO7iAVupOS/WKCRdcqm5vpr0ZqwlllwyOGn1mt6M2EM6PGZrCiDe7DGaZ/nS16pKl
         gsac5ZlebDetnWRr65UJpMaCmVgAUotKWwDvSzkgYT9RJ1jzAyFva0U7yU0HPN9JpO6q
         j6sRYBNlkFMJ5XgpCzkkgy7xOWgDgDsE6lXp+6HIzkRugX3KWuGFXjp/Ope1GgQwKCGT
         UVv6dTFCq9SYm4Aj0GMMm4HGdXDXd6A8i9XDzFMj92BkUzI2lVR8DSR7dQOA1azrOe1F
         N/wg==
X-Gm-Message-State: AOAM530G0LFbZOl618s31Le4C7VeMhjZBzmMuBspEN3lfVZhmnNSeTGr
        +dghGQo9b55KBQ2w+4Px8Rr+1c4z4gc=
X-Google-Smtp-Source: ABdhPJzeh3vF3vob5Rx2fI7+6fu4FnaHsQM5mUWqwERsNmR0iBixVysH/xYBV88Mpzo/i8jcnrVgDQ==
X-Received: by 2002:a05:6870:1690:b0:f3:4053:c009 with SMTP id j16-20020a056870169000b000f34053c009mr22252674oae.41.1654548893769;
        Mon, 06 Jun 2022 13:54:53 -0700 (PDT)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:8846:ac70:774e:54a4])
        by smtp.gmail.com with ESMTPSA id e29-20020a4a9b5d000000b0035eb4e5a6b3sm8324728ook.9.2022.06.06.13.54.52
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 13:54:53 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH] Revert "platform/x86: hp-wmi: Changing bios_args.data to be dynamically allocated"
Date:   Mon,  6 Jun 2022 15:54:51 -0500
Message-Id: <20220606205451.21067-1-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This reverts commit 4b4967cbd2685f313411e6facf915fb2ae01d796.

Changes to bios_args.data to be allocated dynamically causes
several WMI calls for OMEN laptops to fail.  The problem
is resolved by reverting commit 4b4967cbd26.

All changes were validated on a HP ZBook Workstation notebook,
HP EliteBook x360, HP EliteBook 850 G8, and Omen 15 notebooks.
Additional validation was included in the test process to
ensure no other	commands were incorrectly handled.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 drivers/platform/x86/hp-wmi.c | 62 ++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 0e9a25b56e0e..b917571a1e47 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -90,17 +90,12 @@ enum hp_wmi_event_ids {
 	HPWMI_BATTERY_CHARGE_PERIOD	= 0x10,
 };
 
-/*
- * struct bios_args buffer is dynamically allocated.  New WMI command types
- * were introduced that exceeds 128-byte data size.  Changes to handle
- * the data size allocation scheme were kept in hp_wmi_perform_qurey function.
- */
 struct bios_args {
 	u32 signature;
 	u32 command;
 	u32 commandtype;
 	u32 datasize;
-	u8 data[];
+	u8 data[128];
 };
 
 enum hp_wmi_commandtype {
@@ -286,43 +281,37 @@ static inline int encode_outsize_for_pvsz(int outsize)
 static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 				void *buffer, int insize, int outsize)
 {
-	struct acpi_buffer input, output = { ACPI_ALLOCATE_BUFFER, NULL };
+	int mid;
 	struct bios_return *bios_return;
-	union acpi_object *obj = NULL;
-	struct bios_args *args = NULL;
-	int mid, actual_outsize, ret;
-	size_t bios_args_size;
+	int actual_outsize;
+	union acpi_object *obj;
+	struct bios_args args = {
+		.signature = 0x55434553,
+		.command = command,
+		.commandtype = query,
+		.datasize = insize,
+		.data = { 0 },
+	};
+	struct acpi_buffer input = { sizeof(struct bios_args), &args };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	int ret = 0;
 
 	mid = encode_outsize_for_pvsz(outsize);
 	if (WARN_ON(mid < 0))
 		return mid;
 
-	bios_args_size = struct_size(args, data, insize);
-	args = kmalloc(bios_args_size, GFP_KERNEL);
-	if (!args)
-		return -ENOMEM;
-
-	input.length = bios_args_size;
-	input.pointer = args;
-
-	args->signature = 0x55434553;
-	args->command = command;
-	args->commandtype = query;
-	args->datasize = insize;
-	memcpy(args->data, buffer, flex_array_size(args, data, insize));
+	if (WARN_ON(insize > sizeof(args.data)))
+		return -EINVAL;
+	memcpy(&args.data[0], buffer, insize);
 
-	ret = wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
-	if (ret)
-		goto out_free;
+	wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
 
 	obj = output.pointer;
-	if (!obj) {
-		ret = -EINVAL;
-		goto out_free;
-	}
+
+	if (!obj)
+		return -EINVAL;
 
 	if (obj->type != ACPI_TYPE_BUFFER) {
-		pr_warn("query 0x%x returned an invalid object 0x%x\n", query, ret);
 		ret = -EINVAL;
 		goto out_free;
 	}
@@ -347,7 +336,6 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 
 out_free:
 	kfree(obj);
-	kfree(args);
 	return ret;
 }
 
@@ -605,6 +593,7 @@ static int hp_wmi_rfkill2_refresh(void)
 	for (i = 0; i < rfkill2_count; i++) {
 		int num = rfkill2[i].num;
 		struct bios_rfkill2_device_state *devstate;
+
 		devstate = &state.device[num];
 
 		if (num >= state.count ||
@@ -625,6 +614,7 @@ static ssize_t display_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	int value = hp_wmi_read_int(HPWMI_DISPLAY_QUERY);
+
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -634,6 +624,7 @@ static ssize_t hddtemp_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	int value = hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
+
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -643,6 +634,7 @@ static ssize_t als_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
 	int value = hp_wmi_read_int(HPWMI_ALS_QUERY);
+
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -652,6 +644,7 @@ static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	int value = hp_wmi_get_dock_state();
+
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -661,6 +654,7 @@ static ssize_t tablet_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	int value = hp_wmi_get_tablet_mode();
+
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -671,6 +665,7 @@ static ssize_t postcode_show(struct device *dev, struct device_attribute *attr,
 {
 	/* Get the POST error code of previous boot failure. */
 	int value = hp_wmi_read_int(HPWMI_POSTCODEERROR_QUERY);
+
 	if (value < 0)
 		return value;
 	return sprintf(buf, "0x%x\n", value);
@@ -1013,6 +1008,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 		struct rfkill *rfkill;
 		enum rfkill_type type;
 		char *name;
+
 		switch (state.device[i].radio_type) {
 		case HPWMI_WIFI:
 			type = RFKILL_TYPE_WLAN;
-- 
2.25.1

