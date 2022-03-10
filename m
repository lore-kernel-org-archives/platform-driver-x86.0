Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B0EC433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Mar 2022 21:09:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242662AbiCJVJ7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Mar 2022 16:09:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343889AbiCJVJ7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Mar 2022 16:09:59 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 934BF3DDC3
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 13:08:57 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id v15so5490392qkg.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 13:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Upaa1kgWpqw/Vg1N6wJAUKq4F3KMqmL1t14zMQMurnw=;
        b=Zcr11dA/zREo3dihXOrKQx35Umctakjw2T0daa/ozhEXlMP7h/SKh7mgcHsNdTjrhe
         wX0BkA+7R7mXuA8qTXysU9P61dVP4pKgSQzfTEk2PEm7BE3yk+0tRwtDCU6gPOCA2lhX
         uAfMrs8XaCT0DtaRNcg+E4+v9VbbDGy5Nh8LOwMjsE8mGi0JCZ9V4JSRexp48BVK3LTv
         RBt0lBOtpxC3aVAgDt6i50oqKXg5/I80KDTRix1Z+NkauhuKsjzhxHl+LY18uL9phW49
         u2iR0I7MO6NB5Ns8CHHnI0FglBE17u0I2fA88mP9pu4Lm9NaVydoO/vy6ePznid4PWzZ
         7QXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Upaa1kgWpqw/Vg1N6wJAUKq4F3KMqmL1t14zMQMurnw=;
        b=qApV1WRa7Dgua4apn0NS8FfaLjZagZPk+yDeKog1FfDyuCaD20aDoB2PFRu1wiM09M
         goia1h/G1vKQzF710KzcBPNfErt4jhu/d5odiqqw6djKOQE02HAw1neQxzCy2ZR3L/qu
         Yx9GZ/PM9AteBhyQU2gykfNiNGcg+BWXh1pkVZO4DIxDTSBYxTdjZqeu4qdqdimpXhOP
         9GWbzo8dsyWMCVRIqq2P037NAUkFWGGLq64P5dvSnMMh6LS7Fus+deEk5Eg8s/u84K1q
         +VvD2HffIMtcJMPT4+hohLaXaRhpT/0TTrw/61W9fEr/PMBQFhUBocNbVZgogDF4wWJI
         QZtw==
X-Gm-Message-State: AOAM530Rqz4QuTeFy0UaOyH06mdLpMpsuaPYlOx2nGmMYkE2dEkY8k+P
        P2ewbh+j0D24hW+zcCzt3S/ESt23YIE=
X-Google-Smtp-Source: ABdhPJz4brUUBTP8SyzgvJvtUbUDJJDp01LeL0o+ZNSavjbap0bz9WhfGZJ2JtOEuI6JPr2U+Pv3Tw==
X-Received: by 2002:a37:f510:0:b0:663:9d17:8c2e with SMTP id l16-20020a37f510000000b006639d178c2emr4346307qkk.397.1646946536461;
        Thu, 10 Mar 2022 13:08:56 -0800 (PST)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:c0b0:4de4:5b27:f2e7])
        by smtp.gmail.com with ESMTPSA id k6-20020a378806000000b0064915d9584fsm2881727qkd.8.2022.03.10.13.08.55
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 13:08:56 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 2/4] Fix SW_TABLET_MODE detection method
Date:   Thu, 10 Mar 2022 15:08:51 -0600
Message-Id: <20220310210853.28367-3-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310210853.28367-1-jorge.lopez2@hp.com>
References: <20220310210853.28367-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The purpose of this patch is to introduce a fix and removal of the
current hack when determining tablet mode status.

Determining the tablet mode status requires reading Byte 0 bit 2 as
reported by HPWMI_HARDWARE_QUERY.  The investigation identified the
failure was rooted in two areas: HPWMI_HARDWARE_QUERY failure (0x05)
and reading Byte 0, bit 2 only to determine the table mode status.
HPWMI_HARDWARE_QUERY WMI failure also rendered the dock state value
invalid.

The latest changes use SMBIOS Type 3 (chassis type) and WMI Command
0x40 (device_mode_status) information to determine if the device is
in tablet mode or not.

hp_wmi_hw_state function was split into two functions;
hp_wmi_get_dock_state and hp_wmi_get_tablet_mode.  The new functions
separate how dock_state and tablet_mode is handled in a cleaner
manner.

All changes were validated on a HP ZBook Workstation notebook,
HP EliteBook x360, and HP EliteBook 850 G8.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next

This patch requires  patch "Fix hp_wmi_read_int() reporting
error (0x05)" in order to work correctly.
---
 drivers/platform/x86/hp-wmi.c | 71 +++++++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 103f56399ed0..e9aa05c26a40 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -35,10 +35,6 @@ MODULE_LICENSE("GPL");
 MODULE_ALIAS("wmi:95F24279-4D7B-4334-9387-ACCDC67EF61C");
 MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
 
-static int enable_tablet_mode_sw = -1;
-module_param(enable_tablet_mode_sw, int, 0444);
-MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting (-1=auto, 0=no, 1=yes)");
-
 #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
 #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
 #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
@@ -107,6 +103,7 @@ enum hp_wmi_commandtype {
 	HPWMI_FEATURE2_QUERY		= 0x0d,
 	HPWMI_WIRELESS2_QUERY		= 0x1b,
 	HPWMI_POSTCODEERROR_QUERY	= 0x2a,
+	HPWMI_SYSTEM_DEVICE_MODE	= 0x40,
 	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
 };
 
@@ -217,6 +214,18 @@ struct rfkill2_device {
 static int rfkill2_count;
 static struct rfkill2_device rfkill2[HPWMI_MAX_RFKILL2_DEVICES];
 
+/* Chassis Types values were obtained from SMBIOS reference
+ * specification version 3.00. A complete list of system enclosures
+ * and chassis types is available on Table 17. 
+ */
+static const char * const tablet_chassis_types[] = {
+	"30", /* Tablet*/
+	"31", /* Convertible */
+	"32"  /* Detachable */
+};
+
+#define DEVICE_MODE_TABLET	0x06
+
 /* map output size to the corresponding WMI method id */
 static inline int encode_outsize_for_pvsz(int outsize)
 {
@@ -345,14 +354,40 @@ static int hp_wmi_read_int(int query)
 	return val;
 }
 
-static int hp_wmi_hw_state(int mask)
+static int hp_wmi_get_dock_state(void)
 {
 	int state = hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
 
 	if (state < 0)
 		return state;
 
-	return !!(state & mask);
+	return !!(state & HPWMI_DOCK_MASK);
+}
+
+static int hp_wmi_get_tablet_mode(void)
+{
+	char system_device_mode[4] = { 0 };
+	int ret;
+	bool tablet_found = false;
+
+	const char *chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);
+
+	if (!chassis_type)
+		return -ENODEV;
+
+	tablet_found = match_string(tablet_chassis_types,
+			    ARRAY_SIZE(tablet_chassis_types),
+			    chassis_type) >= 0;
+	if (!tablet_found)
+		return -ENODEV;
+
+	ret = hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
+				       system_device_mode, 0, sizeof(system_device_mode));
+
+	if (ret < 0)
+		return ret;
+
+	return system_device_mode[0] == DEVICE_MODE_TABLET;
 }
 
 static int omen_thermal_profile_set(int mode)
@@ -568,7 +603,7 @@ static ssize_t als_show(struct device *dev, struct device_attribute *attr,
 static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
-	int value = hp_wmi_hw_state(HPWMI_DOCK_MASK);
+	int value = hp_wmi_get_dock_state();
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -577,7 +612,7 @@ static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
 static ssize_t tablet_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
-	int value = hp_wmi_hw_state(HPWMI_TABLET_MASK);
+	int value = hp_wmi_get_tablet_mode();
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -699,10 +734,10 @@ static void hp_wmi_notify(u32 value, void *context)
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
@@ -780,19 +815,17 @@ static int __init hp_wmi_input_setup(void)
 	__set_bit(EV_SW, hp_wmi_input_dev->evbit);
 
 	/* Dock */
-	val = hp_wmi_hw_state(HPWMI_DOCK_MASK);
+	val = hp_wmi_get_dock_state();
 	if (!(val < 0)) {
 		__set_bit(SW_DOCK, hp_wmi_input_dev->swbit);
 		input_report_switch(hp_wmi_input_dev, SW_DOCK, val);
 	}
 
 	/* Tablet mode */
-	if (enable_tablet_mode_sw > 0) {
-		val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
-		if (val >= 0) {
-			__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
-			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
-		}
+	val = hp_wmi_get_tablet_mode();
+	if (!(val < 0)) {
+		__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
+		input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
 	}
 
 	err = sparse_keymap_setup(hp_wmi_input_dev, hp_wmi_keymap, NULL);
@@ -1227,10 +1260,10 @@ static int hp_wmi_resume_handler(struct device *device)
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

