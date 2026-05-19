Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A7D33263B
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 18:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214349; cv=none; b=eueBIymHfUVS2xmG3Ee7sIHrYYtt3S5cPDUbBNdsRZdt1BveHCZZnx41+Tif0wLz19c1Nn+VAz/js6BxS+JyYFtBEaOPzxMAydSUrNrCgSKfBRXRHauuY3As7VIdWtO03wl1qqOb+Y1GkzjTteJewFSXOllKWTEjpiEY2LjalRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214349; c=relaxed/simple;
	bh=w4W6Zjlrq4b6NVhLu8PWjZTUveZk4t9W/NdcR4mnQxM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PRLR6YkCpd5AQhLvGj/L47vpYsAEpY332I4hDGpVKuDhYssazmceLfZxn+8HxEm6VDiyxgToXbdT2M2mgzAS0BbzsTTytIjwydOi0Om81DYa2+wBfOoXU5Rlzy8l/NDko/YEC8Y17NnJFFkQ4s2g1zR1IBLE1hOrIBdJEOv2lyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev; spf=pass smtp.mailfrom=ghoul.dev; dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b=PvszhYKV; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b="PvszhYKV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail; t=1779214337; x=1779473537;
	bh=TUeVO854xtbiDXYfeCWZtN/kepqA3wY04QqkF0q0rV0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PvszhYKVkPKDQ04YbQhhpudg5I/00cwBCOM7bKWE0BgCLVIyA7vbTI7BBrYOiVElV
	 YbDGcm1ngT46VjdI0uISMyU4CPiYlj5/0eVT9GDakqqyqsuoDlL1Yl1pp9oS3Hc2Oh
	 qO9JtsefsmgYgn+RXbcmVNnxeHgsDsJ7LROGbIDF6Nq3xXSx234BNmgPfnJ6toAPON
	 FjE1QH0Jidjum0ZYQDkot8xY1Ir36Ee8u54Y968hpnfAWz2qQdKSTorKD5tafX8RUv
	 +ZW8O0SHt0nKNxwP0Gqpp1lkuHhemLXcOltVw9tX+iFKbgLrm7YXkx5wdkvElThx1P
	 ZAJzvhMHqz7RA==
Date: Tue, 19 May 2026 18:12:13 +0000
To: Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello <superm1@kernel.org>, Ahmed Yaseen <yaseen@ghoul.dev>
Subject: [PATCH v3 1/1] platform/x86: asus-armoury: gate PPT writes behind active fan curve
Message-ID: <20260519181155.46044-2-yaseen@ghoul.dev>
In-Reply-To: <20260519181155.46044-1-yaseen@ghoul.dev>
References: <20260519181155.46044-1-yaseen@ghoul.dev>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: c567c24240fd49c6811d64e5f6dbc7dc371c1847
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On models flagged with requires_fan_curve in the DMI power_data table
(30 entries), the BIOS ACPI method SPLX only writes PPT values to the
EC when the fan mode is set to Manual (FANM=3D4). FANM is set to 4 by
the DEFC method when a custom fan curve is written. Without an active
custom fan curve, the WMI DEVS call returns success but the firmware
silently ignores the PPT value, so userspace observes no effect from
its write.

Gate writes to ASUS_WMI_DEVID_PPT_{PL1_SPL,PL2_SPPT,PL3_FPPT,APU_SPPT,
PLAT_SPPT} on a check of asus_wmi_custom_fan_curve_is_enabled(), and
return -EBUSY with a pr_warn_once() when no fan curve is active on an
affected model. Export the helper from asus-wmi so asus-armoury can
call it across module boundaries.

Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
---
 drivers/platform/x86/asus-armoury.c        | 20 ++++++++++++++++++
 drivers/platform/x86/asus-wmi.c            | 24 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  5 +++++
 3 files changed, 49 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asu=
s-armoury.c
index 5b0987ccc270..f094b70fa1f0 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -93,6 +93,8 @@ struct asus_armoury_priv {
=20
 =09u32 mini_led_dev_id;
 =09u32 gpu_mux_dev_id;
+
+=09bool requires_fan_curve;
 };
=20
 static struct asus_armoury_priv asus_armoury =3D {
@@ -216,6 +218,22 @@ static int armoury_set_devstate(struct kobj_attribute =
*attr,
 =09u32 result;
 =09int err;
=20
+=09/* On some models, PPT changes require an active fan curve */
+=09if (asus_armoury.requires_fan_curve) {
+=09=09switch (dev_id) {
+=09=09case ASUS_WMI_DEVID_PPT_PL1_SPL:
+=09=09case ASUS_WMI_DEVID_PPT_PL2_SPPT:
+=09=09case ASUS_WMI_DEVID_PPT_PL3_FPPT:
+=09=09case ASUS_WMI_DEVID_PPT_APU_SPPT:
+=09=09case ASUS_WMI_DEVID_PPT_PLAT_SPPT:
+=09=09=09if (!asus_wmi_custom_fan_curve_is_enabled()) {
+=09=09=09=09pr_warn_once("PPT change requires an active fan curve on this =
model. Enable a custom fan curve first.\n");
+=09=09=09=09return -EBUSY;
+=09=09=09}
+=09=09=09break;
+=09=09}
+=09}
+
 =09/*
 =09 * Prevent developers from bricking devices or issuing dangerous
 =09 * commands that can be difficult or impossible to recover from.
@@ -1002,6 +1020,8 @@ static void init_rog_tunables(void)
 =09=09return;
 =09}
=20
+=09asus_armoury.requires_fan_curve =3D power_data->requires_fan_curve;
+
 =09/* Initialize AC power tunables */
 =09ac_limits =3D power_data->ac_data;
 =09if (ac_limits) {
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wm=
i.c
index 80144c412b90..e4c1716d9b30 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -4001,6 +4001,30 @@ static int asus_wmi_custom_fan_curve_init(struct asu=
s_wmi *asus)
 =09return 0;
 }
=20
+/*
+ * Returns true if at least one custom fan curve is active
+ *
+ * Used by asus-armoury to check if PPT writes will be accepted by the BIO=
S
+ * on models that require an active fan curve for TDP changes.
+ */
+bool asus_wmi_custom_fan_curve_is_enabled(void)
+{
+=09struct fan_curve_data *curves;
+=09struct asus_wmi *asus;
+
+=09guard(spinlock_irqsave)(&asus_ref.lock);
+=09asus =3D asus_ref.asus;
+=09if (!asus)
+=09=09return false;
+
+=09curves =3D asus->custom_fan_curves;
+
+=09return (asus->cpu_fan_curve_available && curves[FAN_CURVE_DEV_CPU].enab=
led) ||
+=09       (asus->gpu_fan_curve_available && curves[FAN_CURVE_DEV_GPU].enab=
led) ||
+=09       (asus->mid_fan_curve_available && curves[FAN_CURVE_DEV_MID].enab=
led);
+}
+EXPORT_SYMBOL_NS_GPL(asus_wmi_custom_fan_curve_is_enabled, "ASUS_WMI");
+
 /* Throttle thermal policy ***********************************************=
*****/
 static int throttle_thermal_policy_write(struct asus_wmi *asus)
 {
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/pla=
tform_data/x86/asus-wmi.h
index 554f41b827e1..5d57293ced6c 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -196,6 +196,7 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u=
32 arg1, u32 *retval);
 int asus_hid_register_listener(struct asus_hid_listener *cdev);
 void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
 int asus_hid_event(enum asus_hid_event event);
+bool asus_wmi_custom_fan_curve_is_enabled(void);
 #else
 static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
 {
@@ -227,6 +228,10 @@ static inline int asus_hid_event(enum asus_hid_event e=
vent)
 {
 =09return -ENODEV;
 }
+static inline bool asus_wmi_custom_fan_curve_is_enabled(void)
+{
+=09return false;
+}
 #endif
=20
 #endif=09/* __PLATFORM_DATA_X86_ASUS_WMI_H */
--=20
2.54.0


