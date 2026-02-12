Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9B770818
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 03:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770867851; cv=none; b=r8QK6ZhwSOinYa5zxA3lvEPcZXGJS+W/b4SFiGwS7y8+7mK2nGg/5ROWQ/NNN0WE1Xccv7iMCdjU5tn8Iq1ofarHUe5oPrCy6iLZkB9ScPDTFkNfx2zXpfjz7hnUyD62VBLv48kWBw+rKo3E8Av3R25dVrHSCn7drXhBoccCnBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770867851; c=relaxed/simple;
	bh=qFPcci3YK4TR6QkwqV/1FwMsqfyXvxIFeoaKD0AV6cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQ71We3apbIXwQDOYOs2pkLWK8Atigse+1q0TL6rCxxCHk0HcTEA/JNJ/Srfd/gyBs1mCjw+AzoGvUXIPMPzHUWGZ3T/Tdh+Ci+3z5eC/y6lcsGdA2JnsRikQH7yYrp73oy/3lekJPj3vhSRQgqmoWpbWI3K+wrhx2IYUEzzUtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkEFjmkw; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkEFjmkw"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b785801c93so14560321eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 19:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770867849; x=1771472649; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zgwx2PhXSAeJY/onPAffiVs6VL6/MP39/A8gzW5qXA8=;
        b=SkEFjmkwvB6ldec4FN57DdsSCsSYXSGFGN+Ll9W2185qfl9vin/ksobxw6b4Pj42Xv
         ya9jitcOt1A1K+lgq/VEQczekPdHPnoOa/6FR+WAMBflbTgzakJ+Z/Sk2R5upe7jyNeO
         Tldyr4yYuVlpYq+Mm3QG0IUsuP3HtGSkqgyMaP9WO7Tk/doXup0TgrNT0QB3eJXV4u4w
         ZlVpRyb7zqEsLlYlZPc/RaW1StYakvMSH+J9zVpD8EiVw3Xe7k3Z+LtYoI3FyA+UMQQT
         cYGpz04DvFBEm8BZhHYcBjtj7x70wBJpwEtFqq4BOSej2hKjHgZO4bZsotWSJG/Vg087
         V0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770867849; x=1771472649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgwx2PhXSAeJY/onPAffiVs6VL6/MP39/A8gzW5qXA8=;
        b=KeTbFrjwWVKD1PVg2VuOJU1GVl0mfxc1oXpGF5KbIpfiqj3SUBoHJKCPYpxLp5O49f
         TLGOUTDopy/NeXoashsiSDiRtjnxZUiGZLT9E/He3tG0P52OKs76BichNgIzK1EiQKGn
         v+BDYiTDjZG9uxAhDyaXNHk5cm7gAmTt7ICARXp8CGJ01rQ66OR78jNT6u4vMWcmFU92
         1UCY5xFA5A3OHWVFX4T+y0nvZTe0cjMtCQ1cEZmmC2XpZzE206fOcYEXEu8MgMYLxZNQ
         05BHiR7jpEb9bFla1HMA2amk2Wzdgw4yCKlvvMaJAk1YH0FaM4f8nNfm+0RhaQD8TpW4
         t5jA==
X-Forwarded-Encrypted: i=1; AJvYcCX8K3fqnOYu39xfux++TFtySmYWVbmmxmlzzYd+5b15Oo9ZqHqk9pxfzJt2YmUU4m9fr8ID6oxf6+QWtXB5KytSIDDP@vger.kernel.org
X-Gm-Message-State: AOJu0YxuVxLWhw1dfhcdu73T00zQH0pd13PmwoxWfMAlYJzIVXnOdsuA
	8v5Qs/f1SSKoHUnirdOFEN2rajKIZyGDqk12jQ6P6St07GRBG3+Kt9d0
X-Gm-Gg: AZuq6aIyGHkA8AFx9GIPDazzG1TDsTmfhnSNinzPyfkhWdpSz0YSAjjvZD48XhvdhrF
	+eAc+KHZcxyjNLttETH/b9YqS5V6VQZEhQKxbAyeolftMZmQ8kjYjhNMYn5uqg4zYTmcOFPZ6LT
	S3GJruXlnHLaT3uaIo5qDxiNUxI99o8mD7ggthOYN7ziVsX8uG9o5Cjdfl8Jd7CPgAk3CjSGvva
	oSiYkcMZsOhclV4uublTUjYrHL8ydfvQWUxwN7HQZ7W8lt1gn/4MuvXxZvPi+2WIUlYBBdGhJp/
	ToHfEBuxi9f51LC39w8c8NHIZ87/wouqlDBitjHMA+hnTsEqogERrLKtLOeG7rgVHg7qJ/JAuLd
	N5qvRWUH79AUfzWsFEzHZXb5fdxi2EVdMM5BbKuXa9oOVGmKeV1vIlZ3vv5NEM6O6BtI/S6hIvJ
	SEpMeYlVdNgIkAzRGbpKdzPK2t1sixtv2HkIR38WeVfupWPMrk1+SMN76XR+9V0og=
X-Received: by 2002:a05:693c:2c14:b0:2ba:7404:f587 with SMTP id 5a478bee46e88-2baa807b7f4mr759518eec.21.1770867849058;
        Wed, 11 Feb 2026 19:44:09 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f5e:c935:ddee:63d0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dd00adcsm2675118eec.32.2026.02.11.19.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 19:44:08 -0800 (PST)
Date: Wed, 11 Feb 2026 19:44:05 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	platform-driver-x86@vger.kernel.org, Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aY1K7z5oYFmwMy2b@google.com>
References: <aYkdKfP5fg6iywgr@jekhomev>
 <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
 <aYnqY4KPq2Gqj3Dv@google.com>
 <CAMRc=McfHM62ZxKdn=QDAmpjExDZwtqhpkLU_=1GE27bbMsirg@mail.gmail.com>
 <aYoOKBMAsTuwHKK0@google.com>
 <CAMRc=MenKFwfT2g2-aUZUsoBdOMaA4m2krJ18Wir=Rwede9JfQ@mail.gmail.com>
 <aYpC_XWNXiRmEdzo@google.com>
 <CAMRc=MecKXHOZSpKfeWzEQLgcddsstbhRQHahD8Hky=3KP4QHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MecKXHOZSpKfeWzEQLgcddsstbhRQHahD8Hky=3KP4QHA@mail.gmail.com>

On Tue, Feb 10, 2026 at 01:53:11AM -0800, Bartosz Golaszewski wrote:
> On Mon, 9 Feb 2026 21:41:49 +0100, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> said:
> >>
> >> Consumers can already use generic gpiod_ interfaces even if their
> >> GPIOs are set up using lookup tables behind the scenes. There's no
> >> need for platform data.
> >
> > But there are other settings that use platform data. For example:
> >
> > struct gpio_keys_button {
> > 	unsigned int code;
> > 	int gpio;
> > 	int active_low;
> > 	const char *desc;
> > 	unsigned int type;
> > 	int wakeup;
> > 	int wakeup_event_action;
> > 	int debounce_interval;
> > 	bool can_disable;
> > 	int value;
> > 	unsigned int irq;
> > 	unsigned int wakeirq;
> > };
> >
> > This describes one gpio-keys button. Besides gpio itself there is code,
> > type, whether it is a wakeup button, whether it can be disabled, it's
> > label, etc. Those can be expressed via device properties (in case of
> > legacy boards via static device properties).
> >
> > I do not want to have a separate way of configuring GPIOs from the rest
> > of the properties. This would be very confusing.
> >
> 
> Yes I do get it as I said before. I am all for using device properties here.
> I just don't want them to be fudged like what is being done now.
> 
> >>
> >> Definitely but look at what we're doing now: -  consumers just set up
> >> GPIOs for themselves using arbitrary strings.
> >
> > Look _beyond_ GPIOs. There are other properties that also need to be
> > set. GPIOs should not be special.
> >
> 
> Agreed, I'm not advocating for using lookup tables. I'm advocating for using
> swnode correctly.

I am curious how would you approach to fixing
drivers/platform/x86/meraki-mx100.c ? The GPIOs in question belong to
"gpio_ich" which is a cell of a MFD PCI device (lpc_ich).

Maybe it has a standard ACPI HID, Andy, do you know?

Thanks.

-- 
Dmitry
