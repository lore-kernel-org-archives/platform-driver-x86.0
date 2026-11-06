Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965391;
	b=HdtYFNzwxLNpaJXqjeFN2eqnnMLIORL/jTEG3flrIMY+B4nfC30BLNM5fLdstKA92d+0
	 LWOuY24TrWA+xQgWsDH4rXEq0PSfwWrHxpHRnwbuB99/AzbBlsAb1T4BqheOqADPBeQ6Q
	 AlyVcMpNkAeOjmRJNyiaKz7AcYB1zgB4ZKJDX4Pv7SJJ67RY/xdxilEtkX9NhjpMRrzAs
	 uDuaCSJ6QGVFLGnXKtrdDaBfUQIc8FQnuP1NVjOax8/U7FdfhZpKfflWYqbzMnqo6NJhA
	 jb8ds+OAFlpU4eQ7/6YDgk/Y2yNkB+xJR2bb6TwCI/sjFBNzdvGXTQ/Qz98VFQhmIZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LnnIdamjDHO6+FMBze92j/z9JQUuUcWbUWtszHcXFKA=;
	b=H+4RMDptWo//UOTLkwxEFt/6V8+VniCOEmcNjmsDf1QzE1w3gIhhIQREnupgrWhWFG31
	 OIxk/KvvfD8Y5pIgWA9JXRb1zD47NK3N9o1+524cSlXSpFCNpgyfMLHFh2NDOZaTPHzM5
	 bzuZGra/RE/fDdZ1IyGFV9vG8fu1hR9uCtiIpw8LusY3Udm4w5ONEvHVmE93jS0oEyCpF
	 28nz4MA6KOKS6ck7tv7BPhHB51QtrMsbFqVu9FC7sTrAS9OQUC8m00KYF/IVq3Bpg36lW
	 G9h7YUCfDM9KaPndPUDb4IaDZCyRiwQ3sv/e9oshxw9eiFaP5hazYLUs4powovZFQoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=UIjr4Nne;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E975D606D804
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 11:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E975D606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=UIjr4Nne
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d1b35dc42so99889966b.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Nov 2026 03:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793965389; x=1794570189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnnIdamjDHO6+FMBze92j/z9JQUuUcWbUWtszHcXFKA=;
        b=UIjr4NneYi82jFQr8OTb4FhRUeIk7tGTtSIIVcpxIVFiMqIfVSZNa9jsbCYsiMSG04
         Nj7sWwcz96lWyrjafF44fbZIwrh6mp6VnBYpVayRbVshMXvBdzO67P7za92g/CWdPLY1
         9uPd6i05V72GgqykfaBQUGIuxxfhn8o1bn2pE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793965389; x=1794570189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LnnIdamjDHO6+FMBze92j/z9JQUuUcWbUWtszHcXFKA=;
        b=2jzhd1aW/Sj2SK32izxhryiUVgWHhw5C8zWIP9y/4VACuvpRxgzBXWOae01k0SPmbS
         Zt19RYm4MrK6eIDYtxI2Ub8NeAwuMhYZWSr/eU0r0TR1QjRxjY9DMPbrqNEGoY0DJJ1J
         FRB5eAtgps/hTUJG4AUo//96oZ9qALCZUnX7YK084GWAwQnbyA+ihMVAs+frJCBBvQ+6
         n/2DaDaVB2tMJHoKabDKRb0ezMvxLd046YPNx34isORsOQhMcuMLw1VmrN3QgkOPFtoe
         XvOZ/vg7vWVxh7PSo8kJz+szcVJ/G2Uvky4neTqsmpBtIl44TmAYJ4bTCvRwgYRkrSVL
         0X6A==
X-Gm-Message-State: APuU4Z8OV586KEQpdhDvnuqLuq2IM5l9JXrDjnD48i+1CU9UstXGyjkz
	nre8fxFa83OxnjLbEfWV9pn37u/QYxz+3N+a1lmhwjA5N6H9JxXaI6yrxmmxIoppRmU=
X-Gm-Gg: AYBFou3d5ykm3GriInkH2GYBb5540JEAGT/OAgnO4aOqmp8c7pJdC/aKoZC4xOD7naM
	lvIDjCwgtCfl8DTM6CpbO1Yxj9NJMVhgbWbCKU60w6TjYIXFnPqqqoXAhg+u1Nc8a2Hy1OhcYPN
	f9jdtdL0k2sUnVMLaIYTkdT5OskdCTrtEfeyBEi4hg4qX209hQrx5MiYnHRnGLcvytPhhfPrwWo
	mbkaIe8aG5BSj3OuFrPDrAdKDtr0PZfRnhfE9YDuNpdn1T1yU6XMZd5Tpk+fVi6WEkFNzs0aq5Z
	nh+Nr2wYi5QSK6lFxe3BNB6tysojSo5Z5JOSw5vdhZ3VSIjgXZujk10ocf7Sis6yxBdrInJ7z8a
	/hUGSgXR6MVHLi6bEhyPMhuYtnmFO4fFslj8aehivDPb//OCsn8F5wBUFpLFWK8KuZGxyvhm2SZ
	bEvsK9d6mmS60vqrE2CuDVTg6cg2GggzYX2B06Ftz52oopnk2kJ5oje+SAPvVjmHIOdR66IKUwQ
	Nao8zmuz74XNXlrp7rF0tPbdffz4iwomxGYdEkVbQQa+QIlcAXLs6DSbSRD2Lj+YFBKvERZLUZl
	xHdOqrCAXPxTG8vi/DYtjmsLkMdsELC2vV9oNfBjC827RsQ=
X-Received: by 2002:a17:907:3906:b0:c2a:4847:231b with SMTP id a640c23a62f3a-c4d3557096amr169438366b.24.1793965388650;
        Fri, 06 Nov 2026 03:43:08 -0800 (PST)
Received: from xia ([83.142.187.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356e7035sm71377866b.80.2026.11.06.03.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:43:08 -0800 (PST)
From: Chris Taraszka <chris@miget.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	KentoNion <kento@kekto.ru>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	Arsenova <7z0423arsenova@proton.me>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v4 2/4] platform/x86: bitland-mifs-wmi: Support a separate profile value on battery
Date: Fri,  6 Nov 2026 12:42:58 +0100
Message-ID: <20261106114300.936782-3-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106114300.936782-1-chris@miget.com>
References: <20261106114300.936782-1-chris@miget.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some firmware uses a different SystemPerMode value for a profile
depending on the power source. The Xiaomi Book Pro 14 uses 0x04 for
performance on AC and 0x03 on battery, both with a 50-58 W sustained
power limit. Its DTT tables have no battery entry for 0x04, and BIOS
0707 refuses 0x04 on battery.

Let a profile entry be marked for battery use. It is set in place of
the AC entry for the same profile while the system runs on battery,
without the AC check. The firmware does not change the mode when the
power source changes, so re-apply the current profile from an ACPI AC
notifier, taking the AC state from the event. A mutex keeps this from
racing with profile changes from userspace.

The notifier is only registered when the quirks have a battery entry,
so models without one are not affected.

Suggested-by: KentoNion <kento@kekto.ru>
Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    v4: no longer edits the TM2424 entry. Patch 3 now adds the quirk with
    0x03 as the battery entry (Mingyou).
    
    Tested together with patch 3, with ftrace kprobes on the AC notifier
    and on the WMI calls:
    
      AC, performance (0x04), unplug: the notifier sets 0x03 within 1 ms
      battery, performance: set 0x03, PL1 58 W
      battery, performance (0x03), plug in: the notifier sets 0x04
      s2idle from performance on AC: resume restores 0x04
    
    Battery class events are ignored. Here Omarchy also switches to its
    saved per-source profile about a second later, which goes through
    laptop_profile_set() after the notifier.

 drivers/platform/x86/bitland-mifs-wmi.c | 120 +++++++++++++++++++++---
 1 file changed, 107 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index d092dc696293..97dafd510ba8 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -91,6 +91,7 @@ struct bitland_profile_entry {
 	enum platform_profile_option profile;
 	u8 wmi_val;
 	bool no_set;
+	bool battery;	/* Set in place of the AC entry while on battery */
 };
 
 struct bitland_mifs_quirks {
@@ -206,8 +207,10 @@ struct bitland_fan_notify_data {
 struct bitland_mifs_wmi_data {
 	struct wmi_device *wdev;
 	struct mutex lock;		/* Protects WMI calls */
+	struct mutex profile_lock;	/* Serializes profile changes */
 	struct led_classdev kbd_led;
 	struct notifier_block notifier;
+	struct notifier_block ac_notifier;
 	struct input_dev *input_dev;
 	struct device *hwmon_dev;
 	struct device *pp_dev;
@@ -329,34 +332,108 @@ static int bitland_pp_check_capability(struct bitland_mifs_wmi_data *data)
 	return 0;
 }
 
-static int laptop_profile_set(struct device *dev,
-			      enum platform_profile_option profile)
+static const struct bitland_profile_entry *
+bitland_profile_set_entry(const struct bitland_mifs_quirks *quirks,
+			  enum platform_profile_option profile, bool on_battery)
+{
+	const struct bitland_profile_entry *entry = NULL;
+	size_t i;
+
+	for (i = 0; i < quirks->num_profile_entries; i++) {
+		const struct bitland_profile_entry *e = &quirks->profile_entries[i];
+
+		if (e->profile != profile || e->no_set)
+			continue;
+
+		if (e->battery && on_battery)
+			return e;
+
+		if (!e->battery && !entry)
+			entry = e;
+	}
+
+	return entry;
+}
+
+static int bitland_profile_set(struct bitland_mifs_wmi_data *data,
+			       enum platform_profile_option profile,
+			       bool on_battery)
 {
-	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
-	const struct bitland_mifs_quirks *quirks = data->quirks;
 	struct bitland_mifs_input input = {
 		.operation = cpu_to_le16(WMI_METHOD_SET),
 		.function = cpu_to_le16(WMI_FN_SYSTEM_PER_MODE),
 	};
-	size_t i;
+	const struct bitland_profile_entry *entry;
 	int ret;
 
-	if (profile == PLATFORM_PROFILE_PERFORMANCE ||
-	    profile == PLATFORM_PROFILE_BALANCED_PERFORMANCE) {
+	entry = bitland_profile_set_entry(data->quirks, profile, on_battery);
+	if (!entry)
+		return -EOPNOTSUPP;
+
+	if (!entry->battery &&
+	    (profile == PLATFORM_PROFILE_PERFORMANCE ||
+	     profile == PLATFORM_PROFILE_BALANCED_PERFORMANCE)) {
 		ret = bitland_pp_check_capability(data);
 		if (ret)
 			return ret;
 	}
 
+	input.payload[0] = entry->wmi_val;
+
+	return bitland_mifs_wmi_call(data, &input, NULL);
+}
+
+static int laptop_profile_set(struct device *dev,
+			      enum platform_profile_option profile)
+{
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+
+	guard(mutex)(&data->profile_lock);
+
+	return bitland_profile_set(data, profile,
+				   !power_supply_is_system_supplied());
+}
+
+static int bitland_ac_notify(struct notifier_block *nb, unsigned long action,
+			     void *data)
+{
+	struct bitland_mifs_wmi_data *drv_data =
+		container_of(nb, struct bitland_mifs_wmi_data, ac_notifier);
+	struct acpi_bus_event *event = data;
+	enum platform_profile_option profile;
+	int ret;
+
+	if (strcmp(event->device_class, ACPI_AC_CLASS))
+		return NOTIFY_DONE;
+
+	guard(mutex)(&drv_data->profile_lock);
+
+	/* Switch to the AC or battery value of the current profile */
+	ret = laptop_profile_get(drv_data->pp_dev, &profile);
+	if (!ret)
+		ret = bitland_profile_set(drv_data, profile, !event->data);
+	if (ret)
+		dev_warn(&drv_data->wdev->dev,
+			 "Failed to update platform profile on AC change: %d\n", ret);
+
+	return NOTIFY_DONE;
+}
+
+static void bitland_ac_notifier_unregister(void *data)
+{
+	unregister_acpi_notifier(data);
+}
+
+static bool bitland_has_battery_entries(const struct bitland_mifs_quirks *quirks)
+{
+	size_t i;
+
 	for (i = 0; i < quirks->num_profile_entries; i++) {
-		if (quirks->profile_entries[i].profile == profile &&
-		    !quirks->profile_entries[i].no_set) {
-			input.payload[0] = quirks->profile_entries[i].wmi_val;
-			return bitland_mifs_wmi_call(data, &input, NULL);
-		}
+		if (quirks->profile_entries[i].battery)
+			return true;
 	}
 
-	return -EOPNOTSUPP;
+	return false;
 }
 
 static int platform_profile_probe(void *drvdata, unsigned long *choices)
@@ -805,6 +882,10 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 	if (ret)
 		return ret;
 
+	ret = devm_mutex_init(&wdev->dev, &drv_data->profile_lock);
+	if (ret)
+		return ret;
+
 	dev_set_drvdata(&wdev->dev, drv_data);
 
 	drv_data->quirks = &default_quirks;
@@ -837,6 +918,19 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 	if (IS_ERR(drv_data->pp_dev))
 		return PTR_ERR(drv_data->pp_dev);
 
+	if (bitland_has_battery_entries(drv_data->quirks)) {
+		drv_data->ac_notifier.notifier_call = bitland_ac_notify;
+		ret = register_acpi_notifier(&drv_data->ac_notifier);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(&wdev->dev,
+					       bitland_ac_notifier_unregister,
+					       &drv_data->ac_notifier);
+		if (ret)
+			return ret;
+	}
+
 	/* Register hwmon */
 	drv_data->hwmon_dev = devm_hwmon_device_register_with_info(&wdev->dev,
 								   "bitland_mifs",
-- 
2.56.0

