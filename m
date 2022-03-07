Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F72C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Mar 2022 22:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232229AbiCGWKb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Mar 2022 17:10:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235685AbiCGWKa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Mar 2022 17:10:30 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D7A49FBF
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Mar 2022 14:09:35 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id q189so1203830oia.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Mar 2022 14:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=20H4QEdS43y+gnKl13/cvTJvGXZbqcq9HDsDJ1m4ONw=;
        b=dMzqWvJXDi8hc0o1FIdpZ2D7+t0yY9K5xvKNp22qVOCJoS3U1qGHw/bEe1r5oZIUMb
         zNw36br75yY43UoXtZtFk2ArbRXZpIsUuf5vjeCo5Lw6qh6RV8QI3z5l4nfibC5NrILg
         ErHBCxWiHVG/HqYgQ4gO9i64VXGPFkqb4S2pBcrPZhlYPkZR99n9uLActeEGjtEUFME0
         eGipR2APBSodptfdbjvGzkOGBFx5JezY8sh806UbqeV54YNqhn6F4bDZWe/Dpv69941R
         YoNBw9fHciW1ROfMvuXZNj4H7KDN7kILX/PmR8BCSSvsexewGyJk2NCGmyaJkncgMzh6
         zpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=20H4QEdS43y+gnKl13/cvTJvGXZbqcq9HDsDJ1m4ONw=;
        b=x+SWrqtovv95AZJGWQ8BlxvNOYd8GvR/eCtA9Wi+2/0rynfJE2MQjfE6OwGoAj6ehA
         Ci2H73ZbYeQqqXzqcMYTjc9a/vW3EoSrUjX00FDEA4bluBDopApYapTacEx+JFUib/MF
         VkWAKtGychmOV/vz0mMo3ZFEbE5OWm5bmF6yagEOzlywxnkI3LR8y2Lbnjq932KC+YYT
         JHFcrmZqVDeUV3U1GhaN0dGo3JdXpC8SUVi1cJ137MGeMwftkaeOOfryStpdKMep4wDO
         6lx5ULN+cBwz+J295TJXWZ3wVyJ7BrEZEDtICRPpYtRupIQ2SQvi0EVXSWgWIQ1DhQwW
         O53Q==
X-Gm-Message-State: AOAM530116lo4OUyitGglYFuS1YMTxuYayf3ahHUJMPT4qukV1FD0eaH
        CEf2u/9RRybiNuapKPgAXuL9bJ2M/8I=
X-Google-Smtp-Source: ABdhPJxtKDD4vBXBbjIH9PQNVq8Dj19S2Km3qjQQ4OpzW6JuHBhzGm3savtyw80+XG7VBZLANx5IPA==
X-Received: by 2002:aca:bec4:0:b0:2d9:7254:1019 with SMTP id o187-20020acabec4000000b002d972541019mr740512oif.144.1646690974136;
        Mon, 07 Mar 2022 14:09:34 -0800 (PST)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:c8fd:9e42:5ced:850e])
        by smtp.gmail.com with ESMTPSA id z25-20020a056808065900b002d97bda386esm6892644oih.51.2022.03.07.14.09.33
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 14:09:33 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 1/3] Fix SW_TABLET_MODE detection method
Date:   Mon,  7 Mar 2022 16:09:30 -0600
Message-Id: <20220307220932.23607-2-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307220932.23607-1-jorge.lopez2@hp.com>
References: <20220307220932.23607-1-jorge.lopez2@hp.com>
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

The latest changes use SMBIOS Type 3 (chassis type) and WMI Command 0x40
(device_mode_status) information to determine if the device is in tablet
mode or not.

hp_wmi_hw_state function was split into two functions; hp_wmi_get_dock_state
and hp_wmi_get_tablet_mode.  The new functions separate how dock_state and
tablet_mode is handled in a cleaner manner.

All changes were validated on a HP ZBook Workstation notebook,
HP EliteBook x360, and HP EliteBook 850 G8.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 drivers/platform/x86/hp-wmi.c | 80 ++++++++++++++++++++++++++---------
 1 file changed, 60 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 48a46466f086..e142e9a0d317 100644
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
+	HPWMI_SYSTEM_DEVICE_MODE       = 0x40,
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
@@ -337,7 +346,7 @@ static int hp_wmi_read_int(int query)
 	int val = 0, ret;
 
 	ret = hp_wmi_perform_query(query, HPWMI_READ, &val,
-				   sizeof(val), sizeof(val));
+				   0, sizeof(val));
 
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -345,14 +354,47 @@ static int hp_wmi_read_int(int query)
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
+	char system_device_mode[4] = { 0 };
+	int ret;
+	bool tablet_found = false;
+
+	const char *chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);
+
+	if (!chassis_type)
+		return 0;
+
+	tablet_found = match_string(tablet_chassis_types,
+			    ARRAY_SIZE(tablet_chassis_types),
+			    chassis_type) >= 0;
+	
+	if (!tablet_found)
+		return 0;
+
+	ret = hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
+				       system_device_mode, 0, sizeof(system_device_mode));
+
+	if (ret < 0)
+		return 0;
+
+	if (system_device_mode[0] == DEVICE_MODE_TABLET) 
+		return 1;
+	
+	return 0;
 }
 
 static int omen_thermal_profile_set(int mode)
@@ -568,7 +610,7 @@ static ssize_t als_show(struct device *dev, struct device_attribute *attr,
 static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
-	int value = hp_wmi_hw_state(HPWMI_DOCK_MASK);
+	int value = hp_wmi_get_dock_state();
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -577,7 +619,7 @@ static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
 static ssize_t tablet_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
-	int value = hp_wmi_hw_state(HPWMI_TABLET_MASK);
+	int value = hp_wmi_get_tablet_mode();
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -699,10 +741,10 @@ static void hp_wmi_notify(u32 value, void *context)
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
@@ -780,19 +822,17 @@ static int __init hp_wmi_input_setup(void)
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
@@ -1227,10 +1267,10 @@ static int hp_wmi_resume_handler(struct device *device)
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

