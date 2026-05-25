Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF2A1E7C18
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 18:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779734315; cv=pass; b=e7EqGZ8DA2rOgdCYqs+c8deMJlpzOe6wNE1h0elaElP/K7vNpNGSaW8mZ9U7On45qb66mTWIofG2b3TM2BGtumkQRiTJU4PlN4TqH42Z5MapAT+HPX5KUOhv6ILnllpPtfXgIU+RpjC6Tt0kWJ3M99gD9NEhWhUJbp2POVLfJG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779734315; c=relaxed/simple;
	bh=O33BVoXyiUZUhI5kaGfdAo690ebTUAAg3+2H+9Z+34Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+ZvtDAYOvbngQmtsFka87wxZXnUd/RyZyRHtd2p0cXe81913/QnqZR6NjLsqsxz8rY9a/O/83UhRbHMwdmM3csx+MBUbIVXLLdzBiYuxc9wM9MUI5Eh7mNhdYDzYEuGsYBT3/IyJinJ285msyax96m66Isc6ll9f2daKRyQs9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=opvOdYFY; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="opvOdYFY"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a884815606so10714435e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 11:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779734312; cv=none;
        d=google.com; s=arc-20240605;
        b=bRLF6zVfrzDL+oLEUcM7Az/vC9gTeHPytFqUHR2GLRA0JSyPlDZ2f7vG2M1maIov50
         FgeiBQIOeD80xzhLXTG61v295QWbnEZndEt/oOkG95xwEgR9v7e4PxZfgI0VaUfCJLp0
         MFcjZpv0tQ4zZ1N2O7ObwweEHaHjR5iXse5NxkW6SVJi8ruQ8bDmdt52kNfV3rpdTtEI
         qg5MFrPl69fXCZ0Sc0ItSXI3jkK12mMZ5dbSaDLTpVGkBP1bHgCaxDlFefWRVB1dyD2b
         Ta+xFZn6MO7Wwr1Lkg2WSkn+Onx7jhhZ9UZyvNXA9iJrrhJEzijdSERW7KM8gxg1s/ZF
         XMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ypkDAXuBGu3fu/OYisL5esT0LvdptfjRmH97HDKvW9c=;
        fh=yNXYLKe1It/lxN4D8dkeqWb/KRmphVTOH8aCRomOuMw=;
        b=TCZ5bNOwyqVizQ8pvqdezWWcxgocH6DZyuanVvZuWz3gPui341j3TiwO/fdD6RY/yP
         c91yqoPCtVtdWyoafMh4Cj6jHb8kjr06cLwEHavQ7KinY1rKzHpFjf8N6bDmKiiNkGN5
         /gYPmtWYMKCM7vhXKT9j7/jU8ZL+nzlKf7ZY5cvogMf7OFiq5U0gRiIiwzb9/wk2mvWy
         sru3J5NgWVs94Tfonv6tlvk7BCyFKN6s3L6CgWBuWY8Uwll80enhf5OFPYCs/WOQXQsv
         zkmV/I1Q3/mJA+773BgZEAPMHODughy9tDbKo3ii7KgXaLEbAiy7j2GHymycIqmI0opC
         SxdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779734312; x=1780339112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypkDAXuBGu3fu/OYisL5esT0LvdptfjRmH97HDKvW9c=;
        b=opvOdYFYMv6lwekLMf44Yt+ciKR+ZjIhP340PdKMW9Zm0VAtqbzCQyhwriECyx3eT1
         cJ0jBzPLvAuHlE+7W7N545UeRy5/IUC/TVk08ofmjqawnJ1RRwWfJ4vOWpsuHUTlDcln
         Uf1BO+dj0T7uTYRPtRYRCCw9lQursN59U+O/bDpNg4/Wmdi/l6mqAYpU/TdAtVlIIyg9
         PtYtZiisx4DpRnLpItPetH4euydk4DV2+rgzn3KQ86BzN580hSj+iAmxsH/DR/4I7B8k
         UUYrtjukUROnIlibkeEhl7k/SrTHv4qb58dzVq7IsT4g7nyVgAgu02EYiVIBLfHdDqAD
         fcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779734312; x=1780339112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ypkDAXuBGu3fu/OYisL5esT0LvdptfjRmH97HDKvW9c=;
        b=DRKZLK5GzyNoomDP7bXMXOyaZkTwNFmmXfrrI7NoE5+zND4H84+OGSY5ZTow3t768P
         2d0Fy0MFMqoQ64gZAPNW13yoqkgyW6HI0sKDvviqn3lA1oiD7VU1bpyofOwqJROoiEvZ
         TfrIss2Vh37zflE0D69CuVVijiz68IYLUF3T5s4sjJ/TRpqyEGocBXDLHO4waokej5v9
         u6I7+cd6w/rrasdcwv9x/IlzhIPjsbCMu7YxHwkX09UPqTJb2Xrda5Jo3chlKgc82iEP
         kyVS8E3eeDb32i6Y+F2ujiZ79w8rguX5R9cR+gVf97iw8lhbjRfdy9b2rPXaryM3NPrA
         7HOA==
X-Forwarded-Encrypted: i=1; AFNElJ8VnuKvPXMGiNqARM+wC8jKvghI/oHAd85XM4xnxMVDn6uGDlWgnbekyd8thKhuQEZYPa7QmhKVTc7+H7N1NiedLOz6@vger.kernel.org
X-Gm-Message-State: AOJu0YwdaatKk1tN05F8R6YBwBFqXq0RlrdrHxwaabodCwFTrZlj9qgE
	7MNDmqlatSLtz/ZQTbbgZXWxdnON1FoekQicTsyOy++L2IoHFK2TtNFyf9DMQ+0X96PpZdcoevo
	WL0VEOQdLMuT3QkbnMdDAkGmkRRi0xUJYXn4=
X-Gm-Gg: Acq92OH+tr5kQCf4UrB6gJx8Z4Ie6ni/6vqSvVkyvGy3tMkO4jHGG4WlXB+RZLNgYgz
	C5V/qsoCfrTTtaOxKEV6Cwcn+U1+h8ooPyf6i6ChoOhUd0Jrx14UDqy8vnyQAyH4eKx1W+07feP
	SM2pcIcBI3s9Y2p+wH3poqRHDALeaGvs4Glej27XjmfeHBuldZDmW0hb5qaDqfb5uAwa0GLX9HK
	ZsDDr6ag1A9/ZKw5cdKlfMvAxRA7LFGlOvLV3fSRMciw4ooVcZyPPdoZyqep7zi0NRKp2UCwhaD
	rHpXjep7pxcngZYF
X-Received: by 2002:a05:6512:1321:b0:5a7:49ed:8aa with SMTP id
 2adb3069b0e04-5aa3239a43cmr4118319e87.11.1779734311638; Mon, 25 May 2026
 11:38:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524121510.36961-1-2minesweeper2@gmail.com>
In-Reply-To: <20260524121510.36961-1-2minesweeper2@gmail.com>
From: Ayman Bagabas <ayman.bagabas@gmail.com>
Date: Mon, 25 May 2026 14:38:18 -0400
X-Gm-Features: AVHnY4K0DYgHPzwp1lja3CPfTvoEpsWI5FZ25OL0TEx2pVh1zfvdGTG4ufhPu28
Message-ID: <CAB3uXr7aFrHfn-6m7Hg+_jfY2YmTtHRfMegzZYk6Vn1zsKDq1Q@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: huawei-wmi: add ACPI fallback for Fn-lock
 on newer models
To: Shaposhnikov Daniil <2minesweeper2@gmail.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Newer Huawei laptops (e.g. FLMH-XX / MateBook 14 2024) no longer support
> the legacy WMI interface for Fn-lock control. Instead, they expose direct
> ACPI methods \GFRS and \SFRS (Get/Set Fn key Reversal Status) which
> communicate with the EC via registers 0x6B (read) and 0x6C (write).
>
> Add huawei_acpi_fn_lock_get() and huawei_acpi_fn_lock_set() helpers that
> use acpi_evaluate_object() to call these methods. Both
> huawei_wmi_fn_lock_get() and huawei_wmi_fn_lock_set() now probe for
> \GFRS/\SFRS via acpi_has_method() first and fall back to the legacy WMI
> path if not present.

Thank you for working on this. Could you open an issue and/or send a PR
to https://github.com/aymanbagabas/Huawei-WMI ?

>
> Tested on: HUAWEI FLMH-XX (MateBook 14 2024),
> CachyOS (kernel 7.0.9-1-cachyos).
>
> Signed-off-by: Shaposhnikov Daniil <2minesweeper2@gmail.com>
> ---
>  drivers/platform/x86/huawei-wmi.c | 95 +++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>
> diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/hua=
wei-wmi.c
> index 93cca17fdf58..19cd8f1a8e33 100644
> --- a/drivers/platform/x86/huawei-wmi.c
> +++ b/drivers/platform/x86/huawei-wmi.c
> @@ -527,11 +527,101 @@ static void huawei_wmi_battery_exit(struct device =
*dev)
>
>  /* Fn lock */
>
> +/*
> + * Newer Huawei models (e.g. HUAWEI FLMH-XX / MateBook 14 2024) use dire=
ct
> + * ACPI methods \GFRS / \SFRS (Get/Set Fn key Reversal Status) to contro=
l
> + * Fn-lock via EC registers 0x6B (read) and 0x6C (write).
> + *
> + * GFRS response buffer layout:
> + *   byte[0] =3D STAT (0 =3D success)
> + *   byte[1] =3D 0x01 (fn-lock off) or 0x02 (fn-lock on)
> + *
> + * SFRS argument layout (CreateByteField(Arg0, 0x02, FRSR)):
> + *   Value is read from byte[2] of the integer argument, so it must be
> + *   passed as (value << 16):
> + *   (1 << 16) =3D fn-lock off (writes 0x55 to EC 0x6C)
> + *   (2 << 16) =3D fn-lock on  (writes 0x5A to EC 0x6C)
> + */

This is very specific to the FLMH-XX model. Can you confirm this is the
case for other newer models?

> +
> +static int huawei_acpi_fn_lock_get(int *on)
> +{
> +       union acpi_object acpi_arg, *obj;
> +       struct acpi_object_list arg_list =3D { .count =3D 1, .pointer =3D=
 &acpi_arg };
> +       struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +       acpi_status status;
> +       u8 val;
> +
> +       acpi_arg.type =3D ACPI_TYPE_INTEGER;
> +       acpi_arg.integer.value =3D 0;
> +
> +       status =3D acpi_evaluate_object(NULL, "\\GFRS", &arg_list, &outpu=
t);
> +       if (ACPI_FAILURE(status))
> +               return -EIO;
> +
> +       obj =3D output.pointer;
> +       if (!obj || obj->type !=3D ACPI_TYPE_BUFFER || obj->buffer.length=
 < 2) {
> +               kfree(obj);
> +               return -ENODATA;
> +       }
> +
> +       /* byte[0] =3D STAT (0 =3D success), byte[1] =3D 1 (off) or 2 (on=
) */
> +       if (obj->buffer.pointer[0] !=3D 0) {
> +               kfree(obj);
> +               return -EIO;
> +       }
> +
> +       val =3D obj->buffer.pointer[1];
> +       if (val !=3D 1 && val !=3D 2) {
> +               kfree(obj);
> +               return -ENODATA;
> +       }
> +
> +       if (on)
> +               *on =3D val - 1; /* 1=E2=86=920 (off), 2=E2=86=921 (on) *=
/
> +
> +       kfree(obj);
> +       return 0;
> +}
> +
> +static int huawei_acpi_fn_lock_set(int on)
> +{
> +       union acpi_object acpi_arg, *obj;
> +       struct acpi_object_list arg_list =3D { .count =3D 1, .pointer =3D=
 &acpi_arg };
> +       struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +       acpi_status status;
> +       int ret =3D 0;
> +
> +       /*
> +        * SFRS reads byte[2] of its argument via CreateByteField(Arg0, 0=
x02).
> +        * on=3D0 =E2=86=92 FRSR=3D1 =E2=86=92 EC gets 0x55 (fn-lock off)
> +        * on=3D1 =E2=86=92 FRSR=3D2 =E2=86=92 EC gets 0x5A (fn-lock on)
> +        */
> +       acpi_arg.type =3D ACPI_TYPE_INTEGER;
> +       acpi_arg.integer.value =3D (u64)(on + 1) << 16;
> +
> +       status =3D acpi_evaluate_object(NULL, "\\SFRS", &arg_list, &outpu=
t);
> +       if (ACPI_FAILURE(status))
> +               return -EIO;
> +
> +       obj =3D output.pointer;
> +       if (obj && obj->type =3D=3D ACPI_TYPE_BUFFER &&
> +           obj->buffer.length >=3D 1 && obj->buffer.pointer[0] !=3D 0)
> +               ret =3D -EIO;
> +
> +       kfree(obj);
> +       return ret;
> +}
> +
>  static int huawei_wmi_fn_lock_get(int *on)
>  {
>         u8 ret[0x100] =3D { 0 };
>         int err, i;
>
> +       /* Newer models: use direct ACPI \GFRS method */
> +       if (acpi_has_method(NULL, "\\GFRS"))
> +               return huawei_acpi_fn_lock_get(on);

Wouldn't it be better to put this behavior behind a quirk instead
of enforcing it on the whole module? Keep in mind that this is
also used by Honor devices that have the same WMI method.

> +
> +       /* Legacy WMI fallback */
>         err =3D huawei_wmi_cmd(FN_LOCK_GET, ret, 0x100);
>         if (err)
>                 return err;
> @@ -550,6 +640,11 @@ static int huawei_wmi_fn_lock_set(int on)
>  {
>         union hwmi_arg arg;
>
> +       /* Newer models: use direct ACPI \SFRS method */
> +       if (acpi_has_method(NULL, "\\SFRS"))
> +               return huawei_acpi_fn_lock_set(on);
> +
> +       /* Legacy WMI fallback */
>         arg.cmd =3D FN_LOCK_SET;
>         arg.args[2] =3D on + 1; // 0 undefined, 1 off, 2 on.
>
> --
> 2.54.0
>
