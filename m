Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA0B37C112
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 16:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770655228; cv=none; b=rl6EP0oxNbKugQV0l5M0gJ6Jb77sP5iRj4mN6cG0ksC9fmno/6pAOjiZVOXZuyZg2v2mnFo2M88TpzgIpszgiG93vKvu+fw4wr1jQq2hsdigtG2JiCjcTVRFyAb1BzPRgUpX7iN++XPgnoFvo9zIZjTSEPN//f8eKhnk6c4Gtc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770655228; c=relaxed/simple;
	bh=dIl/8D+LNkoXSTm6Xv8/XKWtWlHC1fbYKuhtm53pQDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGBCmCCNA8oy6FLYx5BYurQjt4QSkB3lhccaA7eRPrcyzLMlpc5pTNN4b/r7YVW+soShnXhfhpNCt69PrVtKkPlM7Z9oMIb6ImkXfHnWehF6FboQAuJ57dHv+WSgnb0vjUWnj0+qxUHROol3mEeBIOSUecn+e5pJ2HBDx2/DdIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GeITWQrc; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GeITWQrc"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b86ce04c5cso946879eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Feb 2026 08:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655227; x=1771260027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0kPAg++sBI7ZcyBW/AK4P4lNxeYyOJvxXptCFbHF7nY=;
        b=GeITWQrcfx4FITzY5q9mbVcCohuqh3hsowrUaiRcj4BlxThX8xsyKTqPMgfEFhdBe+
         Y31YRUqYUNS4fuvsJssmPSdbD0zpDVIZ8SvcyvNB3tJinb1m1WNnyMdFp2+xlRaaIYuv
         SK6k6mplEqec0P6Sk2HNbpf0r6De6k/LrZ7Sl0GbV7+SpJKfDAAnCvkVieKobPVrA7Sw
         wsd0BZkWhXq5Xj1Z6ARvp7rGe5xWzruDfq1UtKvUEe8Ue2WMiix3ZzLCFVLAp7VyJySX
         Bf7cQ4MjF9w2MECtgKknrmLIp1vhLv9ykw7EM1O8q3Rr/MGdlI2WLXS/KFiMl4zkEdQj
         bf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655227; x=1771260027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kPAg++sBI7ZcyBW/AK4P4lNxeYyOJvxXptCFbHF7nY=;
        b=atJ0FZmHi7aSwYD4N4Cf6RmHfN3PIbDN7nOq3giUGq1OsZl6v93zXcJ94IA7hH09Oe
         Z2TANUsDZCvPncM+tKUsiOpibNZ8BjEghC65GulMYGhN5k0D+kDz9PsCku0nX+a1TFd3
         E8CE5pesp4gjild+KFNg5j8vudYiBo+zAbxVXoeEJATvpOI8ZT4MIpJWxHtvKZKCKy8H
         EzOO50/MKIy2m5GgxwG/Sp6Mcr3otS1bhSrop3KZF/bxEPTngGfoG5rz35S9GNU41/LX
         kenHOZcxwkq+ACimt6HW0X+9z7pZkm+/ChVHv9QpCs0kfQ3gO0oza+IE8xufmV/9Zjqj
         5bKw==
X-Forwarded-Encrypted: i=1; AJvYcCUZJzOkAXimk8ZbLBpDrbmT24IuhWIDkHHSsIF8o5PBxMZfUl+9T6RCX5m/qUMtuMmx/8RM/U0KMfDwaM0aZwlPeavK@vger.kernel.org
X-Gm-Message-State: AOJu0YzWQoBrKPRGYGJuCtH4P3wxCQbvucBIl5oGMjViGq6zZnmubr86
	ZMB721ySI08K2cvt2NBiMOaQYjePYJSAdB6vNGIHlMWRb5RBLNjjVq5xYrjZEg==
X-Gm-Gg: AZuq6aJqM75W9mYeFHeNcFzI+MdFDLDiYjUSKU/OpdhOb9FslORkNbgZxQHWZ0zO7jb
	H32pg/vfA+FaNX17eRjwatGpC2C0KqpGPpM4R51Z2odgr8G/NbF3tlogTlIBfU72uywBv+8UJR5
	hwN1W3II6LeUIcafE3+eoqppFPtd1JhKQ3ViM7Br9/PjDzKkL58RDKyVDfzzM14XORnokZDVO3w
	9gZkggok+PYTsUK7N67ZzhrHssbRxmCxj7hNc3eJQk6fIjdS3V8qeG0A99BwNtYZm3cYCR4PjZ9
	PGVsrjR7T4pRBunMIJewC+PkpsQCpxE5k1yzbhVpUBnCXKXcSlzE30JTO89re0iCjEiZDmKpH1Y
	8izYkkZA7SaQBTW1rfNCJt9epo6zWKaCuwxKk9xvkvZD8fx0UN8FGzwHwKgOCyj9J58H0ZQig4d
	RMRjtg3fGCedtNi2TYI0TbG3Mty0ZSgIOpQAJj154YAlpFzcZmdA==
X-Received: by 2002:a05:7300:881a:b0:2b9:80c1:ba6 with SMTP id 5a478bee46e88-2b980c10e4fmr1721664eec.37.1770655227154;
        Mon, 09 Feb 2026 08:40:27 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d70d:15:1011:7b14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855b0f624sm8865993eec.14.2026.02.09.08.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 08:40:26 -0800 (PST)
Date: Mon, 9 Feb 2026 08:40:24 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Yauhen Kharuzhy <jekhor@gmail.com>, Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aYoNUn8i1avcZLst@google.com>
References: <20250920200713.20193-1-hansg@kernel.org>
 <20250920200713.20193-2-hansg@kernel.org>
 <aYkdKfP5fg6iywgr@jekhomev>
 <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
 <CAMRc=MfMw85D3FoX0ckAxgEyY8D3ZK5uf9sgVXg7_f+mE55dRg@mail.gmail.com>
 <aYnycxR8nxu85Ivd@google.com>
 <CAMRc=McMOMYnGhsZS2OSeXhMcJPKnjSku2v97uAgatwEpZt0zQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McMOMYnGhsZS2OSeXhMcJPKnjSku2v97uAgatwEpZt0zQ@mail.gmail.com>

On Mon, Feb 09, 2026 at 10:30:25AM -0600, Bartosz Golaszewski wrote:
> On Mon, 9 Feb 2026 15:46:55 +0100, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> said:
> > On Mon, Feb 09, 2026 at 08:36:01AM -0600, Bartosz Golaszewski wrote:
> >> On Mon, 9 Feb 2026 15:00:40 +0100, Hans de Goede <hansg@kernel.org> said:
> >> >
> >> > For the drivers/platform/x86/x86-android-tablets/* I think the following
> >> > fix is both the easiest as well as the best solution is to modify:
> >> >
> >> > drivers/pinctrl/intel/pinctrl-baytrail.c
> >> > drivers/pinctrl/intel/pinctrl-cherryview.c
> >> >
> >> > To register a swnode for each GPIO controller and
> >> > then EXPORT_SYMBOL_GPL an array of fwnode pointers
> >> > which can then be used in the PROPERTY_ENTRY_GPIO()
> >> > entries replacing e.g.:
> >> >
> >> > PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[1], 53, GPIO_ACTIVE_HIGH)
> >> >
> >> > with:
> >> >
> >> > PROPERTY_ENTRY_GPIO("reset-gpios", cherryview_gpiochip_fwnodes[1], 53, GPIO_ACTIVE_HIGH)
> >> >
> >> > (these 2 covers pinctrl for the Bay Trail and Cherry Trail x86
> >> > SoC based Android tablets which x86-android-tablets is for).
> >> >
> >> > This should all be pretty straight forward. Assuming we are allowed
> >> > to dereference an external symbol for the property initialization
> >> > if not then this becomes significantly more complex.
> >> >
> >> > I'm not even sure if we need to add swnodes, we can probably
> >> > just use the existing ACPI fwnodes for matching even and then
> >> > we just need an array with the ACPI fwnode pointers.
> >> >
> >>
> >> Yes, we can now reference fwnodes from property entries. The entity that
> >> creates these devices should be able to retrieve the firmware nodes of
> >> the GPIO controllers (e.g.: via gpio_device_find_by_label() - finding it by
> >> labek is what it effectively tried to do now).
> >
> > How do you do that when your code happens to run first, before the
> > controller is instantiated? gpio_device_find_by_label() will not
> > find it, so what will you use as fwnode in that case?
> >
> 
> The device that calls gpio_device_find_by_label() (most likely a "real"
> device with an OF or ACPI node) should return -EPROBE_DEFER if that's the
> case and not create children with software nodes.

There is no real OF or ACPI node in case of old legacy boards that have
not been converted to device tree. In many cases there is not even a
device that you can defer a probe for, and returning random errors
will likely cause the boot to fail.

Thanks.

-- 
Dmitry
