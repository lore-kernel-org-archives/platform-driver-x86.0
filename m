Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6F74501B
	for <platform-driver-x86@vger.kernel.org>; Sun, 19 May 2024 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716143193; cv=none; b=sFvehhiK2X2p25LtpzLGobYZSlZlugdKjCgJkHWXpTWAxZnAL8F8Lrzlb8FGWaCVBkz/Kvj5HB9aQYhkkQOjih6uXzOVFrb+y4OBES16w8v/joAlw0s/rxVX8B+mpGUsBsM3H1PRN/QQhQWdFbW3hhxa4L591Eb2SQs595gnCv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716143193; c=relaxed/simple;
	bh=mFHUpIA8WAUBvR2M1rsVePjO3BFxRxQWbvNGSeEfN98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QKoiLG1mdMfs6IbwdtficPiJ0ib8dgxunkWhQAMGae0eXO1b8ymhYLq1JWzyZguQ4fsA4Uc+q2j4NfH6Bkhz+I10kq89mxaUJPTnVJR0mplyIlun09uQ84iMJFycIUj0Q8qjnUsVVWZTbEY0mBYJ7k9X/SgNyVy2qNI93pyUTyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCdZKy1Z; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCdZKy1Z"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-34db9a38755so1863627f8f.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 May 2024 11:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716143189; x=1716747989; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8uRU/n2v5oOutcdtqHZ1gsTHbVN2qYJOk0v6WlvD8TQ=;
        b=OCdZKy1Z8/r5wveLuPxD3EhnYl/ur5L+VucqBtWDXII0qO35gQEQhG13Gy1+Qm9S+d
         eyt8glJMLnHiPmRRyYLbk35PQ0qqVDu0a9lez34uhd+5Jf/Cyhf5NdliwheIl3JEQJ1X
         q/jCJupr3hRJ3bg7hVQ4yh2yrD6aQrwZppe1jiPMnuG5/jqMb+KYC0Pf8FPN59zGox5P
         UBkt7NCsAzGvYP58oeUHzFQkPMtLSVEjSAsP14SkqU7nVS5V7HvOtutZyCkThZ+8WUfe
         3ATPAQn/Mta4pvrBAPiCkU7/DerVRwyell4TjTmEtMhPQLGaTWbvt4mvZ7VR0u6lONZ2
         Ga/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716143190; x=1716747990;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8uRU/n2v5oOutcdtqHZ1gsTHbVN2qYJOk0v6WlvD8TQ=;
        b=mkk97EGRgBQi3LgA/JpTSgsDj+6I07nInOv4FWU85/L4QijeHWQkbzmu0/+zWLpXBJ
         0rhjqF2U/25A0MdynS3V4N0Nom6w0QGWbhm4QycKDVsCRJcwZ7/rHK3TuaYOJHpAFwLZ
         JStstacsR88M42ap+43hVKUhi3R8+MQ+d/hugn5FGByS5zx7DmSU9dA02Q/5Fv5H+rEa
         qVJLTJJpusBV63XljImoWOnPNhwhdW7FqHMG898byaFqMRaJ3/d4BSEMJCetD1IB2TjL
         4o69Pt3nwy4aeaQ+t6AOrAGbZhAgw1et7H+BDa7zEVqDPgUVsAVO2QiK+2KGAc3BfnXH
         0paw==
X-Gm-Message-State: AOJu0YzBfve8k5Bn/la+yy9Vb0+qfbK0yXZ5+qeu1we9KU6aSvjfamTH
	gtreq05jQOwrc4b7CPEt/AeNPkMXFQJVFNOc6cfVLN5iv+lLSTXB
X-Google-Smtp-Source: AGHT+IFMW8Fw+sXxlNWo9Y/xcprkpf2BwxSwM97M89+6Q75+ARAxtkNLH10dqe1ZyA4T9a63IGq23w==
X-Received: by 2002:a05:6000:1968:b0:34d:707c:922a with SMTP id ffacd0b85a97d-3504a6310bbmr26219730f8f.13.1716143189428;
        Sun, 19 May 2024 11:26:29 -0700 (PDT)
Received: from alexis-pc (cust-west-par-46-193-0-235.cust.wifirst.net. [46.193.0.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce24c0sm392128415e9.17.2024.05.19.11.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 11:26:29 -0700 (PDT)
Date: Sun, 19 May 2024 20:26:27 +0200
From: Alexis Belmonte <alexbelm48@gmail.com>
To: W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/x86: hp-wmi: Fix platform profile option switch
 bug on Omen and Victus laptops
Message-ID: <ZkpEU0Nc3K-SpuYq@alexis-pc>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix a platform profile option switch/getter bug on some Omen and Victus
laptops dismissing userspace choice when selecting performance mode in
inadequate conditions (e.g. by being disconnected from the AC power plug)
by

   -  hooking an ACPI notify handler which listens to the \\_SB.ADP1
      node that propagates battery status events

   -  keeping an intermediate active_platform_profile variable that is
      set when userspace changes the platform profile setting

   -  restoring the selected platform profile kept in
      active_platform_profile when AC power is plugged back into the
      laptop (handled through omen_powersource_notify_handler)

This ensures that the driver follows the principles defined in the
Platform Profile Selection page of the Kernel documentation on those kind
of laptops; which is to not "(...) let userspace know about any
sub-optimal conditions which are impeding reaching the requested
performance level".

Since the Omen and Victus laptops share the same embedded controller
system, the fix is applicable to both categories of laptops.

Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 137 ++++++++++++++++++++++++++++++-
 1 file changed, 133 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 630519c08617..50286128d08a 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -38,6 +38,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
 #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
 #define HPWMI_BIOS_GUID "5FB7F034-2C63-45E9-BE91-3D44E2C707E4"
 
+#define HP_OMEN_EC_POWER_STATUS 0x40
 #define HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET 0x62
 #define HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET 0x63
 #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
@@ -83,6 +84,11 @@ static const char * const victus_thermal_profile_boards[] = {
 	"8A25"
 };
 
+enum hp_wmi_powersource_flags {
+	HPWMI_POWERSOURCE_AC_OFFLINE	= 0x02,
+	HPWMI_POWERSOURCE_AC_ONLINE	= 0x0b
+};
+
 enum hp_wmi_radio {
 	HPWMI_WIFI	= 0x0,
 	HPWMI_BLUETOOTH	= 0x1,
@@ -261,8 +267,11 @@ static const struct key_entry hp_wmi_keymap[] = {
 
 static struct input_dev *hp_wmi_input_dev;
 static struct input_dev *camera_shutter_input_dev;
+
 static struct platform_device *hp_wmi_platform_dev;
 static struct platform_profile_handler platform_profile_handler;
+static struct notifier_block platform_power_source_nb;
+static enum platform_profile_option active_platform_profile;
 static bool platform_profile_support;
 static bool zero_insize_support;
 
@@ -1194,8 +1203,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 	return err;
 }
 
-static int platform_profile_omen_get(struct platform_profile_handler *pprof,
-				     enum platform_profile_option *profile)
+static int platform_profile_omen_get_ec(enum platform_profile_option *profile)
 {
 	int tp;
 
@@ -1223,6 +1231,24 @@ static int platform_profile_omen_get(struct platform_profile_handler *pprof,
 	return 0;
 }
 
+static int platform_profile_omen_get(struct platform_profile_handler *pprof,
+				     enum platform_profile_option *profile)
+{
+	/*
+	 * We directly return the stored platform profile, as the embedded
+	 * controller will not accept switching to the performance option when
+	 * the conditions are not met (e.g. the laptop is not plugged in).
+	 *
+	 * If we directly return what the EC reports, the platform profile will
+	 * immediately "switch back" to normal mode, which is against the
+	 * expected behaviour from a userspace point of view, as described in
+	 * the Platform Profile Section page of the kernel documentation.
+	 *
+	 * See also omen_powersource_notify_handler.
+	 */
+	return active_platform_profile;
+}
+
 static bool has_omen_thermal_profile_ec_timer(void)
 {
 	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
@@ -1297,6 +1323,8 @@ static int platform_profile_omen_set(struct platform_profile_handler *pprof,
 			return err;
 	}
 
+	active_platform_profile = profile;
+
 	return 0;
 }
 
@@ -1381,8 +1409,8 @@ static bool is_victus_thermal_profile(void)
 			    board_name) >= 0;
 }
 
-static int platform_profile_victus_get(struct platform_profile_handler *pprof,
-				     enum platform_profile_option *profile)
+static int platform_profile_victus_get_ec(
+	enum platform_profile_option *profile)
 {
 	int tp;
 
@@ -1407,6 +1435,13 @@ static int platform_profile_victus_get(struct platform_profile_handler *pprof,
 	return 0;
 }
 
+static int platform_profile_victus_get(struct platform_profile_handler *pprof,
+				     enum platform_profile_option *profile)
+{
+	/* Same as for platform_profile_omen_get */
+	return active_platform_profile;
+}
+
 static int platform_profile_victus_set(struct platform_profile_handler *pprof,
 				     enum platform_profile_option profile)
 {
@@ -1430,9 +1465,88 @@ static int platform_profile_victus_set(struct platform_profile_handler *pprof,
 	if (err < 0)
 		return err;
 
+	active_platform_profile = profile;
+
 	return 0;
 }
 
+static int omen_powersource_notify_handler(struct notifier_block *nb,
+					   unsigned long value,
+					   void *data)
+{
+	struct acpi_bus_event *event_entry = data;
+	enum platform_profile_option actual_profile;
+	u8 state;
+	int err;
+
+	if (strcmp(event_entry->device_class, "ac_adapter") != 0)
+		return NOTIFY_DONE;
+
+	pr_debug("Received power source device event\n");
+
+	err = ec_read(HP_OMEN_EC_POWER_STATUS, &state);
+	if (err < 0) {
+		pr_warn("Failed to read power source state (%d)\n", err);
+		return NOTIFY_BAD;
+	}
+
+	if (is_omen_thermal_profile())
+		err = platform_profile_omen_get_ec(&actual_profile);
+	else if (is_victus_thermal_profile())
+		err = platform_profile_victus_get_ec(&actual_profile);
+
+	if (err < 0) {
+		pr_warn("Failed to read current platform profile (%d)\n", err);
+		return NOTIFY_BAD;
+	}
+
+	if (!(state & HPWMI_POWERSOURCE_AC_ONLINE) ||
+	    active_platform_profile == actual_profile)
+		return NOTIFY_DONE;
+
+	err = platform_profile_handler.profile_set(&platform_profile_handler,
+						   active_platform_profile);
+	if (err < 0) {
+		pr_warn("Failed to restore platform profile (%d)\n", err);
+		return NOTIFY_BAD;
+	}
+
+	return NOTIFY_OK;
+}
+
+static void omen_register_powersource_notify_handler(void)
+{
+	int err;
+	acpi_status status;
+
+	if (is_omen_thermal_profile())
+		err = platform_profile_omen_get_ec(&active_platform_profile);
+	else if (is_victus_thermal_profile())
+		err = platform_profile_victus_get_ec(&active_platform_profile);
+
+	if (err < 0) {
+		pr_warn("Failed to retrieve active platform profile (%d)\n",
+			err);
+		active_platform_profile = PLATFORM_PROFILE_BALANCED;
+	}
+
+	platform_power_source_nb.notifier_call = omen_powersource_notify_handler;
+	status = register_acpi_notifier(&platform_power_source_nb);
+
+	if (ACPI_FAILURE(status))
+		pr_warn("Failed to install ACPI power source notify handler\n");
+}
+
+static void hp_wmi_unregister_powersource_notify_handler(void)
+{
+	acpi_status status;
+
+	status = unregister_acpi_notifier(&platform_power_source_nb);
+
+	if (ACPI_FAILURE(status))
+		pr_err("Failed to remove ACPI power source notify handler\n");
+}
+
 static int thermal_profile_setup(void)
 {
 	int err, tp;
@@ -1534,6 +1648,15 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 
 	thermal_profile_setup();
 
+	/*
+	 * Query the platform profile once to know which last power profile
+	 * was set.
+	 */
+	err = platform_profile_handler.profile_get(&platform_profile_handler,
+						   &active_platform_profile);
+	if (err < 0)
+		return err;
+
 	return 0;
 }
 
@@ -1758,6 +1881,9 @@ static int __init hp_wmi_init(void)
 			goto err_unregister_device;
 	}
 
+	if (is_omen_thermal_profile() || is_victus_thermal_profile())
+		omen_register_powersource_notify_handler();
+
 	return 0;
 
 err_unregister_device:
@@ -1772,6 +1898,9 @@ module_init(hp_wmi_init);
 
 static void __exit hp_wmi_exit(void)
 {
+	if (is_omen_thermal_profile() || is_victus_thermal_profile())
+		hp_wmi_unregister_powersource_notify_handler();
+
 	if (wmi_has_guid(HPWMI_EVENT_GUID))
 		hp_wmi_input_destroy();
 
-- 
2.45.1

