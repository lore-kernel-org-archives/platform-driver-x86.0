Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998AD42B313
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jul 2026 14:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348742; cv=none; b=rvGHoU/tQoAjfYV31EjD/EA2P7l2gyxFBXKOZepATpS5y04wVNlXa85gH8JJZp3scMxnV48/gk5SWRWzl4aduwsmvSkCQutHD99Sntz8ZF8PWLp4ASec/8HseoOZnD2SfeOztwlLldpyL+NUqKYvS6VTVhaOG0YbyMm7wdPIA60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348742; c=relaxed/simple;
	bh=W5XMfwMSwoRfoxyd+BvGhH65S6q07rqPKTjQ5dZbpQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GCLVy8C8HH+zrsGysR+FBpEtShBsKkTJ5KFoNfRYJNxxMS7Bg4+63385dH2GlJGrvxhleuON/qKOiGuFplvnd2t9Mfn4hYWc75hcekd9wENJXaoyQc7OTv7vVVV4OUjbMVQcg9OkA4fzzlIeSZCHru8vumfKEN1o3wqTk3DvTYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFITE47F; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFITE47F"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4759b4f0897so1323251f8f.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 07:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783348739; x=1783953539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TsAtMy+jYflG5RxLXIL3sSMXV67j/iz+79CE0LBfVyk=;
        b=RFITE47FBFKRqizFzoQBh9yO24tUWkyQXXGw+22cddW4wpiMJbMi8/5gVOe9mYO332
         p/sJk5PH//qBoCt9D3iNj9uvvvJfTnoUzBPCiJKDr/TPpEIvt2KhOw4e4oT4UYMr10uS
         6j98mZcSNtVjrp+6JBGepLGrIWJXj/w08i+DzBzDEYEGa/dQW94daIC72/woLSPQczLB
         44k6EHJO/JlOR/ZFeQOMkP/2rlko+qodbbKoRqzSO0d1BhkzJgJpee6wxUpj2pTHoVuR
         YcUbvzfzZIsFqMSVMGoZtNeZymYWOnPqV//M1uX10GPPakB2RLNlWTxQhcGqQPEyB3Y+
         FAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348739; x=1783953539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TsAtMy+jYflG5RxLXIL3sSMXV67j/iz+79CE0LBfVyk=;
        b=BwFvlR9RjBVfPgl5uUQVe0rgbXPuXLEDMlda++fSuzkJMD351ynqEcby9TPZeB9gzb
         ivXdbIvQScBkqserwClzFaXYBEJQ5lqqYHM7+LBd1m02923gFFdeHjqwLmEelKcJLi52
         JcsSwH1oCF1OWobtyFYK6QetN1skjcEp8kxaDuhQ1dVHmG/Fgw5x4/0HWO7RFlZhV45l
         0zAC6QajEDMMWCxvw62sBJiAS6mJNS7osLuHy4yof1QFHpDdufKG98jhZxvB+OO23FK/
         vH7lZY1H9UgjfJZyoMeFVQjSk9Z8oVwpmMsw9GztGR2HP9BIfn7DLptZ6RWzCqrxmtR3
         8ztQ==
X-Gm-Message-State: AOJu0Yw+AV9xgMJNHJ5Nkl/0951HarQ3ukpWmymNDZB4voJM8kPvrrmX
	UZVIaAWExemyiDs4Ru9Arxk0+wcZneHIxLPJKLCUY7vK8qlg85/++Fj0uRVkujWxyUU=
X-Gm-Gg: AfdE7cn7BAcKIwifoiFdDf4fzkLbRpKzdzkv2hzm9JYfBs1pDopMYUsg8o6cdmcKh43
	U/wxE7NNlHJixnmfFZ+k8amRWqGd1g3uKbbPhSCgRwyIrbS65dwG0JuTiE4GAocQ3nrBrAvCCox
	LL1bt3kdwXK4H8tc1kDawZDngKGqbM4OuP8UOcY5WZ3r2dVcd3CyFjrLxn/gE9NgdW+cE9IZcmS
	1oK7lm6xJ4IZddWNE2G5pyNDivJv2FEbcaWlTxOsgxCe4VwXHHOQT1OzVkEBzIIPI6RRdurglNh
	0iWz/r6MquavGXp5Nccjgwj4ZHXkzLtlp5874P+xl7mfs8OQSmLCWSCL8O1bAWwuwCEzEHd7s2N
	OF710ZQpEPxcEZR9ge/9Yzv5MXOAGy4qUJ1VsQiykNlCaS/LaoiESozEsxijC8Xb7G9Eji3vt5m
	Fz9dZUkN5cMGo=
X-Received: by 2002:a5d:4946:0:b0:46d:d693:88cb with SMTP id ffacd0b85a97d-47de670da13mr399374f8f.46.1783348738727;
        Mon, 06 Jul 2026 07:38:58 -0700 (PDT)
Received: from user ([104.28.162.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm26504604f8f.37.2026.07.06.07.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:38:58 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>
Subject: [PATCH v6] hp-wmi: add battery threshold support
Date: Mon,  6 Jul 2026 17:38:55 +0300
Message-ID: <20260706143855.35002-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <4792e5f8-8af3-f227-2291-ccd10e1be868@linux.intel.com>
References: <4792e5f8-8af3-f227-2291-ccd10e1be868@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

Introduce battery threshold support via SBCO and GBCO WMI methods, add
battery_get() function to retrieve the current battery mode and to test
compatibility, add battery_set() function to set a battery mode with any
value between 0 and 5, Expose this feature to userspace via sysfs.

Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
---
Note on behaviour:
The mode wont persist past shutdown if not
plugged because the EC clears its registers
to save power, mode 2 is adaptive, meaning
that the EC will set its desired percentage
between 80 and 95% mode 5 is roughly around
78 to 80% and if a mode was set and the current
battery percentage is higher the EC will drain
the battery.
v6:
- Add sysfs interface
- Remove redundant enums
- Add safety checks
- Fix style errors
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
 drivers/platform/x86/hp/hp-wmi.c | 75 +++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8ba286ed8721..bbe279499062 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -302,8 +302,10 @@ enum hp_wmi_event_ids {
 	HPWMI_FN_P_HOTKEY		= 0x1B,
 	HPWMI_OMEN_KEY			= 0x1D,
 	HPWMI_SMART_EXPERIENCE_APP	= 0x21,
+	HPWMI_BATTERY_CONTROL		= 0x2b,
 };
 
+#define HPWMI_AC_REQUIRED 0x35
 /*
  * struct bios_args buffer is dynamically allocated.  New WMI command types
  * were introduced that exceeds 128-byte data size.  Changes to handle
@@ -460,6 +462,7 @@ static struct notifier_block platform_power_source_nb;
 static enum platform_profile_option active_platform_profile;
 static bool platform_profile_support;
 static bool zero_insize_support;
+static bool battery_threshold_support;
 
 static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
@@ -1097,6 +1100,67 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
+static int battery_get(void)
+{
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	int mode;
+
+	if (ACPI_FAILURE(acpi_evaluate_object(NULL, "\\_SB.WMID.GBCO", NULL, &output)))
+		return -EIO;
+
+	union acpi_object *obj __free(kfree) = (union acpi_object *)output.pointer;
+
+	if (!obj || obj->type != ACPI_TYPE_PACKAGE || obj->package.count < 3
+			|| obj->package.elements[2].type != ACPI_TYPE_BUFFER)
+		return -EIO;
+	mode = (int)obj->package.elements[2].buffer.pointer[0];
+	return mode;
+}
+
+static int battery_set(u8 profile)
+{
+	u8 data[4];
+	int status;
+	if (!battery_threshold_support)
+		return -EOPNOTSUPP;
+	if (profile > 5)
+		return -EINVAL;
+	memset(&data, 0, sizeof(data));
+	data[1] = profile;
+	status = hp_wmi_perform_query(HPWMI_BATTERY_CONTROL, HPWMI_WRITE, &data, sizeof(data), 0);
+	if (status < 0)
+		return -EIO;
+	if (status == HPWMI_AC_REQUIRED) {
+		pr_err("You have to be plugged in to set a profile\n");
+		return -EIO;
+	}
+	return 0;
+}
+
+static ssize_t battery_threshold_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	int mode = battery_get();
+	if (mode < 0)
+		return -EINVAL;
+	return sysfs_emit(buf, "%d\n", mode);
+}
+
+static ssize_t battery_threshold_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	int ret;
+	u8 profile;
+	ret = kstrtou8(buf, 10, &profile);
+	if (ret)
+		return ret;
+	ret = battery_set(profile);
+	if (ret < 0)
+		return ret;
+	return count;
+}
+static DEVICE_ATTR_RW(battery_threshold);
+
 static int camera_shutter_input_setup(void)
 {
 	int err;
@@ -2303,7 +2367,14 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 
 	if (err < 0)
 		return err;
-
+	err = battery_get();
+	if (err >= 0) {
+		err = device_create_file(&device->dev, &dev_attr_battery_threshold);
+		if (err)
+			device_remove_file(&device->dev, &dev_attr_battery_threshold);
+		else
+			battery_threshold_support = true;
+	}
 	thermal_profile_setup(device);
 
 	return 0;
@@ -2335,6 +2406,8 @@ static void __exit hp_wmi_bios_remove(struct platform_device *device)
 	priv = platform_get_drvdata(device);
 	if (priv)
 		cancel_delayed_work_sync(&priv->keep_alive_dwork);
+	if (battery_threshold_support)
+		device_remove_file(&device->dev, &dev_attr_battery_threshold);
 }
 
 static int hp_wmi_resume_handler(struct device *device)
-- 
2.55.0

