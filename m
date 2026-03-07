Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA0433C18B;
	Sat,  7 Mar 2026 11:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772884543; cv=none; b=SNdfO8QA1d2SJ5F/QBzeVW0f5v2EeyBUi4l2gnvZoeMLx+YSzppk0jSFNrgiHNf6eu5AGE19G84cZSZKdpgqpKdURZfsLucsorK5nrC5Llkfu9DhdgT5mJvMaQQcu8HgHjQbI5T59optSqL9YxbXrcOEBVws/imMY9Y1UeEs2jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772884543; c=relaxed/simple;
	bh=5oU+6nx8NybhvnyU6g7WeKEeIK8FlI8OU6w8cY8EW7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cG5QOEe716aVeMg/SAi2eI6kwoHzIxKJT0fuxhxzV2z/UWLvO4oyvzj5wLITRFgWmPGL2C6mq1T7lL1Jw50IEvb89bsA5y/IbpgMCMPEr4Qzysp13VjhX/AE8UcZNjwh5FJ/RxZuECGUKNKmCpb3YeUkf/V/5VnOA8/jFHJ9QKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=VaTmXwvN; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="VaTmXwvN"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id D34BFBBF03;
	Sat,  7 Mar 2026 13:55:34 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id F2EC6BC018;
	Sat,  7 Mar 2026 13:55:33 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c5:43c3:0:ba48:cea4:a8c2:d901])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 12F9D1FEB76;
	Sat,  7 Mar 2026 13:55:33 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1772884533;
	bh=7iiJFySa/6fmCGfJE4A2DkcrahcK1BL9xFCtrABdEy8=; h=From:To:Subject;
	b=VaTmXwvNLytJRrI19aodNtxxlpaa4l9s14TTz90F3leBcD5LjtoAqEjB5MUgOdykS
	 7UpVzZCLd8jy1CxFvUcVHcJBSr+mMY1ia2r9+oBAtvFkYj3y4B7Tmyuisr2ikSPH9Y
	 gYJVXaALBLcy22CDh4r/8cmD0GKCUXwBuKT423TsuvmJtqqm4Pla1BdIzZoZks/RHm
	 lyvZvzIW1wt9AUasOr2XcOfIlzHbrpZaNukk5Hos8AVX/G686e4EMy0qnr3BJPS1vs
	 pdL3Sks1s6q4nue5b+MOcO/ayjfJ1sND1OmnMOG1S4SRg7Oa9bIALWTk/4kULN2VyG
	 PF/qQK2JQ/X+w==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c5:43c3:0:ba48:cea4:a8c2:d901) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Mario.Limonciello@amd.com
Cc: W_Armin@gmx.de,
	sashal@kernel.org,
	Shyam-Sundar.S-k@amd.com,
	derekjohn.clark@gmail.com,
	denis.benato@linux.dev,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [RFC v3 3/4] platform/x86/amd: dptc: Add platform profile support
Date: Sat,  7 Mar 2026 12:55:15 +0100
Message-ID: <20260307115516.26892-4-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260307115516.26892-1-lkml@antheas.dev>
References: <20260307115516.26892-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177288453359.1270977.15814030170541816182@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Register a platform_profile handler so the driver exposes standard
power profiles (low-power, balanced, performance, max-power) alongside
the manual tunable interface. max-power is only supplied when the
performance profile's preset values are below the tunable limits.

When a non-custom profile is active, parameter writes are blocked
(-EPERM) and current_value reflects the profile's preset values.
Selecting the "custom" profile returns control to the user for manual
staging and committing. On resume, the active profile is automatically
re-applied.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/amd/Kconfig |   1 +
 drivers/platform/x86/amd/dptc.c  | 116 +++++++++++++++++++++++++++++--
 2 files changed, 113 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index d610092467fc..41ffbd722524 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -48,6 +48,7 @@ config AMD_ISP_PLATFORM
 config AMD_DPTC
 	tristate "AMD Dynamic Power and Thermal Configuration Interface (DPTCi)"
 	depends on X86_64 && ACPI && DMI
+	select ACPI_PLATFORM_PROFILE
 	select FIRMWARE_ATTRIBUTES_CLASS
 	help
 	  Driver for AMD AGESA ALIB Function 0x0C, the Dynamic Power and
diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86/amd/dptc.c
index acfe9cc01bab..1f07e2e6f278 100644
--- a/drivers/platform/x86/amd/dptc.c
+++ b/drivers/platform/x86/amd/dptc.c
@@ -23,6 +23,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/platform_profile.h>
 #include <linux/processor.h>
 #include <linux/sysfs.h>
 #include <linux/unaligned.h>
@@ -56,8 +57,13 @@ struct dptc_param_limits {
 	u32 expanded_max;
 };
 
+struct dptc_profile {
+	u32 vals[DPTC_NUM_PARAMS];	/* 0 = don't set / unstage this param */
+};
+
 struct dptc_device_limits {
 	struct dptc_param_limits params[DPTC_NUM_PARAMS];
+	struct dptc_profile profiles[PLATFORM_PROFILE_LAST];
 };
 
 struct dptc_param_desc {
@@ -85,6 +91,10 @@ static const struct dptc_device_limits limits_maxhh = { .params = {
 	[DPTC_PPT_PL2_SPPT] = {  0,  4, 27,  82, 100 },
 	[DPTC_PPT_PL3_FPPT] = {  0,  4, 40,  85, 100 },
 	[DPTC_CPU_TEMP]     = { 60, 70, 95,  95, 100 },
+}, .profiles = {
+	[PLATFORM_PROFILE_LOW_POWER]   = { .vals = { 15, 15, 25, 0 } },
+	[PLATFORM_PROFILE_BALANCED]    = { .vals = { 25, 27, 40, 0 } },
+	[PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 60, 63, 85, 0 } },
 }};
 
 /* Substring matches against boot_cpu_data.x86_model_id; order matters. */
@@ -134,6 +144,9 @@ struct dptc_priv {
 
 	bool expanded;
 
+	enum platform_profile_option profile;
+	struct device *ppdev;
+
 	enum dptc_save_mode { SAVE_SINGLE, SAVE_BULK } save_mode;
 
 	u32 staged[DPTC_NUM_PARAMS];
@@ -269,6 +282,14 @@ static ssize_t dptc_current_value_show(struct kobject *kobj,
 
 	guard(mutex)(&dptc->lock);
 
+	if (dptc->profile != PLATFORM_PROFILE_CUSTOM) {
+		u32 val = dptc->dev_limits->profiles[dptc->profile].vals[ps->idx];
+
+		if (!val)
+			return sysfs_emit(buf, "\n");
+		return sysfs_emit(buf, "%u\n", val);
+	}
+
 	if (!dptc->has_staged[ps->idx])
 		return sysfs_emit(buf, "\n");
 	return sysfs_emit(buf, "%u\n", dptc->staged[ps->idx]);
@@ -287,6 +308,8 @@ static ssize_t dptc_current_value_store(struct kobject *kobj,
 	if (count == 1 && buf[0] == '\n') {
 		guard(mutex)(&dptc->lock);
 
+		if (dptc->profile != PLATFORM_PROFILE_CUSTOM)
+			return -EPERM;
 		dptc->has_staged[ps->idx] = false;
 		return count;
 	}
@@ -297,6 +320,8 @@ static ssize_t dptc_current_value_store(struct kobject *kobj,
 
 	guard(mutex)(&dptc->lock);
 
+	if (dptc->profile != PLATFORM_PROFILE_CUSTOM)
+		return -EPERM;
 	min = dptc_get_min(dptc, ps->idx);
 	max = dptc_get_max(dptc, ps->idx);
 	if (val < min || (max && val > max))
@@ -426,6 +451,8 @@ static ssize_t dptc_expanded_current_value_store(struct kobject *kobj,
 
 	guard(mutex)(&dptc->lock);
 
+	if (dptc->profile != PLATFORM_PROFILE_CUSTOM)
+		return -EPERM;
 	dptc->expanded = val;
 	/* Clear staged values: limits changed, old values may be out of range */
 	memset(dptc->has_staged, 0, sizeof(dptc->has_staged));
@@ -594,6 +621,78 @@ static void dptc_kset_unregister(void *data)
 	kset_unregister(data);
 }
 
+/* Platform profile */
+
+static void dptc_apply_profile(struct dptc_priv *dptc,
+			       enum platform_profile_option profile)
+{
+	const struct dptc_profile *pp;
+	int i;
+
+	memset(dptc->has_staged, 0, sizeof(dptc->has_staged));
+
+	if (profile == PLATFORM_PROFILE_CUSTOM)
+		return;
+
+	pp = &dptc->dev_limits->profiles[profile];
+	for (i = 0; i < DPTC_NUM_PARAMS; i++) {
+		if (!pp->vals[i])
+			continue;
+		dptc->staged[i] = pp->vals[i];
+		dptc->has_staged[i] = true;
+	}
+}
+
+static int dptc_pp_probe(void *drvdata, unsigned long *choices)
+{
+	struct dptc_priv *dptc = drvdata;
+	int i, j;
+
+	set_bit(PLATFORM_PROFILE_CUSTOM, choices);
+	for (i = 0; i < PLATFORM_PROFILE_LAST; i++) {
+		for (j = 0; j < DPTC_NUM_PARAMS; j++) {
+			if (dptc->dev_limits->profiles[i].vals[j]) {
+				set_bit(i, choices);
+				break;
+			}
+		}
+	}
+	return 0;
+}
+
+static int dptc_pp_get(struct device *dev,
+		       enum platform_profile_option *profile)
+{
+	struct dptc_priv *dptc = dev_get_drvdata(dev);
+
+	guard(mutex)(&dptc->lock);
+
+	*profile = dptc->profile;
+	return 0;
+}
+
+static int dptc_pp_set(struct device *dev,
+		       enum platform_profile_option profile)
+{
+	struct dptc_priv *dptc = dev_get_drvdata(dev);
+	int ret = 0;
+
+	guard(mutex)(&dptc->lock);
+
+	dptc->profile = profile;
+	dptc_apply_profile(dptc, profile);
+	if (profile != PLATFORM_PROFILE_CUSTOM)
+		ret = dptc_alib_save(dptc);
+
+	return ret;
+}
+
+static const struct platform_profile_ops dptc_pp_ops = {
+	.probe       = dptc_pp_probe,
+	.profile_get = dptc_pp_get,
+	.profile_set = dptc_pp_set,
+};
+
 static int dptc_resume(struct device *dev)
 {
 	struct dptc_priv *dptc = dev_get_drvdata(dev);
@@ -601,10 +700,14 @@ static int dptc_resume(struct device *dev)
 
 	guard(mutex)(&dptc->lock);
 
-	if (dptc->save_mode == SAVE_SINGLE)
+	if (dptc->profile != PLATFORM_PROFILE_CUSTOM) {
+		dptc_apply_profile(dptc, dptc->profile);
 		ret = dptc_alib_save(dptc);
-	else
+	} else if (dptc->save_mode == SAVE_SINGLE) {
+		ret = dptc_alib_save(dptc);
+	} else {
 		ret = 0;
+	}
 
 	if (ret)
 		dev_warn(dev, "failed to restore settings on resume: %d\n", ret);
@@ -636,8 +739,7 @@ static int dptc_probe(struct platform_device *pdev)
 		 boot_cpu_data.x86_model_id);
 
 	dptc->fw_attr_dev = device_create(&firmware_attributes_class,
-					  NULL, MKDEV(0, 0), NULL,
-					  DRIVER_NAME);
+					  NULL, MKDEV(0, 0), NULL, DRIVER_NAME);
 	if (IS_ERR(dptc->fw_attr_dev))
 		return PTR_ERR(dptc->fw_attr_dev);
 
@@ -680,6 +782,12 @@ static int dptc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	dptc->profile = PLATFORM_PROFILE_CUSTOM;
+	dptc->ppdev = devm_platform_profile_register(dev, "amd-dptc", dptc,
+						     &dptc_pp_ops);
+	if (IS_ERR(dptc->ppdev))
+		return PTR_ERR(dptc->ppdev);
+
 	return 0;
 }
 
-- 
2.52.0


