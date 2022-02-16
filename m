Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7135AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Feb 2022 16:33:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233574AbiBPQdQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Feb 2022 11:33:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbiBPQdP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Feb 2022 11:33:15 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 793D1154707
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Feb 2022 08:33:03 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id r18-20020a05683001d200b005ac516aa180so1869604ota.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Feb 2022 08:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=osqcMlKjQIK1ExJ7Y9IWkZfTCHPmlvTvyOwfbklawuw=;
        b=InVVx/JEjbe1joC5KdNZu1EI1G4bkFIhDUHjc4EMh0HXUcDFoZQk/Djr6Wijr8G8IF
         qAxlY1IZgJTROMHMRYzuumiJji6fXERwzv5boVY5G/qxB2XdK3b9j9YrQcb8QMRbZcAS
         pLGplCSSwyNrmx4g6kx1sQvu/P2DhrRI4QJ1Dm1BGlLCkmUaeQJT5QEuIvWUHcjbjaan
         8RpmaYDfnKpQvVj1aUFVzCoSOktr2SqjeOYOcdItPDnh52su2diw4J6cUpk3AiVMkoaJ
         wbgb8MZETmTZ8JD3eyclXfh/qFHGEBi2O9ECTUORW2wyI4Jf46Pb3TeEnxPQ8t+4LI/v
         3vGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=osqcMlKjQIK1ExJ7Y9IWkZfTCHPmlvTvyOwfbklawuw=;
        b=chsYf3CqprSG13Aq7ZmZ+Vk6hGvlrySS+E7vN3IvxHDwbDTo+wzIaFpjjYGCZpeBl3
         n88k6ZGWKzbd0v1vbUSuyhfIcf+vQD6WjkhugQZEAa2gfY74M1baOtWha1EJejZE3YAD
         UHl2eluv7KIhiM7iE/NBV113Miz9DcZT9EwvFpQYfMz9ethUOLSbYXrVgmXQ4hdfxJp+
         QEouyjiidKTqJZrF/9QJiPaF1AVCTXj5Ax+uBiRXZnr4MGIXd087F7TO7k8ghHbkIh85
         XhnF2SjXPeOnjncTY5pgItXgf3nomwlSFZqPSTH3fRR0PqHP58Y8dcl0/7xWnl/aoyf4
         QdDg==
X-Gm-Message-State: AOAM533akLfEi2ZIp1/HkZMvM3VNDB1ztpH87kX9/cRqFxboAhsV5MZA
        1W1cm6RltHmGxgm0kpVxf1PPSesxMhQFjQ==
X-Google-Smtp-Source: ABdhPJwdj/05pflJDOYIJvQ2lPCuJatI/HpetjpYbuDXL+Q5PGrplKcptAZC1dALl8VHXDiYIpgCuw==
X-Received: by 2002:a9d:1c98:0:b0:5ad:f8:69bc with SMTP id l24-20020a9d1c98000000b005ad00f869bcmr678450ota.139.1645029182494;
        Wed, 16 Feb 2022 08:33:02 -0800 (PST)
Received: from localhost.localdomain (c-73-76-72-204.hsd1.tx.comcast.net. [73.76.72.204])
        by smtp.googlemail.com with ESMTPSA id x31sm12779369oao.13.2022.02.16.08.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 08:33:02 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org, jorge.lopez2@hp.com
Subject: [PATCH] Fix SW_TABLET_MODE detection method
Date:   Wed, 16 Feb 2022 10:31:47 -0600
Message-Id: <20220216163147.11266-1-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
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

Several WMI queries leverage hp_wmi_read_int function to read their data.
hp_wmi_read_int function returns the appropiate value if
the WMI command requires an input and output buffer size values
greater than zero.  WMI queries such HPWMI_HARDWARE_QUERY,
HPWMI_WIRELESS2_QUERY, and HPWMI_FEATURE2_QUERY requires calling
hp_wmi_perform_query function with input buffer size value of zero.
Any input buffer size greater than zero will cause error 0x05 to be
returned.

A limiting factor discovered during this investigation was the
struct bios_args.data size restriction.  The data member size limits
all possible WMI commands to those requiring buffer size of 128
bytes or less.  Several WMI commands and queries require a buffer size
larger than 128 bytes hence limiting current and feature supported by
the driver.  It is for this reason, struct bios_args.data changed and
it is dynamically allocated.  hp_wmi_perform_query function changed to
handle the memory allocation and release of any required buffer size.

All identified problems were resolved and their correct operation
validated on a ZBook Workstation notebook.  Additional validation was
included to ensure no other commands were failing or incorrectly handled.
---
 drivers/platform/x86/hp-wmi.c | 122 ++++++++++++++++++++++------------
 1 file changed, 79 insertions(+), 43 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 48a46466f086..5320c1eb5cfc 100644
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
@@ -86,12 +83,17 @@ enum hp_wmi_event_ids {
 	HPWMI_BATTERY_CHARGE_PERIOD	= 0x10,
 };
 
+/**
+ * struct bios_args buffer is dynamically allocated.  New WMI command types
+ * were introduced that exceeds 128-byte data size.  Changes to handle
+ * the data size allocation scheme were kept in hp_wmi_perform_qurey function.
+ */
 struct bios_args {
 	u32 signature;
 	u32 command;
 	u32 commandtype;
 	u32 datasize;
-	u8 data[128];
+	u8 data[0];
 };
 
 enum hp_wmi_commandtype {
@@ -127,6 +129,7 @@ enum hp_wmi_command {
 enum hp_wmi_hardware_mask {
 	HPWMI_DOCK_MASK		= 0x01,
 	HPWMI_TABLET_MASK	= 0x04,
+	HPWMI_DETACHABLE_MASK	= 0x08,
 };
 
 struct bios_return {
@@ -260,39 +263,47 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	struct bios_return *bios_return;
 	int actual_outsize;
 	union acpi_object *obj;
-	struct bios_args args = {
-		.signature = 0x55434553,
-		.command = command,
-		.commandtype = query,
-		.datasize = insize,
-		.data = { 0 },
-	};
-	struct acpi_buffer input = { sizeof(struct bios_args), &args };
+	size_t bios_args_size = sizeof(struct bios_args) + insize;
+	struct bios_args *args = NULL;
+	struct acpi_buffer input;
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 	int ret = 0;
 
-	mid = encode_outsize_for_pvsz(outsize);
-	if (WARN_ON(mid < 0))
-		return mid;
+	args = kmalloc(bios_args_size, GFP_KERNEL);
+	if (!args)
+		return -ENOMEM;
 
-	if (WARN_ON(insize > sizeof(args.data)))
-		return -EINVAL;
-	memcpy(&args.data[0], buffer, insize);
+	input.length = bios_args_size;
+	input.pointer = args;
 
-	wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
+	mid = encode_outsize_for_pvsz(outsize);
+	if (WARN_ON(mid < 0)) {
+		ret = mid;
+		goto in_free;
+	}
 
-	obj = output.pointer;
+	/* Avoid unnecessary copy to the data buffer if input buffer size is zero */
+	if (insize > 0)
+		memcpy(args->data, buffer, insize);
 
-	if (!obj)
-		return -EINVAL;
+	args->signature = 0x55434553;
+	args->command = command;
+	args->commandtype = query;
+	args->datasize = insize;
 
-	if (obj->type != ACPI_TYPE_BUFFER) {
+	ret = wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
+
+	obj = output.pointer;
+	if (!obj) {
+		pr_warn("query 0x%x returned a null obj 0x%x\n", query, ret);
 		ret = -EINVAL;
-		goto out_free;
+		goto in_free;
 	}
 
-	bios_return = (struct bios_return *)obj->buffer.pointer;
-	ret = bios_return->return_code;
+	if (!ret && obj->type == ACPI_TYPE_BUFFER) {
+		bios_return = (struct bios_return *)obj->buffer.pointer;
+		ret = bios_return->return_code;
+	}
 
 	if (ret) {
 		if (ret != HPWMI_RET_UNKNOWN_COMMAND &&
@@ -301,6 +312,12 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 		goto out_free;
 	}
 
+	if (obj->type != ACPI_TYPE_BUFFER) {
+		pr_warn("query 0x%x returned an invalid object 0x%x\n", query, ret);
+		ret = -EINVAL;
+		goto out_free;
+	}
+
 	/* Ignore output data of zero size */
 	if (!outsize)
 		goto out_free;
@@ -311,6 +328,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 
 out_free:
 	kfree(obj);
+in_free:
+	kfree(args);
 	return ret;
 }
 
@@ -347,12 +366,19 @@ static int hp_wmi_read_int(int query)
 
 static int hp_wmi_hw_state(int mask)
 {
-	int state = hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
+	int state = 0, ret;
 
-	if (state < 0)
-		return state;
+	ret = hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &state,
+				   0, sizeof(state));
+	
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
 
-	return !!(state & mask);
+	/* determine if Detachable mode is enabled */
+	if (HPWMI_TABLET_MASK == mask) 
+		state = (state & HPWMI_DETACHABLE_MASK );
+	
+	return (state & mask);
 }
 
 static int omen_thermal_profile_set(int mode)
@@ -437,7 +463,7 @@ static int __init hp_wmi_bios_2009_later(void)
 {
 	u8 state[128];
 	int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
-				       sizeof(state), sizeof(state));
+				       0, sizeof(state));
 	if (!ret)
 		return 1;
 
@@ -472,25 +498,37 @@ static const struct rfkill_ops hp_wmi_rfkill_ops = {
 static bool hp_wmi_get_sw_state(enum hp_wmi_radio r)
 {
 	int mask = 0x200 << (r * 8);
+	int ret= 0;
+	int wireless = 0;
 
-	int wireless = hp_wmi_read_int(HPWMI_WIRELESS_QUERY);
+	ret = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_READ, &wireless,
+				   0, sizeof(wireless));
+
+	if (ret < 0)
+	  return -EINVAL;
 
 	/* TBD: Pass error */
 	WARN_ONCE(wireless < 0, "error executing HPWMI_WIRELESS_QUERY");
 
-	return !(wireless & mask);
+	return (wireless & mask);
 }
 
 static bool hp_wmi_get_hw_state(enum hp_wmi_radio r)
 {
 	int mask = 0x800 << (r * 8);
+	int ret= 0;
+	int wireless = 0;
+
+	ret = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_READ, &wireless,
+				   0, sizeof(wireless));
 
-	int wireless = hp_wmi_read_int(HPWMI_WIRELESS_QUERY);
+	if (ret < 0)
+	  return -EINVAL;
 
 	/* TBD: Pass error */
 	WARN_ONCE(wireless < 0, "error executing HPWMI_WIRELESS_QUERY");
 
-	return !(wireless & mask);
+	return (wireless & mask);
 }
 
 static int hp_wmi_rfkill2_set_block(void *data, bool blocked)
@@ -515,7 +553,7 @@ static int hp_wmi_rfkill2_refresh(void)
 	int err, i;
 
 	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-				   sizeof(state), sizeof(state));
+				   0, sizeof(state));
 	if (err)
 		return err;
 
@@ -781,18 +819,16 @@ static int __init hp_wmi_input_setup(void)
 
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
@@ -919,7 +955,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 	int err, i;
 
 	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-				   sizeof(state), sizeof(state));
+				   0, sizeof(state));
 	if (err)
 		return err < 0 ? err : -EINVAL;
 
-- 
2.25.1

