Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AB336BCC5;
	Mon,  9 Mar 2026 20:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773089560; cv=none; b=QzReNA4963FCidqhTAVkLSu0oTHHMbuD0nWPxY1sYGHIoz5P9r4Y1glvJFvfCYlKsVo20VK8Ar72brVl5+M/9PWqgwGn4XZ4Jfq68eBLru0oIqsWS8KzOQgazwA9p3EJSvqQxTol+QFr66kc5+T2PE/VXJZOGeuo0o59KMAzjEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773089560; c=relaxed/simple;
	bh=x5HTQ7UO5QYRYigmkxOGJJE8LcxExe3Dl5SYbxuhSX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dVdf8pnieZ25gJJj35Xujr4ILpMgcr54yF3DFr3vYW2NbBglmpy8gFSAsFVL/s4Ls3Z9c7EnGnXFzlRK+5FeJE04uu+vGoUewP7nJQz3jSJrAHYfgQ1qaDtvw65LIR0PP2Y6tWKjraZm4UJ7LSjlirfT7eJG4t+JVsso+KzeFBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=FHqE9jOs; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="FHqE9jOs"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id EF86BBC067;
	Mon,  9 Mar 2026 22:52:36 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 30F60BC061;
	Mon,  9 Mar 2026 22:52:36 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 3D92D201CC0;
	Mon,  9 Mar 2026 22:52:35 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1773089555;
	bh=bBO/KAUufqMsifmJKJbxnvoskd7fXecqkhvYIRgP1Rc=; h=From:To:Subject;
	b=FHqE9jOsc7xYHZOqmqSps3/T6fiAeuR+AmbM4O+NSLCnOAZHjNVhssWkS/zeUn3xk
	 Ykr5M+ScGrYhvggPzqRKAwqFWh1HbSwqUD9hyeoVHJu1XNsEMz4+QDsA211QDvq4NG
	 uuGKguJwrOX11yIA59Ei+9cFZchrtLliNXoxNN1jbakchRTgZEwlj0PVwa3pzpQcdF
	 V+ERvWJP4gVfBrin4sax0n6IbskPJflWmGjpofT0lZWC7CG6QjEaYoO/D4P1P2oUBr
	 /xzw3J7erTXZnTcdcAF721g/ql/1g+1fQST2KAKC6e1bFxXi1GVg2jQ5An+f5V4hVg
	 Vn/3NGlRgi+aA==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Mario.Limonciello@amd.com
Cc: W_Armin@gmx.de,
	sashal@kernel.org,
	Shyam-Sundar.S-k@amd.com,
	derekjohn.clark@gmail.com,
	denis.benato@linux.dev,
	i@rong.moe,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [RFC v4 3/4] platform/x86/amd: dptc: Add platform profile support
Date: Mon,  9 Mar 2026 21:51:24 +0100
Message-ID: <20260309205125.293148-4-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260309205125.293148-1-lkml@antheas.dev>
References: <20260309205125.293148-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177308955584.1090913.16578991063375942967@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Register a platform_profile handler so the driver exposes standard
power profiles (low-power, balanced, performance) alongside the manual
tunable interface.

When a non-custom profile is active, parameter writes are blocked
(-EBUSY) and current_value reflects the profile's preset values.
Selecting the "custom" profile returns control to the user for manual
staging and committing. On resume, the active profile is automatically
re-applied.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/amd/Kconfig |   1 +
 drivers/platform/x86/amd/dptc.c  | 109 ++++++++++++++++++++++++++++++-
 2 files changed, 108 insertions(+), 2 deletions(-)

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
index b884cdfa3f82..f4db95affb1b 100644
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
@@ -88,6 +94,11 @@ static const struct dptc_device_limits limits_maxhh = {
 		[DPTC_PPT_PL3_FPPT] = {  1,  4, 40,  85, 100 },
 		[DPTC_CPU_TEMP]     = { 60, 70, 95,  95, 100 },
 	},
+	.profiles = {
+		[PLATFORM_PROFILE_LOW_POWER]   = { .vals = { 15, 15, 25, 0 } },
+		[PLATFORM_PROFILE_BALANCED]    = { .vals = { 25, 27, 40, 0 } },
+		[PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 60, 63, 85, 0 } },
+	},
 };
 
 /* Substring matches against boot_cpu_data.x86_model_id; order matters. */
@@ -139,11 +150,14 @@ struct dptc_priv {
 
 	bool expanded;
 
+	enum platform_profile_option profile;
+	struct device *ppdev;
+
 	enum dptc_save_mode save_mode;
 
 	u32 staged[DPTC_NUM_PARAMS];
 
-	/* Protects staged, expanded, and save_mode */
+	/* Protects staged, expanded, save_mode, and profile */
 	struct mutex lock;
 
 	struct dptc_attr_sysfs params[DPTC_NUM_PARAMS];
@@ -271,6 +285,14 @@ static ssize_t dptc_current_value_show(struct kobject *kobj,
 
 	guard(mutex)(&dptc->lock);
 
+	if (dptc->profile != PLATFORM_PROFILE_CUSTOM) {
+		u32 val = dptc->dev_limits->profiles[dptc->profile].vals[ps->idx];
+
+		if (!val)
+			return sysfs_emit(buf, "\n");
+		return sysfs_emit(buf, "%u\n", val);
+	}
+
 	if (!dptc->staged[ps->idx])
 		return sysfs_emit(buf, "\n");
 	return sysfs_emit(buf, "%u\n", dptc->staged[ps->idx]);
@@ -288,6 +310,9 @@ static ssize_t dptc_current_value_store(struct kobject *kobj,
 
 	guard(mutex)(&dptc->lock);
 
+	if (dptc->profile != PLATFORM_PROFILE_CUSTOM)
+		return -EBUSY;
+
 	if (count == 1 && buf[0] == '\n') {
 		dptc->staged[ps->idx] = 0;
 		return count;
@@ -425,6 +450,9 @@ static ssize_t dptc_expanded_current_value_store(struct kobject *kobj,
 
 	guard(mutex)(&dptc->lock);
 
+	if (dptc->profile != PLATFORM_PROFILE_CUSTOM)
+		return -EBUSY;
+
 	dptc->expanded = val;
 	/* Clear staged values: limits changed, old values may be out of range */
 	memset(dptc->staged, 0, sizeof(dptc->staged));
@@ -593,6 +621,75 @@ static void dptc_kset_unregister(void *data)
 	kset_unregister(data);
 }
 
+/* Platform profile */
+
+static int dptc_apply_profile(struct dptc_priv *dptc,
+			      enum platform_profile_option profile)
+{
+	const struct dptc_profile *pp;
+	int i;
+
+	memset(dptc->staged, 0, sizeof(dptc->staged));
+
+	if (profile == PLATFORM_PROFILE_CUSTOM)
+		return 0;
+
+	pp = &dptc->dev_limits->profiles[profile];
+	for (i = 0; i < DPTC_NUM_PARAMS; i++) {
+		if (!pp->vals[i])
+			continue;
+		dptc->staged[i] = pp->vals[i];
+	}
+
+	return dptc_alib_save(dptc);
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
+
+	guard(mutex)(&dptc->lock);
+
+	dptc->profile = profile;
+
+	return dptc_apply_profile(dptc, profile);
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
@@ -601,7 +698,9 @@ static int dptc_resume(struct device *dev)
 	guard(mutex)(&dptc->lock);
 
 	/* In bulk mode, do not use pm ops for userspace flexibility. */
-	if (dptc->save_mode == SAVE_SINGLE)
+	if (dptc->profile != PLATFORM_PROFILE_CUSTOM)
+		ret = dptc_apply_profile(dptc, dptc->profile);
+	else if (dptc->save_mode == SAVE_SINGLE)
 		ret = dptc_alib_save(dptc);
 	else
 		ret = 0;
@@ -679,6 +778,12 @@ static int dptc_probe(struct platform_device *pdev)
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


