Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794983274;
	b=yDFmObUy9cEB55VInoDkzjzeBjY5aiNSh8hKoVjlvgyPhkVHiWe5+iRtqZhmVAASYSZk
	 nKwP8SErLY32xF21gByQV32N5xXlL4JIaQWf3L7Zb9EIqIDwFwRvzejYApkPgdhN+ykhu
	 +S4F1I9IKkTDEfxJEFmXSYJ9QunRfTg7qaO63b7hghc/vyPPS995Qe30GO+hbkemXg0zA
	 boWPPaBx08wFRN+pvbPIMjxOMvXtip5iVYtm5brSNm+Wcx752bHYD3DjK9bTSxD3vZLxw
	 kNyjJ5jKjbRUDRjs84N+3uOM9YSVSjagG4yX2cdD7OQKdZsNpNpLuO3w12wZsJ8Rv2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZYCK2Pu0V+U7jvnnJDNAiZFUh2/yzCMoxjajdOtv3Vk=;
	b=DjxRfcxoGGZdmlv74exzQjrXCg2WYNECd4O5MbVKWpuhyIPmQQhbJQRczOSpvcaZaef3
	 B9+1a7uMzxwEi9cpWBbi0CMt/dH2kAFuzo8iRQVZGWyOKs106WBp4REJq2xXHgpxXIi/O
	 u5ipn7x8ecr5tnnBE86oZMmUqsgYKB6b1SoRojlDDNqnAJevdgCtFk+wjv6sHoTOemyO+
	 FI/RGf21aFgQ31UB/l64JHYv4RKP6YvN46qO9oHMXJLObe/1EyfkXtopmfuxX/Ysyo3Ko
	 BP+fsGwOWoeQju4KUuDA9yq+YV9lczYwF4MXU0cxEJybEhSDbPFdlKbGS6m5ch1Nx7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=IUB13+EG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F182A606A32A
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 06:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F182A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=IUB13+EG
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 293C43F46F
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 06:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794983265;
	bh=ZYCK2Pu0V+U7jvnnJDNAiZFUh2/yzCMoxjajdOtv3Vk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=IUB13+EGJcVYtOj724ymwMmLTcehCG5O4BbjM22+B0rGTZH8+a9O3REMueV6rCOnT
	 eqgmCBXmLS5soKV2sm9yfwEz1nUUmuN43oT+xd0t/EqIoCsrlrfeEKwCH5s7FITgrX
	 bTudTJbpfjqPpvsExqjIm6h74kNBXN3Hor2+kdoH9lkzHnxKdePdX56Kcv61kRQ1ds
	 RYwpLIbQzz1wy0gQ1VEq4gl0nPKMubZ49Xy+S/+2p+NZ9bT9zT/a9yVx7KLz1d0HW9
	 3f1i3m8aLp0l5NVS7TJO6RpVuFv8ksYNz9VcZjRST42ETQf1r27YwoF6b8W19QKcp8
	 lYGDWyo3Sm2XGvpi4OKNhEo6pBj7yf/KGrZ4AlGqurAZG49j//KJCmwRUr0y0QrLPz
	 6vVZYr2bQJajfPfgWgtAtO2ATjmauGXpb/zFYUn1kaMjwLRy60Ui6dUvZcLyag2iZP
	 hxtQLe05iRaFcgJLiTs+6zGpq+d1F4ZDrZ46SAIGuUdDQXg4PvbLFgQI7fZ3XeLbb2
	 AuYTfL7/j3UEGAXaLxnZJ4hF4LTOGF2kkfwCIR0r2Q9pIWdlso0LFQ5DvGM4TrltZA
	 AKFtxVRuXsCxI2cwoyYUmC3ROlV5NxzPgMuSBujLFCywFf/P9kyr/ESGMZ9MCOkq9Z
	 9YW7JHIIWwDUOUyGLqoEka9A=
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so2017114c88.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 22:27:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794983263; cv=none;
        d=google.com; s=arc-20260327;
        b=ESLrg9liDwDrVZ57oG3c7pg2BoTkFDnIZUWtsk38SRJy93kF1zR+0B55L6e2CrLJib
         AvWKycYkTwx8vsGIARbDsouAiwfCTR0jytUY3ab1djTMc9zMW1AzFvRPfo1r23qJJaOF
         rZeqTsiy3KQnOuj06zm+Ule/hQLmrEet+7uMgW003R6tRrAljS1U9y1UnAaUNeEeuL2D
         6r9JjvdSCjpAAkkB/iQSNGg0zx/ZDPTWZi7txSWoZ1Y9dNV/oD2uNgvCV4nKmMvh8wJi
         gXDKJnI/6OhoRiZoFa6fdZKWrQxpF5iZ9B6SeVVzGggyWGH7PXA45fD76kcWX9ECpz7D
         C5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=ZYCK2Pu0V+U7jvnnJDNAiZFUh2/yzCMoxjajdOtv3Vk=;
        fh=OOgvlC4ob/0a5pQxMtOdT3nb9wDz+m06h9r9cCnSJ5w=;
        b=PBiTkRX2KqOGfZuTyeIDw5Q+KGh538MnG38h7DZpMWe8UKX1UgSNaNalncgzvdHEwd
         O7rCjcqdK6P84Apf1/dIRof+w7JQLxJar+nL7eWLM1JFkdudb8AKjq173RJBeNdYqudZ
         fnkx9G0Gm1S9+ic5iTJax/Fl3TwIVkGMqOP/Xzdv3JaQueqYexrwhzmFM2ezqKYqGvtu
         XMtYNdTMilBoIrLbYTqFAB1z1x26UgFLfCq1P9NXveK1gPeDIHdLV4RkULJZ/zdUvU4Y
         6emFs691HU6492nUmLfQBYIHa4OVH7ObMs8SF6E4Ods+YX7fIbbHeNstzChXz2CIpIoU
         yRAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983263; x=1795588063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYCK2Pu0V+U7jvnnJDNAiZFUh2/yzCMoxjajdOtv3Vk=;
        b=O5oE8vZAUPHLB3ukwk/FoICmVoNgvECKdKh+Kh23SbfE3WM8c5Pc+5HmJmxSGwvXDE
         8gyusm/smtz7TBq0L8bXPSeoGrvtvbhK/Yv4kp7BqtRceyhhrPO8E0y2/9oaLhR7UeZq
         5NeirJ1e/nNFyTDD1hDfibw0YytigVoum6y+KFfhCRzmNSfEvXCD4uZIu/XFfUY6ic+R
         vnyqTkA9q+yPb9YwbKwVrARAAz6WtktLTZjuh2VuhYTOIKLVr3ob2GNJhxQxzEMDo4ay
         Nr0Q01LwDHAnj32xkJaNU0+N+Im3emBYUJfSLMePJ5xglh2TXb7KbHFaSr+bYvH/0kGH
         bo4w==
X-Forwarded-Encrypted: i=1; AL+hErE6hIX/jqdgJt4+SMju/5uoXTDkw8zIZohFTxD036xQR8HIuJuEo8FIaTCAOE6gGj82dY7r7lU+d3dp4xGASrp1ho8g@vger.kernel.org
X-Gm-Message-State: APuU4Z8lWBXgSIDkCGoTbN9MOSBzTrBJrNIqzBT/NYQ/weqjAHvyrREs
	oplBXaDKZOC7UxrreQI81xPI09falNAHUfJRDu8cDSzuVYcHJmH7UbYm19yC5O8Y90+6/tcIMWM
	U2LQJri0opEcVO5fmT/nsqCvh8Xqw+UJtoLKpDI0CuSVwOJ7JJe7ctDLmFAv2pPfux15pzzEelp
	FTKN+n63jRDM956TJ51IqrC+4tM2Iz87vNarSrysgWX06hdRNzFXqQvAM4v9zyK4gzhA==
X-Gm-Gg: AYBFou3U8eGx52KDNeyoMG4P59ZggpLgwA1ZKcTgelvDlyGuPUgj22u3x1lmdzcbANh
	KkdsFeeHcgitsTiHzx6UeKZS0yEWIyhdjA+6VYBH9n+cYOpnKiEB/FYrGnlao8bTwv8skpX7tbe
	Hw0TLJ1yPEvL5firrLJFqbfRiSbu8afv6SxB8+VT6kgIiyJsZNKvjF6eJ2RDIdYsyHZr1IUz5lt
	XnvuCHzctz4R5Hr78zT5qho4r8sX9PbCxtMJ30521GYCbFit0GGmZTtt4vJKxOp/b3vikXPY4h8
	xQ7PgyEgFUtB2gNzZGL2ZZRr+f4F/hN5f0R1u/PUYLUK6jszrJOjAMFgbtKsGOIFCyfTfYVR
X-Received: by 2002:a05:7022:f90b:b0:18d:96e8:b913 with SMTP id a92af1059eb24-1b543c4a944mr1572605c88.47.1794983263150;
        Tue, 17 Nov 2026 22:27:43 -0800 (PST)
X-Received: by 2002:a05:7022:f90b:b0:18d:96e8:b913 with SMTP id
 a92af1059eb24-1b543c4a944mr1572580c88.47.1794983262609; Tue, 17 Nov 2026
 22:27:42 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113055726.952551-1-aaron.ma@canonical.com> <b4feb4ce-d818-c6b0-a749-4e58b92c2573@linux.intel.com>
In-Reply-To: <b4feb4ce-d818-c6b0-a749-4e58b92c2573@linux.intel.com>
From: Aaron Ma <aaron.ma@canonical.com>
Date: Wed, 18 Nov 2026 14:27:31 +0800
X-Gm-Features: AclHuK8VgyeeoUXEKHXZd76ln6Mizm3zIiggFq-UHwvrPWqWaYx_3r4qTvsztGA
Message-ID: <CAJ6xRxVLMmK6Vk8h8FYbeuDSKhd_hhN=HKEkF=E5CUisimKtZw@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: lenovo-wmi-other: Deconflict battery
 with thinkpad_acpi
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Rong Zhang <i@rong.moe>, Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 13, 2026 at 7:04=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Fri, 13 Nov 2026, Aaron Ma wrote:
>
> > ThinkPads expose battery charge thresholds and charge_behaviour through
> > thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups. The
> > Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
> > charge_behaviour and charge_types on systems advertising those WMI
> > capabilities.
> >
> > When lenovo-wmi-other registers first, thinkpad_acpi fails to create a
> > duplicate charge_behaviour sysfs attribute and unregisters its battery
> > extension. Conversely, registering or updating any power_supply_ext on
> > the same battery runs sysfs_update_groups(), which removes standard
> > power-supply attributes not owned by power_supply_core and wipes out
> > thinkpad_acpi's charge_control_start_threshold,
> > charge_control_end_threshold, and charge_behaviour files.
> >
> > Deconflict both ideapad_laptop (VPC2004 with GBMD and SBMC) and
> > thinkpad_acpi (LEN0268, LEN0068, or IBM0068 with BDSG and BICG) via a
> > per-driver table guarded by IS_ENABLED() in Kconfig, and update the
> > force_load_psy_ext description accordingly.
> >
> > Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery =
charge limiting")
> > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > Co-developed-by: Rong Zhang <i@rong.moe>
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> > ---
> > Changes in v3:
> > - Wrap deconfliction table entries in #if IS_ENABLED(CONFIG_*) and drop
> >   driver_enabled, as suggested by Rong Zhang.
> > - Group deconfliction entries per driver (HIDs list + methods list).
> >
> > Changes in v2:
> > - Consolidate IdeaPad and ThinkPad deconfliction into a table of ACPI
> >   device IDs, method pairs, and driver configuration checks, as suggest=
ed
> >   by Derek J. Clark.
> > - Check GBMD and SBMC for IdeaPads, and BDSG and BICG for ThinkPads,
> >   instead of relying only on ThinkPad ACPI device presence.
> > - Check whether the corresponding driver is enabled before looking up
> >   its ACPI device, including for ideapad_laptop.
> > - Update the force_load_psy_ext description to cover both drivers.
> >
> > v2: https://lore.kernel.org/platform-driver-x86/20261112074823.853819-1=
-aaron.ma@canonical.com/
> > v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285-1=
-aaron.ma@canonical.com/
> >
> >  drivers/platform/x86/lenovo/wmi-other.c | 66 ++++++++++++++++++++-----
> >  1 file changed, 53 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform=
/x86/lenovo/wmi-other.c
> > index bd64e7b44669d..340159df5f7cc 100644
> > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > @@ -189,10 +189,10 @@ MODULE_PARM_DESC(relax_fan_constraint,
> >  static bool force_load_psy_ext;
> >  module_param(force_load_psy_ext, bool, 0444);
> >  MODULE_PARM_DESC(force_load_psy_ext,
> > -     "This option will skip checking if the ideapad_laptop driver will=
 conflict "
> > +     "This option will skip checking if the ideapad_laptop or thinkpad=
_acpi driver will conflict "
> >       "with adding an extension to set the battery charge behavior and =
battery charge "
> >       "control end threshold. It will also skip checking if the BIOS re=
ports that "
> > -     "those features are fully supported. It is recommended to blackli=
st the ideapad "
> > +     "those features are fully supported. It is recommended to blackli=
st the conflicting "
> >       "driver before using this option.");
> >
> >  /* =3D=3D=3D=3D=3D=3D=3D=3D HWMON (component: lenovo-wmi-capdata 00 & =
fan) =3D=3D=3D=3D=3D=3D=3D=3D */
> > @@ -905,17 +905,41 @@ static acpi_status lwmi_acpi_match(acpi_handle ha=
ndle, u32 lvl,
> >       return AE_CTRL_TERMINATE;
> >  }
> >
> > +struct lwmi_psy_deconflict {
> > +     char * const *hids;
>
> Who is only the pointer const, not the char?
>

It only lacked const because it shared LWMI_PSY_DECONFLICT_STRS() with
methods. I made hids const char * const * in v4.

> > +     char * const *methods;
>
> If acpi_has_method would input const char * (to me it seems convertable
> as it only calls acpi_get_handle that takes const char *), this too could
> be const char.
>

Agreed. acpi_has_method() still takes char *, so I kept methods as
char * const * in v4.

> > +};
> > +
> > +#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) || IS_ENABLED(CONFIG_THINKPAD_AC=
PI)
> > +#define LWMI_PSY_DECONFLICT_STRS(...) \
> > +     ((char * const[]) { __VA_ARGS__, NULL })
> > +#endif
>
> What exactly does ifdef'ing this construct achieve? Does something hunt
> unused macros?
>

Yes, W=3D2 enables -Wunused-macros. The guard avoids the warning when
both drivers are disabled.

> > +
> > +static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] =3D=
 {
> > +#if IS_ENABLED(CONFIG_IDEAPAD_LAPTOP)
> > +     {
> > +             .hids =3D LWMI_PSY_DECONFLICT_STRS("VPC2004"),
> > +             .methods =3D LWMI_PSY_DECONFLICT_STRS("GBMD", "SBMC"),
> > +     },
> > +#endif /* IS_ENABLED(CONFIG_IDEAPAD_LAPTOP) */
> > +#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
> > +     {
> > +             .hids =3D LWMI_PSY_DECONFLICT_STRS("LEN0268", "LEN0068", =
"IBM0068"),
> > +             .methods =3D LWMI_PSY_DECONFLICT_STRS("BDSG", "BICG"),
> > +     },
> > +#endif /* IS_ENABLED(CONFIG_THINKPAD_ACPI) */
> > +};
> > +
> >  /**
> >   * lwmi_om_psy_ext_init() - Hooks power supply extension to device bat=
tery
> >   * @priv: Pointer to the lwmi_om_priv drvdata.
> >   *
> > - * Checks if the ideapad_laptop driver is going to manage charge attri=
butes first,
> > - * then if not, hooks the battery to our WMI methods if they are suppo=
rted.
> > + * Checks if the ideapad_laptop or thinkpad_acpi driver is going to ma=
nage
> > + * charge attributes first, then if not, hooks the battery to our WMI =
methods
> > + * if they are supported.
> >   */
> >  static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
> >  {
> > -     static const char * const ideapad_hid =3D "VPC2004";
> > -     acpi_handle handle =3D NULL;
> >       unsigned int props =3D 0;
> >       int ret;
> >
> > @@ -928,14 +952,30 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_p=
riv *priv)
> >       if (force_load_psy_ext)
> >               goto load_psy_ext;
> >
> > -     /* Deconflict ideapad_laptop driver */
> > -     ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, N=
ULL);
> > -     if (ret)
> > -             return;
> > +     for (unsigned int i =3D 0; i < ARRAY_SIZE(lwmi_psy_deconflict_lis=
t); i++) {
> > +             const struct lwmi_psy_deconflict *entry =3D &lwmi_psy_dec=
onflict_list[i];
> >
> > -     if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(=
handle, "SBMC")) {
> > -             dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages =
battery for device\n");
> > -             return;
> > +             for (unsigned int j =3D 0; entry->hids[j]; j++) {
> > +                     const char *hid =3D entry->hids[j];
> > +                     acpi_handle handle =3D NULL;
> > +                     bool has_methods =3D true;
> > +
> > +                     ret =3D acpi_get_devices(hid, lwmi_acpi_match, &h=
andle, NULL);
> > +                     if (ret || !handle)
> > +                             continue;
> > +
> > +                     for (unsigned int k =3D 0; entry->methods[k]; k++=
) {
> > +                             has_methods =3D acpi_has_method(handle, e=
ntry->methods[k]);
> > +                             if (!has_methods)
> > +                                     break;
>
> So this goes to dev_dbg + return, why complicate the code flow with extra
> break + check that is never true?
>
> If indentation is the worry here, the innermost bodies don't seem to
> require much from the outer ones so they could be moved to a function
> (j body + k loop).
>

When missing a method then try the next HID. In v4, I moved the lookup
and method checks into a helper.

Thanks,
Aaron

> > +                     }
> > +                     if (!has_methods)
> > +                             continue;
> > +
> > +                     dev_dbg(&priv->wdev->dev, "ACPI device %s manages=
 battery for device\n",
> > +                             hid);
> > +                     return;
> > +             }
> >       }
> >
> >  load_psy_ext:
> >
>
> --
>  i.
>
