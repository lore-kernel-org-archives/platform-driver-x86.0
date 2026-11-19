Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073139;
	b=5VJ80XSSmdrMDMkOwQKTr4Kx7KnY1YC5ygCuVgtwTXwrHTYqg/5UYtEjuuDygR3Vx2Gy
	 Mku5RNtjy4ArmmmhiXT2KYZa9PDNHN21ora0qFj9qEX5bIXGd0En//LeOrj/4HWLv5DGR
	 llmVKota98c5nKdOeCaQ/lOct9dv/KKIY/xNKRWqpxiCqX6WQQl0T7+RRVSCYfcEIQUh8
	 EL90J6T5NIPJk484A+Gti5DpAIjOlqXOKjBqSfACU4rYh9jYWdH32OI611XM1A2TR0pcl
	 s6WQxiq7wnGIr4uGICdkvJ8//UnsqCw+GwtZWoB5XbABKaZGd3jYCxReQ1VFcaBlNHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=AKG9Ro9EBe1AjV7DEsjeahMcz9Otw2gwrVsv8hiQDYw=;
	b=LW9qD4WgB9VlS1qm7xcLskFpBrh3m4fTL5zcyDBqJgcaz6mL0QCNjXChuuYv7QGf6F3k
	 dMtdJ9p69zh1IuxC+G6C529d2VsqSKhrmW35OXs3tLr1XeLrOa9GB1CWv1wvi1gWpQcDq
	 jBDopkZwSReuNqcnN7/t+QgItvF8IKHteyyvuOEj/padph1S864qG/VNHRpeaLQlbwSDZ
	 rrjg29tNnKbJ+TPhPQ5yU+fnVyMkaBtCNFhb6Gpx1xcff3X/KaBrNP4RdMhlvBGtnrVmY
	 pPU+TyMsh4AxvQUc/L9UAHYEXc0LP127WRZVVRoth+FddXhEXDDoaTG7TOkEhVn6sTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=lYU9Xz30;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D83606A325
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 07:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65D83606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=lYU9Xz30
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 58DC33F322
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 07:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795073130;
	bh=AKG9Ro9EBe1AjV7DEsjeahMcz9Otw2gwrVsv8hiQDYw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lYU9Xz30F+hbEVjz1Y5OiipZLb9YR82kxX+7XGYcTDkiJG9gos2YH+6122Mz8qZTo
	 wQSr7UkjUL1Qnh3UcyZtyCRDO7sfwV2XHzfqkq56QjWdFs2taz/3Hs9pAJ3bOUYfwq
	 5FCzHQ27wpFuarK3hacvXAuiv1MxevvNIkoJdVCxnrO6X/1m0FZcj1k+LgItwjyq0s
	 7WybepiYKjOzn01pEps48KzPAqUtTT1/ZczdcSFv54oiKbSqLRVle6B0ZCbovT8WX2
	 K+ccWYicfB597Azxcu+cqHRCbliaLf0aLGvZrhJRRq7G8pxZ+ptQh1LB6CJfXySNiQ
	 Qq2bunDbRjn5v8mfMR52wBZ2XWLn5o6ECGXj75nz5IXB6GsQRTjixc8PSs0R1TbNS6
	 JDEK7ctnZSk3NA9j2lTLrQTvQNQt7ITT0w5dt3243nrH9Y1ll9qs+9EWuzDVSWcuQN
	 YectRoQYYGj+VZxumPVEIEvrsclyHg04hd/hPhorl2QCXO16usTRj4EMBPpBQTzY14
	 jfknnQKZLO8Yw8QfK/JQr3CYA7oA6EC7BMTDOGJyXH/ZFkKlrPz7+bhLYusbkKfhNi
	 nWS5BWMhul1Mdyy1BuEtSa+sUaojAP8ZZM4Ge97VdJpQD8zOg1JcpvIQGGDDEOJIIJ
	 Dn8zRh9e1yzqfu7hAdCBAS5U=
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso2473263eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 23:25:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073128; x=1795677928;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKG9Ro9EBe1AjV7DEsjeahMcz9Otw2gwrVsv8hiQDYw=;
        b=pjeVb+cVNemVa/qlSJgvzvn9n2qBsMW5bk1hd2Hu1VMoZVGF0i41f8/M/h7saAfPPd
         OdaOU3iPYhODLke22jKnHVW4ZGsTO3xhh+7RVc9FyAK7F8cyKUyAhsD2nxzIPpShQ4Jk
         ywXDXJ3YLwvVJEALwGRqXsf7tAeuQbhl5hw1/QUKeB5R/wyBQEgMtzIA1Y2xdGEwFPt5
         vI4J7Gdws/v8T1m3Yw1FiaHcKP5U+2HX+wnKVY9+SpIU28izEwHYE3wOatTnCZmh9wiL
         CtgcPnd+extJkBzGAoFQ7veQby1IctVLevXial2Ksu3ArW9wHbzeJ/Vze9XL3bgh3XCy
         Me9A==
X-Forwarded-Encrypted: i=1; AL+hErGllYclIKCeFFHh1hVilIcjZ29AEVv1kbA4HBfO5ISAdUBNBUgdPhg6y8MaHNyul69cYik+gXT5xpDKPPphKL2fU7V3@vger.kernel.org
X-Gm-Message-State: APuU4Z/P8qqOSLxK5Rou/PBR52FT5cRzTO5dDmiDyNRz04t5pnQ/IkFi
	rX89kAkicn0vr2ZWs3rR6rqsbzzLT2za5qB4hSMLigIXrlNLiK7EIh6xiDPBxJMaZgQ6jsc9l6B
	a7NXuyDu7ATQvWsaN2zpmk3N/7ExejLRs2iTANCydMZBAToH6KIyr+hvGr/3YmCUmBgrIQAZgPt
	UYa43c/k+KMoRafC3TiLa+TYBj5w==
X-Gm-Gg: AZFdTZdjvOpHdiLO/uxBXyyO/ezCp/TZziOeVdlmZmOFJUOCYseEnfg5IQHJca8wLun
	NzqANDFS+IZzaA2YEulX7RpVqjeYSXBtGk5Qa835IbtLN5tjlJxp+2CFcQkocYdv8N+CWkY7lnq
	1avMQI5csJKq7kw+ifYIwMIg2vhdtthzd7vgWbPtjMq0XvkrjWNAnihiFtbsLaXktGsK8fthXHW
	MDCu73KtCeRKkfiS4buVpeqc0z5ulnrHdsIRK0gmEvGqlXByIF9Rf2YDOBRRMiM3DrkNOdd7BdT
	TuB+NgZvMftmqgIEsUkc2uldLEO7kNuL+znG2sDvD2NpBgdWy6CxABW4AKzwJIRzDy8f0SCEQd1
	X6KXQHLG+ghrqK9akz2W9VQCcbviVHLf3nId1FnCae+5HreDduNVNG+gwInzkouKQi5Lb4Vp0So
	5VyehiTqFbaE9Adu0MNLJWbVRl5tSd3aWiVRfePXbgCbD60qCTPYA62n7g3+0BWkoziYA8ts/Lt
	PhYFxHlBOHoh2Zm9Hfz7il28IprkQnLRr+lDLJkWgWgDB9hKUdu3Hyqr/u50/xAA0rEhgzmSzYI
	tmGImtkflA+h1w==
X-Received: by 2002:a05:7300:c7c4:b0:381:610e:4045 with SMTP id 5a478bee46e88-38280079f92mr4939871eec.8.1795073128517;
        Wed, 18 Nov 2026 23:25:28 -0800 (PST)
X-Received: by 2002:a05:7300:c7c4:b0:381:610e:4045 with SMTP id 5a478bee46e88-38280079f92mr4939854eec.8.1795073128012;
        Wed, 18 Nov 2026 23:25:28 -0800 (PST)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([103.155.100.6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6def9e2sm16130168eec.13.2026.11.18.23.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:25:27 -0800 (PST)
From: Aaron Ma <aaron.ma@canonical.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v5] platform/x86: lenovo-wmi-other: Deconflict battery with thinkpad_acpi
Date: Thu, 19 Nov 2026 15:24:59 +0800
Message-ID: <20261119072516.309524-1-aaron.ma@canonical.com>
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
Changes in v5:
- Drop the outer #if guard around the macro definition, as requested by
  Rong Zhang and Ilpo Järvinen.
- Make methods const char * const * as well with a single
  LWMI_PSY_DECONFLICT_STRS() macro, casting at acpi_has_method(), as
  suggested by Rong Zhang.

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

v4: https://lore.kernel.org/platform-driver-x86/20261118063058.157862-1-aaron.ma@canonical.com/
v3: https://lore.kernel.org/platform-driver-x86/20261113055726.952551-1-aaron.ma@canonical.com/
v2: https://lore.kernel.org/platform-driver-x86/20261112074823.853819-1-aaron.ma@canonical.com/
v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285-1-aaron.ma@canonical.com/

 drivers/platform/x86/lenovo/wmi-other.c | 81 ++++++++++++++++++++-----
 1 file changed, 67 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index bd64e7b44669d..33be29bafabf5 100644
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
@@ -905,19 +905,66 @@ static acpi_status lwmi_acpi_match(acpi_handle handle, u32 lvl,
 	return AE_CTRL_TERMINATE;
 }
 
+struct lwmi_psy_deconflict {
+	const char * const *hids;
+	const char * const *methods;
+};
+
+#define LWMI_PSY_DECONFLICT_STRS(...) \
+	((const char * const[]) { __VA_ARGS__, NULL })
+
+static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] = {
+#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP)
+	{
+		.hids = LWMI_PSY_DECONFLICT_STRS("VPC2004"),
+		.methods = LWMI_PSY_DECONFLICT_STRS("GBMD", "SBMC"),
+	},
+#endif /* IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) */
+#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
+	{
+		.hids = LWMI_PSY_DECONFLICT_STRS("LEN0268", "LEN0068", "IBM0068"),
+		.methods = LWMI_PSY_DECONFLICT_STRS("BDSG", "BICG"),
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
+static bool lwmi_acpi_device_has_methods(const char *hid,
+					 const char * const *methods)
+{
+	acpi_handle handle = NULL;
+	int ret;
+
+	ret = acpi_get_devices(hid, lwmi_acpi_match, &handle, NULL);
+	if (ret || !handle)
+		return false;
+
+	for (unsigned int i = 0; methods[i]; i++) {
+		if (!acpi_has_method(handle, (char *)methods[i]))
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
@@ -928,14 +975,20 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
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

