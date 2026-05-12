Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DCE376BCA
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 15:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778598935; cv=none; b=jSDFgXAB1hiNUAKZOcc3C8k2cOxVuVfhiGlfEd4UyrCokYCY7Alcpuvck1q5I+sLihQ60bKyiw4Fa6sqntvGIl6bHQZrGmjL2iJOyrN0qk6tuu15sRAqRy2c/RBlN2S2WSfIyPq9BCydYZcOiyKzzfEHLXKjEMyMpxm/10G/Pe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778598935; c=relaxed/simple;
	bh=SVn7+YO7Wx5BKTRirXwXO+/n+yCEp+vE33eAJV9iCu4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=lvY0LDdFr6zgY18kLR03VcgQzdbdFOBC0vFf8lb1HS4i/+Pdn+RDAq+EgVb2+Up3a2rIiJIEax+abzr6hQsSby5kuUzEm2A5I8E0KoMlfVIm0cjagsPPqlSRHU7UMIJ5jSKhet4b08vOmfCyRTYr5bzUQLcJQQ81QJZ2sJxZdhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qo5XLeR9; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qo5XLeR9"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ef38cf04f0so8602254eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 08:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778598933; x=1779203733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XeeTzoEvwlbKB6SSwyl86jSeoPq6oCA5sU9F3LOv8ws=;
        b=qo5XLeR9KIxW6KTIAyImoQxhuxCG47jOibAVnAmu0ppbU7K0AVGrA4VC7zW2crs4K4
         o+3j4s0lnktTdPMgh+T7rwmwnw2OXO0+TUycb+1B7idQz8Z48QsxJmqI6+B6gT7vaAly
         PHqF//qjWhWzmdmp5SSqci9vXdLFFBSpTpzlN/3IKn4Bhb4fJjm7dELmIrLgMM/99Jot
         eUNkGKRFOBk4al27XWAAt5fATGGf5cSx9ujrlVRe1YRmFL+DLHRY2patKJdAFu3VGk4A
         HblBi/7/NKxRtErTMhGayhsXRFfdnYvAly5a5D2lzPqHosKUG6WrCPwPyH2rXBC2lj2H
         EgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778598933; x=1779203733;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XeeTzoEvwlbKB6SSwyl86jSeoPq6oCA5sU9F3LOv8ws=;
        b=pFpi7ORQgokz2Ni/dgvfsfZjDNPJuM5zQURusztIPAYrF3+OHo8FMHwhQxB8wmf0Md
         LeM1MpB4uia0EeDjHOZ8L0jWzXuOjy7qaGYcDMk/YdjPQCn8Opr6HKvqJixsw9Ryx1Qk
         ETXwoGjNFNFvD/xOFGlYHM5gcYP306acCeVocYiQnrHFprgitzqrAViYV4v3tC51AN4C
         JwNW/BH2NOmU6XfHB6dca/purUY51zACXukF10v8rQ97xCQxpLJc4/NAmNwTEy/yPp8N
         dLKrxy0/Hx11WVvL2QbNuSGUrTWv1u6RjPJANZAB2tIAfNBnr7qTipbzD7MhRqq4A/Ag
         5isA==
X-Forwarded-Encrypted: i=1; AFNElJ/rnnWJAYvr3v+9vhJHZkRXcIEl/Gn30mTfcPzPeEBuNqWHX+yf3IQCMqDdMXUU4PP0rUjzIr0ikeDdTm3unAAOnlWl@vger.kernel.org
X-Gm-Message-State: AOJu0YxeFxXUc6bVes8cxFVBbm7t+CAs+QY6LjNnyAdtz91OndVohXyD
	V0rwn/lXMhLXJ5GlpttzSgiNmA9lD1JjpeqoTJ1uFCUA2V8ACfsIYmJI
X-Gm-Gg: Acq92OFmrZEz9Ye9UDHZW43HbfN6NrFWcQpzq3hIcW+O2re3D4FBGCAJ27jPLIEkyZx
	m3cYf7IQR3B1CdANWglB8DIlXO3atmR4it2zHQ2XqFFpjqnt+8loyX1jtRKXS4gbqnf8eapTElZ
	MKCAQMhRX9edzAL66WRgZEOlua9oNowdGfJuyWLylpk2DsIJTIyJLgyaNjA9h5nbB9/1oCQ1E/+
	+koNhrn3/kgKwmJ7IXHzqdi9ZZRpeS5o9hHSewNKA4NyDbzqGJPiubOJSijGJkBZxnt7GGuq0PK
	ZcIigbyDyaJzGNNpGctrsNdarpTPd0Hcl5pHjzcVoVDPAxqTIO2+wSPwffivQkHDJDwkPRN48R2
	rDENPZIABsFVt+GzLixuZJgHLfCrQjgXEIQrm2KyxOEpGVYuMlLVbi3hz/lClicqH1Ax0hbHN3P
	P6MA+iwFR1W7CjrI4DwPPbmLZF/ofitoSZdwIIY76KBsfFi33+loKdeQ==
X-Received: by 2002:a05:7301:5f02:b0:2f5:6dfc:cb6d with SMTP id 5a478bee46e88-2fb3e2cf016mr8353464eec.11.1778598933216;
        Tue, 12 May 2026 08:15:33 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2607:fb90:8b60:89af:ad3:e552:812a:cc1f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8893441absm24257042eec.31.2026.05.12.08.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 08:15:32 -0700 (PDT)
Date: Tue, 12 May 2026 08:15:29 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Ahmed Yaseen <yaseen@ghoul.dev>, platform-driver-x86@vger.kernel.org
CC: yaseen@ghoul.dev, corentin.chary@gmail.com, luke@ljones.dev,
 denis.benato@linux.dev, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 prasanth.ksr@dell.com, mpearson-lenovo@squebb.ca,
 Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org,
 asus-linux@lists.linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/2=5D_platform/x86=3A_asus-armour?=
 =?US-ASCII?Q?y=3A_gate_PPT_writes_behind_active_fan_curve?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260511061901.907540-2-yaseen@ghoul.dev>
References: <20260511061901.907540-1-yaseen@ghoul.dev> <20260511061901.907540-2-yaseen@ghoul.dev>
Message-ID: <EBE34D4E-ED27-4F51-8647-3D3F6F41AAB6@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 10, 2026 11:19:30 PM PDT, Ahmed Yaseen <yaseen@ghoul=2Edev> wrote:
>On models flagged with requires_fan_curve in the DMI power_data table
>(28 entries), the BIOS ACPI method SPLX only writes PPT values to the
>EC when the fan mode is set to Manual (FANM=3D4)=2E FANM is set to 4 by
>the DEFC method when a custom fan curve is written=2E Without an active
>custom fan curve, the WMI DEVS call returns success but the firmware
>silently ignores the PPT value, so userspace observes no effect from
>its write=2E
>
>Gate writes to ASUS_WMI_DEVID_PPT_{PL1_SPL,PL2_SPPT,PL3_FPPT,APU_SPPT,
>PLAT_SPPT} on a check of asus_wmi_custom_fan_curve_is_enabled(), and
>return -ENODEV with a pr_warn() when no fan curve is active on an
>affected model=2E Export the helper from asus-wmi so asus-armoury can
>call it across module boundaries=2E
>
>Signed-off-by: Ahmed Yaseen <yaseen@ghoul=2Edev>
>---
> drivers/platform/x86/asus-armoury=2Ec        | 20 ++++++++++++++++
> drivers/platform/x86/asus-wmi=2Ec            | 28 ++++++++++++++++++++++
> include/linux/platform_data/x86/asus-wmi=2Eh |  5 ++++
> 3 files changed, 53 insertions(+)
>
>diff --git a/drivers/platform/x86/asus-armoury=2Ec b/drivers/platform/x86=
/asus-armoury=2Ec
>index 5b0987ccc270=2E=2E01e552573674 100644
>--- a/drivers/platform/x86/asus-armoury=2Ec
>+++ b/drivers/platform/x86/asus-armoury=2Ec
>@@ -93,6 +93,8 @@ struct asus_armoury_priv {
>=20
> 	u32 mini_led_dev_id;
> 	u32 gpu_mux_dev_id;
>+
>+	bool requires_fan_curve;
> };
>=20
> static struct asus_armoury_priv asus_armoury =3D {
>@@ -216,6 +218,22 @@ static int armoury_set_devstate(struct kobj_attribut=
e *attr,
> 	u32 result;
> 	int err;
>=20
>+	/* On some models, PPT changes require an active fan curve */
>+	if (asus_armoury=2Erequires_fan_curve) {
>+		switch (dev_id) {
>+		case ASUS_WMI_DEVID_PPT_PL1_SPL:
>+		case ASUS_WMI_DEVID_PPT_PL2_SPPT:
>+		case ASUS_WMI_DEVID_PPT_PL3_FPPT:
>+		case ASUS_WMI_DEVID_PPT_APU_SPPT:
>+		case ASUS_WMI_DEVID_PPT_PLAT_SPPT:
>+			if (!asus_wmi_custom_fan_curve_is_enabled()) {
>+				pr_warn("PPT change requires an active fan curve on this model=2E En=
able a custom fan curve first=2E\n");
>+				return -ENODEV;

-EBUSY is more appropriate IMO=2E It lets userspace know the device isn't =
ready for the operation, not that it doesn't exist=2E

- Derek
>+			}
>+			break;
>+		}
>+	}
>+
> 	/*
> 	 * Prevent developers from bricking devices or issuing dangerous
> 	 * commands that can be difficult or impossible to recover from=2E
>@@ -1002,6 +1020,8 @@ static void init_rog_tunables(void)
> 		return;
> 	}
>=20
>+	asus_armoury=2Erequires_fan_curve =3D power_data->requires_fan_curve;
>+
> 	/* Initialize AC power tunables */
> 	ac_limits =3D power_data->ac_data;
> 	if (ac_limits) {
>diff --git a/drivers/platform/x86/asus-wmi=2Ec b/drivers/platform/x86/asu=
s-wmi=2Ec
>index 80144c412b90=2E=2Eb05218d31d90 100644
>--- a/drivers/platform/x86/asus-wmi=2Ec
>+++ b/drivers/platform/x86/asus-wmi=2Ec
>@@ -341,6 +341,9 @@ struct asus_wmi {
> /* Global to allow setting externally without requiring driver data */
> static enum asus_ally_mcu_hack use_ally_mcu_hack =3D ASUS_WMI_ALLY_MCU_H=
ACK_INIT;
>=20
>+/* Global asus_wmi instance for use by exported functions */
>+static struct asus_wmi *asus_wmi_instance;
>+
> #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> static void asus_wmi_show_deprecated(void)
> {
>@@ -4001,6 +4004,28 @@ static int asus_wmi_custom_fan_curve_init(struct a=
sus_wmi *asus)
> 	return 0;
> }
>=20
>+/*
>+ * Returns true if at least one custom fan curve is active
>+ *
>+ * Used by asus-armoury to check if PPT writes will be accepted by the B=
IOS
>+ * on models that require an active fan curve for TDP changes=2E
>+ */
>+bool asus_wmi_custom_fan_curve_is_enabled(void)
>+{
>+	struct asus_wmi *asus =3D asus_wmi_instance;
>+	struct fan_curve_data *curves;
>+
>+	if (!asus)
>+		return false;
>+
>+	curves =3D asus->custom_fan_curves;
>+
>+	return (asus->cpu_fan_curve_available && curves[FAN_CURVE_DEV_CPU]=2Een=
abled) ||
>+	       (asus->gpu_fan_curve_available && curves[FAN_CURVE_DEV_GPU]=2Een=
abled) ||
>+	       (asus->mid_fan_curve_available && curves[FAN_CURVE_DEV_MID]=2Een=
abled);
>+}
>+EXPORT_SYMBOL_NS_GPL(asus_wmi_custom_fan_curve_is_enabled, "ASUS_WMI");
>+
> /* Throttle thermal policy *********************************************=
*******/
> static int throttle_thermal_policy_write(struct asus_wmi *asus)
> {
>@@ -5156,6 +5181,8 @@ static int asus_wmi_add(struct platform_device *pde=
v)
>=20
> 	asus_wmi_debugfs_init(asus);
>=20
>+	asus_wmi_instance =3D asus;
>+
> 	return 0;
>=20
> fail_wmi_handler:
>@@ -5199,6 +5226,7 @@ static void asus_wmi_remove(struct platform_device =
*device)
> 	throttle_thermal_policy_set_default(asus);
> 	asus_wmi_battery_exit(asus);
>=20
>+	asus_wmi_instance =3D NULL;
> 	kfree(asus);
> }
>=20
>diff --git a/include/linux/platform_data/x86/asus-wmi=2Eh b/include/linux=
/platform_data/x86/asus-wmi=2Eh
>index 554f41b827e1=2E=2E5d57293ced6c 100644
>--- a/include/linux/platform_data/x86/asus-wmi=2Eh
>+++ b/include/linux/platform_data/x86/asus-wmi=2Eh
>@@ -196,6 +196,7 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0,=
 u32 arg1, u32 *retval);
> int asus_hid_register_listener(struct asus_hid_listener *cdev);
> void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
> int asus_hid_event(enum asus_hid_event event);
>+bool asus_wmi_custom_fan_curve_is_enabled(void);
> #else
> static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
> {
>@@ -227,6 +228,10 @@ static inline int asus_hid_event(enum asus_hid_event=
 event)
> {
> 	return -ENODEV;
> }
>+static inline bool asus_wmi_custom_fan_curve_is_enabled(void)
>+{
>+	return false;
>+}
> #endif
>=20
> #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */

