Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794540496;
	b=RsiMF5e9W2curDdqlCdevFhQ1EN3pzLBMrnbjqJcbkBJ5TnZRs6VhPGWliM4hR8QNWEl
	 ud1E79JBwnCBfn5FQmvj7rLMJm5y2YIKWKOTWThySElbgdalfmDz3FJAtAy66+ywcF9V/
	 AibpiW5/rwQoNJlFBsW33gIQrL3Vn00iNHxD8YXkMP5kStaoJhBQoSM/D3kbfniPy8qe+
	 UnmZYOTSGezvQwtWvhpCsGy9a3fEbMWHTcUFRE2gd4/ievfDE4CuXoBCdIZIhBlF/Uuyo
	 xWF8lNGD0kXr/Cd+zb5aaA6+kbvhBJbMdBiRFnQmGtSbIJklywUoNMbocH7PDiqHPUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540496;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=HpKMOMN6krLvkQ07zG8o6IsjCqhxfxlN3jx0X00HkWk=;
	b=HGKCrHFId1A2YyHSMnrbwraL1HgxzrJyGyDrouvPkCx5bOykyf+5L2aVINq/j6MPEY2V
	 Se/yxUtBw5zfVX4s/n6T2vb/HMekq2ekBPfCUReu4EN/hlnjds1TOdOoYp1GbQUReFjdv
	 OSazVJ6NlhinCGTwOouDPgEeTS6RGABNrwb/nZT8ha+NaAUmj3yevdIt8wAlwprnpQzWU
	 boD5OS9KjKv8Oj0BXAcaFvB/HYIqBFZJmoe7sMTvyggCBZ+AIFJHcWRh0m0SCyfD32l9l
	 yKaaH7r436enyP1Mmk+Io/KRCDiAyNCxrH3TewfaJcMXL9Q0YIzQmvMEx2rqxCm2OzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=Qxk5nBVM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809DE606A321
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 03:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 809DE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=Qxk5nBVM
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0E3DF40605
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 03:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794540494;
	bh=HpKMOMN6krLvkQ07zG8o6IsjCqhxfxlN3jx0X00HkWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Qxk5nBVMLzeo1CnXDh7EUB+nBdgZufrNl3BHRziy3cjn3/bh9X8xgOb3L5lDLDyD0
	 zmwWnNPGFgJ1alGNiLFIYQWD8kLksW4lLINzuVKtAfyyC1v/J7aWiqs6x6PIO8JWr6
	 te+oYnfroxDSmk7PokrlOPE05ozXNvdoKGiu2stbUXifiL3jTBjUtVU+HueaK4rtTS
	 1G53mZr1dxEu5sEMhpkSOYP1iCtT53BmS+jYiG9TPaX05z9rHlZIQhnFZ3QEva0k/v
	 ge/y5SbdrEZuN/zTf/SFpEXunkmV3ytIIoVJBEhDn26fkBGjkSNAoCMgQqBJwxJa45
	 6zOABBx+oGXPjBH/J/Et3UdHXru5Y/DXRgwMNmjWnq09vLmK1SIEP6qFCyfXwjEiGw
	 Ckj6tIR8coWxaIzFFlTvZk7HkVt+9yzqHW4D9qlmJox4Joi9sQu5rI0Nbdm/boV62u
	 5tqkNKEbKMQTqXmmZ+jdHuenDbKDJdVnbHgKEd5CE3cdOmrFp2uE+n8BKzNS3mjjnp
	 qED9vEsgjgwE894mVZDSCCP3uCSFtvBSYDhOQnAU4WNk2kLwU2OJKAUULgLZPIRJpt
	 clT6kRSyYRCbdL83kSmwNIuVwuzl0dyhlfWoipveWc4ZQ1OuRwZovtEK2OrGHo6fpc
	 mMXE8zEilgWQqwQ4Bwui9qkc=
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so723600eec.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 19:28:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794540492; cv=none;
        d=google.com; s=arc-20260327;
        b=IOGfy47ft5lCqHQzZVK6W47DqhnZNYu78yg3+hjyfPk4rGJYU5Fr7Zht9X5Wrt0KYJ
         mkA3ey/iqZ0T8mMdvHWB8WQAADV2iDfLPwD3XE4Um2ShyOZeOlGdgvWvSM4pdSRLrjjA
         lig0n0zvGNjgFbrjAt9eXRoLBFi3K25vlLJDbmis9enuD5FRadxT63Qjelq9b5XiMY2R
         1Hq7HAb6fGiwoxr7e0E2RJm5GtKlF/XiO6xvmPADm6asc4Fu3HzjNcrDRFb3gblROzX7
         LwD+vgvIY+13vybT+GP49IHGPuEG7lVFgDfz4yP1r2YTBSq0fOaVN1oShdb0r7uE14If
         kcxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=HpKMOMN6krLvkQ07zG8o6IsjCqhxfxlN3jx0X00HkWk=;
        fh=2/LTDxybIym7Yiff5igcfmO5A2GBQTGqw+qGPpM23E8=;
        b=DFFpTAMaJlaoyFyMaSgHd7nvrpux5iuN0BFu4Yk4vfPrGRRL/2/+FUbmW2seYScwz7
         5xJQszc2oMl6ZBu1gqMXOSNZxluLvYIC9oV5thgZfDFP5z3wD70j1PHE9uEQ5WauxdHb
         xM/AQ/doDhDSLNU6xpacUZtAfL9x56C0CL9e6DL5CBM6nhhQq23XLUJiJUtaWAVQrebG
         v24NXlqAq5OXTzXq/ZcEnhvmQ9DHFIszBt42KX0MHZGdM3YMqO2MEaHeyQ5sfedtDrsQ
         wETPceMWtg8akkT9EV58xBaiKqeUsR9tnumgV4iq6u24/QNSZ/SIhl0fYqtIPG5TcjGF
         lbFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540492; x=1795145292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HpKMOMN6krLvkQ07zG8o6IsjCqhxfxlN3jx0X00HkWk=;
        b=p8vRBIARUzeXpDmu1hjhO/WsR+dVKax9HwmBCaSERBTrG2PAyRlhmiSTZWmHjIs+Kp
         ZfNIxYbcuAk2sDEcDL3D+uJZ01pf6EophptzBtcUR2mQUu97bnIlpNXoBFD1sXYrGJl+
         CokvfQbUm2nKeX9UJUzuFM1eZwzDF6XVLk2liqoHI3v5DRz6qY2TkAF9nEGKe98KRMT+
         1kg39X5BcK5Xn90HlPWmmWHsiyFt5Ksil/x32vr7Josw8BbWTlQoX/cpbE+8voNTOSTV
         K+1ufj1QaQiJ0HVGONWlSqM1v31XopRfqNA2GwyG2rzs1xCZhdVtNVNaFfItHH3yAxmC
         ocuQ==
X-Forwarded-Encrypted: i=1; AL+hErFSFvATe9qpyx/l32xuI//BCHOGCrj8PocoVVQ573Lf0ihkqn/wPECSYnKZVXo5laJmD1y9WGkIhYbEHiwuR+A6aG5K@vger.kernel.org
X-Gm-Message-State: APuU4Z/Up5FlynylH0/I2JewJSI/dUcq38XDJ90OeMLK+s3tqE38T/VN
	fIQOcuDXMxwATw+CNYhvW7oGG1QuuajfbjeGAMRPYwrrrOSOkIXBbE2FJWmNAObkc69quE/n9Cg
	Db1VJa0CDmi8c02qQivSmR2tWvR/Trg7wSd1UNH6JVXaWMhevN/T9JEz81NkM0wM0cevtCX1Jae
	y9R9tLqu8EaoEKe7ShSur3/ex4z79G9SkZbBQYu8va2BIn1u+yct3qlsFntTTRTqL83Q==
X-Gm-Gg: AYBFou3mKLuy47wkFnd9JnG0s3cnGD/WWqLg+Leum8K9Wd4eJoPWR0+Uo9cXP5+07G8
	TP42BSqYScjcWGf8P/6k+W/yGD4br5W55tYeF6tJ+IsSCrWjp8ICQmmxAZSvcHWlfSgc1lx5g4M
	KaWKDjFFoAClfip/3IsCdb+MRXb4Tm8RK1Mm261eBXQmjUqr7/tvKGYaZJ37+spgCHAykJ9XSqu
	bqv2uYbUDshJ+HuTh3r2A8pGvIdHPvsB1UaWhBIBn7bPKosR1zeFRid3xNZ07I/Fo2o1XcRltQy
	DuG0itQQNafmL27uIRB22IbBTl7tgR62+sO0h3xlTol2UZnMoYtAFd0PB0+jfqVHf2OLZVj6
X-Received: by 2002:a05:701b:230b:b0:1b2:46ca:242e with SMTP id a92af1059eb24-1b5030a346dmr1112771c88.14.1794540491937;
        Thu, 12 Nov 2026 19:28:11 -0800 (PST)
X-Received: by 2002:a05:701b:230b:b0:1b2:46ca:242e with SMTP id
 a92af1059eb24-1b5030a346dmr1112759c88.14.1794540491446; Thu, 12 Nov 2026
 19:28:11 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112074823.853819-1-aaron.ma@canonical.com> <18febc1a4ca8191d1374c586998611952ff0cf75.camel@rong.moe>
In-Reply-To: <18febc1a4ca8191d1374c586998611952ff0cf75.camel@rong.moe>
From: Aaron Ma <aaron.ma@canonical.com>
Date: Fri, 13 Nov 2026 11:27:59 +0800
X-Gm-Features: AclHuK8meXdDsLUSD3mVRDDkmixMmtlj893g0fjWTVke1e_5xtZwxg_562ZQczw
Message-ID: <CAJ6xRxVNfRET70eByhzq4WuM_nVwofTf9t4SkwW8SS+j9iPy7A@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: lenovo-wmi-other: Deconflict battery
 with thinkpad_acpi
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 11:14=E2=80=AFPM Rong Zhang <i@rong.moe> wrote:
>
> Hi Aaron,
>
> Thanks for working on this.
>
> On Thu, 2026-11-12 at 15:48 +0800, Aaron Ma wrote:
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
> > table check when the corresponding driver is enabled in Kconfig, and
> > update the force_load_psy_ext description accordingly.
> >
> > Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery =
charge limiting")
> > Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> > ---
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
> > v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285-1=
-aaron.ma@canonical.com/
> >
> >  drivers/platform/x86/lenovo/wmi-other.c | 51 ++++++++++++++++++-------
> >  1 file changed, 38 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform=
/x86/lenovo/wmi-other.c
> > index bd64e7b44669d..14b2c3f4cc7ae 100644
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
> > @@ -905,17 +905,32 @@ static acpi_status lwmi_acpi_match(acpi_handle ha=
ndle, u32 lvl,
> >       return AE_CTRL_TERMINATE;
> >  }
> >
> > +struct lwmi_psy_deconflict {
> > +     const char *hid;
> > +     char * const *methods;
> > +     bool driver_enabled;
>
> Why is this required?
>
> IMO the relevant items should be wrapped by #if IS_ENABLED(CONFIG_*). In
> this manner, lwmi_om_psy_ext_init() doesn't need to iterate through
> useless items in vain.
>
> > +};
> > +
> > +static char * const lwmi_ideapad_psy_methods[] =3D { "GBMD", "SBMC" };
> > +static char * const lwmi_thinkpad_psy_methods[] =3D { "BDSG", "BICG" }=
;
> > +
> > +static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] =3D=
 {
> > +     { "VPC2004", lwmi_ideapad_psy_methods, IS_ENABLED(CONFIG_IDEAPAD_=
LAPTOP) },
> > +     { "LEN0268", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPA=
D_ACPI) },
> > +     { "LEN0068", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPA=
D_ACPI) },
> > +     { "IBM0068", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPA=
D_ACPI) },
> > +};
>
> It could be flattened and simplified into a 2-items array. See the
> attached patch (untested, may be completely nonsense).
>
> If you adopt my approach, feel free to add
>

Hi Rong,
Thanks for the suggestion and patch. Grouping the table per driver under
`#if IS_ENABLED()` is cleaner. I will adopt this in v3 with your tags.

Thanks,
Aaron

>    Co-developed-by: Rong Zhang <i@rong.moe>
>    Signed-off-by: Rong Zhang <i@rong.moe>
>
> Thanks,
> Rong
>
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
> > @@ -928,14 +943,24 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_p=
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
> > +             acpi_handle handle =3D NULL;
> >
> > -     if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(=
handle, "SBMC")) {
> > -             dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages =
battery for device\n");
> > -             return;
> > +             if (!entry->driver_enabled)
> > +                     continue;
> > +
> > +             ret =3D acpi_get_devices(entry->hid, lwmi_acpi_match, &ha=
ndle, NULL);
> > +             if (ret || !handle)
> > +                     continue;
> > +
> > +             if (acpi_has_method(handle, entry->methods[0]) &&
> > +                 acpi_has_method(handle, entry->methods[1])) {
> > +                     dev_dbg(&priv->wdev->dev,
> > +                             "ACPI device %s manages battery for devic=
e\n",
> > +                             entry->hid);
> > +                     return;
> > +             }
> >       }
> >
> >  load_psy_ext:
