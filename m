Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D17149C7A
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 Nov 2024 11:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731239541; cv=none; b=tnYAL5T2xUkxWaBzwToXaNJNp/X7VOglkxlQ6esdD7mjnYlg248kwzToDbAtHJVvE79BGAUE26hh583ZDFgK2IzgQaTllMpZi8LM6m7GQ16l4Jz77KqOe75oJ7QkU8eASUTni6r5GUZfTmTa/BwiIuABAJikacEtMpHrS1BvVVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731239541; c=relaxed/simple;
	bh=0ACRMFzNDcrCJft81NhF9+si56p/MmWbPpGjSWKPepU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BVWA3cPXiNn3ku/uBVk5mluzw7w2P0zhioZhOx/4aSUsTi1JoGEIx0zAs8Ao07bAK+2Uc6HWrh68gXtY+m5yQj0i43naOuyMwy2sWzh5tnRLVj77nhzmhVR1DluGvc+0Sqpr/A6Mny+KGR39DSahmhvmlTLZuco6p4Rf8SJXSWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVY5yGkp; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVY5yGkp"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9a628b68a7so652553666b.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Nov 2024 03:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731239538; x=1731844338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmXSn2dgeP5HSEdbhXxnf+do9GbZYQHUMbsS78m10DM=;
        b=QVY5yGkpRvHP/CEO1AAyeEmjpG+/foKkJnESW2zwlNMwq5vqJh9VJnAAJvxDWFQ51z
         yegJEtHNiUC7hyFxyjrdTJvXb35wlrPYOO27CIT9n4dP4Ky3MX8tfR363gXBGFuZMKZv
         oTt/JpKpuHc10TvuwxrZMLCZ0qCKh3Yf0Tn/+F/YJhppUfyLS0H7pbAyrUt2k5xeGWJT
         RhV3izj131QsX28Qg6Vl8qYA4ATnTTSck5oBxmVJkiogrLUHAoS3ILV6qxcgVKOQtV7z
         EJpAsgMDEkxD8OzIR9F3Q2wf0mgJiBuiPi2wvEnJcJlfGgFwvBzd2IqHVhb5HEHcA4Iw
         ST9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731239538; x=1731844338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmXSn2dgeP5HSEdbhXxnf+do9GbZYQHUMbsS78m10DM=;
        b=TqPA7pMOo4pTuODyhBtgl57N2zVIPxsQ3AkreIl3tLghd+p4leksNoa3u0HSGSqin6
         57amCk4JItaVUT6yLlWEYKybaeWv0n6SqzgHzVoKdYc0WZczpP/igm9a/1tDcK10fH54
         rlnXzUK6nQ1xCiYtzwfGhWtJzhURPZ573zMVMIzgLj2R/EDtc4mE+/Be7B4vVaB/ibf8
         5/mM46edUtVFXtXRavTVcT3ibaqK2EKg0kwdLuZFMef/1LdcVHA3FGzr/nQ9MwHHYxph
         EbyYAlQy5rxACvTV4LMP/c4/36QbTUmh+hRT99CKzOIuG5JQD+ypk5cSI4NTWk2Bgj7J
         m9mA==
X-Forwarded-Encrypted: i=1; AJvYcCXsMCeAK0UnS6yADhHNpgJXfp3qGrdEcFMmXWx+B+Uiv0FX2XHYyYlzK3x3O1V2iOCOMgvlnWbA98jBerw2nD04YRTD@vger.kernel.org
X-Gm-Message-State: AOJu0YwPgbEtg9IjogQeSFIjBrlx7Ui1wLIdBPt58trQ4A01Xc3foDy8
	AD0OnmC/6TKId6qQC5xZF/eQc5731I7x5inSW/r2m+v9WCDUmOZVPQRhLGsO+Oanc3fPgL4YrmV
	MaQSR/PFUvO/eryd24eaXVd2ioDM=
X-Google-Smtp-Source: AGHT+IEQ7D1RvjU0QbHr+v0s3YjdrsDhvgIQiMeQPfGmiV9rm8CdWNzxSdNwaZ98X3w7vO9NRl/38YHIZ2l7OF2ZisE=
X-Received: by 2002:a17:906:5651:b0:a9f:508:592b with SMTP id
 a640c23a62f3a-a9f05085c51mr333884666b.38.1731239537556; Sun, 10 Nov 2024
 03:52:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241109220530.83394-1-hdegoede@redhat.com> <20241109220530.83394-5-hdegoede@redhat.com>
In-Reply-To: <20241109220530.83394-5-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 10 Nov 2024 13:51:41 +0200
Message-ID: <CAHp75Vcp1AxcZcAqoA9e-YXerHPaRAxsoGT34R41aQeaMUrgCg@mail.gmail.com>
Subject: Re: [PATCH 4/5] platform/x86: x86-android-tablets: Add support for
 getting serdev-controller by PCI parent
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 10, 2024 at 12:05=E2=80=AFAM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> On the Vexia EDU ATLA 10 tablet, which ships with Android + a custom Linu=
x
> (guadalinex) using the custom Android kernel the UART controllers are not
> enumerated as ACPI devices as they typically are.
>
> Instead they are enumerated through PCI and getting the serdev-controller
> by ACPI HID + UID does not work.
>
> Add support for getting the serdev-controller by the PCI devfn of its
> parent instead.
>
> This also renames the use_pci_devname flag to use_pci since the former
> name now no longer is accurate.

...

> +       if (dev_info->use_pci)
> +               ctrl_dev =3D get_serdev_controller_by_pci_parent(info);
> +       else
> +               ctrl_dev =3D get_serdev_controller(info->ctrl_hid, info->=
ctrl_uid, 0,
> +                                                info->ctrl_devname);

I would expect that they both take info as an argument...

>         if (IS_ERR(ctrl_dev))
>                 return PTR_ERR(ctrl_dev);

...

>  struct x86_serdev_info {
> +       /* For ACPI enumerated controllers */
>         const char *ctrl_hid;
>         const char *ctrl_uid;
> +       /* For PCI enumerated controllers */
> +       unsigned int ctrl_devfn;
> +       /* Typically "serial0" */
>         const char *ctrl_devname;

Why not union as we have a type selector, i.e. use_pci ?

--=20
With Best Regards,
Andy Shevchenko
