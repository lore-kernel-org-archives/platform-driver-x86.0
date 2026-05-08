Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6334740FDAF
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 May 2026 17:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778262125; cv=pass; b=XaGK4O8J2jfSh3OYAQH0WN2040GCjg58dlRz5nS74Dtq4PmnhWwoMD3PzTvtnzdDdC81kj4uJ9nyE7qE33yTgyKiYy73MgNdenMTTCFp54SStB72irNhyNX+TtgTU+vjF/vuBa88MlT805l92q0yezIZzjxxKcNC71y8TR3f+Xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778262125; c=relaxed/simple;
	bh=O58h6zWhsKVauj09ngK3JzzJWvv1VnNuVgDkCnA6agc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CBIw+oJJJ2JSFup2kL1gYPV6QR5sTIxK5Z+8p8rhSZvLr5vDCYx2x77pw1hz2NAcgK8oHrf8uIMhZpnnLQDfIRsNb83hpmKPpDQpkaeGaTeNmhES9OFI9hTAI9Fah5SsKhK5rY2uoLtPBGfcov10W+S7kJVzwwo8rYEuJwtEw8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NL+QFVnJ; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NL+QFVnJ"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50d75bfb259so14605091cf.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 08 May 2026 10:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778262121; cv=none;
        d=google.com; s=arc-20240605;
        b=HeTuRpglwVByczS4dNglsD+tRGvNpPr5qbWbccifFbwlOpjUVCu7CvV1+KWtlM8WPw
         SF/Bq2acanafZZSLAblzWYdvJ32fSx/h4c6isQ/gpZRIT6yztsQp6lIbVc6jPgO+m3R3
         kTeNw9FcgB//U/5mF7M/1UUL0GMYM3CEC3pKUfJ3OhAqHukqckyQNSgP1nmkDC8q5bsS
         I3jXrDan9BcTamskBOoNYwylh8F7FSqXmQCoJA5eV4DU2c+uw9Id4Hw+HyKquJJqiqaH
         p6G/Yz6WGcdGdEoNzZSmB0tlsx/6Cbzp2WEpRd7z/cb1aXlVNs0on2/w7oE5EavxDsNJ
         xBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VVSiBiKVrIMtOb+20PEHWGsQ0f3YNgBfaT35wk3S6gs=;
        fh=4c3RK15RVwNtOXYvTgKjwnXcGZUe43S0kvbUzQMBsa4=;
        b=LA0mPfqq3Xe4eLo3pqhUQZeIq93CYMV/UvoitMeW+T/OZndRufhigs/wxSwlHZiayE
         GhS3sYsEmy8Bpc+ogEVb8kHbSoDltzWZ0ZpRTAl7Ik8GUlVow4mdmf6eIEIT5+JZYa2u
         ZVAELj9DrF7Jzcp71CQ21Jv9F8rH4KSRgrNiU0sLy8VEuyQ8C8A8Oz1w7DQ/wcJbkCcz
         lLGx74w74Hx07lG8Jtjj35Ip3Glbymg4gaIlq0m2rKu99W/TC80Cc+mQkZ2dx/mWR5pz
         UVbrvrTighfFqM7Gax4Nc273faGDRzBUwygnWbvvwTwpDtofGIwXCHNXHDVZVWBD2bak
         Zvkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778262121; x=1778866921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVSiBiKVrIMtOb+20PEHWGsQ0f3YNgBfaT35wk3S6gs=;
        b=NL+QFVnJY27AfP0RtVqTKo924vdU1jr1mtYortvM91WteAVLvw6JCfueGq179QvOgD
         GnvvMV+Hj1Z9LiWuzHzqozoFqqWwF91kScTMX1UC/n6kXfkKrp6Z7UD4tTMXREfY5Vvw
         Kh9FKpC4sWZIgG4+/M0+U4bDLlB1YJ5aWjb7qa8YDdzMpeXi5m1roWIdrP9qJJfg5+h9
         J+RhoWugYVwQOs2cn2XBnvw1kzGNsDHmDQIXGvQJfSyHtQteFegr+74ykiuXtG4cbnYo
         nOmQ640dc9xlU8wrT9uEGqnWDczK9uhRR7zMGSNUn9Ctf52FzuO7B92vuU8i3TlTqxrv
         I3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778262121; x=1778866921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VVSiBiKVrIMtOb+20PEHWGsQ0f3YNgBfaT35wk3S6gs=;
        b=sJiUZRwKCHMSOHF8BrRmEzI/Hg0rF0e0S6sQZZ0u+5LasJ5d1tCqahFObuOkoNZ28r
         TqWUFXxdV5iQ+zhlHycTnVWsiMx6Grgq7GDd5tzfbKFwseHuyAtfjjZvwlkfQk0/EiRT
         CQ9s2Pl+oNRCNgqX1D+gWt3akNCNNGRZZZoCTkmXqHyAtV7UpDHtQkCEzHSIV0HE2XnM
         EpQU8KRlt0k/lXzHT3g0DsyWoMWYkFDg5inpnonJRK+JP4kwGTv8zXsm2/ExPQai0WMU
         WofcgdH0w6ORwyVGPNmUSJUCgOPOTA36y1/JDPumgRqfgO48Uh3EnXDlDVafcZWG1pIb
         Fl4g==
X-Forwarded-Encrypted: i=1; AFNElJ8+byq23eYKH0k+/bTYRRwGPMRvzECrOra1tVJz/4GfDTNPSwUaAVRP4VX8Hmslbi4D6rVldatFLlBtJoD/RzDpmNib@vger.kernel.org
X-Gm-Message-State: AOJu0YxS7n6YCet550TajCtxOKwHLcKtwf2y1xMzzt4S8Ic4+D4miBA9
	bjrMbYNNMTP4TMvchDRolSevD28d8/kqyq5tvnuo+Ubi/4I4XH9PIdhPE1uTAYIMp3DQyDt/1Ts
	B0izpyWASskIlHIMlhAqBPzD4eqjLz98=
X-Gm-Gg: AeBDies7g3uAZ1/yGfcw0Nt+EBkpdEc/CF39FdXo/COUn+NQDmMzLTAB0iSKfkFaiG+
	+zwP+Sn7AWBZs40FhD3KBkAJ74jJoCgaksI0PIJkoy5poWZvUGK2SGXx2ZUn/hIEnK/EZfvJ21o
	d6grNzOyh6keZKjgSOQMpc+7O7kzKBCScR+MuMy2TRqsvzTxyj1zYq5nZaJEVSvAZnOklrhkaZa
	YQFsRNDfBdgXpYbT0P9NNFqeWGTHA1Z+Xi4kDs4/9bDv/Iaog0A95HHEdFWDA1h973cEkl/LJmb
	+epvIsB5
X-Received: by 2002:a05:622a:558b:b0:50b:34f1:6309 with SMTP id
 d75a77b69052e-514621c7dc7mr182700581cf.49.1778262121031; Fri, 08 May 2026
 10:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507180507.912966-1-derekjohn.clark@gmail.com>
 <20260507180507.912966-16-derekjohn.clark@gmail.com> <f7938f65-b38c-8d96-3e2f-b66c943d5f03@linux.intel.com>
In-Reply-To: <f7938f65-b38c-8d96-3e2f-b66c943d5f03@linux.intel.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Fri, 8 May 2026 10:41:49 -0700
X-Gm-Features: AVHnY4KbSy9hYEgGvNSwdUUMZQXOA_nkZbOuAqLoItRHDuTPhyx7qMexW4Q_iAo
Message-ID: <CAFqHKTkMuOAti_3THuEmcJh2O02bh-W-o-yByEajzF9aR7Y0qQ@mail.gmail.com>
Subject: Re: [PATCH v11 15/15] platform/x86: lenovo-wmi-capdata: Add debugfs
 file for dumping capdata
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, Rong Zhang <i@rong.moe>, 
	Kurt Borja <kuurtb@gmail.com>, "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	marshall@shzj.cc, hyacinth@shzj.cc, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 8:08=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Thu, 7 May 2026, Derek J. Clark wrote:
>
> > From: Rong Zhang <i@rong.moe>
> >
> > The Lenovo GameZone/Other interfaces have some delicate divergences
> > among different devices. When making a bug report or adding support for
> > new devices/interfaces, capdata is the most important information to
> > cross-check with.
> >
> > Add a debugfs file (lenovo_wmi/<device_name>/capdata), so that users ca=
n
> > dump capdata and include it in their reports.
> >
> > Since `struct capdata01' is just an extension to `struct capdata00',
> > also converts the former to include the latter anonymously
> > (-fms-extensions, since v6.19). In this manner type casting won't be
> > confusing.
> >
> > Tested-by: Kurt Borja <kuurtb@gmail.com>
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> >  drivers/platform/x86/lenovo/Kconfig       |   1 +
> >  drivers/platform/x86/lenovo/wmi-capdata.c | 120 ++++++++++++++++++++++
> >  drivers/platform/x86/lenovo/wmi-capdata.h |   4 +-
> >  3 files changed, 122 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86=
/lenovo/Kconfig
> > index b9a5d18caa1e..4443f40ef8aa 100644
> > --- a/drivers/platform/x86/lenovo/Kconfig
> > +++ b/drivers/platform/x86/lenovo/Kconfig
> > @@ -236,6 +236,7 @@ config YT2_1380
> >  config LENOVO_WMI_CAPDATA
> >       tristate
> >       depends on ACPI_WMI
> > +     depends on LENOVO_WMI_HELPERS
> >
> >  config LENOVO_WMI_EVENTS
> >       tristate
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platfo=
rm/x86/lenovo/wmi-capdata.c
> > index 169665be4dcf..b5e2c16d638f 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> > @@ -31,6 +31,7 @@
> >  #include <linux/cleanup.h>
> >  #include <linux/component.h>
> >  #include <linux/container_of.h>
> > +#include <linux/debugfs.h>
> >  #include <linux/device.h>
> >  #include <linux/dev_printk.h>
> >  #include <linux/err.h>
> > @@ -42,6 +43,7 @@
> >  #include <linux/mutex_types.h>
> >  #include <linux/notifier.h>
> >  #include <linux/overflow.h>
> > +#include <linux/seq_file.h>
> >  #include <linux/stddef.h>
> >  #include <linux/types.h>
> >  #include <linux/wmi.h>
> > @@ -88,6 +90,7 @@ struct lwmi_cd_priv {
> >       struct notifier_block acpi_nb; /* ACPI events */
> >       struct wmi_device *wdev;
> >       struct cd_list *list;
> > +     struct dentry *debugfs_dir;
> >
> >       /*
> >        * A capdata device may be a component master of another capdata =
device.
> > @@ -118,6 +121,8 @@ struct cd_list {
> >
> >  static struct wmi_driver lwmi_cd_driver;
> >
> > +/* =3D=3D=3D=3D=3D=3D=3D=3D Device components =3D=3D=3D=3D=3D=3D=3D=3D=
 */
> > +
> >  /**
> >   * lwmi_cd_match() - Match rule for the master driver.
> >   * @dev: Pointer to the capability data parent device.
> > @@ -471,6 +476,116 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_=
WMI_CAPDATA");
> >  DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdata_fa=
n);
> >  EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CAPDATA");
> >
> > +/* =3D=3D=3D=3D=3D=3D=3D=3D debugfs =3D=3D=3D=3D=3D=3D=3D=3D */
> > +
> > +/**
> > + * lwmi_cd00_show() - Dump capdata00
> > + * @s: Pointer to seq_file where the capdata00 is dumped.
> > + * @cd00: Pointer to a capdata00 struct to be dumped.
> > + */
> > +static void lwmi_cd00_show(struct seq_file *s, struct capdata00 *cd00)
> > +{
> > +     u8 dev =3D FIELD_GET(LWMI_ATTR_DEV_ID_MASK, cd00->id);
> > +     u8 feat =3D FIELD_GET(LWMI_ATTR_FEAT_ID_MASK, cd00->id);
> > +     u8 mode =3D FIELD_GET(LWMI_ATTR_MODE_ID_MASK, cd00->id);
> > +     u8 type =3D FIELD_GET(LWMI_ATTR_TYPE_ID_MASK, cd00->id);
> > +     bool extra =3D cd00->supported & ~(LWMI_SUPP_GET | LWMI_SUPP_SET =
| LWMI_SUPP_VALID);
> > +     bool get =3D cd00->supported & LWMI_SUPP_GET;
> > +     bool set =3D cd00->supported & LWMI_SUPP_SET;
> > +     bool valid =3D cd00->supported & LWMI_SUPP_VALID;
> > +
> > +     seq_printf(s, "  id:             0x%08x [dev: %2u, feat: %2u, mod=
e: %2u, type: %2u]\n",
> > +                cd00->id, dev, feat, mode, type);
> > +
> > +     seq_printf(s, "  supported:      0x%08x [%c%c%c%c]\n", cd00->supp=
orted,
> > +                extra ? '+' : ' ',
> > +                get   ? 'R' : ' ',
> > +                set   ? 'W' : ' ',
> > +                valid ? 'V' : ' ');
> > +
> > +     seq_printf(s, "  default_value:  %u\n", cd00->default_value);
> > +}
> > +
> > +/**
> > + * lwmi_cd01_show() - Dump capdata01
> > + * @s: Pointer to seq_file where the capdata01 is dumped.
> > + * @cd01: Pointer to a capdata01 struct to be dumped.
> > + */
> > +static void lwmi_cd01_show(struct seq_file *s, struct capdata01 *cd01)
> > +{
> > +     /* capdata01 is an extension to capdata00. */
> > +     lwmi_cd00_show(s, (struct capdata00 *)cd01);
>
> Hpmf, so anonymous struct leads to this now.
>
> I wonder if we could wrap it with an union to have both named access to i=
t
> (to get the pointer without casting) while retaining anonymous access to
> its members:
>
> struct capdata01 {
>         union {
>                 struct capdata00;
>                 struct capdata00 cd00;
>         };
>         ...
>
> ...If it's not possible, then I'll have to accept the cast I guess.
>

With that, the call becomes:
lwmi_cd00_show(s, &cd01->cd00);

Everything seems to work as expected. This looks cleaner to me, and
doesn't need the comment to explain.

- Derek


> > +     seq_printf(s, "  step:           %u\n", cd01->step);
> > +     seq_printf(s, "  min_value:      %u\n", cd01->min_value);
> > +     seq_printf(s, "  max_value:      %u\n", cd01->max_value);
> > +}
> > +
> > +/**
> > + * lwmi_cd_fan_show() - Dump capdata_fan
> > + * @s: Pointer to seq_file where the capdata_fan is dumped.
> > + * @cd_fan: Pointer to a capdata_fan struct to be dumped.
> > + */
> > +static void lwmi_cd_fan_show(struct seq_file *s, struct capdata_fan *c=
d_fan)
> > +{
> > +     seq_printf(s, "  id:             %u\n", cd_fan->id);
> > +     seq_printf(s, "  min_rpm:        %u\n", cd_fan->min_rpm);
> > +     seq_printf(s, "  max_rpm:        %u\n", cd_fan->max_rpm);
> > +}
> > +
> > +/**
> > + * lwmi_cd_debugfs_show() - Dump capability data to debugfs
> > + * @s: Pointer to seq_file where the capability data is dumped.
> > + * @data: unused.
> > + *
> > + * Return: 0
> > + */
> > +static int lwmi_cd_debugfs_show(struct seq_file *s, void *data)
> > +{
> > +     struct lwmi_cd_priv *priv =3D s->private;
> > +     u8 idx;
> > +
> > +     guard(mutex)(&priv->list->list_mutex);
> > +
> > +     /* lwmi_cd_alloc() ensured priv->list->type must be a valid type.=
 */
> > +     for (idx =3D 0; idx < priv->list->count; idx++) {
> > +             seq_printf(s, "%s[%u]:\n", lwmi_cd_table[priv->list->type=
].name, idx);
> > +
> > +             if (priv->list->type =3D=3D LENOVO_CAPABILITY_DATA_00)
> > +                     lwmi_cd00_show(s, &priv->list->cd00[idx]);
> > +             else if (priv->list->type =3D=3D LENOVO_CAPABILITY_DATA_0=
1)
> > +                     lwmi_cd01_show(s, &priv->list->cd01[idx]);
> > +             else if (priv->list->type =3D=3D LENOVO_FAN_TEST_DATA)
> > +                     lwmi_cd_fan_show(s, &priv->list->cd_fan[idx]);
> > +     }
> > +
> > +     return 0;
> > +}
> > +DEFINE_SHOW_ATTRIBUTE(lwmi_cd_debugfs);
> > +
> > +/**
> > + * lwmi_cd_debugfs_add() - Create debugfs directory and files for a de=
vice
> > + * @priv: lenovo-wmi-capdata driver data.
> > + */
> > +static void lwmi_cd_debugfs_add(struct lwmi_cd_priv *priv)
> > +{
> > +     priv->debugfs_dir =3D lwmi_debugfs_create_dir(priv->wdev);
> > +
> > +     debugfs_create_file("capdata", 0444, priv->debugfs_dir, priv, &lw=
mi_cd_debugfs_fops);
> > +}
> > +
> > +/**
> > + * lwmi_cd_debugfs_remove() - Remove debugfs directory for a device
> > + * @priv: lenovo-wmi-capdata driver data.
> > + */
> > +static void lwmi_cd_debugfs_remove(struct lwmi_cd_priv *priv)
> > +{
> > +     debugfs_remove_recursive(priv->debugfs_dir);
> > +     priv->debugfs_dir =3D NULL;
> > +}
> > +
> > +/* =3D=3D=3D=3D=3D=3D=3D=3D WMI interface =3D=3D=3D=3D=3D=3D=3D=3D */
> > +
> >  /**
> >   * lwmi_cd_cache() - Cache all WMI data block information
> >   * @priv: lenovo-wmi-capdata driver data.
> > @@ -773,6 +888,8 @@ static int lwmi_cd_probe(struct wmi_device *wdev, c=
onst void *context)
> >               dev_err(&wdev->dev, "failed to register %s: %d\n",
> >                       info->name, ret);
> >       } else {
> > +             lwmi_cd_debugfs_add(priv);
> > +
> >               dev_dbg(&wdev->dev, "registered %s with %u items\n",
> >                       info->name, priv->list->count);
> >       }
> > @@ -783,6 +900,8 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
> >  {
> >       struct lwmi_cd_priv *priv =3D dev_get_drvdata(&wdev->dev);
> >
> > +     lwmi_cd_debugfs_remove(priv);
> > +
> >       switch (priv->list->type) {
> >       case LENOVO_CAPABILITY_DATA_00:
> >               lwmi_cd_sub_master_del(priv);
> > @@ -822,6 +941,7 @@ static struct wmi_driver lwmi_cd_driver =3D {
> >
> >  module_wmi_driver(lwmi_cd_driver);
> >
> > +MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
> >  MODULE_DEVICE_TABLE(wmi, lwmi_cd_id_table);
> >  MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> >  MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platfo=
rm/x86/lenovo/wmi-capdata.h
> > index e0a30f2c0c87..0df3ae534ed5 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> > @@ -38,9 +38,7 @@ struct capdata00 {
> >  };
> >
> >  struct capdata01 {
> > -     u32 id;
> > -     u32 supported;
> > -     u32 default_value;
> > +     struct capdata00;
> >       u32 step;
> >       u32 min_value;
> >       u32 max_value;
> >
>
> --
>  i.
>
