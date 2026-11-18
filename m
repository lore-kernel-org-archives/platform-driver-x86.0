Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795002897;
	b=lmWzKeCZqMvNl/wEQ/uumTFU6HzehMcVKxBG6L9WNzOhCujJzMhBSR8irOpDD6Cnwx1A
	 dGINXPtE3dZ0TE/ewkQ7n4hthLYVjnS92beCb0owo18/pDcAxqQKgvKA3CPFo2SlOGPqw
	 S9yOdYYTNUa3Q5V5leMVVK/AfadsLc+ogqYpQBBY54d3ELvR59mc50cttn7tF714a4Trs
	 /6I7ARRKO0yqG7dCL6mq19vI8gTBvORdep3B1iJxWrhpfSV9qPnOl6NGTE/hONnw3gdbD
	 0swsUpAP78AJ+JIASGtpZ1SNZOBgD/cKQLOhFhsOFMHJGYqGY4CjleIBoBHtw2X4HEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002897;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=qEycYkVKBZ6AFwtyn7K8dWaa7W+xI0dgQEc7SQN+y1k=;
	b=hwUNFjGcZ3t5QuCcHUksiFaYkEGBQjJDfvFtJifK3w9Ls2H7kCkr7p+V68reQ6rgadzz
	 c8VbWf3vSkronBakfO+mwbq8BCV8/UT3hyDW63SFD8XhtPHSwhAtWIGuzw1Gl0XhMGTIN
	 IN9nm3MRvpIKTfUGxzBs26i6XLoOnoOH+bnvAzYpus0LFNfitvqRY+RbubOIQSIgX3xLa
	 Zsp9BVG4mEy1JNJ9A9rp3qcqiXqnDLZemstD5eyyEVslLYEBv7oaQOxOO6lgRE1UgyOc+
	 kJ4untcFvSCAwwdxkEh5AkKxNp8+nAs2qMg5gQfS/H7bjCoWMpikQWxo+hLo8a3o61w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=C4Wq3bp1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DF0606A320;
	Wed, 18 Nov 2026 11:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37DF0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=C4Wq3bp1
ARC-Seal: i=1; a=rsa-sha256; t=1795002881; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TKAvjCM5TlttLfeI6jjAFhKAqbrX5+HKbWZoHs+kY6GZ/ymzDoJOOsCT5VXlyPwy+LgcPiTC2F7VIM5QfuQg0FI/jRIr4RBtV8ka0RWQXaGGxWMoZ9Ao0M4mHCmqRpniIPcaLn54DCvbiPhh0z4trrpD1LBLGStNuVJLu+CfhRI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795002881; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qEycYkVKBZ6AFwtyn7K8dWaa7W+xI0dgQEc7SQN+y1k=; 
	b=k4Hwi39ALzrI+xZ/VF7HtWWuuPNL/eREPBhqD1vC3oxwuUPecEPFfVPX20wBzXqcWQOxnuL0eIIAkB2ETC8F3yPaC+0DUQ5kF0uo1N+qis/nSptNLELp+JJiNHjfmg5a/emlbw4Q5Ejqhkjq0uMT3rASMTFQeV+Z88qnpTBcWIo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=C4Wq3bp1GCbIJv9TsOy/47/TT+kiHG0G3qVgkxZDu65wJPw1OD2SdYjb7bYP+fDhZWBN4k4ZnyHkqnoB9uXv9JG7U678A0s07G3MVpUBUi2N9z/8mGMrj0CCCZSaA9UFxYKMDpKSBnPxUYLY1iJ8gFzqYQFTK5O0wQtqfo3E9vUAofkxMNvTNdk+AMxMyRNfQd9mTqPpi3KBAEOX8b3EhJ3GroGIJJYS43WfXbrfi4i73UpU4HR8Ip/1rXpMQdu4hja+ACRrdozlx3iegHCQ8GifMhvQMm7H8tMbiBwLhxTAqsOcmqKY6QzdvbQoH+RvAyTA2Be4auvOKvYme4qUbg==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=qEycYkVKBZ6AFwtyn7K8dWaa7W+xI0dgQEc7SQN+y1k=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795002878859924.8127584992199;
	Wed, 18 Nov 2026 03:54:38 -0800 (PST)
Message-ID: <5a31d0457534bafc37f8a84c02720ba5f4515180.camel@rong.moe>
Subject: Re: [PATCH v3] platform/x86: lenovo-wmi-other: Deconflict battery
 with thinkpad_acpi
From: Rong Zhang <i@rong.moe>
To: Aaron Ma <aaron.ma@canonical.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark"
	 <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <CAJ6xRxVLMmK6Vk8h8FYbeuDSKhd_hhN=HKEkF=E5CUisimKtZw@mail.gmail.com>
References: <20261113055726.952551-1-aaron.ma@canonical.com>
	 <b4feb4ce-d818-c6b0-a749-4e58b92c2573@linux.intel.com>
	 <CAJ6xRxVLMmK6Vk8h8FYbeuDSKhd_hhN=HKEkF=E5CUisimKtZw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 19:49:32 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi Aaron,

On Wed, 2026-11-18 at 14:27 +0800, Aaron Ma wrote:
> Hi,
>=20
> On Fri, Nov 13, 2026 at 7:04=E2=80=AFPM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >=20
> > On Fri, 13 Nov 2026, Aaron Ma wrote:
> >=20
> > > ThinkPads expose battery charge thresholds and charge_behaviour throu=
gh
> > > thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups. T=
he
> > > Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
> > > charge_behaviour and charge_types on systems advertising those WMI
> > > capabilities.
> > >=20
> > > When lenovo-wmi-other registers first, thinkpad_acpi fails to create =
a
> > > duplicate charge_behaviour sysfs attribute and unregisters its batter=
y
> > > extension. Conversely, registering or updating any power_supply_ext o=
n
> > > the same battery runs sysfs_update_groups(), which removes standard
> > > power-supply attributes not owned by power_supply_core and wipes out
> > > thinkpad_acpi's charge_control_start_threshold,
> > > charge_control_end_threshold, and charge_behaviour files.
> > >=20
> > > Deconflict both ideapad_laptop (VPC2004 with GBMD and SBMC) and
> > > thinkpad_acpi (LEN0268, LEN0068, or IBM0068 with BDSG and BICG) via a
> > > per-driver table guarded by IS_ENABLED() in Kconfig, and update the
> > > force_load_psy_ext description accordingly.
> > >=20
> > > Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI batter=
y charge limiting")
> > > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > Co-developed-by: Rong Zhang <i@rong.moe>
> > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> > > ---
> > > Changes in v3:
> > > - Wrap deconfliction table entries in #if IS_ENABLED(CONFIG_*) and dr=
op
> > >   driver_enabled, as suggested by Rong Zhang.
> > > - Group deconfliction entries per driver (HIDs list + methods list).
> > >=20
> > > Changes in v2:
> > > - Consolidate IdeaPad and ThinkPad deconfliction into a table of ACPI
> > >   device IDs, method pairs, and driver configuration checks, as sugge=
sted
> > >   by Derek J. Clark.
> > > - Check GBMD and SBMC for IdeaPads, and BDSG and BICG for ThinkPads,
> > >   instead of relying only on ThinkPad ACPI device presence.
> > > - Check whether the corresponding driver is enabled before looking up
> > >   its ACPI device, including for ideapad_laptop.
> > > - Update the force_load_psy_ext description to cover both drivers.
> > >=20
> > > v2: https://lore.kernel.org/platform-driver-x86/20261112074823.853819=
-1-aaron.ma@canonical.com/
> > > v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285=
-1-aaron.ma@canonical.com/
> > >=20
> > >  drivers/platform/x86/lenovo/wmi-other.c | 66 ++++++++++++++++++++---=
--
> > >  1 file changed, 53 insertions(+), 13 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platfo=
rm/x86/lenovo/wmi-other.c
> > > index bd64e7b44669d..340159df5f7cc 100644
> > > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > > @@ -189,10 +189,10 @@ MODULE_PARM_DESC(relax_fan_constraint,
> > >  static bool force_load_psy_ext;
> > >  module_param(force_load_psy_ext, bool, 0444);
> > >  MODULE_PARM_DESC(force_load_psy_ext,
> > > -     "This option will skip checking if the ideapad_laptop driver wi=
ll conflict "
> > > +     "This option will skip checking if the ideapad_laptop or thinkp=
ad_acpi driver will conflict "
> > >       "with adding an extension to set the battery charge behavior an=
d battery charge "
> > >       "control end threshold. It will also skip checking if the BIOS =
reports that "
> > > -     "those features are fully supported. It is recommended to black=
list the ideapad "
> > > +     "those features are fully supported. It is recommended to black=
list the conflicting "
> > >       "driver before using this option.");
> > >=20
> > >  /* =3D=3D=3D=3D=3D=3D=3D=3D HWMON (component: lenovo-wmi-capdata 00 =
& fan) =3D=3D=3D=3D=3D=3D=3D=3D */
> > > @@ -905,17 +905,41 @@ static acpi_status lwmi_acpi_match(acpi_handle =
handle, u32 lvl,
> > >       return AE_CTRL_TERMINATE;
> > >  }
> > >=20
> > > +struct lwmi_psy_deconflict {
> > > +     char * const *hids;
> >=20
> > Who is only the pointer const, not the char?
> >=20
>=20
> It only lacked const because it shared LWMI_PSY_DECONFLICT_STRS() with
> methods. I made hids const char * const * in v4.
>=20
> > > +     char * const *methods;
> >=20
> > If acpi_has_method would input const char * (to me it seems convertable
> > as it only calls acpi_get_handle that takes const char *), this too cou=
ld
> > be const char.
> >=20
>=20
> Agreed. acpi_has_method() still takes char *, so I kept methods as
> char * const * in v4.
>=20
> > > +};
> > > +
> > > +#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) || IS_ENABLED(CONFIG_THINKPAD_=
ACPI)
> > > +#define LWMI_PSY_DECONFLICT_STRS(...) \
> > > +     ((char * const[]) { __VA_ARGS__, NULL })
> > > +#endif
> >=20
> > What exactly does ifdef'ing this construct achieve? Does something hunt
> > unused macros?
> >=20
>=20
> Yes, W=3D2 enables -Wunused-macros. The guard avoids the warning when
> both drivers are disabled.

Usually we don't particularly care about W=3D2, otherwise our lives would
be too tough to continue.

W=3D2/3 only makes sense when you are looking for potential bugs or
optimizations. If the code doesn't fall into either category, the
warnings can be safely ignored.

Thanks,
Rong

>=20
> > > +
> > > +static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] =
=3D {
> > > +#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP)
> > > +     {
> > > +             .hids =3D LWMI_PSY_DECONFLICT_STRS("VPC2004"),
> > > +             .methods =3D LWMI_PSY_DECONFLICT_STRS("GBMD", "SBMC"),
> > > +     },
> > > +#endif /* IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) */
> > > +#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
> > > +     {
> > > +             .hids =3D LWMI_PSY_DECONFLICT_STRS("LEN0268", "LEN0068"=
, "IBM0068"),
> > > +             .methods =3D LWMI_PSY_DECONFLICT_STRS("BDSG", "BICG"),
> > > +     },
> > > +#endif /* IS_ENABLED(CONFIG_THINKPAD_ACPI) */
> > > +};
> > > +
> > >  /**
> > >   * lwmi_om_psy_ext_init() - Hooks power supply extension to device b=
attery
> > >   * @priv: Pointer to the lwmi_om_priv drvdata.
> > >   *
> > > - * Checks if the ideapad_laptop driver is going to manage charge att=
ributes first,
> > > - * then if not, hooks the battery to our WMI methods if they are sup=
ported.
> > > + * Checks if the ideapad_laptop or thinkpad_acpi driver is going to =
manage
> > > + * charge attributes first, then if not, hooks the battery to our WM=
I methods
> > > + * if they are supported.
> > >   */
> > >  static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
> > >  {
> > > -     static const char * const ideapad_hid =3D "VPC2004";
> > > -     acpi_handle handle =3D NULL;
> > >       unsigned int props =3D 0;
> > >       int ret;
> > >=20
> > > @@ -928,14 +952,30 @@ static void lwmi_om_psy_ext_init(struct lwmi_om=
_priv *priv)
> > >       if (force_load_psy_ext)
> > >               goto load_psy_ext;
> > >=20
> > > -     /* Deconflict ideapad_laptop driver */
> > > -     ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle,=
 NULL);
> > > -     if (ret)
> > > -             return;
> > > +     for (unsigned int i =3D 0; i < ARRAY_SIZE(lwmi_psy_deconflict_l=
ist); i++) {
> > > +             const struct lwmi_psy_deconflict *entry =3D &lwmi_psy_d=
econflict_list[i];
> > >=20
> > > -     if (handle && acpi_has_method(handle, "GBMD") && acpi_has_metho=
d(handle, "SBMC")) {
> > > -             dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manage=
s battery for device\n");
> > > -             return;
> > > +             for (unsigned int j =3D 0; entry->hids[j]; j++) {
> > > +                     const char *hid =3D entry->hids[j];
> > > +                     acpi_handle handle =3D NULL;
> > > +                     bool has_methods =3D true;
> > > +
> > > +                     ret =3D acpi_get_devices(hid, lwmi_acpi_match, =
&handle, NULL);
> > > +                     if (ret || !handle)
> > > +                             continue;
> > > +
> > > +                     for (unsigned int k =3D 0; entry->methods[k]; k=
++) {
> > > +                             has_methods =3D acpi_has_method(handle,=
 entry->methods[k]);
> > > +                             if (!has_methods)
> > > +                                     break;
> >=20
> > So this goes to dev_dbg + return, why complicate the code flow with ext=
ra
> > break + check that is never true?
> >=20
> > If indentation is the worry here, the innermost bodies don't seem to
> > require much from the outer ones so they could be moved to a function
> > (j body + k loop).
> >=20
>=20
> When missing a method then try the next HID. In v4, I moved the lookup
> and method checks into a helper.
>=20
> Thanks,
> Aaron
>=20
> > > +                     }
> > > +                     if (!has_methods)
> > > +                             continue;
> > > +
> > > +                     dev_dbg(&priv->wdev->dev, "ACPI device %s manag=
es battery for device\n",
> > > +                             hid);
> > > +                     return;
> > > +             }
> > >       }
> > >=20
> > >  load_psy_ext:
> > >=20
> >=20
> > --
> >  i.
> >=20
