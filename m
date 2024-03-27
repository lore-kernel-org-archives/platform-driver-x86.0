Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F08D17BB3
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 06:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711519810; cv=none; b=VlgLDbn9lJZPVEY6u/DIuX0ItylLD2b38s7KIljte1fA/NcXLWyjU+CNCegsm2Mz1C2qxItsAyR7NqDqqXW5Ivylh1UgyWuv0J3vsQtrE2deLdCKrw+ZKYvdBTYhIiTzLkI7oLHzOkhPueg4kf2iEk7elydnNrdj3vc5lnbRmBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711519810; c=relaxed/simple;
	bh=aj1aL6upPcAi/oYsdf1FW6tZ/Jif1m82oyTDDBx7OMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pE6LczUTJhyzxdml3RZz/ccD+E0cfEqlAuux7RGhOZzGaQCiAvqAQIsKioqgHwcMt1WAR+Pal94pRfrcpm9HhSr2Gtdm+bkeLeMYnAWBVYr/2pOe1WsUBLh6m/vcmY1rStLd+TyTpHSWY9/rcicqIJb5/9KSXm6QaKu4IQC9st4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TJZlPT0a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TJZlPT0a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711519807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aj1aL6upPcAi/oYsdf1FW6tZ/Jif1m82oyTDDBx7OMo=;
	b=TJZlPT0aLNdhPs6dlgmrDhpIBpoyvJZml+51TlAGKtHbfrycrIZG/ayruJ6yX9q/kOprL7
	sKx6XfYDFm/t/ALNy16qM6VCITGQFcXSV1tNiqYDrlYkjtXrMqbBJ/5zRSPjYIXaJZmxxR
	huyzxsY5/yv54VA5mpBnHxNf3WS6BoE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-mohrOOWCM9m-JrVXO6oENw-1; Wed, 27 Mar 2024 02:10:04 -0400
X-MC-Unique: mohrOOWCM9m-JrVXO6oENw-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-29f6765954aso5100645a91.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Mar 2024 23:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711519803; x=1712124603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aj1aL6upPcAi/oYsdf1FW6tZ/Jif1m82oyTDDBx7OMo=;
        b=fqDM+P7TXZ7kjcXPMVyiEPFo0Tn+xhsf/KsDqmO+vo3APZAkt2ZsPTLovEzjdaIJdQ
         48DA58kyQjchBp/e5NvNSSVUeou1v/0JmiffVItRkZ+Zt7XZUdP9kVy2rjrAsmdaexXb
         5j8eajY83fTdz37rZ2p9ipkkuXSGk/GIb/gVPOx1XWIEtxv6d1c4jj7Ak/+49j2lCgMM
         VYY2AdYJQALGMZmaduZUS+M1Tf/PgdQAW8DdsRlWPbsIe/Xk6AojqjPVjoEyiKloxf8C
         HVYAIP6r9uQ7J8VdAsuJfYwNY3diHpTyrZIwNNh8QuLOkGyt2HvYNE4kpF1H445o1xGA
         n3rw==
X-Forwarded-Encrypted: i=1; AJvYcCUjkrH3ilX7f1QUI9h+oaoGndPsnDSWhdl16w+kPIbfpAdUizh2AtXYO+kGbo0v9HQtyoO99m6metpmo9oa4EeO7l2sp0lyjiVK8mG08Zn2tip/zw==
X-Gm-Message-State: AOJu0Yxf4z8oKwDfrvBWK0FvMdvpDqEN8iNrkEQIaSXBSKRplfkVDmsp
	NvGbIozretHtwldIIbDfSYm9ZfnhMzViUq+VAXP6cb58mao7yzeTwg6KcKWAMNwm5XO79gFejIm
	Of+m+xZzZ6DGDGqajVhMVosktlLk5aEJX1o6A/2jlhkjtroeo3w66OgUc0uCkv3B+d9UVbqMQf7
	CQgKLCc4qRfKkOGVQ5JJC05YGymFEgylZl6IqGFCifWDv7dQ==
X-Received: by 2002:a17:90b:3ec6:b0:29f:f6c7:1ace with SMTP id rm6-20020a17090b3ec600b0029ff6c71acemr1806622pjb.32.1711519803672;
        Tue, 26 Mar 2024 23:10:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnJ9eZnxGImAgN6jxUMCflVFqJDA9V46b7u8wTdTfp151Xu61S6bJ6bs/eJvZiZf6QsvrT47Be/7ekcgEGtgw=
X-Received: by 2002:a17:90b:3ec6:b0:29f:f6c7:1ace with SMTP id
 rm6-20020a17090b3ec600b0029ff6c71acemr1806611pjb.32.1711519803228; Tue, 26
 Mar 2024 23:10:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322033736.9344-1-hpa@redhat.com> <20240322033736.9344-2-hpa@redhat.com>
 <bb7536be-9bed-4557-b111-6409ebfe48f4@redhat.com> <ZgGm7eDBQtwH37ya@smile.fi.intel.com>
In-Reply-To: <ZgGm7eDBQtwH37ya@smile.fi.intel.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 27 Mar 2024 14:09:52 +0800
Message-ID: <CAEth8oEps=T3JGJiCEH_SknjkcGaTXv+ekBQLgVRm+Nc7qfa1g@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] platform: x86-android-tablets: other: Add swnode
 for Xiaomi pad2 indicator LED
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, Mar 26, 2024 at 12:32=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Mar 25, 2024 at 04:02:54PM +0100, Hans de Goede wrote:
> > On 3/22/24 4:37 AM, Kate Hsuan wrote:
> > > There is a KTD2026 LED controller to manage the indicator LED for Xia=
omi
> > > pad2. The ACPI for it is not properly made so the kernel can't get
> > > a correct description of it.
> > >
> > > This work add a description for this RGB LED controller and also set =
a
> > > trigger to indicate the chaging event (bq27520-0-charging). When it i=
s
> > > charging, the indicator LED will be turn on.
> > >
> > > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> >
> > Thank you for your patch, I've applied this patch to my review-hans
> > branch:
> > https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-=
x86.git/log/?h=3Dreview-hans
> >
> > I will also merge [PATCH v5 6/6] platform: x86-android-tablets:
> > others: Set the LED trigger to charging_red_full_green for Xiaomi pad2"
> >
> > Once the new power_supply trigger patch this relies on has been
> > accepted.
> >
> > Once I've run some tests on this branch the patches there will be
> > added to the platform-drivers-x86/for-next branch and eventually
> > will be included in the pdx86 pull-request to Linus for the next
> > merge-window.
>
> I believe I have commented on the "RESEND" version.
>

Thank you for your reviewing.
Please review the RESEND patch and I'll fix them according to Andy's commen=
ts.

> --
> With Best Regards,
> Andy Shevchenko
>
>


--=20
BR,
Kate

