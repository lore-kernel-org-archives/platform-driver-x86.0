Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63F341D219
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 11:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325507; cv=pass; b=JECIaDAoccD2oIE4p6B+Ejf0sMdyGTgEWO/z8lF5zr7a06rxikMp6do8a6tj8j97bk6fSMQDTf0+1okOWZ8LIBi+470u+fpQ/0Rv3g4N/jMsyjRE9GmXFOlye39y7KYJG9/h/ke3UVVnL1NE0SqJA5fZkEkNKJzEX5/am34ESqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325507; c=relaxed/simple;
	bh=FLPHNvRQdoBt+d9amRqUb2qeOLirKfRBz6I3QbkaJjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c08mQ0Eo5g0qY3ul3ss80O9QBu3d75iixddN0n2NjGVGRF6XDI7j+ltYVYaNV+v8XJWEDGSe2whLvqANH+LwcHzTOUxjdk9cKNtej98KMhSY5yB4HumvWK2t4B3uOR81ey2v/BrX2hKOgp1TH3ClrQAswjE0CKc17//cHfTb6tI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=POpgMw0N; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=U39WddTJ; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="POpgMw0N";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="U39WddTJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785325504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PQJT115HU92JWPYUPpOUK44QRUO6MpxVdnzSebyVM+c=;
	b=POpgMw0NgB8Ls7d/f2Dbu67180H0ad9a8ZOeCmLd+IE9QdE9DoZpimv5jgA/8YH3Z+Mafw
	kBCT5bfLROC/8P+yBg6XiXAZ5W9yq6iAZRjzMBxbBxpkvIIe+fSTK0eGGPGrayQWE/6TUB
	DUTHra8Zoy5qpzgME+4fnQkafsj1O1o=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-vx2ppWW0PumTEbroHbHd1g-1; Wed, 29 Jul 2026 07:45:02 -0400
X-MC-Unique: vx2ppWW0PumTEbroHbHd1g-1
X-Mimecast-MFC-AGG-ID: vx2ppWW0PumTEbroHbHd1g_1785325502
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-451ff8b9acbso1724438fac.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 04:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785325502; cv=none;
        d=google.com; s=arc-20260327;
        b=dU6qAtgN20QIRMunY8X+aTAHl5HW8/vYJbykYRrogqzCcqQC6Yc/Od2yRASnGV4qW5
         Q/ju3//H7JnOrjy0AhxzaNNcHBeQgKqyLRpjtAShK3wVuxdxWBh63KCVzNT4gswwmmU6
         TfDUovkwPD8SpgcJ+/3y7+T2atU96uWwzwlxNM/nqAkC9NSOqdjVfpCW6UKkaSDZCzBo
         tES5dvFUP1fMw9dILg/yB/4Hj5VdrTBVzk/OprXKjFwJd4elb52r8T6JWK9tKTTe8LbH
         KVnB/NvxMuuq8GAlLoFVaz0W6s6fNtkiny29jCeCsJUzTULy+uDc1b38QHe5dE66fZA6
         +rkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PQJT115HU92JWPYUPpOUK44QRUO6MpxVdnzSebyVM+c=;
        fh=c3vMpP/6dIyC68wBfSSOdwq4r7joDCkRTVRTZM047zM=;
        b=T/caexw6YV/biSZv07s1TGG6vDGPQZLsgg/0gAWQ5OzSfOup+NuNCobhhI7sCayB1T
         VwmsuaTALeHW0eGKDOQwUe9jFpqtO27PJiXNOiFnRTwKYBMcKgpUxKOAp5+kJTvVP5UY
         pGkX8s+D75nJR83lTNUyizd9xvcY72bgo4d9ONLC+cgV6FFgyxBLPDNO6D677uLMjGEw
         lifi5/dGd4+vINY4YLgRNEh5xiIMVQqyuyUhUbdBTnEeOTj69mjQ7IeR3IC5Xjo4FdKT
         T/dlF/kX9dUFbTdCSf2PIleK45KsF4UV8uxAWFsQjURzfB0WWROniPuiNrgR+RU0hmms
         tvHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785325502; x=1785930302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PQJT115HU92JWPYUPpOUK44QRUO6MpxVdnzSebyVM+c=;
        b=U39WddTJTAhO2kMCD6Z15ZIO8qnaJrKzA1GSs1sQu0AcIXQFoBMKi7C2cv6d0KASS8
         NBO8eE+00FH29cxGwmXJia8tbtd0F2c8cqi5CzfjHlut6TvsxWSeB1ztPaOgZffguS22
         xThFx0D0STHuKNz8O54sEeCDRHOp6sNalLA0FFBsascmaFScqvGwGL0HbOUMGxPANx+3
         dhqC6IeGYEn2PM6aF8ZCGyiKMJhN5w9gHMdu5ksOYTJ2QyrWWumao6Z2FAFJdhvwNfJg
         9n9oMMjCxnRy8cy5dh0ZBfnUxBHWAWoqZVt/pS/s5DrVDw1/x8sofC9AP0gcPoBXOk7H
         qfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325502; x=1785930302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PQJT115HU92JWPYUPpOUK44QRUO6MpxVdnzSebyVM+c=;
        b=sjSg4hok5kZ7EQ82/oo9Fbrc6/0cAzIxEmd0sEMvtF3mZRVT/O9UEJGR82Ol8tA68j
         FbuZumEWrDoFlaVH1NOzj+xzLEWXIw9AcMkY8UPYzZ4dILq2NCqZtn5OpIcmI3lG/xjP
         sJUAjlYaXp6BKrUZkJuMY0OyZSn4saA4NnoQOqJ17M4M8n/G5LTidC6Tak0qMgWdG4AU
         7+sKlU6JqngDQ/9SYj2tYyzXRqpwIWE/yewomtcfalv/Zzeu3qrsFgPbGiGrZddbz2f/
         fJzTy7p8B+nI5plVPj1GcEISjIpZh4r7A9SojRa6GFANQeheU+KLeaDNQxFjKq+rAabs
         6kgQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHpWj2Tq9XS2VAbGfwk2ryEZkxCrNfiN+PaKKSnmlZ6YdmVwdO7KHDDYLoLj/eI5KYxMR2kZE1zaha8DiuLhZ9wISd@vger.kernel.org
X-Gm-Message-State: AOJu0YzCj2PCgcjxeAcvkhrsL2HD2z7gvim8Pkw8US1CMgRCtedXGIhp
	ClWNhpbhOkblWSgUAGE8ZoPai0Q0p+BJklt3D/gJ3wohrk+wKn1iUD3jNTKWPjq3/RgUkEDxNbc
	+oZvlYN+MuQB2iUmjTaM7UbNlxzERmyNNkK/FfY/qZAvNA9d+q+yDV905XLAB3/k4usm17oo/hC
	kvyLRxnBnsFwSUezADqXiacxdywr79JxUC8Dm68KvMB20dEEqiwA==
X-Gm-Gg: AR+sD12mPBRicLt79fDyxsH4sjcEQ9Q5pWJFSQhTb8OmUVY7uLamGm6HxoYyth6Vl+r
	vX2wuvelyjbdLvhrioTjx8ZjAJN8muHibIA2RwTeGSmVTg8NgapHiPtpRySpwJo4OrGyIn/VV/g
	FiyQWzRHd2tjJb4ahjxsRFkXueGSjpPjoxmefVxcs9b4hIK7S+rTIkPQs=
X-Received: by 2002:a05:6870:d10c:b0:456:c0b0:fa81 with SMTP id 586e51a60fabf-458961d8416mr941084fac.15.1785325501892;
        Wed, 29 Jul 2026 04:45:01 -0700 (PDT)
X-Received: by 2002:a05:6870:d10c:b0:456:c0b0:fa81 with SMTP id
 586e51a60fabf-458961d8416mr941066fac.15.1785325501434; Wed, 29 Jul 2026
 04:45:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729055801.751945-1-tarang.raval@siliconsignals.io>
In-Reply-To: <20260729055801.751945-1-tarang.raval@siliconsignals.io>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 29 Jul 2026 19:44:49 +0800
X-Gm-Features: AUfX_myXi3r4mFBAWY7Kh1aMk6sh7LJFih7OsIzW7gGkgMauQPQs3oOrfLT51Ew
Message-ID: <CAEth8oFjCMXGRMkuq_FUcXk-QgQ3BZ010C+We0BC_TZXDYZgEg@mail.gmail.com>
Subject: Re: [RESEND PATCH v3] platform: int3472: discrete: Support multiple
 HIDs per GPIO map entry
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tarang,

Thank you for your work.

On Wed, Jul 29, 2026 at 1:58=E2=80=AFPM Tarang Raval
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
> Cc: linux-media@vger.kernel.org
> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> Tested-by: Kate Hsuan <hpa@redhat.com>
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Change-log:
>
> v2 -> v3:
>
> - Move the comments after the HID strings and include the sensor name,
>   as suggested by Hans.
> - Add the Reviewed-by tags from Hans and Daniel.
>
> v1 -> v2:
>
> - Add per-HID comments to power_enable_hids_vana[] (Lenovo X9-14/X9-15
>   for SONY471A, Lenovo X1 Carbon G14 for TBE20A0)
> - Convert INT33F0 (mt9m114), INT347E (ov7251) entries to use named
>   power_enable_hids_*[] arrays instead of anonymous compound literals,
>   for style consistency
> - Did not convert OVTI08F4 (ov08x40) to a named array, and did not add
>   a NULL guard in int3472_gpio_map_hids_match(): not fully convinced
>   these changes are needed yet, but open to further discussion on both
>
> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 59 +++++++++++++------
>  1 file changed, 40 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/plat=
form/x86/intel/int3472/discrete.c
> index adff564bf3fd..6c729fcfce5d 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -123,10 +123,31 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int34=
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
> +       "SONY471A", /* imx471 on Lenovo X9-14 and X9-15 */
> +       "TBE20A0", /* imx471 on Lenovo X1 Carbon G14 */
> +       NULL
> +};
> +
> +static const char * const power_enable_hids_vdd[] =3D {
> +       "INT33F0", /* mt9m114 */
> +       NULL
> +};
> +
> +static const char * const power_enable_hids_enable[] =3D {
> +       "INT347E", /* ov7251 */
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
> @@ -135,7 +156,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472=
_discrete_device *int3472,
>   * GPIO_ACTIVE_HIGH otherwise
>   */
>  struct int3472_gpio_map {
> -       const char *hid;
> +       const char * const *hids;
>         u8 type_from;
>         u8 type_to;
>         bool polarity_low;
> @@ -145,38 +166,27 @@ struct int3472_gpio_map {
>
>  static const struct int3472_gpio_map int3472_gpio_map[] =3D {
>         {       /* mt9m114 designs declare a powerdown pin which controls=
 the regulators */
> -               .hid =3D "INT33F0",
> +               .hids =3D power_enable_hids_vdd,
>                 .type_from =3D INT3472_GPIO_TYPE_POWERDOWN,
>                 .type_to =3D INT3472_GPIO_TYPE_POWER_ENABLE,
>                 .con_id =3D "vdd",
>                 .enable_time_us =3D GPIO_REGULATOR_ENABLE_TIME,
>         },
>         {       /* ov7251 driver / DT-bindings expect "enable" as con_id =
for reset */
> -               .hid =3D "INT347E",
> +               .hids =3D power_enable_hids_enable,
>                 .type_from =3D INT3472_GPIO_TYPE_RESET,
>                 .type_to =3D INT3472_GPIO_TYPE_RESET,
>                 .con_id =3D "enable",
>         },
>         {       /* ov08x40's handshake pin needs a 45 ms delay on some HP=
 laptops */
> -               .hid =3D "OVTI08F4",
> +               .hids =3D (const char * const[]) { "OVTI08F4", NULL },
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
> @@ -184,6 +194,17 @@ static const struct int3472_gpio_map int3472_gpio_ma=
p[] =3D {
>         },
>  };
>
> +static bool int3472_gpio_map_hids_match(struct acpi_device *adev,
> +                                       const char * const *hids)
> +{
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
> @@ -200,7 +221,7 @@ static void int3472_get_con_id_and_polarity(struct in=
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

It is good for me.

Reviewed-by: Kate Hsuan <hpa@redhat.com>


--=20
BR,
Kate

