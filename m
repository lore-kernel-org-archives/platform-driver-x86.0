Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4F72C0274
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jul 2026 16:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783096338; cv=none; b=QhkgKO/NUW5rKuCT5m/G8u1yl+uAN0jaRdH532yBhqxZOfl1YjgaackH/7nbNKcDV0vsss48Uvv+8bLiS7BsC1KKFEzd+r2l2hxaJaRTdtlVYCe+FmJuj4erlZY8ievW/mUkPs37wbW+eXVJknjh4CqPMKS1OcIfnPiDSRWvRzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783096338; c=relaxed/simple;
	bh=S0pNT5a0tQbvwR1AF2smTu1Vd7EFT6ud4LoLicZ6L8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XvCs2tpKOtFmH6BI9ErZAGsTkaNtrzolYtsqmqGkKmmCOvvQNfQmfecgUpfGcNJ6vOIiHDea1AgjBZi4fjjyQR+iYLsRYGXyMdUiu2bsx/GRKEuQ//m1+LdhEFxfgnLOkscxhxsb0p150N2RGObGDhLl/r+VQLuw8T59f2/xN1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HN5hHt6R; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HN5hHt6R"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47122683cf3so534355f8f.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jul 2026 09:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783096335; x=1783701135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n68O+bCc2Zaci4HBQjAWr+zKDYc2kd75mI1LZf0/BUk=;
        b=HN5hHt6RomkEN11LuGX83hr9jqWhSxFy1Fow3tfsF+qP+UVAbvSxltLosWxpSrE1Sd
         EEXrsU5cVtkOB3+uH0WjYfujohe2sboM+HHOPJ5sZ2dyoQkKi4WB4qnkbmr6tqwPGiVW
         se8eDS3SYj7ZPA0LmJhIrifDqn6WtNmKU7OecotCsOs/Qpfh4g/LLnM3s2d6PQtoNLLp
         Kclk6IiF1kLYWnloRexu5vxBWVRQjO6sNpwnf3I0yIpF1VztnqhFH+i5gnGjWiKsYLJa
         l7jmRuZeAzPbgmgmGCC2Y/d4ZA2UskAH+DZKJwgwA3NDgEDiKOmoCvXJ987NdAICXoGm
         bAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783096335; x=1783701135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n68O+bCc2Zaci4HBQjAWr+zKDYc2kd75mI1LZf0/BUk=;
        b=kYQM+CcuZRPDPgg34oQgi79t+hW3pe/7H7Fcq5Wfw7nK6jUpVZSmOA3r3Tt0EQOBGS
         OHyh33A+pnXoufiMyTRu0ZVdqk6M+NfPQoC88F0fQmItDwxryZ1BY+jJQY8M3GA4ZYi+
         /ZVvO3eEDznsp+jQFYtB+Ld7+XQwVByZKuaqqhJP+u9e7zSD8jravNE1sWSeatImd/GH
         VCbrcvlKipi6iqjAEGPxf/k0q2aVIF1AS91h0ye6V/aiIRqUlvb0/5B7Tt3PzuF2CXyi
         sdu+9d5I33xdRQhjpBbVVEoAYrRtTGpf/3etgOSnFjTtM+35/R5CdrLYT9R8V7myPMfX
         5F5w==
X-Gm-Message-State: AOJu0YylIjivp6MRhXNiFWIHOahNdipputr1QjzYE+fj3Qt5qL7f42jn
	2iJNkIrb++4i7xHhHSxQD1viEa5zdL4PZ2C9RCVVppCCukTW8ayn1AXz
X-Gm-Gg: AfdE7clqC97b02b073d2H6xJGCOECzZsBGSY0fTelmcm8Ma2RhgpT9Q5e3/FACVg8RM
	jTUr7zpRvyomgpIQqsvQ0GDtBKFnEMVSMqhHbAZcwMzcdsGH5os1UrKZe/pSSARo5t09yMNkbbx
	pRAZwncGlHU/wA1qGfW2ZBTkOChJuJYtfYfcqDrwz6mnw2xIsWJ9Pd+r6NMwmhmHiVi1ujIZ33y
	XkqTe3lnPxP6CL08E2DyVcgBvJARzcZ1WvRs0gyNXkcdHfUCQWaIDlx5D3XkRGQ1Qg2iK5sklfD
	ZmBMNCGhdEOLa3tVt1nGtMLpMV1sKygbH44JLT+IAcQtRaIXZk3Ik+JG0kOkkPtvBg9F8wn/KEq
	XlSsCY/x3B9OVNzRYHWEybz7rH4W0HpbzwXBiqQUbef7g1OpLN8bV5CBDgIzfIh8v5hKXY7lP6L
	c7t+XZ4CiA6hg=
X-Received: by 2002:a05:6000:41cc:b0:460:3b5d:43b6 with SMTP id ffacd0b85a97d-47aae2c51a8mr85691f8f.31.1783096334551;
        Fri, 03 Jul 2026 09:32:14 -0700 (PDT)
Received: from user ([104.28.162.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm520738f8f.14.2026.07.03.09.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 09:32:14 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>
Subject: [PATCH v5] hp-wmi: add battery threshold support
Date: Fri,  3 Jul 2026 19:32:07 +0300
Message-ID: <20260703163207.37515-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6b94a592-9cdc-b9f7-1998-ade4493661a4@linux.intel.com>
References: <6b94a592-9cdc-b9f7-1998-ade4493661a4@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

Introduce battery threshold support via SBCO and
GBCO WMI methods, add battery_get function to retrieve
the current battery mode and to test compatibility, add
battery_set function to set a battery mode with any
value between 0 and 5, anything larger creates a crash
or creates a softbrick of the laptop that requires AC
power to boot.

Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
---
v5:
- Use hp_wmi_perform_query for battery_set
- Remove mode 6 as it requires AC power to boot
- Fix styling errors and remove redundant comments
v4:
- Remove redundant definitions
- Rebase the code
v3:
- Fix coding style errors and warning
- Refine the changelogs for clarity

v2:
- Simplify detection logic via battery_get
- Add Battery Profiles enum table
- Add functions to set the battery mode
---
 drivers/platform/x86/hp/hp-wmi.c | 50 +++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8ba286ed8721..bf25acf45b02 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -302,8 +302,16 @@ enum hp_wmi_event_ids {
 	HPWMI_FN_P_HOTKEY		= 0x1B,
 	HPWMI_OMEN_KEY			= 0x1D,
 	HPWMI_SMART_EXPERIENCE_APP	= 0x21,
+	HPWMI_BATTERY_CONTROL		= 0x2b,
 };
 
+enum hp_battery_modes {
+	HP_BATTERY_MODE_NORMAL    = 0x00,
+	HP_BATTERY_MODE_ADAPTIVE  = 0x02,
+	HP_BATTERY_THRESHOLD_80   = 0x05,
+};
+
+#define HPWMI_AC_REQUIRED 0x35
 /*
  * struct bios_args buffer is dynamically allocated.  New WMI command types
  * were introduced that exceeds 128-byte data size.  Changes to handle
@@ -460,6 +468,7 @@ static struct notifier_block platform_power_source_nb;
 static enum platform_profile_option active_platform_profile;
 static bool platform_profile_support;
 static bool zero_insize_support;
+static bool battery_threshold_support;
 
 static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
@@ -1097,6 +1106,43 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
+static int battery_get(void)
+{
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	int mode;
+
+	if (ACPI_FAILURE(acpi_evaluate_object(NULL, "\\_SB.WMID.GBCO", NULL, &output)))
+		return -EIO;
+	union acpi_object *obj __free(kfree) = (union acpi_object *)output.pointer;
+
+	if (!obj || obj->type != ACPI_TYPE_PACKAGE || obj->package.count < 3)
+		return -EIO;
+	mode = (int)obj->package.elements[2].buffer.pointer[0];
+	return mode;
+}
+
+static int battery_set(u8 profile)
+{
+	u8 data[4];
+	int status;
+
+	if (!battery_threshold_support) {
+		pr_err("Battery threshold is not supported");
+		return -EOPNOTSUPP;
+	}
+	memset(&data, 0, sizeof(data));
+	data[1] = profile;
+	status = hp_wmi_perform_query(HPWMI_BATTERY_CONTROL, HPWMI_WRITE, &data, sizeof(data), 0);
+
+	if (status < 0)
+		return -EIO;
+	if (status == HPWMI_AC_REQUIRED) {
+		pr_err("You have to be plugged in to set a profile");
+		return -EIO;
+	}
+	return status;
+}
+
 static int camera_shutter_input_setup(void)
 {
 	int err;
@@ -2303,7 +2349,9 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 
 	if (err < 0)
 		return err;
-
+	err = battery_get();
+	if (err >= 0)
+		battery_threshold_support = true;
 	thermal_profile_setup(device);
 
 	return 0;
-- 
2.55.0

