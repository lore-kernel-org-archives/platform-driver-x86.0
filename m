Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D81CCA47C
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Jun 2022 13:25:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244632AbiFGNZS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Jun 2022 09:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244624AbiFGNZR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Jun 2022 09:25:17 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC42BE154
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jun 2022 06:25:16 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 123so5490801pgb.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2022 06:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LxWRBVaAY+phAkjGqy0v3xkLRwWWCDznZIZ4ZNdQf40=;
        b=WCh/wV/n+yuTPWnM2dcENbiwAd7ftjUmGtKRQdB53C2HFz1cr1GmhiDbdsjjMJJ4z6
         0iXz8pdF7hcWh0r9HWEYefJ3mvmXidWOi63wwaYw7K5ECiR6ZaeDi4D6bt2KRzSIxleC
         cv+v8U+ukt3UCo46USKC4zGIMU0AE1R+iGaUFXiDku9/NNXfaMFy8mR5TwMm7hWgieOb
         um4Sd60g2xZTvykm0b4cuSzgwZxtau2tv9XfGg4C1UzGRpy82WqtLK3SUMk5FLQunV9V
         BlNKVxevvPAnGJujNHaqR6faZLt4aYnzDvHOQ5PoiMIRJjbfUI/MoVuDCndoLhcv8oxy
         0TYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LxWRBVaAY+phAkjGqy0v3xkLRwWWCDznZIZ4ZNdQf40=;
        b=CrpQXFCGXFPAfOETsk4NnQVanvdPPVLhoNomeHRv/sCKgJFfF1jNuAcsNfn1go+ljk
         D8cQRyPGhehJJwuzlC1FXw37XNFvSpb5V56Z2jaSUqH69j9cfHlVNRPU6w3acziJVYPP
         qw46FcT5ay566jMT0DR9aDw7tg0MkgLOL3IxOCE6HPp78rsmBJ2MDXa7ShQtMHmN93NU
         wtKRPugMAmR0THPWm3mDwDUwC63G3eDHTgF93n7/kTCO1Q2/ySgOeNMsavDyOA31Vz7Y
         cmitN9w+7w6gMfWltprJuBcebnuFDL2kaZV37o8lTW/cJuOk5JUnjdfd7E5ylUCmVNpk
         7bMQ==
X-Gm-Message-State: AOAM530ERHJB9tTMxvArkdfRC/KmqeYxxDDSjhv11l4MGtUQ0HiOs7mC
        cKp2kaFS+W3/+JveBeQqJGr7hp6iDnFjTRiAO5U=
X-Google-Smtp-Source: ABdhPJywqVLzcRMAtq2Rvaxy995L2LMeMziYg9txobL/16OmX6qU58NfXlyOKtOVrlfdP8k3w6Y5/g==
X-Received: by 2002:a05:6a00:1a87:b0:51c:29f1:13a0 with SMTP id e7-20020a056a001a8700b0051c29f113a0mr7474784pfv.13.1654608315606;
        Tue, 07 Jun 2022 06:25:15 -0700 (PDT)
Received: from fedora.. ([2405:201:a007:e183:aa6d:fbda:3c70:a6e9])
        by smtp.googlemail.com with ESMTPSA id l63-20020a632542000000b003fc4001fd5fsm12736795pgl.10.2022.06.07.06.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 06:25:15 -0700 (PDT)
From:   Bedant Patnaik <bedant.patnaik@gmail.com>
To:     hdegoede@redhat.com
Cc:     Bedant Patnaik <bedant.patnaik@gmail.com>, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [RFC] platform/x86: hp-wmi: make hp_wmi_perform_query() work with certain devices
Date:   Tue,  7 Jun 2022 18:54:28 +0530
Message-Id: <20220607132428.7221-1-bedant.patnaik@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

4b4967cbd2685f313411e6facf915fb2ae01d796 ("platform/x86: hp-wmi: Changing bios_args.data to be dynamically...")
broke WMI queries on some devices where the ACPI method HWMC unconditionally attempts to create Fields beyond the buffer
if the buffer is too small, this breaks essential features such as power profiles:
        CreateByteField (Arg1, 0x10, D008)
        CreateByteField (Arg1, 0x11, D009)
        CreateByteField (Arg1, 0x12, D010)
        CreateDWordField (Arg1, 0x10, D032)
        CreateField (Arg1, 0x80, 0x0400, D128)
In cases where args->data had zero length, ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Field [D008] at bit 
offset/length 128/8 exceeds size of target Buffer (128 bits) (20211217/dsopcode-198) was obtained.
Fix: allocate at least 128 bytes for args->data

be9d73e64957bbd31ee9a0d11adc0f720974c558 ("platform/x86: hp-wmi: Fix 0x05 error code reported by several WMI calls")
and 12b19f14a21a2ee6348825d95b642ef2cd16794f ("platform/x86: hp-wmi: Fix hp_wmi_read_int() reporting error (0x05)")
caused ACPI BIOS Error (bug): Attempt to CreateField of length zero (20211217/dsopcode-133) because of the ACPI
method HWMC, which unconditionally creates a Field of size (insize*8) bits:
	CreateField (Arg1, 0x80, (Local5 * 0x08), DAIN)
In cases where args->insize = 0, the Field size is 0, resulting in an error.
Fix: use zero insize only if 0x5 error code is returned

Tested on Omen 15 AMD (2020) board ID: 8786.

Signed-off-by: Bedant Patnaik <bedant.patnaik@gmail.com>
Cc: markgross@kernel.org
Cc: platform-driver-x86@vger.kernel.org

---
 drivers/platform/x86/hp-wmi.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 667f94bba..3ef385f14 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -38,6 +38,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
 #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
 #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
 #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
+#define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
 
 /* DMI board names of devices that should use the omen specific path for
  * thermal profiles.
@@ -175,7 +176,7 @@ enum hp_thermal_profile_omen_v1 {
 enum hp_thermal_profile {
 	HP_THERMAL_PROFILE_PERFORMANCE	= 0x00,
 	HP_THERMAL_PROFILE_DEFAULT		= 0x01,
-	HP_THERMAL_PROFILE_COOL			= 0x02
+	HP_THERMAL_PROFILE_COOL			= 0x02,
 };
 
 #define IS_HWBLOCKED(x) ((x & HPWMI_POWER_FW_OR_HW) != HPWMI_POWER_FW_OR_HW)
@@ -220,6 +221,7 @@ static struct input_dev *hp_wmi_input_dev;
 static struct platform_device *hp_wmi_platform_dev;
 static struct platform_profile_handler platform_profile_handler;
 static bool platform_profile_support;
+static bool zero_insize_support;
 
 static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
@@ -297,8 +299,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	if (WARN_ON(mid < 0))
 		return mid;
 
-	bios_args_size = struct_size(args, data, insize);
-	args = kmalloc(bios_args_size, GFP_KERNEL);
+	bios_args_size = max(struct_size(args, data, insize), struct_size(args, data, 128));
+	args = kzalloc(bios_args_size, GFP_KERNEL);
 	if (!args)
 		return -ENOMEM;
 
@@ -374,7 +376,7 @@ static int hp_wmi_read_int(int query)
 	int val = 0, ret;
 
 	ret = hp_wmi_perform_query(query, HPWMI_READ, &val,
-				   0, sizeof(val));
+				   zero_if_sup(val), sizeof(val));
 
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -410,7 +412,8 @@ static int hp_wmi_get_tablet_mode(void)
 		return -ENODEV;
 
 	ret = hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
-				   system_device_mode, 0, sizeof(system_device_mode));
+				   system_device_mode, zero_if_sup(system_device_mode),
+				   sizeof(system_device_mode));
 	if (ret < 0)
 		return ret;
 
@@ -497,7 +500,7 @@ static int hp_wmi_fan_speed_max_get(void)
 	int val = 0, ret;
 
 	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
-				   &val, 0, sizeof(val));
+				   &val, zero_if_sup(val), sizeof(val));
 
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -509,7 +512,7 @@ static int __init hp_wmi_bios_2008_later(void)
 {
 	int state = 0;
 	int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, HPWMI_READ, &state,
-				       0, sizeof(state));
+				       zero_if_sup(state), sizeof(state));
 	if (!ret)
 		return 1;
 
@@ -520,7 +523,7 @@ static int __init hp_wmi_bios_2009_later(void)
 {
 	u8 state[128];
 	int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
-				       0, sizeof(state));
+				       zero_if_sup(state), sizeof(state));
 	if (!ret)
 		return 1;
 
@@ -598,7 +601,7 @@ static int hp_wmi_rfkill2_refresh(void)
 	int err, i;
 
 	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-				   0, sizeof(state));
+				   zero_if_sup(state), sizeof(state));
 	if (err)
 		return err;
 
@@ -1007,7 +1010,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 	int err, i;
 
 	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-				   0, sizeof(state));
+				   zero_if_sup(state), sizeof(state));
 	if (err)
 		return err < 0 ? err : -EINVAL;
 
@@ -1483,11 +1486,15 @@ static int __init hp_wmi_init(void)
 {
 	int event_capable = wmi_has_guid(HPWMI_EVENT_GUID);
 	int bios_capable = wmi_has_guid(HPWMI_BIOS_GUID);
-	int err;
+	int err, tmp = 0;
 
 	if (!bios_capable && !event_capable)
 		return -ENODEV;
 
+	if (hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &tmp,
+				 sizeof(tmp), sizeof(tmp)) == HPWMI_RET_INVALID_PARAMETERS)
+		zero_insize_support = true;
+
 	if (event_capable) {
 		err = hp_wmi_input_setup();
 		if (err)
-- 
2.36.1

