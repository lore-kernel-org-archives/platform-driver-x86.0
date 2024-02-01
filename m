Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B8A53377
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Feb 2024 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706794178; cv=none; b=icYcw+Dqn80xnvdc7+djQ+qpliTJk36MjpFwGqQg14blr50xcLmSE7RlWVwKhWqFX2iEMdCMGEz8u+A8vOA9ltWLcZQRPS6lnJor4v/gC026jI8FlLbI5hE6miYHRwp2cnV9pAsnZDuwmyb5h+l+ReroKT2WxWZyHF5xPmMN8x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706794178; c=relaxed/simple;
	bh=Mc+923QkDWYPrzpNIIMbYqVklIxTsX68E6rf5R4cZNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MqWLzXPjCBhqAM6aMPxY0S/OGDTRVQNXIrGyUfJTM/WTf16BsShnsOxb22yeLqduCcxrXBmIY4wbYf1eaLUcsQR8bY2m0uedR6xmDi7kUtBovkGHBEo5C6J7ry6Rqe/EA9oN+stjTz7arUxcmDspgzJHXx6fcJeUdEGOPjx829U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erp3JBxm; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erp3JBxm"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33ae53eb5a8so553411f8f.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Feb 2024 05:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706794174; x=1707398974; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FdgVStWX9l2Up/qDJ3Kmw5sZEBxKi2uvAnRmBl5psCI=;
        b=erp3JBxm10FtoJ9JyvNOy/XebAriyEsI31wJt0S9Wy0wVc1cvNcy0Pe8oqYj5OpQqt
         C8WSN2i5k606MDf04/723jTx2Gv5HHPox4ES4cULh7mvxcTf0LKJ8/11ArnStrEh/S3v
         qF9ewhrSdlQXWXf6EwOn9ksqTmtImtk07qgyl313tItH6Pg4dKVGmwjuYnvKYw5BSLt+
         5VmFou4E/+KcfnHa8w9qYOvuBg2w23qx0lupNa88NrJjOZTdNa1KaTn3Q5QAT+/q5nPH
         bOZSAoablwV35GTXM8OHCKFo60ADJVlHB8oAF6B8qLhCR0xZrFlBFFDFxRjerdx0gwJg
         alUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706794174; x=1707398974;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FdgVStWX9l2Up/qDJ3Kmw5sZEBxKi2uvAnRmBl5psCI=;
        b=j7m5q2BhNugi/2+xMgLkFg51SMDH71ApAeyoku9Dbk9Ak+hdNh1/8cx0O/DxoFqkK+
         4iYdx56kuXiPz/wEsXGR7Y1q2if8T8Ng/IcRW3mC10PXq9mOtDUqCvsRrzEEq7oeB0J3
         ERyvNOxmvdrexHw7hfI6oaVLp7GsXt3c5cuHh3hGzjHafvpTzdss+eKAN4npgNLeCqE7
         8HFp0kiVNWvuBsRvwkMhWRvgj0OEwavkoB0omNlAtgDH3onEcy+LRxzVi8kvqGk2OmLo
         7fhIsLMQTU6q53h6imKR8CLF/s832ATDsStnO0KIkt0Zyb6/Rd5wKXV+20nnCVG6EfgG
         Yw+Q==
X-Gm-Message-State: AOJu0Yy6tF23QysjCjux0UxoPGMAL6Q08jpSBjYHfyWFnz++C8I1UBCm
	/636zEG/2/h4Vw49H4KJ0RQa7sgQPaqHlrehF4+qPjltAd+RWV13
X-Google-Smtp-Source: AGHT+IG/rapsVPI5Mu/aobsECIrIYShMwdAbe5oIrSapK6E88GH1QD9BVkhRHIcPSPxXUlpdvkgfTw==
X-Received: by 2002:a5d:5a92:0:b0:33b:1562:34f9 with SMTP id bp18-20020a5d5a92000000b0033b156234f9mr1683407wrb.39.1706794174575;
        Thu, 01 Feb 2024 05:29:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXrCp3OSPdWFXemWQ5ZnrDZvxj8q2Y3kjM5dixZxmIOH9kxLeYPuZqLgoRHUcWuj/7qIcOn11XTSqBsWUNpOoMX7vddXdDyteGgxNLjIwkFgez6MxCd4w==
Received: from alexis-pc (cust-west-par-46-193-0-235.cust.wifirst.net. [46.193.0.235])
        by smtp.gmail.com with ESMTPSA id k14-20020adfe3ce000000b0033b0924543asm3193027wrm.108.2024.02.01.05.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 05:29:34 -0800 (PST)
Date: Thu, 1 Feb 2024 14:29:33 +0100
From: Alexis Belmonte <alexbelm48@gmail.com>
To: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org, putr4.s@gmail.com
Subject: [PATCH v2 2/2] platform/x86: hp-wmi: Add thermal profile support for
 8BAD boards
Message-ID: <ZbucvX2rRdqRgtcu@alexis-pc>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add 8BAD to the list of boards which have thermal profile selection
available. This allows the CPU to draw more power than the default TDP
barrier defined by the 'balanced' thermal profile (around 50W), hence
allowing it to perform better without being throttled by the embedded
controller (around 130W).

We first need to set the HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET to zero.
This prevents the timer countdown from reaching zero, making the embedded
controller "force-switch" the system's thermal profile back to 'balanced'
automatically.

We also need to put a number of specific flags in
HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET when we're switching to another
thermal profile:

   - for 'performance', we need to set both HP_OMEN_EC_FLAGS_TURBO and
     HP_OMEN_EC_FLAGS_NOTIMER;

   - for 'balanced' and 'powersave', we clear out the register to notify
     the system that we want to lower the TDP barrier as soon as possible.

The third flag defined in the hp_thermal_profile_omen_flags enum,
HP_OMEN_EC_FLAGS_JUSTSET, is present for completeness.

To prevent potential behaviour breakage with other Omen models, a
separate omen_timed_thermal_profile_boards array has been added to list
which boards expose this behaviour.

Performance benchmarking was done with the help of silver.urih.com and
Google Chrome 120.0.6099.129, on Gnome 45.2, with the 'performance'
thermal profile set:

|                  | Performance |     Stress |   TDP |
|------------------|-------------|------------|-------|
|    with my patch |      P84549 |    S0.1891 |  131W | 
| without my patch |      P44084 |    S0.1359 |   47W |

The TDP measurements were done with the help of the s-tui utility,
during the load.

There is still work to be done:

   - tune the CPU and GPU fans to better cool down and enhance
     performance at the right time; right now, it seems that the fans are
     not properly reacting to thermal/performance events, which in turn
     either causes thermal throttling OR makes the fans spin way too long,
     even though the temperatures have lowered down

   - expose the CPU and GPU fan curves to user-land so that they can be
     controlled just like what the Omen Gaming Hub utility proposes to
     its users;

Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 61 ++++++++++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index b19039cf1966..05011aa93a7a 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -38,6 +38,8 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
 #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
 #define HPWMI_BIOS_GUID "5FB7F034-2C63-45E9-BE91-3D44E2C707E4"
 
+#define HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET 0x62
+#define HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET 0x63
 #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
 
 #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
@@ -57,7 +59,7 @@ static const char * const omen_thermal_profile_boards[] = {
 	"874A", "8603", "8604", "8748", "886B", "886C", "878A", "878B", "878C",
 	"88C8", "88CB", "8786", "8787", "8788", "88D1", "88D2", "88F4", "88FD",
 	"88F5", "88F6", "88F7", "88FE", "88FF", "8900", "8901", "8902", "8912",
-	"8917", "8918", "8949", "894A", "89EB"
+	"8917", "8918", "8949", "894A", "89EB", "8BAD", "8A42"
 };
 
 /* DMI Board names of Omen laptops that are specifically set to be thermal
@@ -68,6 +70,14 @@ static const char * const omen_thermal_profile_force_v0_boards[] = {
 	"8607", "8746", "8747", "8749", "874A", "8748"
 };
 
+/* DMI board names of Omen laptops that have a thermal profile timer which will
+ * cause the embedded controller to set the thermal profile back to
+ * "balanced" when reaching zero.
+ */
+static const char * const omen_timed_thermal_profile_boards[] = {
+	"8BAD", "8A42"
+};
+
 /* DMI Board names of Victus laptops */
 static const char * const victus_thermal_profile_boards[] = {
 	"8A25"
@@ -184,6 +194,12 @@ enum hp_thermal_profile_omen_v1 {
 	HP_OMEN_V1_THERMAL_PROFILE_COOL		= 0x50,
 };
 
+enum hp_thermal_profile_omen_flags {
+	HP_OMEN_EC_FLAGS_TURBO		= 0x04,
+	HP_OMEN_EC_FLAGS_NOTIMER	= 0x02,
+	HP_OMEN_EC_FLAGS_JUSTSET	= 0x01,
+};
+
 enum hp_thermal_profile_victus {
 	HP_VICTUS_THERMAL_PROFILE_DEFAULT		= 0x00,
 	HP_VICTUS_THERMAL_PROFILE_PERFORMANCE		= 0x01,
@@ -451,7 +467,11 @@ static int hp_wmi_get_tablet_mode(void)
 
 static int omen_thermal_profile_set(int mode)
 {
-	char buffer[2] = {0, mode};
+	/* The Omen Control Center actively sets the first byte of the buffer to
+	 * 255, so let's mimic this behaviour to be as close as possible to
+	 * the original software.
+	 */
+	char buffer[2] = {-1, mode};
 	int ret;
 
 	ret = hp_wmi_perform_query(HPWMI_SET_PERFORMANCE_MODE, HPWMI_GM,
@@ -1203,10 +1223,33 @@ static int platform_profile_omen_get(struct platform_profile_handler *pprof,
 	return 0;
 }
 
+static bool has_omen_thermal_profile_ec_timer(void)
+{
+	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
+
+	if (!board_name)
+		return false;
+
+	return match_string(omen_timed_thermal_profile_boards,
+			    ARRAY_SIZE(omen_timed_thermal_profile_boards),
+			    board_name) >= 0;
+}
+
+inline int omen_thermal_profile_ec_flags_set(enum hp_thermal_profile_omen_flags flags)
+{
+	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET, flags);
+}
+
+inline int omen_thermal_profile_ec_timer_set(u8 value)
+{
+	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET, value);
+}
+
 static int platform_profile_omen_set(struct platform_profile_handler *pprof,
 				     enum platform_profile_option profile)
 {
 	int err, tp, tp_version;
+	enum hp_thermal_profile_omen_flags flags = 0;
 
 	tp_version = omen_get_thermal_policy_version();
 
@@ -1240,6 +1283,20 @@ static int platform_profile_omen_set(struct platform_profile_handler *pprof,
 	if (err < 0)
 		return err;
 
+	if (has_omen_thermal_profile_ec_timer()) {
+		err = omen_thermal_profile_ec_timer_set(0);
+		if (err < 0)
+			return err;
+
+		if (profile == PLATFORM_PROFILE_PERFORMANCE)
+			flags = HP_OMEN_EC_FLAGS_NOTIMER |
+				HP_OMEN_EC_FLAGS_TURBO;
+
+		err = omen_thermal_profile_ec_flags_set(flags);
+		if (err < 0)
+			return err;
+	}
+
 	return 0;
 }
 
-- 
2.43.0

