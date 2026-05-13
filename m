Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DFA38C2D1
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 15:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687278; cv=none; b=Wup2upVTJXyspGFVD+hBP21ZbKNviS79Bo9BFa8VC37tOFV3h5gNLr+zncBdkTEVYfUDa9G5acrTiLCQFqSCqLBkVOTohHWifa6LyXeustuaw37OwY4KqGtpOtDd/jZwuEWbtZaolp2MxRBbW+2jmlEUaAqR2YZ43NH0q/R6vGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687278; c=relaxed/simple;
	bh=JW806Mza6/CGzprvTIZwHv4oY2J8KIsQUYgVYzwFzJs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B1wdSj80LABfcdl6ueRc3n+5rJrgbQ7KuRqlL2u/pJGbXDBPGSnZfxjypr3S09XizNcIRmhPnmSaQk+RYEJS/z17SMkN6vtegqtob4Tm2XL4W/otvp6+41KyFoqMFi5dm2ImuHO116dzsQFphnRVsHYEGMLvbJuB0uTeswvDO/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev; spf=pass smtp.mailfrom=ghoul.dev; dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b=s4KYwpTp; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b="s4KYwpTp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail; t=1778687260; x=1778946460;
	bh=6vidsa8RmgfNvZCWuhwkcXTsNAc0VFs/m9IdhIXPQhk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=s4KYwpTphz0g86lZBiRvtVQAe5iXJUoHbcW/Bc68qAtdAn8iz+Bm2xHM2kY+oxfb2
	 LBa8Mqz1o5OCO2hJyJWwY6QfIAjXMsXkg774gtM22BdUZEAx4MwlJPJ2J0p8kgcxeP
	 c/LesRhpHccU6YbGSp02v5ch51srLf42IgWry4SYEZP88Pvjcp8n7BgpMEYH1yqn1e
	 1Azgk42VqNk6V8M2tQNyUrKwuFHOZaHLKemQxn6gAsiwSiNADJzTktux/ngH+hoCmn
	 r7gIyxAYRjfRdV/2T1+5D+AUh3mU+ylwLPENWNNceq0PfSIRDbElwL2UMalRN0rRzl
	 eiGhDysSCTaAQ==
Date: Wed, 13 May 2026 15:47:33 +0000
To: platform-driver-x86@vger.kernel.org
From: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: yaseen@ghoul.dev, corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, derekjohn.clark@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, prasanth.ksr@dell.com, mpearson-lenovo@squebb.ca, Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] platform/x86: asus-armoury: gate PPT writes behind active fan curve
Message-ID: <20260513154714.25160-2-yaseen@ghoul.dev>
In-Reply-To: <20260511061901.907540-1-yaseen@ghoul.dev>
References: <20260511061901.907540-1-yaseen@ghoul.dev>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: 195c003e991b27a121709d9a8b76b890bff10f70
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On models flagged with requires_fan_curve in the DMI power_data table
(28 entries), the BIOS ACPI method SPLX only writes PPT values to the
EC when the fan mode is set to Manual (FANM=3D4). FANM is set to 4 by
the DEFC method when a custom fan curve is written. Without an active
custom fan curve, the WMI DEVS call returns success but the firmware
silently ignores the PPT value, so userspace observes no effect from
its write.

Gate writes to ASUS_WMI_DEVID_PPT_{PL1_SPL,PL2_SPPT,PL3_FPPT,APU_SPPT,
PLAT_SPPT} on a check of asus_wmi_custom_fan_curve_is_enabled(), and
return -EBUSY with a pr_warn() when no fan curve is active on an
affected model. Export the helper from asus-wmi so asus-armoury can
call it across module boundaries.

Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
---
 drivers/platform/x86/asus-armoury.c        | 20 ++++++++++++++++
 drivers/platform/x86/asus-wmi.c            | 28 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  5 ++++
 3 files changed, 53 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asu=
s-armoury.c
index 5b0987ccc270..9b1c41a25b38 100644
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
+=09=09=09=09pr_warn("PPT change requires an active fan curve on this model=
. Enable a custom fan curve first.\n");
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
index 80144c412b90..b05218d31d90 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -341,6 +341,9 @@ struct asus_wmi {
 /* Global to allow setting externally without requiring driver data */
 static enum asus_ally_mcu_hack use_ally_mcu_hack =3D ASUS_WMI_ALLY_MCU_HAC=
K_INIT;
=20
+/* Global asus_wmi instance for use by exported functions */
+static struct asus_wmi *asus_wmi_instance;
+
 #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 static void asus_wmi_show_deprecated(void)
 {
@@ -4001,6 +4004,28 @@ static int asus_wmi_custom_fan_curve_init(struct asu=
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
+=09struct asus_wmi *asus =3D asus_wmi_instance;
+=09struct fan_curve_data *curves;
+
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
@@ -5156,6 +5181,8 @@ static int asus_wmi_add(struct platform_device *pdev)
=20
 =09asus_wmi_debugfs_init(asus);
=20
+=09asus_wmi_instance =3D asus;
+
 =09return 0;
=20
 fail_wmi_handler:
@@ -5199,6 +5226,7 @@ static void asus_wmi_remove(struct platform_device *d=
evice)
 =09throttle_thermal_policy_set_default(asus);
 =09asus_wmi_battery_exit(asus);
=20
+=09asus_wmi_instance =3D NULL;
 =09kfree(asus);
 }
=20
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


