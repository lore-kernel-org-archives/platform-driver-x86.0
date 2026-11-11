Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416665;
	b=iItUnCrKq5Nx9BpPBH9uW1H7n0j3Y2sr+wfJHdZtu6upfmS0pIkJc26Yc9pXI738tleK
	 UKz7xS9ZeI3imbBONADXPbqi68C7M7TOvwJNth5qRuOz+pnsZkFlE/mIZ4YQUSGhEIUXn
	 t6lSlboqNRD8kpIbIzWU0uo+GubN53kLBEby9LTIf/eXOkvy15Ilh09p/B3u+mm5vR1B2
	 q6bqmNiPWd6GKl0i50om1PAu+qx/dUQ4hjyCO92Vc1Pw32kJc3CqAygHdynbJ8StqeD3V
	 pAc+7O/nTlghYwZwk9O2K3ufCL5ajSkUht6s6J/EGmY/QFYo2AxdW/5qk75VKAeuy4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UbADhzE1xi4qyLEBY5pOxlcVGmXzPk2Jq0OH/tDEmxY=;
	b=rcysrvt4HNZT47SgKn8YIiKQkt0Vvo/s3T5ckvgk1eZv2pBxw7FmEewFN+KHiAfDy0aN
	 ip1t7jftCNkPuE0G5Veu9XnWQ8z4N7Hk+zunm5glVOfY0fKCcvwGCkEz3OP71HF9s6Co7
	 5Dun2JSz7IUwOilwRtPr3UFE15JcAijop4SCeMojztnq5EiZZ+ILSlL0HMMjyY/e1S2w7
	 RUVsoE/Yv9qv0ntny1GGw3WQyRKoB2H8tEelPZX40raDRav9y3hwRttPzJTnD2eR2GxB3
	 bNLCi6InMqcbKgPH9U8sAwrTHAGXI4qZZ2l/XfqIYVDwOqvOZPlZ4Qvi3A9PZYz5MLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=D7psJ64N;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD1860A2637
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 17:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FD1860A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=D7psJ64N
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso3991788a12.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 09:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1794416663; x=1795021463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UbADhzE1xi4qyLEBY5pOxlcVGmXzPk2Jq0OH/tDEmxY=;
        b=D7psJ64N3wKKQ3To2jwtXS27l+L0plE7v6TUqPceYhSNmqpzr5QzSUnDUg9IHpl5o+
         R4o7GNL044HJeHV0t5JE7Y/GkF77rBO80a24pbCamk0b0Aj3gzIo3Uta1zajBw6To/Rv
         tmRaNqrTIJLeMmt57T7usNxQdzDLC+84Vx2GM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416663; x=1795021463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UbADhzE1xi4qyLEBY5pOxlcVGmXzPk2Jq0OH/tDEmxY=;
        b=xLCmZsrW1EkMWDYBH/AxFA3PO4lL6byjBgNkPjRN8Qtaw1y0+SWmUA6dTyhZWAcHBh
         TSS1h7/gC2/wTOkSEwWV9cNv5Sk8v5zfbkOnUE9qgjj7Ni8GyC6pMrWkcaLZuWED4ahR
         m6hUJAEIyRrKG5e3OCoJ3J04TIephYiC1zAgMKwyvU/+3Z5N4xMKfZ4BzyQaULpuehSA
         CudDqriawNjYsuNyi2FGPrCRam3AjGGL1dIX4+F8BWYyAjccRNKycymrTsVVyBTL227d
         A5fp0n0GqAkwx/wH2DgnfYzi65/vcFbJDjHYZxn5VW14Npbmw+fvAzVYiAcGZ3oCbh28
         c9jg==
X-Gm-Message-State: APuU4Z/7c6ZxmjOQbx8836D+Q8qMgf4EL05QvzgfgXlASDaFKABw/IzV
	J1d0aAWDfgjtnWE4nNC5Ch8vcufcV8gSqGWNDFDuPdsmeSp4la69hC9xl56nJNdTrpA=
X-Gm-Gg: AYBFou2Dtev5Do61mTWA+zYOu9YlGVudfU4A+RhwA5lzP06Xl4zcrblJpTWyyXq09nI
	ly1jypv6Xtb5vJnNKP/yap3Z9tj19+OBpjUZa8PmmcZ5FsYkuRVWYYGSLJuznEImr3XbmxgYale
	1wip4zpCUfrzGkzhLalqVUMk20lTB2eRQe9NWBfiQu15ZxvySodO+9PWRbLcC4LPz94nzJIdc1I
	pX72M8d/U/9CqS+PvkrGkQr+1XW/NMxovWhYAWQdgYXZgzZuzhHQX2MSsNI0bNlM2OETErgDU5V
	SraTdDw2A2bH8Hucq6UC7U1i27qy2/AM4uloILsiP8DL1H/eIRrzVAKinhi761YUTelMSBMABJG
	n+QIGwGxKbOFoghLGkukPspltgj0omB3bLv+USzdyLU/B8woebW+5ekoPNRZ1UJs9Wy1dXDRab9
	CZKAEmaG+nN7mZyKo1wYQrDCeW7S2FsAQwZ5n0mIj1a2dTlgS3+QHhFaxItza/O0DuO2UI+8LTS
	kDY9LxufAGCfi+dQXm1o4rh4bw+jZYA/oj37gkS7bx/1wxa/HCbd7Wl3AE3Jw69TJL67iWNnubb
	5maFKY8v9V3gC+oIWYs/nTD/2X3kNND+KSwas4CkWAXYl3EIPha7ikeInwSPiTRhocCuvpCd59D
	8z9HmQOalx/PZ37JsiPuJtkfzJF+yqO2r/YWg
X-Received: by 2002:a05:6402:134c:b0:6b6:f3ca:94c7 with SMTP id 4fb4d7f45d1cf-6b7773edfe9mr1852684a12.12.1794416662568;
        Wed, 11 Nov 2026 09:04:22 -0800 (PST)
Received: from xia.tail836dc0.ts.net (user-46-112-106-110.play-internet.pl. [46.112.106.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7834cdc23sm871660a12.12.2026.11.11.09.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:04:22 -0800 (PST)
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
	Yun Wang <7z0423arsenova@proton.me>,
	Oleg Rybalov <rybalov.oleg.dev@gmail.com>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v5 2/4] platform/x86: bitland-mifs-wmi: Support a separate profile value on battery
Date: Wed, 11 Nov 2026 18:04:04 +0100
Message-ID: <20261111170406.1634428-3-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111170406.1634428-1-chris@miget.com>
References: <20261111170406.1634428-1-chris@miget.com>
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
    Unchanged since v4.
    
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
index 6217486fece8..4bbf38651ed7 100644
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

