Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813D9EACD
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770891864; cv=none; b=YYrvUJNviHgguLVhGog2lftsookH/fDabOj+Z+CDEZ+vnHKgjzh8yHtr9HI+MWV/NABAWxPS2skbWYTYtCXWac4uqCeVR0CvpQDz7B/zb6E+Msvqwtm814sTNqxwfHIH0OY75sHtw+agCFEwwfD/H3Cll0uZ2pzqOc/SGLihoBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770891864; c=relaxed/simple;
	bh=Mv2PMWkx7MyOs5PgfeRiC4FCS/2TQml4qeem80bpQDQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sW8iRGVTxz4EC0vaxT8wDTAqUARi1cc9D8l8B4vFklBBskUsyeGKQb/EsdqpxDkLKgK7s6iSyccB3Vg2aqfUo9mqBkDC9SHXXiAVXMlP4gh4Rrkigvt9OaRTUcmHHJn+a1T0kp8wn+VZMf/PEVuMYjsDL7W1lvOgtV2NsSfx9Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxFK30F7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxFK30F7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B192C2BC86
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 10:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770891864;
	bh=Mv2PMWkx7MyOs5PgfeRiC4FCS/2TQml4qeem80bpQDQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=SxFK30F7Hr7oqaW8VOJMFfU3wQEg0ZvLJQpTKm+AA8OJdG6qNPcEnARyYYP+7Vz5b
	 AMiKQayfRCHn+kG1QLgcjj70K+8XLgLpV7hsoXP4/NPBN2AWejVcHsmzZ0jHm2/WjB
	 qpZTGY9JH/pYXNgJbZqKSWJIxbNtQSkVNZ5ymptk2Zh2UKwEbptYsmdds37v5hzeQr
	 01la54cfHI5sR7VZQuU+Qfie6jJjcFXR4Q2BU0GIZPql/zK6WB85S44kp5E3WmtOaL
	 ZzVHlcTL20oNTITjb/HhAMkJihQi9dxCmG29xeL8c7G8z6cBVKaHNCESoBab+K+nTz
	 mpdQbERVowkVg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59e6b736b84so13707e87.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 02:24:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPZ9au3bOqd+4o/+KTMF8p94P1ak7UESPtlH2fHURmmi00bH7b2SAwYaQJosk5WAHWy1T2UCPhX16BmJeW4PfMB3hW@vger.kernel.org
X-Gm-Message-State: AOJu0YyPqvMzuwK8pX4BtrGQBshCUailfeL/p7OUsgg7AMxKcNsTSmaK
	yXhalFXnjNDXA0E+RmAGstOmWO9RJ/zTjaKsan/KlrWJd/h1Oud8/Nz+EU+7CTL3SwDBgOYfXCP
	go3zTfBHTpvDK/sh0HPKa1YPlPen7kNCxyF2YiDh/lw==
X-Received: by 2002:ac2:568c:0:b0:59e:3912:432b with SMTP id
 2adb3069b0e04-59e64016c2cmr762397e87.13.1770891862638; Thu, 12 Feb 2026
 02:24:22 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Feb 2026 02:24:20 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Feb 2026 02:24:20 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMRc=MfdeQhgQd9FzUt5JtynerzR52yWndbVJ5Xu-eVUwtvgJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aYkdKfP5fg6iywgr@jekhomev> <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org> <aYnqY4KPq2Gqj3Dv@google.com>
 <CAMRc=McfHM62ZxKdn=QDAmpjExDZwtqhpkLU_=1GE27bbMsirg@mail.gmail.com>
 <aYoOKBMAsTuwHKK0@google.com> <CAMRc=MenKFwfT2g2-aUZUsoBdOMaA4m2krJ18Wir=Rwede9JfQ@mail.gmail.com>
 <aYpC_XWNXiRmEdzo@google.com> <CAMRc=MecKXHOZSpKfeWzEQLgcddsstbhRQHahD8Hky=3KP4QHA@mail.gmail.com>
 <aY1K7z5oYFmwMy2b@google.com> <CAMRc=MfdeQhgQd9FzUt5JtynerzR52yWndbVJ5Xu-eVUwtvgJg@mail.gmail.com>
Date: Thu, 12 Feb 2026 02:24:20 -0800
X-Gmail-Original-Message-ID: <CAMRc=Md4RvSASOtg7pbRMxVEJ=fOf2NePzqbpRZQBrY-iG=1fA@mail.gmail.com>
X-Gm-Features: AZwV_Qg8ZuLihZDw14vZiHk8LSStNKN-2TuFeNPYLYKSvIVR0fIddNEMxd_fbRU
Message-ID: <CAMRc=Md4RvSASOtg7pbRMxVEJ=fOf2NePzqbpRZQBrY-iG=1fA@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Yauhen Kharuzhy <jekhor@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Feb 2026 11:01:02 +0100, Bartosz Golaszewski <brgl@kernel.org> said:
> On Thu, 12 Feb 2026 04:44:05 +0100, Dmitry Torokhov <dmitry.torokhov@gmail.com> said:
>>>
>>> Agreed, I'm not advocating for using lookup tables. I'm advocating for using
>>> swnode correctly.
>>
>> I am curious how would you approach to fixing
>> drivers/platform/x86/meraki-mx100.c ? The GPIOs in question belong to
>> "gpio_ich" which is a cell of a MFD PCI device (lpc_ich).
>>
>
> Something like this (compile tested only):
>
> diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
> index 4b7d0cb9340f1..ab9730dcd2688 100644

[snip]

In fact: MFD cells are the easy use-case: we typically have a header in which
to expose the relevant software nodes. What's more complex is when there's
a GPIO controller that has an OF node but no definition in C of any kind.

If we don't want to dynamically wait for it to appear in the system or look
for its OF node, then I was thinking about something like this:

declare_future_fwnode_from_of_by_name(gpio_node, "gpio0");

static const struct property_entry consumer_props[] = {
	PROPERTY_ENTRY_GPIO("reset", gpio_node, 1, GPIO_ACTIVE_LOW),
	{ }
};

Where the gpio_node fwnode would be a proxy resolving the reference to
-EPROBE_DEFER until the tree is scanned, after which it would return the
actual fwnode we're looking for.

We could potentially also add declare_future_fwnode_from_dev_by_name() for
when we know the name of the device and are waiting for it to appear.

This way the deferal would happen inside gpiolib-swnode.c using the normal
path for waiting for devices to appear and this could be reused for other
such cases.

Bartosz
