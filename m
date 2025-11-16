Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC1F2236EE
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Nov 2025 12:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763296843; cv=none; b=dOqh9kdrjymRuhWBSDeKBA/uVm4mETcoF2R9Sc1Rv06DIhSBR9vCxD6cwPCSagaE3WaHSIJ1UAIEZLkOB3/pPA1RhepmUaa3vSAd0FcfNQsv+i7iT/pfCz4+IdV2IkJ9n6YKfCo9hiRUzTHVVqFF8jmpMbYSClttCgGoaR2Epj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763296843; c=relaxed/simple;
	bh=IO37mf12FJq4Ef2t+nk5lLEmcczBPEY7+F8Zzv+Zj8Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=YyZnECqDglzpoh7OEDSJCBC0S94l3TJ74YSOHKd3LRRmqzWjJsxOx8FOr5xgb7AfAeXaLgFkWxnswVRuIMNIDz8mTFiCwWx4q5o/Y540zVNYXjilTIKDm853h9+bOf6nToxjr2Mxf7OraROUyBvyU7OknSheOI1CpYMSezBbW/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJXN649B; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJXN649B"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5de23ddba5eso2337149137.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Nov 2025 04:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763296840; x=1763901640; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQ/fyHmKV/6OJASu2MHI9fy1bw7vRJvbroTNkv2ZoaE=;
        b=OJXN649Bw4ennxo6aZiqjewtabz/dvV3DK9josoj4bCel3OI7ppgusT2Bt0glmlLq2
         p5nN0yTcWw0FBppbnZ3jZAKmVgKyzmuDdiu4Vmvj3fMkDS+L/Im5YpGheZfDKS4mbUdZ
         PhdkizzNAY69gCZ4xisgbQuVh4lu82hd8Q8f8IhqgCS6jixif5gFKAi9jvjDcm+adD+X
         56fWayKQbVxoB0XnxyyKrAAwGQfPmRkM+k7MoLv9FRpKyj5TT2inoX5miPFM3fs9BJtH
         7e4cn7gND/E4Nz8/qpYNlLBwknUYY6pJwQB6qr0DZNsI+cw+eBu2UB6l3xrWY0WWrWYH
         VBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763296840; x=1763901640;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQ/fyHmKV/6OJASu2MHI9fy1bw7vRJvbroTNkv2ZoaE=;
        b=OOxBZH/P6wQXhPi52KlCPKzbWU3tUYGKlGf/OfNkKiljdZH3chn7i4s9xfLfHyi/zU
         9sT8Ww0dS4WF9aAATJNE3UKXtXzFpAu/SgMIHGMrsxvEXKvoixuhW01IjJ4XbJEOEDMk
         8oM/fk2Hc8iXdsffKpf8KUucj2siCaElyN6xpfm+9O8347/Ubb5f4bQUppKyilfsERs6
         L63J7+74/lna3VKzhIsoxXuNUYCxfcvZuGUw90kF7mxg909nveTMKVgkzD4oILyezfMu
         xYzrAF2iLuu1kDqpNzPXId2TfXIVrtNU/pQq3GnCmCpkspkp0SCi1iGJv9FvI5iwKueJ
         wtng==
X-Gm-Message-State: AOJu0YyKy7sxvhMFkBI+17glyNwMoAhagcgbqBKeVCTMxfsNIvQpvslk
	iXsyOL85gILGdXoW/XdM/uBp4QnAbrGBA2ToEftDDt2WJ0pFdkzMhmNh
X-Gm-Gg: ASbGncthVZJHeojlThdTiywRpssbiGUJJtU2CZF2kz4YSnOpUa43L5OhnqvmdPf59h7
	ZoKTeKmdvevLqbLvA7nijEiSfKBQjvyd7d75VuR4fbbzUqPovGuPkfNTfUR4S5whZViPzONuel2
	FioLBFLlSo0MaHYnNlAKMf+oxeX/QgOPoZEv3YbKcO13umuzSEuqacIj6xqQtG6lAmhSxgrGh/O
	duMQyACoB23TXQQkJCz9BUAgnbIlBer99LtQ/I922FDObpb2xSmhJ9mFU2P6YmPm0J7JnrRv+0L
	i2jWy7or2pcopqI/80EeWepvDHk1Msx9MOANn6qisQB9LTqWdtTziQUJpMleyzgVaP752R9HUmH
	eK+GZ61viQ8zHO+BNM49DNTq88BAIdn7O4EbRt/YR5xUH1rC8fj+sTk07UGPr0z74xyZ/
X-Google-Smtp-Source: AGHT+IHGeXQ9wrtVBDKSn2OrgB1bPU/GBb9m33p3oxsNRGxI4QxmC0gnj6eJICM1U5VdN90yvdCClQ==
X-Received: by 2002:a05:6102:f0e:b0:5d5:f6ae:38ee with SMTP id ada2fe7eead31-5dfc5bcd631mr3502222137.37.1763296840096;
        Sun, 16 Nov 2025 04:40:40 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-937611bf6fdsm3132024241.12.2025.11.16.04.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 04:40:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 16 Nov 2025 07:40:38 -0500
Message-Id: <DEA4K8Q6VE8Q.308RH28K9QD45@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Anthony Wong" <anthony.wong@ubuntu.com>, "Kurt Borja"
 <kuurtb@gmail.com>
Cc: <platform-driver-x86@vger.kernel.org>, <hansg@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <Dell.Client.Kernel@dell.com>
Subject: Re: [PATCH] platform/x86: alieneware-wmi-wmax: Add AWCC support to
 Alienware 16 Aurora
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251007084734.25347-1-anthony.wong@canonical.com>
 <DE91X624SV94.1C3A31K6FDMD3@gmail.com>
 <CAE7LaDCG0QSprA4LST-qp4Vv_if9gqE=0h5LCoxiEGZsBFvz0A@mail.gmail.com>
In-Reply-To: <CAE7LaDCG0QSprA4LST-qp4Vv_if9gqE=0h5LCoxiEGZsBFvz0A@mail.gmail.com>

On Sat Nov 15, 2025 at 7:44 PM -05, Anthony Wong wrote:
> Hi Kurt,
>
> On Sat, Nov 15, 2025 at 6:23=E2=80=AFAM Kurt Borja <kuurtb@gmail.com> wro=
te:
>>
>> On Tue Oct 7, 2025 at 3:47 AM -05, Anthony Wong wrote:
>> > From: Anthony Wong <anthony.wong@ubuntu.com>
>> >
>> > Add AWCC support to Alienware 16 Aurora AC16250.
>>
>> Hi Anthony,
>>
>> I'm very interested in getting this merged.
>>
>> Do you have access to this model? If so, either testing the
>> `force_gmode` module parameter or attaching the acpidump of this laptop
>> would be amazing.
>
> Here's the acpidump of the machine:
> https://people.canonical.com/~ypwong/alienware16-aurora-acpidump
>
> I tried the `force_gmode` module parameter but it doesn't seem to do
> anything, how to check if it's really in effect?

It maps the 'performance' profile to G-Mode. In some laptops this
toggles the led of the G-Mode/Performance key and performance may be
better.

I checked the acpidump you provided and your model does support it,
thus we should use `g_series_quirks` instead of `generic_quirks`.

>
> Once this is cleared up, I can send a v2 with the suggestions you
> provided below.
>
> Thanks,
> Anthony
>
>>
>> Either way, I have a couple of comments that I missed. First there is a
>> typo in the title: alieneware-wmi-wmax -> alienware-wmi-wmax.
>>
>> >
>> > CC: stable@vger.kernel.org
>>
>> CC -> Cc.
>>
>> > Signed-off-by: Anthony Wong <anthony.wong@ubuntu.com>
>> > ---
>> >  drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++++++
>> >  1 file changed, 8 insertions(+)
>> >
>> > diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/=
platform/x86/dell/alienware-wmi-wmax.c
>> > index 31f9643a6a3b5..eb7c3fb6b078d 100644
>> > --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
>> > +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
>> > @@ -89,6 +89,14 @@ static struct awcc_quirks generic_quirks =3D {
>> >  static struct awcc_quirks empty_quirks;
>> >
>> >  static const struct dmi_system_id awcc_dmi_table[] __initconst =3D {
>> > +     {
>> > +             .ident =3D "Alienware 16 Aurora AC16250",
>> > +             .matches =3D {
>> > +                     DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
>> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "Alienware 16 Aurora=
 AC16250"),
>>
>> I suggest we drop the "AC16250" so we won't need additional patches if
>> Dell releases Alienware 16 Aurora R1, R2, etc.
>>
>> > +             },
>> > +             .driver_data =3D &generic_quirks,
>> > +     },
>> >       {
>> >               .ident =3D "Alienware Area-51m",
>> >               .matches =3D {
>>
>> Thanks!
>>
>> --
>>  ~ Kurt
>>


--=20
 ~ Kurt

