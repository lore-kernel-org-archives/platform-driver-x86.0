Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79BC17554
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Feb 2024 04:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708403714; cv=none; b=Bpmm+m191kzr2R4XWFozDwOthG9X/S6Sed3oAbitBy1AorYSuSeyYrHWcsRvOf06GwmjPJOjqkT6kdAOr6phLylIG2ZcsbF6D3riFSyMV/w+r6q5fhxcE0ROpYo3aNldTx3fNh2f40w11HjP4kXRkiZxVukNRWPOSeUsNA2ce8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708403714; c=relaxed/simple;
	bh=K/YeU9M90aSb7Nx389wWU8KvQcsMt1FNwLBpELg9Q/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ey68ybRufCj7EzzeLHZRhskViEpf3Q2zBdee8n+JfEh2FsTPR2BR5weKotFdamigfBKI7o0GAYerx1p5zg2PcvU2Xjs4mUIUnYyx3KiL9JWGDn+/6N+HUPA9yPji/N/QO/B5alL8hA7FeEFr1DCdoxlec2EZDmCl5+fL4Dk9xtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ACpWRirM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ACpWRirM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708403711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=epxkk3LK7jaEzZwfS8fvOU6Oo1fiHyu0s9CUPbIExc0=;
	b=ACpWRirMBBClM+g+ZWdjfAEk6/oyz4ni92+D0pqEAsmf8uDbx3LY8CtIUy/nGlmvS3KT1P
	8D42ZlFwzEbRcdgQOz7JUnJ/UC4a2SkamTvclsbkpC55+EBuaGZMKHcMxm4Sf8wPOXCbNZ
	2oFFVBS2tiTlEvnx9rDuMmLiOKkJjDM=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-hJyWNdGlMsuIuRWttQ0Sng-1; Mon, 19 Feb 2024 23:35:08 -0500
X-MC-Unique: hJyWNdGlMsuIuRWttQ0Sng-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-299c5a61099so767828a91.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 20:35:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708403707; x=1709008507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epxkk3LK7jaEzZwfS8fvOU6Oo1fiHyu0s9CUPbIExc0=;
        b=kKZZuHbyQIIhxdTukgghCtbdYjpEhxPfeKptmWPL6iPFbDjxXncZZ9Cmhp35MMZqJ8
         X6QyBCXuxxMdESmVtU/lNOt/aSdftsqBVZZyQ4IspPwHHH2twJQqH6edY5ql88KKXvN8
         c/cCzToS7rwrxMtcPWpD/yT3x3dx3N+3O51lQUVpWOB4Rd3x9QI9nIOcLDjoDyny0kOJ
         5ulP0mD7NE8LNXM89WZOcmkHPG5Sepqb8jgEKM08j6QoikJVz8mdKbCJ7JCwYeClJ/Uh
         mV4DYs9cZYt5UVVrTNpz5NRVXbhe16kP9sU0pj6UYuxYdYG3DHRrKBsyB01ToA/Ismvh
         hLZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzu1jVtri6YtdxrSzaUgXDy83OYVG4p6t+s7nlFGFBLQbYyu6fUooOiHuX+fj8ypyoxmPfR6g+LRMumpYjp4/H0yUGYqIh2Ka1tR4tid3Lpbf0EA==
X-Gm-Message-State: AOJu0Yw7Io1NT6FNFz9hw8nHju+9rg1hCayg8hfSDZr8VhXOOFr72neQ
	pvsF5cxnEXBztc/ZXQ19kj3Es3y0Q9retVDTg0S8PzQI/8n7Qy1R6q1OA7h33cdUjW+ShG8mKpX
	zaX1LsFNKtP3rW47IBe/EHJX44SD9OWr4EQnuLZvw48+/Gj5ov04mtiJj1rd6LjH5lWSJPVnSWc
	ePiJi2DgLvFu9L085FNYMuoTPwpDHkDTonyIu1jW7x2odTQgGNvU0eLQeX
X-Received: by 2002:a17:90a:1506:b0:299:2db9:1ad4 with SMTP id l6-20020a17090a150600b002992db91ad4mr8144681pja.40.1708403707107;
        Mon, 19 Feb 2024 20:35:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFX+axYbsDY48k5l7j5C7a1cJrJX/RLz+J+wnl4KKylH8daXnj2i63k8T6eRvoXIL3JCQPS/mxYwKGFc7hVFU=
X-Received: by 2002:a17:90a:1506:b0:299:2db9:1ad4 with SMTP id
 l6-20020a17090a150600b002992db91ad4mr8144665pja.40.1708403706675; Mon, 19 Feb
 2024 20:35:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216160526.235594-1-hpa@redhat.com> <2dd3ead1-1066-3564-7c6b-9d366dc6e1e9@linux.intel.com>
In-Reply-To: <2dd3ead1-1066-3564-7c6b-9d366dc6e1e9@linux.intel.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 20 Feb 2024 12:34:55 +0800
Message-ID: <CAEth8oE1=JKSskNG3HKxRyc8p=OXtgMskO7w4NV=stxCdmWhHw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] KTD2026 indicator LED for X86 Xiaomi Pad2
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi llpo,

On Mon, Feb 19, 2024 at 9:57=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Sat, 17 Feb 2024, Kate Hsuan wrote:
>
> > The v2 patch includes:
> > 1. Typo and style fixes.
> > 2. The patch 0003 skips all the regulator setup for Xiaomi pad2 since
> >    KTD2026 on Xiaomi pad2 is already powered by BP25890RTWR. So, the
> >    sleep can be removed when removing the module.
> >
> > Kate Hsuan (3):
> >   platform: x86-android-tablets: other: Add swnode for Xiaomi pad2
> >     indicator LED
> >   leds: rgb: leds-ktd202x: Get device properties through fwnode to
> >     support ACPI
> >   leds: rgb: leds-ktd202x: Skip requlator settings for Xiaomi pad2
>
> So what's the expectation here?
Thank you for reviewing it.

Sorry for the confusion.
This patch enabled the KTD2026 LED controller on a Xiaomi Pad2. The
controller controls an indicator LED which indicates the status of the
charging or other events.
Since it is an x86-based Android tablet, we need to set the device
information through swnode and revise the driver to use fwnode APIs.

> I take the first patch and the two other
> go through the LED subsys?

Yes. the first patch is for platform-driver-x86 and the second is for
the LED subsystem. If someone would like to test it, they could easily
get the necessary part of this work.

>
> --
>  i.
>


--=20
BR,
Kate

