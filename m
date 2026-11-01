Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793549914;
	b=Gk+Z4cXYtOS1c3EjACL/C77iNGXPvc9s21rg2HStfVbqpxtyaedpgmgGe8ZARzsQuK+2
	 vbMhRZQl1Rki5j3+lTsdvi+4RJ45xceJ5r2cXGWeFGn0ipDS/I9daKqckT0H3XMRz5PWd
	 7yCr9rIWsINvg+EkzYDJQQr3zAa9rDBjZN5uE7/thdqPASvTtz9/Gc4QAiXWDX/SLIauZ
	 y43YxQLAwSFabz3nlyfvQDpahq6NBSUBgARiUeBV1KMraVCLlmfddfKO0a4P7qf5UFuot
	 MxpWZI4nN9kfLaDS70jNzj0x3ISIH8Nlx6mG2CzQke2iNw1R1sVJPJiV9EwHzkDBwZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793549914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dGpg9pFMDIojSeb4nvfIKMrj6NnEFPCfisae6aP11Oc=;
	b=Y1gXubvOfLA8SGDkIfXAivVJssTXRLDiBHDt9iFx1Jn56bys/AUdJWDJhgePTDWA3kyu
	 RBjikP++eGy6URneIDYHK3x4u+XgnHtmc9diQZGOXF4/FjaJXMFjabPccDZcHFZwQ7Xyu
	 CGEj6T6KP1r8MsqbpG/1zHPcskrZAdDMbL35zT4c6SK4g+d3JAOzMZYkGWerA82wmNqG2
	 q4+7tjODR+lF8LO7o2oOMdcsSFJsmdWiKaavIePyZqp661wse9cOPiHIdjsujzSTGCly9
	 +4rC513/fvDMkn2NDZvbSrfj1U1KQgopMXKCSKPMHXqyPceOdKfkjbfrYEDjGKT8Abg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b="DAWy7//M";
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA22606A32E
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 16:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EA22606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=DAWy7//M
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso3005450a12.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 08:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793549913; x=1794154713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGpg9pFMDIojSeb4nvfIKMrj6NnEFPCfisae6aP11Oc=;
        b=DAWy7//M5QO1VMwyg3FVoMHZ/S0ROJa82PJL3NO04LTgTlIQwzv/tubxULBqn3HuGA
         SaVCvo4Ncfy9zY/NoeQl9iQJWoYN0uYuhLkfJTh72ZYbz7hSYAaA6pAmObnu9RUNJOhq
         lJZqwNlyJe10eljBhHQEb+HHY0vBCuTjmfnY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793549913; x=1794154713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dGpg9pFMDIojSeb4nvfIKMrj6NnEFPCfisae6aP11Oc=;
        b=jaA6c6XLgSRRAMCOT+R0vzFO7BSWozi9cTFF7h4it4+ioczRgJNXWV+3DCoYDjFni/
         NuDPEofRo09kt4/W2amDvEEJ0284vuwd+rE2nObIIMnVdlwFYsajf2ESg6oPY9gFTNT9
         meMICZP2o/0qNKuhv8HSkTItKQMDNLjGsuiSzFAmDelDmeJ0w7W97YwbGNT7NnEXbfYb
         4KfwQPuN+qtN0Jbdh0KQRD+2SgtacOk3G7I2QrRJOEhkHjLvFzGFRntcmPKscNHO4vJ5
         ps+cLza4xf2XmVO/nJp253lDwkXgzy5etCkJFqEqENaMCJKq8wvBZ+1fU5KQAo8w4rHY
         1Adw==
X-Gm-Message-State: APuU4Z9gJaMMObBbMyEwxHmTfuiG1GduKvqJa8IcRSSQJkEICWVeol8T
	a3dFQoz1KoWRzf9rZQ7T+FYf/U24fwQViPDbt+SG7cHZKwNCFz6R+WjZowmOLfIOKLk=
X-Gm-Gg: AYBFou0/8FKP7s8yQoqMTJQPYpBslT2SJsR8rfMpbw7S9bQMm+29F90i7kbKhEmQknh
	OPR8WepRdfErnvwbkjZUo2jQi3WCw0W7gzgYEOGESiN32HAZIpHgOUji92+APn1T8TYdax3g1Fj
	Msk5xyvr38eB8wdHjeq6yQA0Dmuu4wpwUoeNJ8FLIOujDbIjxKc68L4NL+XfrS3AhCB9tsAUADJ
	JBOpaIg98Dcy2T4lQsGpzC4paEZSaA6jMXmWq7iOcphtURx2oktvW0F+3VHjn87vFkrMqafq0Ch
	Q4prSg0v4on5DxFC2Y95WbV0E+WtP4juEf/iLz/43ec+JMuXacpGjDb0pcaerwqjX0nLv38ZqHt
	51oXAZuf1fm3O7Nwmt8/6jrQ/6a0jrF10SNK5DXG3FE0ZKnVPqVoSBFGeOeLwnn9eX1coo/fhuj
	6y7pAkYpVjnQhPJOK1YDiKBwM42GwbwZQ/9RnJgd1Yk/mTDAKigbDVzVrp6lsrIFyGz0qfic/B7
	LiT94VhR6OUWWr5f5lIcmC0le3yG2xcCYDS/jJedkX3zXblp1kBCW18jO+ejoKv+JNzCmlz6Lm5
	baaVzzuJ51IpzXa4mx/AROW5pN/pYrGqicMLepmcSfXtRCgbHjEQdyIzHg1AU4jQ1/A7QmwJIKz
	CH0ASTWsrlD/BXHzVk732HmqPoqqC
X-Received: by 2002:a05:6402:46cf:b0:6b3:f81f:927d with SMTP id 4fb4d7f45d1cf-6b4d337cba8mr4907898a12.6.1793549912703;
        Sun, 01 Nov 2026 08:18:32 -0800 (PST)
Received: from xia.tail836dc0.ts.net (user-46-112-84-13.play-internet.pl. [46.112.84.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcac9sm2200155a12.18.2026.11.01.08.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:18:31 -0800 (PST)
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
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v3 3/4] platform/x86: bitland-mifs-wmi: Support a separate profile value on battery
Date: Sun,  1 Nov 2026 17:18:13 +0100
Message-ID: <20261101161814.1325847-4-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101161814.1325847-1-chris@miget.com>
References: <20261101161814.1325847-1-chris@miget.com>
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

The Xiaomi Book Pro 14 firmware uses different SystemPerMode values for
performance depending on the power source: 0x04 on AC and 0x03 on
battery, both with a 50-58 W sustained power limit. Its DTT tables have
no battery entry for 0x04, and BIOS 0707 refuses 0x04 on battery, so
the driver currently refuses performance on battery.

Let a profile entry be marked for battery use. It is set in place of
the AC entry for the same profile while the system runs on battery,
without the AC check. The firmware does not change the mode when the
power source changes, so re-apply the current profile from an ACPI AC
notifier, taking the AC state from the event. A mutex keeps this from
racing with profile changes from userspace.

Mark 0x03 as the battery value for performance on the Xiaomi Book
Pro 14.

Suggested-by: KentoNion <kento@kekto.ru>
Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    Tested with ftrace kprobes on the AC notifier and on the WMI calls:
    
      AC, performance (0x04), unplug: the notifier sets 0x03 within 1 ms
      battery, performance: set 0x03, PL1 58 W
      battery, performance (0x03), plug in: the notifier sets 0x04
      s2idle from performance on AC: resume restores 0x04
    
    Battery class events are ignored. Here Omarchy also switches to its
    saved per-source profile about a second later, which goes through
    laptop_profile_set() after the notifier.

 drivers/platform/x86/bitland-mifs-wmi.c | 122 +++++++++++++++++++++---
 1 file changed, 108 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 0891dcc1e9b4..4d02cd9e8a6b 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -91,6 +91,7 @@ struct bitland_profile_entry {
 	enum platform_profile_option profile;
 	u8 wmi_val;
 	bool no_set;
+	bool battery;	/* Set in place of the AC entry while on battery */
 };
 
 struct bitland_mifs_quirks {
@@ -118,7 +119,7 @@ static const struct bitland_profile_entry tm2424_profile_entries[] = {
 	{ PLATFORM_PROFILE_LOW_POWER,   0x0a, true },
 	{ PLATFORM_PROFILE_BALANCED,    0x09 },
 	{ PLATFORM_PROFILE_PERFORMANCE, 0x04 },
-	{ PLATFORM_PROFILE_PERFORMANCE, 0x03, true },
+	{ PLATFORM_PROFILE_PERFORMANCE, 0x03, .battery = true },
 };
 
 static const struct bitland_mifs_quirks tm2424_quirks = {
@@ -227,8 +228,10 @@ struct bitland_fan_notify_data {
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
@@ -350,34 +353,108 @@ static int bitland_pp_check_capability(struct bitland_mifs_wmi_data *data)
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
@@ -826,6 +903,10 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 	if (ret)
 		return ret;
 
+	ret = devm_mutex_init(&wdev->dev, &drv_data->profile_lock);
+	if (ret)
+		return ret;
+
 	dev_set_drvdata(&wdev->dev, drv_data);
 
 	drv_data->quirks = &default_quirks;
@@ -858,6 +939,19 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
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

