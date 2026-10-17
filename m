Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692BB15E5BB
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 13:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792243472; cv=none; b=RNja5m8YWvXNzaLJCxBApBBsrVg/JPGTAhpJdF1JfiT5rbq0EkdPUKDA8oYlfYWOmCNkLpia13qM3lZZFPWC4x7z2YYG0j6ob+jFB0Abn3RKJT+4pGC6vdLtPfjnQG22nKDmXahHJjChzKjwW95VOBz71a5tiIqsofzqHXJPAAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792243472; c=relaxed/simple;
	bh=gLue7yef9uvfyxJFMURRNO3MQczL2A/EJwhF0/lnaIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nqieorJEkGAlvUEJJVtfXP0QP8Rlf7Nwb5G8AyR0EUdf/h6qnHPSTU9RrHBIV/9aeeZuke8mIMWQ7DTo1mq+3YuvNLn2ojEeGAywTuW+u8D9ZIWQzF1mwrIbwFECWBj6c4BrybUMg9EmKa9QjC9vBULZP2UCdZZcUCpS3nJ27aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkgj9xnv; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkgj9xnv"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-16ad92569b5so750467c88.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 06:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792243469; x=1792848269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vuBcV8Vuj1/7kHJ1EaX30e66343TtFfRGuqJHWrtZw4=;
        b=dkgj9xnviuv/P8J2FHyAjuMtc+RWrS9+mWXAIFVTqVoU+MXmTqGLEXk4tESTec7OXK
         PR0K+qsUTmZw2IuvJF+HGX7MlmpIKTLKJljBF2lVo5Ik1ah1snHLSIwtpTuhoiPBAyk3
         VRKWo1UYGDTfi3mdsRq8GS4YXVO0YqCxRVBbO3iexQXCnlaRkltbhTzJPlxoEcJxg9Zh
         Ei6RuKTBHXlVNTtTAUiAc3CmuawEuk54oM+GTqHKTZyjidbmqWcrpKSjFnRhuDqofKBC
         7XaAb9GhTBXUnnfZJ5/0AbpPHHAL4+uA9kCtJR3nLr+kMaz+GbIdmuDj/9hkK0n7ylr2
         Xm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792243469; x=1792848269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vuBcV8Vuj1/7kHJ1EaX30e66343TtFfRGuqJHWrtZw4=;
        b=C4mhvTNRRT7g8zuZg9rgV1oq0AM/BdAOmmJ9vVpONlk3Ar4CH8b8H6prUT9bthzq+6
         X3BwCvB1aINcZ36eH64PEgWZEUNcv2t2tw3vYDWgG/kuSA3TnaXxErB9JwgdO4zXVbNT
         Mirv/ocnYe4lAestUoi0Ig04GIhqOcC8D4nlKBj5Qs6Ds67ark/ZrqN98oXVjgYmwYgQ
         OzH38m30Pm7YXSg0gAHcZOdykz4ahuUJA0hFk32Ds0ZWinBzsDPDHxHxLVplul4wG0cd
         8VrSxvN8Zw8P2d/37IfHFfQWakXZvXV3US5jF/3MPRax3biH/uWBYHWZ4TdoOf35ndkb
         l9Qg==
X-Gm-Message-State: AFq9FYKdeD6ECpQUPWpyUnt69D8C01Ib561kt5GDTv6YMCBctkZWaP6n
	x5NeuM+VjRZVhkJFwDalXImmLQiPjjNAirD8bQLkpnb7QyU2bk8A5ojO
X-Gm-Gg: AYBFou3mVOagW/HkFDHCzTxhne3I6cetwcy8xrAwRYcahlox7cSF9A0zYmK+kSMXbPi
	/K1hufvCjyTOvPY+EJQUXTV1zi1hIfPEohcsWXhfUWcGWivOZClcuUUVzj4jY7Uvpb8N5xltRwd
	QmVNJJijSVjLM/WOTDp7gxV9zkX+SYmQQNHCs6arM7btrt78wRa7rMEmcZAlniSQc084ht00a3/
	Jwf3ZM+IgRYrB8BsFkDfhWmoF6nKa5QjdNRLI25S5wxg2l9i1M5dwF/I92AZb6ufQO3WI5IvcK2
	v0Owy1PNf5nAFbRHhhij2iTqv8+C+3X17PJrsbIHd2VERvxNNGPvszqdIuHhZqUwcoIjMQJCtW+
	eZISB1PYh7GoS+D3rHYEutCqZ6yt4/Nuh2RM3HKSeL0y3J0OO6w9yHCCnjH3wnvhRYvbyHYejSe
	z+SRDqqRF+4iZ9ApJ9ayHM5FGZCthZgZLPLdf3on5GcbWDab7h/QmSygdb0VytuJ+vPZX5ZdulN
	Um1/xWwp+YdpUZeRa0mZHt/zzJlBZQVr6b7qBedC6RURkcA/bRxAC6ttq4aXuei25iZukQak3EJ
	7Sg2Ihk2xR31bdk=
X-Received: by 2002:a05:701b:4309:b0:144:c128:4c4b with SMTP id a92af1059eb24-185134dd22cmr3563521c88.36.1792243469339;
        Sat, 17 Oct 2026 06:24:29 -0700 (PDT)
Received: from archlinux.tailec59cb.ts.net ([2405:201:1b:20ef:268a:fa82:9f05:61a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm13406158c88.21.2026.10.17.06.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 06:24:29 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Disable hwmon attributes when no fans are usable
Date: Sat, 17 Oct 2026 18:54:21 +0530
Message-ID: <20261017132421.279522-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, hp_wmi_hwmon_is_visible() checks whether fan RPM queries
succeed before exposing fan1_input and fan2_input, but pwm1_enable
remains visible always, even when fan support is unavailable. On some
devices, such as certain Omnibook models, the firmware does not provide
functional WMI fan methods. Exposing pwm1_enable on these devices can
mislead userspace and cause fan mode changes to fail.

Additionally, some firmware implementations provide stub methods
that return an all-zero buffer instead of an error. In this case,
hp_wmi_get_active_fan_speed() and hp_wmi_get_fan_speed() can report 0
RPM even when the fan is physically spinning.

Use the result of fan count query (fetched from firmware once in
hp_wmi_setup_fan_settings(), and cached in hwmon private data) to
determine whether fan related attributes should be exposed.

The fan count query can have the following outcomes:
* Negative: The WMI query failed. Other fan-related queries are also
  expected to fail, so disable fan support.
* Zero (stub firmware): The methods return zero-filled responses without
  providing functional fan support, so disable fan support.
* Zero (genuine firmware): No fans are exposed through WMI, so disable
  fan support.
* Positive (1 or 2): Firmware reports one or more fans, so allow fan
  support. Per-channel RPM queries continue to determine which
  individual fan input attributes are exposed.

When fan support is unavailable, hide the fan and PWM attributes and
skip applying the initial fan settings.

Tested on: HP OmniBook 5 Laptop 16-ag1xxx (board: 8DF4)

Tested-by: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Reported-by: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222138
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 0eac5e1d9cdb..52077833ac89 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -651,6 +651,7 @@ enum pwm_modes {
 
 struct hp_wmi_hwmon_priv {
 	struct mutex lock;	/* protects mode, pwm */
+	int fan_count;
 	u8 min_rpm;
 	u8 max_rpm;
 	u8 mode;
@@ -2950,12 +2951,18 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
 				       enum hwmon_sensor_types type,
 				       u32 attr, int channel)
 {
+	const struct hp_wmi_hwmon_priv *priv = data;
+
 	switch (type) {
 	case hwmon_pwm:
+		if (priv->fan_count <= 0)
+			return 0;
 		if (attr == hwmon_pwm_input && !hp_wmi_fan_control_supported())
 			return 0;
 		return 0644;
 	case hwmon_fan:
+		if (priv->fan_count <= 0)
+			return 0;
 		if (hp_wmi_fan_control_supported()) {
 			if (hp_wmi_get_active_fan_speed(channel) >= 0)
 				return 0444;
@@ -3124,6 +3131,7 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 
 	/* Default behaviour on hwmon init is automatic mode */
 	priv->mode = PWM_MODE_AUTO;
+	priv->fan_count = hp_wmi_get_fan_count_userdefine_trigger();
 
 	/* Bypass devices without fan control support. */
 	if (!hp_wmi_fan_table_supported())
@@ -3208,6 +3216,11 @@ static int hp_wmi_hwmon_init(void)
 		return PTR_ERR(hwmon);
 	}
 
+	if (priv->fan_count <= 0) {
+		dev_info(dev, "No usable fans reported by WMI, disabling fan support\n");
+		return 0;
+	}
+
 	ret = hp_wmi_apply_fan_settings(priv);
 	if (ret)
 		dev_warn(dev, "Failed to apply initial fan settings: %d\n", ret);
-- 
2.56.0

