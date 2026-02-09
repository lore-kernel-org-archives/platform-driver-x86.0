Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDC22BE057
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 16:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770654628; cv=none; b=A+Or57HRGWa7GdiszFLUhZCC8yznnucV0ldWghFPX94yWq8NNyL8IKzh6MCduNspttYzkGwHQNka27aifjMYQpgQq53gneiEsgFhKEr9b52pz7Q0U+24CRXEUlw2O3CmQBd3BpDNPS7DKAiY5ZuCK5ysbAi/0jqGT6Zg09PDsyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770654628; c=relaxed/simple;
	bh=RwvB8i66ujJAASlrCYJH/cu8NvS0Ujw9D05NZI9HQ3Y=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X/qJk0oqcEPZ4/PYXYbtC/ONg+/LKwCrq1fQ2KWln75oXb78CEbYcDeKYzUQ8YhGkcLGkPeapQSdiOopR7wuILY/IiG9D7kwsJA9haqPUEuECEPS2xeF3tTrfLyl1izI6kTvLrmXtEcGDs0yjCHKaqF7hGxRnx2Doz6CLlyWBiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5YyNKlE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5YyNKlE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F44AC116C6
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 16:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770654628;
	bh=RwvB8i66ujJAASlrCYJH/cu8NvS0Ujw9D05NZI9HQ3Y=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=C5YyNKlE5imqu8qk1X8x84pvnmeecXeqzhH5qRAxKctrcD7NqfD87tsgXu4umphwK
	 WUb1KkgfPE3SikcKR7FP7/8M+1u1Lir4dhdX9H+XV7wux28+epYYOQHKZnRyDs7bBe
	 u+vrw8zf7SLuZNb06mlbezWg5jhxkLdcdLQMoVO6WH6fngn9KfKDnT2gqoRheu8wHF
	 CJyWN2o+YdR7W78mWhu+Dp7CEaw1GL7pJwsiCzsxZAZVv0TbupYsgMx8+l3wV8dOM1
	 aqxKEDZFg2sjqT/gHN/5hGmUe4xXSNq2glhvOFw+cQ3mWzAvOs2LE+Lta8aDTrt2Wb
	 CMV3/IjgCxcCQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-385c6c727fcso37526111fa.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Feb 2026 08:30:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9o24KaiVA4jKMQ5PBmYIjGZX3aqT8YF+ck+a1h4Yf3vjzKqVVhES1mlih0WL6pNYviW4T1ee9RRdVIOMFiApV59l1@vger.kernel.org
X-Gm-Message-State: AOJu0YyoKOpeOIW5eavWVxqPElsEIlM4mTh6goIO4s1fBDmJlHC1Wmfg
	KZB2hfCK/W+kVQSRZNRIonO1HdL8mkULIy/RGFoczWaP3vpRU6yvGaA+IOhKuRyGooNo4D4Dncw
	2U0oWHcPc6pF/H5/b2bHVIP+3/G6rupevJeLBUoCc2w==
X-Received: by 2002:a05:651c:150e:b0:385:c21f:37f4 with SMTP id
 38308e7fff4ca-386b4f05d1bmr35929781fa.16.1770654627110; Mon, 09 Feb 2026
 08:30:27 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Feb 2026 10:30:25 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Feb 2026 10:30:25 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aYnycxR8nxu85Ivd@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920200713.20193-1-hansg@kernel.org> <20250920200713.20193-2-hansg@kernel.org>
 <aYkdKfP5fg6iywgr@jekhomev> <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org> <CAMRc=MfMw85D3FoX0ckAxgEyY8D3ZK5uf9sgVXg7_f+mE55dRg@mail.gmail.com>
 <aYnycxR8nxu85Ivd@google.com>
Date: Mon, 9 Feb 2026 10:30:25 -0600
X-Gmail-Original-Message-ID: <CAMRc=McMOMYnGhsZS2OSeXhMcJPKnjSku2v97uAgatwEpZt0zQ@mail.gmail.com>
X-Gm-Features: AZwV_QghfHmX8FQjGFyXfraEpd1UKLkPhx0WWJXaQNpZjyIK7BtKX94s1Ajphlw
Message-ID: <CAMRc=McMOMYnGhsZS2OSeXhMcJPKnjSku2v97uAgatwEpZt0zQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Yauhen Kharuzhy <jekhor@gmail.com>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Feb 2026 15:46:55 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> On Mon, Feb 09, 2026 at 08:36:01AM -0600, Bartosz Golaszewski wrote:
>> On Mon, 9 Feb 2026 15:00:40 +0100, Hans de Goede <hansg@kernel.org> said:
>> >
>> > For the drivers/platform/x86/x86-android-tablets/* I think the following
>> > fix is both the easiest as well as the best solution is to modify:
>> >
>> > drivers/pinctrl/intel/pinctrl-baytrail.c
>> > drivers/pinctrl/intel/pinctrl-cherryview.c
>> >
>> > To register a swnode for each GPIO controller and
>> > then EXPORT_SYMBOL_GPL an array of fwnode pointers
>> > which can then be used in the PROPERTY_ENTRY_GPIO()
>> > entries replacing e.g.:
>> >
>> > PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[1], 53, GPIO_ACTIVE_HIGH)
>> >
>> > with:
>> >
>> > PROPERTY_ENTRY_GPIO("reset-gpios", cherryview_gpiochip_fwnodes[1], 53, GPIO_ACTIVE_HIGH)
>> >
>> > (these 2 covers pinctrl for the Bay Trail and Cherry Trail x86
>> > SoC based Android tablets which x86-android-tablets is for).
>> >
>> > This should all be pretty straight forward. Assuming we are allowed
>> > to dereference an external symbol for the property initialization
>> > if not then this becomes significantly more complex.
>> >
>> > I'm not even sure if we need to add swnodes, we can probably
>> > just use the existing ACPI fwnodes for matching even and then
>> > we just need an array with the ACPI fwnode pointers.
>> >
>>
>> Yes, we can now reference fwnodes from property entries. The entity that
>> creates these devices should be able to retrieve the firmware nodes of
>> the GPIO controllers (e.g.: via gpio_device_find_by_label() - finding it by
>> labek is what it effectively tried to do now).
>
> How do you do that when your code happens to run first, before the
> controller is instantiated? gpio_device_find_by_label() will not
> find it, so what will you use as fwnode in that case?
>

The device that calls gpio_device_find_by_label() (most likely a "real"
device with an OF or ACPI node) should return -EPROBE_DEFER if that's the
case and not create children with software nodes.

Bartosz
