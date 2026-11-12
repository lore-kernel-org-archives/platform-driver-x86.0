Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494810;
	b=eULF8/q5vohXO2+/lg8TAh/NcgdCmq0SNpLUzyXJhbSSI51Fov0kCXhYcJhfQJCxjLQg
	 JDev1plk8pzB370gR42I6ahK8MQwuAti/Gx1f/atFOJdAvtOmW6PKm9YcvqILIVrFMEQo
	 YpukU+sNuEpFomK/owTCPQyk+iFR/zoeDH84Stye52QUaxyYIvaKGij9ldNUFs0qqBjhC
	 w0IGhyRLd+DRCbVKkrwQnsmRfbWIypaL61dFAaD8LLFTaS4My6m2IQj+rK/wnuV1TC4Ym
	 2aF4+yGYiQ1mOvxqtUwbhoDNNBvCd48R9vixXldvSIf0nZBaL73Wqn7nmSSty68Sjbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=GW1J6s7aL2zvtC13WpFK94wE9d4airqES1RCBPqtr2M=;
	b=gPGcHNEwz6K8vLCgAEAa2hCo6ii4Q4glVFIc1e5NhVganFgwXqrgs8Pko7+RLC53ccqw
	 zwi6bgeeN4cmn3pWAtXtKJ6t3eOXMFASJ0L+/0HQRqx+a0WFuxrySehkXruaOaEFC5ZOd
	 shSZndZ2uwID3HQIaxD9C9zFuE3kCpU9G2iu4mVYMJ7T0yKB7d8z2q+aCdqErV/rXzHgo
	 lo/UR2zADwB+KiZm/qB54s9PBpmn7h83DjYl1Wd821OwFxBIHpPiIoxqW3oWAv01/QMky
	 hmf7T839Hu5jfdS/scK4QK8jb4o5t2vwQ48S3mOggvUbZC8NycK0fM7P2n+l7/ntAnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B5ie9Sbk;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F6F606A335
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 14:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38F6F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B5ie9Sbk
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36dbde64409so8541408eec.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 06:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494809; x=1795099609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GW1J6s7aL2zvtC13WpFK94wE9d4airqES1RCBPqtr2M=;
        b=B5ie9Sbk0h0ROlG5e70AX9jsL+iKEdl5R+SqOO+0e/f+zcG2//r+6xJSJaXzM7yXmB
         bZgvfZ+iA2nav/8AycjLNu1CizbhripoJ642uoYr4akc+mggEeGuliAIXpvvTeIELebu
         vvh8f3EZjTlIb+HBY+QtvI2Kf889Ei1fVf5Nj5AbQZABx97e4ot0IqJBv0kHaVVP2Pkt
         +rVxIrhMsygSJJr4glSnP/OTNlK61vufHrXiE+jfwW82wKO17ULrO3RLaSVkyvhe0aC+
         ahPcvS3VAY6mJgU6TvtX3cBIC+fPVWfPwJk78TBWJv2ms8TuYcKg0j4Zeg/aNtxqHq6b
         nQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494809; x=1795099609;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GW1J6s7aL2zvtC13WpFK94wE9d4airqES1RCBPqtr2M=;
        b=MsQDGLYjjBn+LDcLFJrOq6HdeFgKMdgvYBEUtkQjm2D+Jdsl3YjzulqUMRKlVhA2Va
         sg9mTxegKviCapeZt/DJIJ1Dp6ntKdAd8WrqfQR7V8lolPn+fRjOPKtodeum5LeQor1G
         zJNvrKiJVbi3pddIAqc9M+urFaeZexqIK2ZssS4PifTXJHOo152/bUfSJRV2gBPuJCAa
         Tx+Kip4LFVpq073J+nzuAuPxbrI/X06COJQgjUWMXjqCwrQwtUik8VWT5EJ56guXsVI+
         MREoWsRGQCC05zXa4Z+6fWlOPux5Yut/s11Dw/sHyzsdS3sv2QmCp1Kr3di8VGEMG2MF
         0c7g==
X-Forwarded-Encrypted: i=1; AL+hErHKEY/isILK70FdlH9NfdXQZpv9pPWFraMxEihDavwHvbkLvAHb4vphyu1QFqz8DQfG6PECLztd6p6k7ERaVrrDH171@vger.kernel.org
X-Gm-Message-State: APuU4Z8aTFfIRqk1g3a5osiy2UpfOBAMZslPCZ7CJKqagKM+T/0FVDRT
	W+29xU6fT1hQwHNuOK3PXYLCEkQQLyOnHIhnpXxbDdMs+RBpvi6nL5sP
X-Gm-Gg: AYBFou1/6xtsKYmEIqhzndQf3oSqiEWR/WeO7TDhYwqKdIe0C5HAal8EVotmmSPU7P5
	26p5uV/qpd+cw0boYO7X8k0iStlmFHrUo9+rO/K416c4y/5zr0Q9MQaUujNPKiJxKPg4QKjBPAF
	qOTDNK+y6UMHuQQcf6IUcJRgc0uYrrlK2kvC2eEZIczkp0Wy9/lQyedoIAvrj3hhgs8Nzf8VdZ7
	iwj6xbX9H6vhUR8jtRfZS3gty13r1ru8bYGcwUhBSwNP1XWLnl/WnkLYK3IlscRxuUefgEXnedn
	bmECHqZx6+ECtPU55HaqdBsSjWAb4WCkuMwt3dL7IZUAoYHvwIN74SFuP5m6eRvCfyu/0D1InWw
	jEk72cj0LEHQs4A5bw2q1GWmtxBUbUxw9mcdz8ietbrbisWUW9QLmTtplMF3rd7vDiL1TJ9m/yw
	PprhMgxYOQyl6sD6VSZnHGfnExzD5QWfEyaijZ/K8T/n35rDeUSGd70pyYk3tKUNVEdi7q+Lgv4
	DokQLR3U6CsGiAh7Plwwtn7zojwzVDkmUPhc1loxpv5zrzPvzbpwiTYmUMTzSoNLz5Tvgvti1Cl
	I+HY/CdBAOKG+tTW7nI3P4YJkA2mngs+diDzLLXux6RYQEKBABpGaHGvaEWA7F8jEXdSBUNr6UA
	K7IW7seQU961X2MHbmCDXSwc=
X-Received: by 2002:a05:7301:470c:b0:36a:12c4:8bd6 with SMTP id 5a478bee46e88-37686171f1bmr5787039eec.22.1794494809135;
        Thu, 12 Nov 2026 06:46:49 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37925e611e4sm285392eec.20.2026.11.12.06.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:46:48 -0800 (PST)
Date: Thu, 12 Nov 2026 06:46:47 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Aaron Ma <aaron.ma@canonical.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Rong Zhang <i@rong.moe>, Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_platform/x86=3A_lenovo-wmi-ot?=
 =?US-ASCII?Q?her=3A_Deconflict_battery_with_thinkpad=5Facpi?=
User-Agent: Thunderbird for Android
In-Reply-To: <20261112074823.853819-1-aaron.ma@canonical.com>
References: <20261112074823.853819-1-aaron.ma@canonical.com>
Message-ID: <68B20AF1-0037-4810-98B8-49E3CBF17E92@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 11, 2026 11:48:23 PM PST, Aaron Ma <aaron=2Ema@canonical=2Ecom>=
 wrote:
>ThinkPads expose battery charge thresholds and charge_behaviour through
>thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups=2E The
>Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
>charge_behaviour and charge_types on systems advertising those WMI
>capabilities=2E
>
>When lenovo-wmi-other registers first, thinkpad_acpi fails to create a
>duplicate charge_behaviour sysfs attribute and unregisters its battery
>extension=2E Conversely, registering or updating any power_supply_ext on
>the same battery runs sysfs_update_groups(), which removes standard
>power-supply attributes not owned by power_supply_core and wipes out
>thinkpad_acpi's charge_control_start_threshold,
>charge_control_end_threshold, and charge_behaviour files=2E
>
>Deconflict both ideapad_laptop (VPC2004 with GBMD and SBMC) and
>thinkpad_acpi (LEN0268, LEN0068, or IBM0068 with BDSG and BICG) via a
>table check when the corresponding driver is enabled in Kconfig, and
>update the force_load_psy_ext description accordingly=2E
>
>Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery ch=
arge limiting")
>Signed-off-by: Aaron Ma <aaron=2Ema@canonical=2Ecom>

Hi Aaron,

Looks good, thanks=2E I'll test it in a couple of days=2E I have one quest=
ion below but it's not blocking for me, I just want to check my assumption =
is correct=2E

Reviewed-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>

>---
>Changes in v2:
>- Consolidate IdeaPad and ThinkPad deconfliction into a table of ACPI
>  device IDs, method pairs, and driver configuration checks, as suggested
>  by Derek J=2E Clark=2E
>- Check GBMD and SBMC for IdeaPads, and BDSG and BICG for ThinkPads,
>  instead of relying only on ThinkPad ACPI device presence=2E
>- Check whether the corresponding driver is enabled before looking up
>  its ACPI device, including for ideapad_laptop=2E
>- Update the force_load_psy_ext description to cover both drivers=2E
>
>v1: https://lore=2Ekernel=2Eorg/platform-driver-x86/20261111083529=2E7272=
85-1-aaron=2Ema@canonical=2Ecom/
>
> drivers/platform/x86/lenovo/wmi-other=2Ec | 51 ++++++++++++++++++-------
> 1 file changed, 38 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/platform=
/x86/lenovo/wmi-other=2Ec
>index bd64e7b44669d=2E=2E14b2c3f4cc7ae 100644
>--- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>+++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>@@ -189,10 +189,10 @@ MODULE_PARM_DESC(relax_fan_constraint,
> static bool force_load_psy_ext;
> module_param(force_load_psy_ext, bool, 0444);
> MODULE_PARM_DESC(force_load_psy_ext,
>-	"This option will skip checking if the ideapad_laptop driver will confl=
ict "
>+	"This option will skip checking if the ideapad_laptop or thinkpad_acpi =
driver will conflict "
> 	"with adding an extension to set the battery charge behavior and batter=
y charge "
> 	"control end threshold=2E It will also skip checking if the BIOS report=
s that "
>-	"those features are fully supported=2E It is recommended to blacklist t=
he ideapad "
>+	"those features are fully supported=2E It is recommended to blacklist t=
he conflicting "
> 	"driver before using this option=2E");
>=20
> /* =3D=3D=3D=3D=3D=3D=3D=3D HWMON (component: lenovo-wmi-capdata 00 & fa=
n) =3D=3D=3D=3D=3D=3D=3D=3D */
>@@ -905,17 +905,32 @@ static acpi_status lwmi_acpi_match(acpi_handle hand=
le, u32 lvl,
> 	return AE_CTRL_TERMINATE;
> }
>=20
>+struct lwmi_psy_deconflict {
>+	const char *hid;
>+	char * const *methods;
>+	bool driver_enabled;
>+};
>+
>+static char * const lwmi_ideapad_psy_methods[] =3D { "GBMD", "SBMC" };
>+static char * const lwmi_thinkpad_psy_methods[] =3D { "BDSG", "BICG" };
>+
>+static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] =3D {
>+	{ "VPC2004", lwmi_ideapad_psy_methods, IS_ENABLED(CONFIG_IDEAPAD_LAPTOP=
) },
>+	{ "LEN0268", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPAD_ACPI=
) },
>+	{ "LEN0068", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPAD_ACPI=
) },
>+	{ "IBM0068", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPAD_ACPI=
) },
>+};
>+
> /**
>  * lwmi_om_psy_ext_init() - Hooks power supply extension to device batte=
ry
>  * @priv: Pointer to the lwmi_om_priv drvdata=2E
>  *
>- * Checks if the ideapad_laptop driver is going to manage charge attribu=
tes first,
>- * then if not, hooks the battery to our WMI methods if they are support=
ed=2E
>+ * Checks if the ideapad_laptop or thinkpad_acpi driver is going to mana=
ge
>+ * charge attributes first, then if not, hooks the battery to our WMI me=
thods
>+ * if they are supported=2E
>  */
> static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
> {
>-	static const char * const ideapad_hid =3D "VPC2004";
>-	acpi_handle handle =3D NULL;

I'm assuming this was moved to avoid handling cleanup each loop?

Thanks,=20
- Derek

> 	unsigned int props =3D 0;
> 	int ret;
>=20
>@@ -928,14 +943,24 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_pri=
v *priv)
> 	if (force_load_psy_ext)
> 		goto load_psy_ext;
>=20
>-	/* Deconflict ideapad_laptop driver */
>-	ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
>-	if (ret)
>-		return;
>+	for (unsigned int i =3D 0; i < ARRAY_SIZE(lwmi_psy_deconflict_list); i+=
+) {
>+		const struct lwmi_psy_deconflict *entry =3D &lwmi_psy_deconflict_list[=
i];
>+		acpi_handle handle =3D NULL;
>=20
>-	if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(handle=
, "SBMC")) {
>-		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for d=
evice\n");
>-		return;
>+		if (!entry->driver_enabled)
>+			continue;
>+
>+		ret =3D acpi_get_devices(entry->hid, lwmi_acpi_match, &handle, NULL);
>+		if (ret || !handle)
>+			continue;
>+
>+		if (acpi_has_method(handle, entry->methods[0]) &&
>+		    acpi_has_method(handle, entry->methods[1])) {
>+			dev_dbg(&priv->wdev->dev,
>+				"ACPI device %s manages battery for device\n",
>+				entry->hid);
>+			return;
>+		}
> 	}
>=20
> load_psy_ext:

