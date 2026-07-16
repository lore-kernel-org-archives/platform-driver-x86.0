Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D423A9DA1
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 07:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784186396; cv=pass; b=b/adrAy2dEq3rir9U1oYsgXxTYPmIeTLLbJAx9FQLAXFT/UsSFafrqdAioChku/qyXoLa5Iic0DGY6hjOTlSIY2CqUYDreySwv8eFvoy84YCEYXcGdopD436y2caJhjQgM7vv3LnS6M9z0UP86aYt/PzEcvdYttgpilmKxpi66E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784186396; c=relaxed/simple;
	bh=n+fq4j/hdHSoVcG+GPdj5vhY7oXUzw1IPlCjerkWt/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qh5LINGD+Pw9eTQQx4boG7bVOHA+7is3qVxsIK0mg+7rigs/QbwWY6LOTcfVlnR/cn7a5qFI3Wg+A41GQjIRYHHoI3cpBw0zFU+SrjLzmT6m/5mVtJUf3lKAHk7awolVee7j/hgaYUzQOPCTmX+klrHlXqDSrp+muOc/ob5YVAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PX3YPdbz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=e5nPv2rW; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PX3YPdbz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="e5nPv2rW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784186381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zSLA7fX0gikIVIi7M9qv+FICqDicmNU2IOHbKR7PeuY=;
	b=PX3YPdbzuV7CJQgWOWl0Vk4mgfY/PTGrpGjGjom6rbzJvyM8Rtq6xY4gbDO4d8KePfm1IS
	x5rB/xQ8hMHEIW2s/H7VEbJbFIYLENJ3mXgiQ2TgJpuG6mJejMFw9/mI4ky+cXqCg6oUQD
	3rTdz8qX4B7BaTO8iG3Uyo3NBOpz+/g=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-8RFoCivSOaOXovZG-3nM8Q-1; Thu, 16 Jul 2026 03:19:39 -0400
X-MC-Unique: 8RFoCivSOaOXovZG-3nM8Q-1
X-Mimecast-MFC-AGG-ID: 8RFoCivSOaOXovZG-3nM8Q_1784186379
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-49001defc4dso9367100b6e.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 00:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784186379; cv=none;
        d=google.com; s=arc-20260327;
        b=LuhNlg8TPtVq7KSp2RzHlJyAe9JVZcUGjzr4260ERgRjpGQEG5dJQ4uS2uUAc2SyMV
         u1f90f6TQHtg43YNIuQpg4CJrFxZuM5N3Yh2N40Rrkwljl83MQAwSsCdg2svykxNLWz8
         KPEVCFurtwbeesU/xlnSlWlxqxICgu1HXbQjHkucqJj3XOu93BRZHQGBTmwuNBLy44IM
         DJtnpnsnqnmK0DPNrKH35eFWUWH6td8+SJ53RXhn5xgIFiPkudRR0LIvkrDhuliBusop
         wvy9w9rSL0AFWsth1k+l98ogwul9riDzAumW70lQm+RIKpAG5dfL+vJW9A/Xk/BLG45N
         15Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zSLA7fX0gikIVIi7M9qv+FICqDicmNU2IOHbKR7PeuY=;
        fh=Ms//uQnXlrAL978oaCtjOslD+tZtvfbCxMUASn+0GfQ=;
        b=Q1ECLUJbdODOKS97H9VajNeEu/9OVtTOQoBwrrRieuLFuR5c3k3sbgF/7HsW6a8gOg
         EMe6U4tsuun6dL51bWUFzeA5EILAEuGOamzO/9mG8rj35xWQWJZuJPGNgBw+e2XfmxAe
         GXzzqSjoUFZgHZMobdOQVOn4oZ5K8U/kCT8O14lvqu45J3nLpDeLy9w3pW07f+8bocRs
         gSOLQyjmj+HrlsKw4uj2TR9YAD524+wpHmc6J1hUqWZ76y/74pqFSjMtg0KKWn1cdTaL
         Y5iiFSy2+jvgy3DC8YHO3wcDv8oEQQDv5pn8X0JJXpcOKvs1QGpdU9m6COgNu1QJc72s
         yHIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784186379; x=1784791179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zSLA7fX0gikIVIi7M9qv+FICqDicmNU2IOHbKR7PeuY=;
        b=e5nPv2rWaSALVLakZd+DrRNGTkMXuh6Blt0rqHnXxK9C7J5zPjPpfFY2nlaN2O1A3h
         BOE5jL5JsZiLo6ygx5+gvpDuZUqrDcEPzMxD9RjAhkAIlNkiD1VGQB4SzA0tHWXqUY2x
         ZQnB10bxb2pQxJTAeNa/tHuVDlkKG9gnTGoBwT0Sfx8e0nDMERR775xSEYbl5VlJ1JgZ
         IXdgRogZBdmtf+4MCj4se1TrlmhOcge+7ZImQnus9i59xJaxsnIdfKR90ikmZaZXYgVM
         GtVsoXui9gRCWxlkIOxpFzUhM3gRRM1Y4syEeHddbUGu4/FUBGedU0CAFzBDvDxIOgIx
         JJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784186379; x=1784791179;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zSLA7fX0gikIVIi7M9qv+FICqDicmNU2IOHbKR7PeuY=;
        b=ALrB0yqeYgMIKCiRoxYoMvIisLmg3i35d7PM5jg4wFoiqJUoIoJrY7MYULelsr3Tce
         WxvfplPH8avzU9gsJZAwPjLd7xRmfJgW+gHMgKC5H8AC8XYpDJvRXtzkTuyI2PgQLyku
         //Q+aM2J+fuqvRphH2vrGeXqAvA/I7TVj96b0IFHMIFGn39nZ/c+9EBEbeSuTS13OmcM
         ZIuZODe0f7GT+6yV8XJF8ZtC5RQMxwYICBIpaNPTBgDS1KWr19IuJBs3mj3owRkhtt15
         HU9EM5X2gR4T6dUkNj1BcTvrwmfrZ+7SZ7AQxVP2iSC6HZBAbfIuaUceO7XbWFczFYBH
         /syw==
X-Forwarded-Encrypted: i=1; AHgh+RqSyOOGrqKx35+vO9o36+Ohdf3FSObn50yty9mlbCRJ7v7iIm8xIHT97YMZsVi4jvg7Ynff9Wsfcg8AHCOrlr5valTI@vger.kernel.org
X-Gm-Message-State: AOJu0YwRFCiaD4YuCm87PG41GAMaKPdxKrYpbiFMLzOFv8JoA/s9VMcA
	XnaI69cAeHOYLFtGVe/Pj9B5s7eEWmxbLc/cFyc3FTncnpc4dAPEcipdmjXlmuXIWnO/dmUykNG
	DY7YGdwyfbd9gdOcVC4U3UZFvHVf8xaxZm482Q4l2k4fBlPJD7y6asZsSNG2eGcYCYm7G927sMF
	TKgOP7KuBdYsd0CoxBuFltyS/NQC7isQersKS/SInvc6jFgjDqdA==
X-Gm-Gg: AfdE7cmqNNTRBzEisElNmRDmnJXlPQPjsBFKRkXahonN1DJdh9j6Iz+PEewaJ22wZvV
	xVvBEMqLLoeGSbdbuW18suJ0FwCpYqeWWj8XHIAyG7q7kFB0LjUmVmmq9hqasM/Wn8AUGqHb0Fp
	CogyTm2CGTEe7P99fhOzge0WCMJZ+4dPHrJsk44/nNfyUfaNko8drCecu2
X-Received: by 2002:a05:6808:c14a:b0:486:8a11:6e8b with SMTP id 5614622812f47-4a47a40d3abmr6341334b6e.2.1784186378556;
        Thu, 16 Jul 2026 00:19:38 -0700 (PDT)
X-Received: by 2002:a05:6808:c14a:b0:486:8a11:6e8b with SMTP id
 5614622812f47-4a47a40d3abmr6341293b6e.2.1784186378070; Thu, 16 Jul 2026
 00:19:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260711111356.54497-1-tarang.raval@siliconsignals.io>
In-Reply-To: <20260711111356.54497-1-tarang.raval@siliconsignals.io>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 16 Jul 2026 03:19:25 -0400
X-Gm-Features: AUfX_mzlZDQQixrRBDwU-Y5ZjLUP1A3uRktj4EtAVr3N0ZvrOENUJVAziU-Mxi4
Message-ID: <CAEth8oH=nbSv-sPa8oyKLSEYH=mWGwo0pW1OmYrXVTZPRstkAQ@mail.gmail.com>
Subject: Re: [PATCH] platform: int3472: discrete: Support multiple HIDs per
 GPIO map entry
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, hansg@kernel.org, 
	Daniel Scally <dan.scally@ideasonboard.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tarang,

Thank you for working on this.

On Sat, Jul 11, 2026 at 7:16=E2=80=AFAM Tarang Raval
<tarang.raval@siliconsignals.io> wrote:
>
> Each int3472_gpio_map entry currently maps exactly one ACPI HID to a
> GPIO quirk. As more sensors needing the same quirk are identified, this
> means adding a full duplicate table entry per HID, differing only in
> the HID string, which does not scale.
>
> Change int3472_gpio_map::hid to a NULL-terminated hids array so a
> single entry can match any number of ACPI HIDs, letting new HIDs be
> added to the relevant array instead of duplicating quirk entries.
>
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>
> Identified while reviewing Kate Hsuan's imx471 vana con_id patch, whose
> two near-identical SONY471A/TBE20A0 entries are collapsed here into
> one, backed by a new power_enable_hids_vana[] array.
>
> This patch is on top of kate's imx471 driver series[1].
>
> Link: https://lore.kernel.org/linux-media/20260629074026.35490-1-hpa@redh=
at.com/T/#t [1].
>
> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 49 ++++++++++++-------
>  1 file changed, 30 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/plat=
form/x86/intel/int3472/discrete.c
> index adff564bf3fd..f86333e38341 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -123,10 +123,21 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int34=
72_discrete_device *int3472,
>         return desc;
>  }
>
> +/*
> + * Other vana-supply users (e.g. ST, Toshiba, Sony sensors) can be added=
 to
> + * this array instead of adding new quirk table entries.
> + */
> +static const char * const power_enable_hids_vana[] =3D {
Should we have a commit mentioning which laptop model exposed the HID?
For example
            /* Lenovo X9-14 and X9-15 */
> +       "SONY471A",
            /* Lenovo X1 Carbon G14 */
> +       "TBE20A0",
> +       NULL
> +};
> +
>  /**
>   * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
>   * sensor driver (as in DT bindings)
> - * @hid: The ACPI HID of the device without the instance number e.g. INT=
347E
> + * @hids: NULL-terminated array of ACPI HIDs of the devices without the
> + * instance number e.g. INT347E
>   * @type_from: The GPIO type from ACPI ?SDT
>   * @type_to: The assigned GPIO type, typically same as @type_from
>   * @enable_time_us: Enable time in usec for GPIOs mapped to regulators
> @@ -135,7 +146,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472=
_discrete_device *int3472,
>   * GPIO_ACTIVE_HIGH otherwise
>   */
>  struct int3472_gpio_map {
> -       const char *hid;
> +       const char * const *hids;
>         u8 type_from;
>         u8 type_to;
>         bool polarity_low;
> @@ -145,38 +156,27 @@ struct int3472_gpio_map {
>
>  static const struct int3472_gpio_map int3472_gpio_map[] =3D {
>         {       /* mt9m114 designs declare a powerdown pin which controls=
 the regulators */
> -               .hid =3D "INT33F0",
> +               .hids =3D (const char * const[]) { "INT33F0", NULL },

I think it is bettter to keep the consistent style, the hids array can
be declared individually like you did for the sony sensor.

for example,
static const char * const power_enable_hids_vdd[] =3D {
      /* mt9m114 */
      "INT33F0",
      NULL
};

...

  .hids =3D power_enable_hids_vdd;

>                 .type_from =3D INT3472_GPIO_TYPE_POWERDOWN,
>                 .type_to =3D INT3472_GPIO_TYPE_POWER_ENABLE,
>                 .con_id =3D "vdd",
>                 .enable_time_us =3D GPIO_REGULATOR_ENABLE_TIME,
>         },
>         {       /* ov7251 driver / DT-bindings expect "enable" as con_id =
for reset */
> -               .hid =3D "INT347E",
> +               .hids =3D (const char * const[]) { "INT347E", NULL },
same here.

>                 .type_from =3D INT3472_GPIO_TYPE_RESET,
>                 .type_to =3D INT3472_GPIO_TYPE_RESET,
>                 .con_id =3D "enable",
>         },
>         {       /* ov08x40's handshake pin needs a 45 ms delay on some HP=
 laptops */
> -               .hid =3D "OVTI08F4",
> +               .hids =3D (const char * const[]) { "OVTI08F4", NULL },
same here.

>                 .type_from =3D INT3472_GPIO_TYPE_HANDSHAKE,
>                 .type_to =3D INT3472_GPIO_TYPE_HANDSHAKE,
>                 .con_id =3D "dvdd",
>                 .enable_time_us =3D 45 * USEC_PER_MSEC,
>         },
> -       {       /* imx471 expects "vana" as con_id for power enable */
> -               .hid =3D "SONY471A",
> -               .type_from =3D INT3472_GPIO_TYPE_POWER_ENABLE,
> -               .type_to =3D INT3472_GPIO_TYPE_POWER_ENABLE,
> -               .con_id =3D "vana",
> -               .enable_time_us =3D GPIO_REGULATOR_ENABLE_TIME,
> -       },
> -       {
> -               /*
> -                * imx471 (on Lenovo ThinkPads X1 G14) expects "vana" as =
con_id
> -                * for power enable
> -                */
> -               .hid =3D "TBE20A0",
> +       {       /* Sensors which expect "vana" as con_id for power enable=
 */
> +               .hids =3D power_enable_hids_vana,
>                 .type_from =3D INT3472_GPIO_TYPE_POWER_ENABLE,
>                 .type_to =3D INT3472_GPIO_TYPE_POWER_ENABLE,
>                 .con_id =3D "vana",
> @@ -184,6 +184,17 @@ static const struct int3472_gpio_map int3472_gpio_ma=
p[] =3D {
>         },
>  };
>
> +static bool int3472_gpio_map_hids_match(struct acpi_device *adev,
> +                                       const char * const *hids)
> +{

It is better to have a NULL guard here.
       if (!hids)
               return false;

> +       for (unsigned int i =3D 0; hids[i]; i++) {
> +               if (acpi_dev_hid_uid_match(adev, hids[i], NULL))
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
>  static void int3472_get_con_id_and_polarity(struct int3472_discrete_devi=
ce *int3472, u8 *type,
>                                             const char **con_id, unsigned=
 long *gpio_flags,
>                                             unsigned int *enable_time_us)
> @@ -200,7 +211,7 @@ static void int3472_get_con_id_and_polarity(struct in=
t3472_discrete_device *int3
>                 if (*type !=3D int3472_gpio_map[i].type_from)
>                         continue;
>
> -               if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid=
, NULL))
> +               if (!int3472_gpio_map_hids_match(adev, int3472_gpio_map[i=
].hids))
>                         continue;
>
>                 dev_dbg(int3472->dev, "mapping type 0x%02x pin to 0x%02x =
%s\n",
> --
> 2.34.1
>

I tested this patch and it works.

Tested-by: Kate Hsuan <hpa@redhat.com>


--
BR,
Kate

