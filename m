Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983473;
	b=mVsqbZD+/BrePe+uCHdChfYK/sisnOgS5x+1vPJeJ4I9tordc4ok4ly5kQU8PUMrVufE
	 iuaVJivBYonAYaC3p26MhlTwr8MY7ULSd7XdxcjS+8gsGDzjgAxKn4WrdIhndyXVQfEvB
	 lE+/5VMVkiC98bbhfUsQPYvaUg+kKXcrtWEbK1TR340kgE0ZCSRXEto8Rq5rwX95I7I8z
	 Cm7Dx6BxdEbGLkFm5u3mRoyZHClSlGElp1ammEGJC7Hq/Krfs8ndquH0yu6NR5CPFD00p
	 GMA3oe1L6jmxeh/1WfCXhaotXpOHWk0zGLoN6jJVx1UgcGVcxDkQ/Pw59A9uuYlnmMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=xnwLzNpN41lZ2zslZu7EVyglG2sUIr9VKey9Lh0r/zw=;
	b=kPejZGRW7/GkAB7G6mKxd71KHRGfXsMQOlbpVxhdAq/20oIoBco0DoQ6MU1CFsymgGDP
	 eD8ckgot+5guFhePJ+h2RnM9T8rTF7gCRRyYt5OrAPaEPR6+LEyiuxhvvyLls9HoGRfsj
	 gXbPvsy6VUTXdkRuVx8clhNaC83Ito/iwhT1B608STTFHyt85VpfWaYOtef5QHs57/JL9
	 Ai7khhPZv/FLFHUDoBij6UdG84mDyDq6+GAC74SVMfWhPuQfEkxItlIsM5Xke6sB+H1TC
	 Ynkl70Ra0p7nePYqy8nZURvatowAlQoeZasKxRF6UBVHPtOXIyKYIUK5En/GQpWqViA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=NSQx9laD;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9BC606A32C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 06:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D9BC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=NSQx9laD
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DB2413F46F
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 06:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794983471;
	bh=xnwLzNpN41lZ2zslZu7EVyglG2sUIr9VKey9Lh0r/zw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NSQx9laDPeQU2PRHrya3CMcJmlFy4yG7ic8hz2tD6neDuhMzfyLrsr0Ems5BIxb21
	 C1wqruVaZq9nNEzhJwJ2sn1jXYDxCrZ2WpDgOx16AfKQTgWqC2r1EuFn3aX2nge4kM
	 4usmDuYb3oeAlELi5jJqmxukfvG5O62OTk7mbsJi+7DB2oWvoyc3c+IYfou9NvVS/k
	 A8NXRjhMDy9Ulr1xiV0dloThQHet9Rmgt2W999xr5vc74Ml9ZZILZblPeTxxQALzR7
	 9b6FmCV7CjUCFwG1hiORutOz6wglXzHxjkBFFIGBLasrIHVX/51L8qJUBkPgpUkqrG
	 E5I1FaHtRjjhKXVdzQx920yvQZLhn4Fg7nt63Ll5WWgaOw3ZfcUXKgzPNpTsxo0Kbv
	 MyDszFU8J/5XprCOqnp24smxNH6W4eZiZrcKglDUtdJkMhvPxau8uzkF7c+oC9T+GB
	 9PPGrokX+bVGAu7GyGirLXbB0znKvSQRroYnTw5A39X1kmWNdXAUiRkVaRLYLd4iap
	 cgZOlGQQMlz0wMi7KTTkM+MZVC4wtGMOcPsHnX1Wog7k6ssGIeRpyBydyZSSph22SU
	 X6F1Z/sf+lA8VWtLTSGJlRxvAFOsJO0TW4+e1qXl8h2wVqce8XbhZFpzBsoZnN8y/2
	 bYMFLDbqOIE+IX5xeLQH5nhI=
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5be4be15430so270450e87.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 22:31:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983471; x=1795588271;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnwLzNpN41lZ2zslZu7EVyglG2sUIr9VKey9Lh0r/zw=;
        b=cXQnkFAXgvbpLNoWhyC0nTo2+udNRDXnFRSWB5BwmP+HZ9fsf5hj3Fydwg3DAbeNxS
         FsKzDhiN+VgoFpNXGWtxzB5bGUFNB/9oomlGQ57NOH0biA42vjKpA+0css2rktJ7WzVj
         QO4ffH3Z3PKGQol8pmloD3KOlhIOj3KBWMstyVVSJLoW6FGReR12Bj+tDuJasGBZv06t
         TIPwx5/2D2o4AUPcAiump3kSbCS3JR3CfMJK4QhxAUtmrfMxoI9spJ5zpwyqtys0PQmB
         tA3RkPx2rfQAh11B1zbvdVNKHoZpKgUlh1pHIneX4JoxQg9lC9QGi1p6AMPt8nV0Ohc8
         EOvQ==
X-Forwarded-Encrypted: i=1; AL+hErHyRtbZYUyS6Vpl0TCnP3VgeJGiiaX8H1x/SEWFn5UH2pisSRdz69wkSjnz9GbrFopG/vnLAtm9hbURyuF0ImwLc1lt@vger.kernel.org
X-Gm-Message-State: APuU4Z+zIK4KoRiVypOF87kxeYTnq6/zZ04CYkhx/CLM7dWXHuFp7bVE
	c5wY/xhiPNrufki/sDVkoksnupNV7FLV3Xp1GJDRK5FNT+LFWy5dnE3vC/m0ml5utl+aSFYIwKI
	5vGx+cpVL3j/AR2liRGnkjONir3gFsovVAkwPqXA6wEXdmdvsWd4zfO8rRo4GJxRI8q2loVffrN
	zAiyNYVqdCUKLHL8U=
X-Gm-Gg: AYBFou3DpYypQEPZMvbZT9ABMlsHPS3ITcz9bu5/CL1rkSpvbmLnHCziquj9v8FPDgv
	Sk+Rh6soK0CovCxI0tgn0l+3pTkzh+KYhaGJCrcj0vLzQ8iF3JK7tEHQzbgvMQn6Pcwu01/Btj7
	yNgTuLXg/XZ92TzSqmmXw3XOTgl/KrUDwkshPWnCU3bkI1OMPqxCUWP78OdH6tn22FeUwL8T9If
	hrhkpYjf9n3zgMq7401hWn16VGrtnEJSmOJKLnBqDVbcZ/WDXRpv6q4/Z9IORBk2jd1CkBPsR0b
	sdsU2Y1aPMf6z09lqhLXMZqmLAu1asO8aAubXVxJOh/xSotpB76KZMKMYRqyb1xSHzMTYOikAuU
	lZSwf6jQ691ncSzRxpBf+NaRwwO+nncgUFLCSj1VDlt0+tz3BIo9BrIv55aSRFuLO9/BEJNxaM2
	ZXX0Ud9rSTD+68+0erWMLuEpxOS0d5g6+RmnJ+xv/hpRD1MqlBH4l59ZpBOCdvzEC9RVzEkpbSg
	/djFgBxWmGIJIqdsANWWP8gQ2zAFM0gpsVRXM+gkvquaBtX3MPASy6x7yARj06XwA1131QfDvlO
	+KBwXpYRIuEm8g==
X-Received: by 2002:a05:6512:31d4:b0:5c0:b5c:408d with SMTP id 2adb3069b0e04-5c1a9d25a9amr520398e87.6.1794983471178;
        Tue, 17 Nov 2026 22:31:11 -0800 (PST)
X-Received: by 2002:a05:6512:31d4:b0:5c0:b5c:408d with SMTP id 2adb3069b0e04-5c1a9d25a9amr520381e87.6.1794983470649;
        Tue, 17 Nov 2026 22:31:10 -0800 (PST)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([103.155.100.4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa77e605sm311349e87.47.2026.11.17.22.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:31:09 -0800 (PST)
From: Aaron Ma <aaron.ma@canonical.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] platform/x86: lenovo-wmi-other: Deconflict battery with thinkpad_acpi
Date: Wed, 18 Nov 2026 14:30:52 +0800
Message-ID: <20261118063058.157862-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ThinkPads expose battery charge thresholds and charge_behaviour through
thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups. The
Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
charge_behaviour and charge_types on systems advertising those WMI
capabilities.

When lenovo-wmi-other registers first, thinkpad_acpi fails to create a
duplicate charge_behaviour sysfs attribute and unregisters its battery
extension. Conversely, registering or updating any power_supply_ext on
the same battery runs sysfs_update_groups(), which removes standard
power-supply attributes not owned by power_supply_core and wipes out
thinkpad_acpi's charge_control_start_threshold,
charge_control_end_threshold, and charge_behaviour files.

Deconflict both ideapad_laptop (VPC2004 with GBMD and SBMC) and
thinkpad_acpi (LEN0268, LEN0068, or IBM0068 with BDSG and BICG) via a
per-driver table guarded by IS_ENABLED() in Kconfig, and update the
force_load_psy_ext description accordingly.

Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery charge limiting")
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Co-developed-by: Rong Zhang <i@rong.moe>
Signed-off-by: Rong Zhang <i@rong.moe>
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
Changes in v4:
- Make hids const char * const * with separate HIDs and methods macros,
  as noted by Ilpo Järvinen.
- Move HID lookup and method checks into lwmi_acpi_device_has_methods(),
  as suggested by Ilpo Järvinen.

Changes in v3:
- Wrap deconfliction table entries in #if IS_ENABLED(CONFIG_*) and drop
  driver_enabled, as suggested by Rong Zhang.
- Group deconfliction entries per driver (HIDs list + methods list).

Changes in v2:
- Consolidate IdeaPad and ThinkPad deconfliction into a table of ACPI
  device IDs, method pairs, and driver configuration checks, as suggested
  by Derek J. Clark.
- Check GBMD and SBMC for IdeaPads, and BDSG and BICG for ThinkPads,
  instead of relying only on ThinkPad ACPI device presence.
- Check whether the corresponding driver is enabled before looking up
  its ACPI device, including for ideapad_laptop.
- Update the force_load_psy_ext description to cover both drivers.

v3: https://lore.kernel.org/platform-driver-x86/20261113055726.952551-1-aaron.ma@canonical.com/
v2: https://lore.kernel.org/platform-driver-x86/20261112074823.853819-1-aaron.ma@canonical.com/
v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285-1-aaron.ma@canonical.com/

 drivers/platform/x86/lenovo/wmi-other.c | 84 ++++++++++++++++++++-----
 1 file changed, 70 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index bd64e7b44669d..485e9a9e4afbd 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -189,10 +189,10 @@ MODULE_PARM_DESC(relax_fan_constraint,
 static bool force_load_psy_ext;
 module_param(force_load_psy_ext, bool, 0444);
 MODULE_PARM_DESC(force_load_psy_ext,
-	"This option will skip checking if the ideapad_laptop driver will conflict "
+	"This option will skip checking if the ideapad_laptop or thinkpad_acpi driver will conflict "
 	"with adding an extension to set the battery charge behavior and battery charge "
 	"control end threshold. It will also skip checking if the BIOS reports that "
-	"those features are fully supported. It is recommended to blacklist the ideapad "
+	"those features are fully supported. It is recommended to blacklist the conflicting "
 	"driver before using this option.");
 
 /* ======== HWMON (component: lenovo-wmi-capdata 00 & fan) ======== */
@@ -905,19 +905,69 @@ static acpi_status lwmi_acpi_match(acpi_handle handle, u32 lvl,
 	return AE_CTRL_TERMINATE;
 }
 
+struct lwmi_psy_deconflict {
+	const char * const *hids;
+	char * const *methods;
+};
+
+#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) || IS_ENABLED(CONFIG_THINKPAD_ACPI)
+#define LWMI_PSY_DECONFLICT_HIDS(...) \
+	((const char * const[]) { __VA_ARGS__, NULL })
+#define LWMI_PSY_DECONFLICT_METHODS(...) \
+	((char * const[]) { __VA_ARGS__, NULL })
+#endif
+
+static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] = {
+#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP)
+	{
+		.hids = LWMI_PSY_DECONFLICT_HIDS("VPC2004"),
+		.methods = LWMI_PSY_DECONFLICT_METHODS("GBMD", "SBMC"),
+	},
+#endif /* IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) */
+#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
+	{
+		.hids = LWMI_PSY_DECONFLICT_HIDS("LEN0268", "LEN0068", "IBM0068"),
+		.methods = LWMI_PSY_DECONFLICT_METHODS("BDSG", "BICG"),
+	},
+#endif /* IS_ENABLED(CONFIG_THINKPAD_ACPI) */
+};
+
+/**
+ * lwmi_acpi_device_has_methods() - Check if an ACPI device has all methods
+ * @hid: ACPI hardware ID to match
+ * @methods: NULL-terminated array of required ACPI method names
+ *
+ * Return: true if a matching ACPI device is present and exposes all @methods,
+ * or false otherwise.
+ */
+static bool lwmi_acpi_device_has_methods(const char *hid, char * const *methods)
+{
+	acpi_handle handle = NULL;
+	int ret;
+
+	ret = acpi_get_devices(hid, lwmi_acpi_match, &handle, NULL);
+	if (ret || !handle)
+		return false;
+
+	for (unsigned int i = 0; methods[i]; i++) {
+		if (!acpi_has_method(handle, methods[i]))
+			return false;
+	}
+
+	return true;
+}
+
 /**
  * lwmi_om_psy_ext_init() - Hooks power supply extension to device battery
  * @priv: Pointer to the lwmi_om_priv drvdata.
  *
- * Checks if the ideapad_laptop driver is going to manage charge attributes first,
- * then if not, hooks the battery to our WMI methods if they are supported.
+ * Checks if the ideapad_laptop or thinkpad_acpi driver is going to manage
+ * charge attributes first, then if not, hooks the battery to our WMI methods
+ * if they are supported.
  */
 static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
 {
-	static const char * const ideapad_hid = "VPC2004";
-	acpi_handle handle = NULL;
 	unsigned int props = 0;
-	int ret;
 
 	if (lwmi_psy_prop_is_supported(priv, POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR))
 		props |= LWMI_PSY_PROP_BEHAVIOUR;
@@ -928,14 +978,20 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
 	if (force_load_psy_ext)
 		goto load_psy_ext;
 
-	/* Deconflict ideapad_laptop driver */
-	ret = acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
-	if (ret)
-		return;
+	for (unsigned int i = 0; i < ARRAY_SIZE(lwmi_psy_deconflict_list); i++) {
+		const struct lwmi_psy_deconflict *entry = &lwmi_psy_deconflict_list[i];
 
-	if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")) {
-		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for device\n");
-		return;
+		for (unsigned int j = 0; entry->hids[j]; j++) {
+			const char *hid = entry->hids[j];
+
+			if (!lwmi_acpi_device_has_methods(hid, entry->methods))
+				continue;
+
+			dev_dbg(&priv->wdev->dev,
+				"ACPI device %s manages battery for device\n",
+				hid);
+			return;
+		}
 	}
 
 load_psy_ext:
-- 
2.53.0

