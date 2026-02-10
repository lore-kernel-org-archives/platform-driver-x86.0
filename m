Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EF420C463
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 09:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717195; cv=none; b=l7A65sOqgNSPl6w2KX67vPvViObOJZnR7Q5yy6mKEs8JAqEhi/2/pmlYKYSl4r6iGcyEQLtofEN2WlyvsX10YqrjEWD6JIJgBbF7/iN9yX9HGS2GE3xiS2ElIgsFMtBVu3RHWHl717N84Ga6l0rPirToOa+bXC+N3nLw9cNiXlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717195; c=relaxed/simple;
	bh=ktZ4YJEMb/jxSO4eMIM3t3vC3HiOcF2sJ1zbf6lFjl8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6fxWkn8sTHSh81oCR+1f/AREvJkKYLBjvf4qLeUk226hYffIZJW1+4K1D/qXmo3/HmABk5aRjPjkb+aV21jXfibi/pCHo461SMxdjDaiuE2xnQ6kmtaerDIQMMLvbH/d6We65MHd2yK7KAFTZk019AEdgL3uRLwSeaD3aULN7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIPuVRaq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIPuVRaq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381DDC19424
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 09:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770717195;
	bh=ktZ4YJEMb/jxSO4eMIM3t3vC3HiOcF2sJ1zbf6lFjl8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=XIPuVRaqv9ew/VCBfP3mtOituOdAvlbX6Bnxg9OHKK0chWUkg8n+Yl7iIfXTacsjc
	 P+iotqYA6oOfEGw9IXrZTKd6Gkj+8IAcp7Z/GXSTgvRKPh9/ZHrloidsGYg7v0NFNG
	 ZO+3ACgX6iMgvrDFZ/wZXmQPPciVLBJQkMzZLjPJeKrepgpRVKYyG6DLJFdElpY891
	 4ejrYNiQSVZZH2AYrvAV92Stn4gDjzYxnd8rF7adppirLOawHrJNqicWzzONidQ9mg
	 j4EnZbP9wjfMVqZXFijLv4Il4KykvG1S3Bh5CjY5iRviKQHBH9PBkqaXV7Oh3kA7Ix
	 08zR4nQzfiYDw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-382f9211cbfso35335731fa.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 01:53:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZFJZWSC9GJG8KqQ3s0/2qQdWy11m31vtK0hEwDGPR8nS3l0aUbK3vXWix2IDTAcWYWVF5WaIbruco5HSJAteyaQsf@vger.kernel.org
X-Gm-Message-State: AOJu0YxgaFLtbImo4vz6mMZhnhDpAOdoatfoU7HCVt4RjL0Y33bOKGYQ
	ZnnrWpMkPq0DXBqIFuxVGjZ7m0zdEVaA7sQqjULeey+o2Z8BaJK6sqGYFnDCMG4J2INja/mXZ3t
	yRfkqOQejvAyPfstVe/T4sPWTPr3JpSlu35FLvj1uVA==
X-Received: by 2002:a05:651c:31d3:b0:385:f5ac:ff3e with SMTP id
 38308e7fff4ca-386b50cb5f2mr48529151fa.27.1770717193903; Tue, 10 Feb 2026
 01:53:13 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Feb 2026 01:53:11 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Feb 2026 01:53:11 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aYpC_XWNXiRmEdzo@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920200713.20193-1-hansg@kernel.org> <20250920200713.20193-2-hansg@kernel.org>
 <aYkdKfP5fg6iywgr@jekhomev> <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org> <aYnqY4KPq2Gqj3Dv@google.com>
 <CAMRc=McfHM62ZxKdn=QDAmpjExDZwtqhpkLU_=1GE27bbMsirg@mail.gmail.com>
 <aYoOKBMAsTuwHKK0@google.com> <CAMRc=MenKFwfT2g2-aUZUsoBdOMaA4m2krJ18Wir=Rwede9JfQ@mail.gmail.com>
 <aYpC_XWNXiRmEdzo@google.com>
Date: Tue, 10 Feb 2026 01:53:11 -0800
X-Gmail-Original-Message-ID: <CAMRc=MecKXHOZSpKfeWzEQLgcddsstbhRQHahD8Hky=3KP4QHA@mail.gmail.com>
X-Gm-Features: AZwV_QhbzAEntBPW256dQUSquoCywcPe2WVyVumqD3Ik38CAbkrW7Jsx82ZIrzA
Message-ID: <CAMRc=MecKXHOZSpKfeWzEQLgcddsstbhRQHahD8Hky=3KP4QHA@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Yauhen Kharuzhy <jekhor@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Feb 2026 21:41:49 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
>>
>> Consumers can already use generic gpiod_ interfaces even if their
>> GPIOs are set up using lookup tables behind the scenes. There's no
>> need for platform data.
>
> But there are other settings that use platform data. For example:
>
> struct gpio_keys_button {
> 	unsigned int code;
> 	int gpio;
> 	int active_low;
> 	const char *desc;
> 	unsigned int type;
> 	int wakeup;
> 	int wakeup_event_action;
> 	int debounce_interval;
> 	bool can_disable;
> 	int value;
> 	unsigned int irq;
> 	unsigned int wakeirq;
> };
>
> This describes one gpio-keys button. Besides gpio itself there is code,
> type, whether it is a wakeup button, whether it can be disabled, it's
> label, etc. Those can be expressed via device properties (in case of
> legacy boards via static device properties).
>
> I do not want to have a separate way of configuring GPIOs from the rest
> of the properties. This would be very confusing.
>

Yes I do get it as I said before. I am all for using device properties here.
I just don't want them to be fudged like what is being done now.

>>
>> Definitely but look at what we're doing now: -  consumers just set up
>> GPIOs for themselves using arbitrary strings.
>
> Look _beyond_ GPIOs. There are other properties that also need to be
> set. GPIOs should not be special.
>

Agreed, I'm not advocating for using lookup tables. I'm advocating for using
swnode correctly.

>
> OK, so maybe:
>
> 1. Restore the label matching as a fallback for now (keeping the fwnode
>    identity mapping as the first choice)

I sent a patch.

Bart

> 2. Work through cases where we can actually instantiate/locate the
>    firmware node, like with omap-gpio (but we will need to see if there
>    are linking/loading order issues there)
> 3. Figure out what to do with the rest (if any)
> 4. Drop the label matching (or agree to keep it until legacy boards die
>    off if #3 fails).
>
> If Arnd removes PXA boards that will help a bunch.
