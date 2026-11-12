Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469740;
	b=PrcOOXfRSx1xmbZ3X0YAsKv2bugBgCI3XUjd4BV7P88dQ4J9tafZ3h+zaxGR2X/gthNe
	 Nk/G98ysLMiWJmLwNVT7n/Ry39f6UggPGv09nWGO51rO5qx2ZIXPZZJ95NLKidofo3OXg
	 DozDYYBJ32SkxngnOriJV4pSnNtyVB9+ugTmlFGY98iPesLdO4CZSOTAUcc+VAPnla+nX
	 xc2RmPJw9ZnQ6ktKGGWyxvDqkGmC1RsVISXGo2g/hS/aj0OuDYy+GE04p8Y4B+n96yMQH
	 h6/JBsaJp7Iz1KZhjvuJFlXlMh2gwb3/03zHFogDZprcTzBd94A/Gd1IdzpURBH5ESg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UTxjwsGyPSnDcBcDCP67400BSKT3Lhs5REZ8Ih/HPr8=;
	b=qC0NJl39g8FKScy/ENukAg+93w9HkCWqWN/HSTWwtOwuzhsEVynsb5Winvm6PmIqYy8T
	 ddRPhPhfCs4jVTk42k8q+MRMZ9vG3Eqv3zcQJ1Ut4D5o0BsFMZfZi2pLglohgektyJSNf
	 KUpuagWPE9T5+GQI3tYHIkk+iowf/LYj9jddAUVWC+hTx35WaMnqkIb0lhQyj3L1bfqVy
	 KskCdqjAiSlA8GwnoLZ9u0Col46+858ycY7zsOxx9q8SguKsfgwcR0mMTad/H9gaEZfEC
	 FxaH5dhat6C+nIWZe2vxos4AaujT13Am8Hi1ZIClvXKf40SILoiYlwKrX7fhjqochxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=HILvCv9a;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAF5606A8AC
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 07:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FAF5606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=HILvCv9a
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3D8DC40290
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 07:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794469737;
	bh=UTxjwsGyPSnDcBcDCP67400BSKT3Lhs5REZ8Ih/HPr8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=HILvCv9anRi++cAca8bMuFCecpxOVTdsdgtUhCQ2a3ujA5yoxgqiNvjTuMtFbhQcE
	 d/+LMayuzbAwpdaEoRdmO5on6SES0jAEIy5ACQ+at2NfpTW+nJhvmJ/uxpsZKkktDK
	 jy3Oxlvm5Lqm37I+QyBhUun1vP0OEb4JTEVizNg5zDIXBjdAQ5gilXemwAUOIltivK
	 j0SbfeybXYEQ1Kdmnn9NXjTjqVAMpQWVBhJ5hLLawNcCuP8rbx/sA4fmpiViDE1VGc
	 NczrUsxrZ6y5L8J+btTZHQUcMqb8M1yXyFIfckx/I2438F1I7tMzbLW+b8muCdM/hR
	 u7WFyPHW74Tnb3mAVAhvUzKgUVu3IFH669YE2a60+OYCliOSgfZkp3tplFgoP71WRz
	 xEjXqOGUUhcC/30ssMjqJ8c3OMOtJafyxsX1DlIQ3O17fjmo5hpjqjX3q9uz2dGQ9/
	 Qm/SCSSd1VJCQ6lMRL5r/aznac5EFewov8ea8xw4jqMTyH3mAMnVzXlpZaD0hBbxg1
	 ho3XOEYsDg9HeNjEYr3uDS3inKVdU/6gecSjUy5hldF4Nm+jy6BscXQAgsQsmWvco7
	 fT+IC7F4j1adymCA29rP6Y1mXRqW4KIGFjeUuOBgCWO4KDEwx7i038C4/CkCCb27fy
	 JuWM2fqz+GAtqKmXjEYYpm2Q=
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36ecd5db581so307320eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 23:48:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469735; x=1795074535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UTxjwsGyPSnDcBcDCP67400BSKT3Lhs5REZ8Ih/HPr8=;
        b=x84nuPQH+53pXKp3+I/5AA8hIFi7iLSfEZWhu6RLiDZJxvfXTqksjF28G1Yk5mVT22
         1rtk5gu3JMusZ/Spk9l6Q/JlJVOc0ihyDvnV3FzojDJD92l6c/RwwSgLXqLkwYcUrpng
         lQLnXjHrpeT+roUxPXCwvZTkg/h0jcnLOMUdHZNDwRpzKOJSzoeCz0fjnOliEkNy71Z3
         XjAvqysFI2bbkFLN+DKqE/khXOyrlYulMKZzuXxuuAQBbZCwIDw18znqAsmr0An4yJ5A
         Sh1yzew9Eb0Mv8xJgHtsIuWJTVL+YnipZBmNi/F4Z2bEaIqr63cy5XLna6OIzHvIsdtT
         8ruA==
X-Forwarded-Encrypted: i=1; AL+hErE7FXHyq41bJm0eLXz1UzIYX7HjH5DXlnMiVZChMzdzMfMk9Zn1dVFrZte/r+dWWVypt38ckVTnJtxrPnsoUYmxE7mt@vger.kernel.org
X-Gm-Message-State: APuU4Z8RKLWZnLm/Aa0m+zLhQSnba4Z1vfww21u1akNM5JVZv5g3ibjg
	b+iAY6ZEnFAb9EOSWcmq+ore/KjDmJRRGZ80zjAFeeNJUZV8zc1t0/rbHFt8P2+1brqQpLSGphV
	EQzlS3OiUEXS5rtAbTDlxFybdBHnxaTqD/DJrL82Lu2aA0DN29UyYiIGEEilwWHVg3P5u4H3DtA
	qrxaj9ymQN/nXNh00b2IfESlqH7A==
X-Gm-Gg: AYBFou2++MX/mK3t/6isU+gFltxzDy3bLyRs2aB2Sh70TqHDBttrnzgara4kd8GmKO3
	DG+aYt1HaArds+VMK8mRyEUDK3XT0d+rSnP1B4AO2cG5mIzkfBR6Esl6h54Boz1ZYI3OhWnOw2g
	za3uYE3WbtXlONln7s3CTRattuXQY+lB8xy5yfitu4ryAd+ZiirgsCMxH7MYXTsNPzPv4fGzXWx
	HrAB5ZRqRZzigM1E/mrw48cYmowMLkjbax9XQtCBH362QtQGONcqrpIKFb8iP1zZ6sRgltSCz2r
	FUXABgfgd9d8wNRtSH1tHUX6xoRrELNIPwcfUPJKs5ILdFNIdGWVcVdocLFy/moH9xywVYgT4Nr
	TPJ9B7wSyDpC2uQXUdYPlSHb3xV0Jntgbai1mEotd9PFYX6oSNaQnkzHqUXBtWVlSA24SFoVPgx
	bPwDalkG/5myx5Ktkup6PO2kbXk2v8YvbhD/MkElBNOZ5KdmEzfOMjc0ZXDOwMpTE7WK9zvcz9r
	td0OYCT4oYMUJ9xz6FVuA0qjse6d7oTfu+FGmYUvtqvtn2CdZUPUpWMvXeqMnJ4XHSrcilwvCRX
	ybtm+SL76CTrlxw=
X-Received: by 2002:a05:7300:d941:b0:372:1be6:110b with SMTP id 5a478bee46e88-376861826d1mr4459568eec.15.1794469734926;
        Wed, 11 Nov 2026 23:48:54 -0800 (PST)
X-Received: by 2002:a05:7300:d941:b0:372:1be6:110b with SMTP id 5a478bee46e88-376861826d1mr4459550eec.15.1794469734214;
        Wed, 11 Nov 2026 23:48:54 -0800 (PST)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([103.155.100.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm44595188eec.29.2026.11.11.23.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:48:53 -0800 (PST)
From: Aaron Ma <aaron.ma@canonical.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: lenovo-wmi-other: Deconflict battery with thinkpad_acpi
Date: Thu, 12 Nov 2026 15:48:23 +0800
Message-ID: <20261112074823.853819-1-aaron.ma@canonical.com>
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
table check when the corresponding driver is enabled in Kconfig, and
update the force_load_psy_ext description accordingly.

Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery charge limiting")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
Changes in v2:
- Consolidate IdeaPad and ThinkPad deconfliction into a table of ACPI
  device IDs, method pairs, and driver configuration checks, as suggested
  by Derek J. Clark.
- Check GBMD and SBMC for IdeaPads, and BDSG and BICG for ThinkPads,
  instead of relying only on ThinkPad ACPI device presence.
- Check whether the corresponding driver is enabled before looking up
  its ACPI device, including for ideapad_laptop.
- Update the force_load_psy_ext description to cover both drivers.

v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285-1-aaron.ma@canonical.com/

 drivers/platform/x86/lenovo/wmi-other.c | 51 ++++++++++++++++++-------
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index bd64e7b44669d..14b2c3f4cc7ae 100644
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
@@ -905,17 +905,32 @@ static acpi_status lwmi_acpi_match(acpi_handle handle, u32 lvl,
 	return AE_CTRL_TERMINATE;
 }
 
+struct lwmi_psy_deconflict {
+	const char *hid;
+	char * const *methods;
+	bool driver_enabled;
+};
+
+static char * const lwmi_ideapad_psy_methods[] = { "GBMD", "SBMC" };
+static char * const lwmi_thinkpad_psy_methods[] = { "BDSG", "BICG" };
+
+static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] = {
+	{ "VPC2004", lwmi_ideapad_psy_methods, IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) },
+	{ "LEN0268", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPAD_ACPI) },
+	{ "LEN0068", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPAD_ACPI) },
+	{ "IBM0068", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPAD_ACPI) },
+};
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
 	int ret;
 
@@ -928,14 +943,24 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
 	if (force_load_psy_ext)
 		goto load_psy_ext;
 
-	/* Deconflict ideapad_laptop driver */
-	ret = acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
-	if (ret)
-		return;
+	for (unsigned int i = 0; i < ARRAY_SIZE(lwmi_psy_deconflict_list); i++) {
+		const struct lwmi_psy_deconflict *entry = &lwmi_psy_deconflict_list[i];
+		acpi_handle handle = NULL;
 
-	if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")) {
-		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for device\n");
-		return;
+		if (!entry->driver_enabled)
+			continue;
+
+		ret = acpi_get_devices(entry->hid, lwmi_acpi_match, &handle, NULL);
+		if (ret || !handle)
+			continue;
+
+		if (acpi_has_method(handle, entry->methods[0]) &&
+		    acpi_has_method(handle, entry->methods[1])) {
+			dev_dbg(&priv->wdev->dev,
+				"ACPI device %s manages battery for device\n",
+				entry->hid);
+			return;
+		}
 	}
 
 load_psy_ext:
-- 
2.53.0

