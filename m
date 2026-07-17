Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FD6277C9E
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jul 2026 03:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784260220; cv=pass; b=rS8c/oo0wsOMVVX5gJ0ATMsQ7AKtG4sc7AZA5VkuAu5JqhhhA7YYvJiDe3jZXubYRAeDva2htiBJ7xb0tl/ygPcMMjQvLs/acclEeqAv+HTjNwAdgJy8BN4aws+PZW7sYKOIHB1ACqXBHQbxuNCmtM/j7s7LqHC4eYal6jHNVPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784260220; c=relaxed/simple;
	bh=PCxREgmb/Z7rWQfHkl01czglE63rU5J516+d6EIQW8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+OpNwWKwxCJbJdbWXj+53Yt7qcsV6pbmlRTjPEuJc5Dat0dZA58THd+rHxTFiR/4TP8fz8EKuemvsCRUyiBrO2Dmd1lN5ZfzMtJOU5PEuAokSOsq9qkIjAVq+ClpFfFh9C3iZQvmai5Lx5NCxXHHAUUftyfilTJxGTXF1ojG+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dIdQuHC1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UFKvXse7; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dIdQuHC1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UFKvXse7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784260217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmYAKofT9oILP5lZvPb1GmNCS5wwnrerJ0a/xMFFhd8=;
	b=dIdQuHC1hTmpfxLHxcg1SP4sFk+BLgZfo/qwFGIliSlsTeqzSr/qC7EgAeDqP31umlC7sx
	M6wKJsTgLHon0UEtS6kRauytEf48k97cqwE1ypjDnSbufYwRspAqoh7BPK83om5aRpiu3z
	2gA+mYgBtXbwVwcif84Ad6sSW6UWKxs=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-khoNm7zMOSycvX1w6d_f9A-1; Thu, 16 Jul 2026 23:50:16 -0400
X-MC-Unique: khoNm7zMOSycvX1w6d_f9A-1
X-Mimecast-MFC-AGG-ID: khoNm7zMOSycvX1w6d_f9A_1784260215
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-43ccd5d5357so4404812fac.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 20:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784260215; cv=none;
        d=google.com; s=arc-20260327;
        b=PM8b9SSE6QEbB7Gu9b0n0aKC8y/UKoj5DoDkI8XZGCYkxJHKGygyTTM3ub62QNbnxO
         EF9brCz52yfRbjT3qKsfuoJophMt/40ye/7xJuB2nto/YfiHCIrL5Knk9ZQEwHZ/CH7Z
         xLWBkt/8s7OM6Wr1An1FzMFIlrfxhKtbumSLd6LXHJba+A82ihSXFoeI05PhAvHrYvCq
         c33/96mW51XoPwXN5vvRuwaqXlhtEQBmQp5GAxMsxuEMAYvcFVWvJp7StEU9oiviSrhB
         wy9dkSYftWjb+dhITA0X96KL3A1RhcDUA0wXABsxglvFd7GIvLiAXfyLJJrazDUQlUsR
         lGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZmYAKofT9oILP5lZvPb1GmNCS5wwnrerJ0a/xMFFhd8=;
        fh=wlGg4NCBaE2ysRUlFImm09zu2jHypjWyiXLqBMGM6OA=;
        b=smEpEIC+XMJDakpG06JPXi0a/jt1pFLy1XQd+PneGYhVaaMHtoTSmAvMkW6Mja+z74
         nTX5qy7Io3AkoTsqWS9W+f21VG06f2H6X3xEbY6uvckZLddPz3UVJoOvqTQ6NVmQ9Ut1
         ou4ZyGDLM8u2ZtEBJdnSen3UtdOks0/CZuaNoUxWJd3BQGseD1Mz3mAY0OsiSw1L+y5U
         IT6PwGH9ASk++LPWrFu9RPHpuXXAvBnxWT8YWGcHSrn0HuXbgQ62Ss2dRDxe858mJ647
         37MXcqguivhXCDwDtz4tgqDyfWpU59nUEW12luiaXBtvf+Awg8Q7E5a1lnlSaGrvy/sl
         zOKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784260215; x=1784865015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZmYAKofT9oILP5lZvPb1GmNCS5wwnrerJ0a/xMFFhd8=;
        b=UFKvXse7cu3Zh1z7TfOlStTOdWcY9NG7jR8jEL97M17stOOemqAZ9fwLIG7AAw+pMe
         SRyr8divDmBwog9LcKKmC/3c9V/Frr3lWy3nW+YMJiQXLea/ueTdhQ9koabCGKz9qXvr
         hvkcnt1KiY5RuwN620uws6VyHJTUocdGQodAVMoqvlfJCfnb0aHP64pjyZjN2On4OusG
         2xttRkshsylp1/9y35XgMygbI6Rne76Io3ahEpxseMniIczpzwvask+wl2WUHBK0KOhQ
         3oTRNRzWR6w6BFwlLEeKJ766Do0hj3FQppMiMaKu0EcnBW3QnCdodFzRf126KgxmGiC6
         kX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784260215; x=1784865015;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZmYAKofT9oILP5lZvPb1GmNCS5wwnrerJ0a/xMFFhd8=;
        b=Q4hR7uYVzuV8O2ecEO1ydWepF9+TxHSO0G5QxZP5PzfowRrrmFWimYopJPUreY4kw5
         abbUE17p4k80a1LkOQ4pzS/hoOfhutoA/j2BzB6M7JEbqcHtT5CUZG0VDv/F/O4EwxRV
         r45kY5PqUDoUwnPLF9kpS1rzCoNnuGCpONR2hY7bPbMKEGcxGqwLj1CdctpTdVTZ6Rti
         PfNXAFLEQtnIbRNY8DO9PqTW8iRuA8ZwxlF4PeyeLpZsZDaIZKN2AYeSUX8tTqcpbEd8
         Axymm+rd++6szYCCvmFl5LAkk6njK4Wlk3mxAabWIsXg6+QMGC/IGQGqN3qIkVnVx6Kg
         SZaQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYlFXdn3kcuODm1LR8QRYHlz62Z9CV7wmqwMf8dTy7k0EuECR+9d0nSeNsAb8iyuQWWubNy6pC/lNJpd3yYa94GCBt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx86j40ycdTs71Bs13yCJ+dPTQIwVGvEpncAOjcIALMHiXh+wkC
	85ZdTE3r19H31BNt3u2PTWXgDtQGzUerlmZQ7lP9pwm6hypQmy+O+Er9aBSHPHO2LDsSjX/MFPl
	/BBd4Pabw69TqhiKn4bbXjzidm35k/O1ICsfId0z7OjzPiqhPLcO7frDqEFn02Rn+5CuD910XwD
	jE6iL83DqIB/SiPKFWwLJnUrjDX0wUA3tth/4ALVAbZVzv306iUg==
X-Gm-Gg: AfdE7cmmMc5Ye65SM9h2XZXFk09cEXCSloPOq+wqkMavZpk8ONUPW78uoa4jrI4gPI+
	wBTr58C1a+lskSdA51b6TWIViknaVyF6xBKZfELXDZ25j5Cfrvr+9PbJdM1JgrGy10L3jFOBrOO
	H5NO+ffl+Gn+2QK2k8o5DjGq89JLVbedkhS6qdPNIlo5zOKn5m3z3Klw+Y
X-Received: by 2002:a05:6871:c929:b0:43b:5268:b7a0 with SMTP id 586e51a60fabf-4569038eb5fmr318611fac.26.1784260215447;
        Thu, 16 Jul 2026 20:50:15 -0700 (PDT)
X-Received: by 2002:a05:6871:c929:b0:43b:5268:b7a0 with SMTP id
 586e51a60fabf-4569038eb5fmr318594fac.26.1784260214909; Thu, 16 Jul 2026
 20:50:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260711111356.54497-1-tarang.raval@siliconsignals.io>
 <CAEth8oH=nbSv-sPa8oyKLSEYH=mWGwo0pW1OmYrXVTZPRstkAQ@mail.gmail.com> <PN3P287MB1829E30ABB1D2E409C16F2AD8BC72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <PN3P287MB1829E30ABB1D2E409C16F2AD8BC72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 16 Jul 2026 23:50:03 -0400
X-Gm-Features: AUfX_mxxLRFG2_Z2-Uj-K1Slur_U160pJPWFMWY4fLTxd3XgDGXULtiqixXC7a8
Message-ID: <CAEth8oFnXp-xpq8GQLSRDKBBkPXabgEeDPVNWJLT6M+tuyT=Lg@mail.gmail.com>
Subject: Re: [PATCH] platform: int3472: discrete: Support multiple HIDs per
 GPIO map entry
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "hansg@kernel.org" <hansg@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tarang,

Thank you for the update.

On Thu, Jul 16, 2026 at 4:44=E2=80=AFAM Tarang Raval
<tarang.raval@siliconsignals.io> wrote:
>
> Hi Kate,
>
> > Hi Tarang,
> >
> > Thank you for working on this.
> >
> > On Sat, Jul 11, 2026 at 7:16=E2=80=AFAM Tarang Raval
> > <tarang.raval@siliconsignals.io> wrote:
> > >
> > > Each int3472_gpio_map entry currently maps exactly one ACPI HID to a
> > > GPIO quirk. As more sensors needing the same quirk are identified, th=
is
> > > means adding a full duplicate table entry per HID, differing only in
> > > the HID string, which does not scale.
> > >
> > > Change int3472_gpio_map::hid to a NULL-terminated hids array so a
> > > single entry can match any number of ACPI HIDs, letting new HIDs be
> > > added to the relevant array instead of duplicating quirk entries.
> > >
> > > Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> > > ---
> > >
> > > Identified while reviewing Kate Hsuan's imx471 vana con_id patch, who=
se
> > > two near-identical SONY471A/TBE20A0 entries are collapsed here into
> > > one, backed by a new power_enable_hids_vana[] array.
> > >
> > > This patch is on top of kate's imx471 driver series[1].
> > >
> > > Link: https://lore.kernel.org/linux-media/20260629074026.35490-1-hpa@=
redhat.com/T/#t [1].
> > >
> > > ---
> > >  drivers/platform/x86/intel/int3472/discrete.c | 49 ++++++++++++-----=
--
> > >  1 file changed, 30 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/=
platform/x86/intel/int3472/discrete.c
> > > index adff564bf3fd..f86333e38341 100644
> > > --- a/drivers/platform/x86/intel/int3472/discrete.c
> > > +++ b/drivers/platform/x86/intel/int3472/discrete.c
> > > @@ -123,10 +123,21 @@ skl_int3472_gpiod_get_from_temp_lookup(struct i=
nt3472_discrete_device *int3472,
> > >         return desc;
> > >  }
> > >
> > > +/*
> > > + * Other vana-supply users (e.g. ST, Toshiba, Sony sensors) can be a=
dded to
> > > + * this array instead of adding new quirk table entries.
> > > + */
> > > +static const char * const power_enable_hids_vana[] =3D {
> > Should we have a commit mentioning which laptop model exposed the HID?
> > For example
> >             /* Lenovo X9-14 and X9-15 */
> > > +       "SONY471A",
> >             /* Lenovo X1 Carbon G14 */
>
> I'll update in v2.
>
> > > +       "TBE20A0",
> > > +       NULL
> > > +};
> > > +
> > >  /**
> > >   * struct int3472_gpio_map - Map GPIOs to whatever is expected by th=
e
> > >   * sensor driver (as in DT bindings)
> > > - * @hid: The ACPI HID of the device without the instance number e.g.=
 INT347E
> > > + * @hids: NULL-terminated array of ACPI HIDs of the devices without =
the
> > > + * instance number e.g. INT347E
> > >   * @type_from: The GPIO type from ACPI ?SDT
> > >   * @type_to: The assigned GPIO type, typically same as @type_from
> > >   * @enable_time_us: Enable time in usec for GPIOs mapped to regulato=
rs
> > > @@ -135,7 +146,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int=
3472_discrete_device *int3472,
> > >   * GPIO_ACTIVE_HIGH otherwise
> > >   */
> > >  struct int3472_gpio_map {
> > > -       const char *hid;
> > > +       const char * const *hids;
> > >         u8 type_from;
> > >         u8 type_to;
> > >         bool polarity_low;
> > > @@ -145,38 +156,27 @@ struct int3472_gpio_map {
> > >
> > >  static const struct int3472_gpio_map int3472_gpio_map[] =3D {
> > >         {       /* mt9m114 designs declare a powerdown pin which cont=
rols the regulators */
> > > -               .hid =3D "INT33F0",
> > > +               .hids =3D (const char * const[]) { "INT33F0", NULL },
> >
> > I think it is bettter to keep the consistent style, the hids array can
> > be declared individually like you did for the sony sensor.
> >
> > for example,
> > static const char * const power_enable_hids_vdd[] =3D {
> >       /* mt9m114 */
> >       "INT33F0",
> >       NULL
> > };
> >
> > ...
> >
> >   .hids =3D power_enable_hids_vdd;
>
> I'll update in v2.
>
> > >                 .type_from =3D INT3472_GPIO_TYPE_POWERDOWN,
> > >                 .type_to =3D INT3472_GPIO_TYPE_POWER_ENABLE,
> > >                 .con_id =3D "vdd",
> > >                 .enable_time_us =3D GPIO_REGULATOR_ENABLE_TIME,
> > >         },
> > >         {       /* ov7251 driver / DT-bindings expect "enable" as con=
_id for reset */
> > > -               .hid =3D "INT347E",
> > > +               .hids =3D (const char * const[]) { "INT347E", NULL },
> > same here.
> >
> > >                 .type_from =3D INT3472_GPIO_TYPE_RESET,
> > >                 .type_to =3D INT3472_GPIO_TYPE_RESET,
> > >                 .con_id =3D "enable",
> > >         },
> > >         {       /* ov08x40's handshake pin needs a 45 ms delay on som=
e HP laptops */
> > > -               .hid =3D "OVTI08F4",
> > > +               .hids =3D (const char * const[]) { "OVTI08F4", NULL }=
,
> > same here.
>
> This shouldn't be a named array like power_enable_hids_vana. Unlike vana,
> this entry's enable_time_us (45ms) is a HID-specific quirk, not a shared
> property, so a generic power_enable_hids_dvdd array would wrongly imply
> future HIDs added to it inherit that same delay.
>
> Except for this one, I'll declare the other HID arrays individually.
I think keeping the inconsistent style is better for readability, but
let's wait for input from the other reviewers.

>
> > >                 .type_from =3D INT3472_GPIO_TYPE_HANDSHAKE,
> > >                 .type_to =3D INT3472_GPIO_TYPE_HANDSHAKE,
> > >                 .con_id =3D "dvdd",
> > >                 .enable_time_us =3D 45 * USEC_PER_MSEC,
> > >         },
> > > -       {       /* imx471 expects "vana" as con_id for power enable *=
/
> > > -               .hid =3D "SONY471A",
> > > -               .type_from =3D INT3472_GPIO_TYPE_POWER_ENABLE,
> > > -               .type_to =3D INT3472_GPIO_TYPE_POWER_ENABLE,
> > > -               .con_id =3D "vana",
> > > -               .enable_time_us =3D GPIO_REGULATOR_ENABLE_TIME,
> > > -       },
> > > -       {
> > > -               /*
> > > -                * imx471 (on Lenovo ThinkPads X1 G14) expects "vana"=
 as con_id
> > > -                * for power enable
> > > -                */
> > > -               .hid =3D "TBE20A0",
> > > +       {       /* Sensors which expect "vana" as con_id for power en=
able */
> > > +               .hids =3D power_enable_hids_vana,
> > >                 .type_from =3D INT3472_GPIO_TYPE_POWER_ENABLE,
> > >                 .type_to =3D INT3472_GPIO_TYPE_POWER_ENABLE,
> > >                 .con_id =3D "vana",
> > > @@ -184,6 +184,17 @@ static const struct int3472_gpio_map int3472_gpi=
o_map[] =3D {
> > >         },
> > >  };
> > >
> > > +static bool int3472_gpio_map_hids_match(struct acpi_device *adev,
> > > +                                       const char * const *hids)
> > > +{
> >
> > It is better to have a NULL guard here.
> >        if (!hids)
> >                return false;
>
> Why ?

>
> There is no case where .hids can legitimately be NULL, since every
> GPIO mapping entry is meaningless without a HID to match against.
>
> so the NULL check isn't needed.
>
> > > +       for (unsigned int i =3D 0; hids[i]; i++) {

Dereferencing a NULL hids pointer in the for loop will lead to a
kernel crash.  Verifying the input parameter "hids" before
dereferencing it makes this function more defensive.

> > > +               if (acpi_dev_hid_uid_match(adev, hids[i], NULL))
> > > +                       return true;
> > > +       }
> > > +
> > > +       return false;
> > > +}
> > > +
> > >  static void int3472_get_con_id_and_polarity(struct int3472_discrete_=
device *int3472, u8 *type,
> > >                                             const char **con_id, unsi=
gned long *gpio_flags,
> > >                                             unsigned int *enable_time=
_us)
> > > @@ -200,7 +211,7 @@ static void int3472_get_con_id_and_polarity(struc=
t int3472_discrete_device *int3
> > >                 if (*type !=3D int3472_gpio_map[i].type_from)
> > >                         continue;
> > >
> > > -               if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i]=
.hid, NULL))
> > > +               if (!int3472_gpio_map_hids_match(adev, int3472_gpio_m=
ap[i].hids))
> > >                         continue;
> > >
> > >                 dev_dbg(int3472->dev, "mapping type 0x%02x pin to 0x%=
02x %s\n",
> > > --
> > > 2.34.1
> > >
> >
> > I tested this patch and it works.
> >
> > Tested-by: Kate Hsuan <hpa@redhat.com>
>
> Thanks for testing this patch.
>
> Best Regards,
> Tarang



--=20
BR,
Kate

