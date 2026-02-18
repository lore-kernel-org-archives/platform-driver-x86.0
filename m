Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DD22D7812
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 17:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771434935; cv=none; b=mDiYC5j5x8JI7cIo1aSaNnk0akcbjGKshPzT+i3ySw7EWABqKMlmgXKIFRQfgF+BhGFdg9tSUJBi4D1oqUZJaw/PIoddCNbhTLZdNs0oH273Of3Yq5Xsf/o9oyTgTlLOcKZqBM0SUxGpqxcAI6tRNjwOXCYsVBD2GjLUtfl4N0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771434935; c=relaxed/simple;
	bh=Q9ooPQVTGTcVJezfW6R+eFguPYeeOCmuofwhzMEcloE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjsGkvObX8U/GQG3xqknamc0o3+58TsDf0VopoTC79vaXEZ546hlCC5IU6+0TYLgrmn0OiUA+8mx7oc0lY698eIMPscc3LorcjfcgqPq948r2/m/stofk0LKFmRpNhM4g48pe3YVHdBPNGGdlzt8e8s+iZWDrs2X3owGT0PiHm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4g8Qx9R; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4g8Qx9R"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-126ea4b77adso6906611c88.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 09:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771434933; x=1772039733; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wIZQJcadFJwIiNdmilqedpFYEso+tQwK1rGzbwDAdbY=;
        b=A4g8Qx9RHBdDCRZPnmspn153wPXv/iwgGb9oWxb/dbrKzEZrt5NcSBFKWtOrdSSX9b
         3xefLpNJfZW37VIhvrnwJ19AoDRRnIBwAhLW0jUz3liS2CPTw0p3wMHaSW+plpbENmxT
         bmImBV0NkWBfV9wSEhXE05Phq9e++/x9AoAbYKIhGXXNcaV/cwjLe5MjKPs0f+3hxDzs
         lwUccqVlwjAkjlxjyVKU0lGDtiu21K9OlUmU5CD4Z6p0V4IO+xYB8wnuD6w1gSqlAg3h
         wAqGRtxrmez6c7AG1dbIhG5xnddg3XfYstdc8B2eMlx52Yzl70p5/f9ggkDFz1PTlR8k
         0b8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771434933; x=1772039733;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wIZQJcadFJwIiNdmilqedpFYEso+tQwK1rGzbwDAdbY=;
        b=kLflirwYcVyVwI5MpVLeenyF1GrweEq6B5rLT5S6l00GaOCBHlQ0MlOsqNGWN1Tucg
         De0xuMCndDRVEg6I9AFsgZLl53bn0tVf0wjFYg9lgNKu6IBPyKIYZ3lxu/1K2KBYVvXu
         wjtC+V1cZbn/vbwFl0Ibx+5E0NTfHmn8pULHaT6AyYqwRpUqPRtjCtYuKV6sPCScySAi
         b3fL4qFfhJMn+CJzNES3FKJspjjpyT/e+6Gi5Cdc8bL1DHBfJDhmBC+06uJzs5pdSy4U
         rJF9IdMskM8B7GyLRVk8c1TId1noIMaborXGMs7/fTfxdRWOf0d10tm4Hhtn9ehn8MdX
         13mA==
X-Forwarded-Encrypted: i=1; AJvYcCV///uYMnXHTsqe2C0TNW0P6eL93jCi1b3DTM0Bjiw7Sxc3jIOm4vP4LTNARTusFWHOPTJKOe9WO1MNItS3y1OF8Ehg@vger.kernel.org
X-Gm-Message-State: AOJu0YwrI1G68CxckA+JqZZ5xFXT5h37C139OTXmX2HG7MAX6k4TFckk
	qB6OMOtgB7LslZsn8494xVqkAuWqAHWPXyBp62krVAuaJ/H93REhLpjo
X-Gm-Gg: AZuq6aJXksljO1w8pH7a4i597aDLZugwT0hTKjfzO67pzo55dgyYR+tQHnT8TqfjXPs
	xoiB8s3+/GhCQN3l9BcELkvI1LY4W62TFdFPWqTZP5Mh//YxHufJrBq8X1bpXFlkD9WQElVZtbW
	KLxsjT4gquGsIetZKyUfuWMYkWFCncKA51ktN3e/kD7a347YIfKZ9m5aeJxT8bzA1frZHCGXMFE
	vWMhppSsFCY2hX9HfAbkfYPyquPOun4WGb+fpKLjiOxogweR7MOjHQlTd82P1VLIsCXMKI+nPYF
	BhybxkcShHam0Dok2f45VDbBxy8OjSbVWwhTm3du8TqWraSAZ4/L/LsABV7Yn/elNPtsFzTn8vh
	cEsFbMevY9q1lG9BsIXZXUJKbVgEUmcrDNSkkI4uDiBOCdA38cEO5TGcKG0XFPFUf9/ymV965fa
	FxXvt8EfPFOcfeBAsT2IKTlhoHF0r/TcggxIkEucjqYtvANTroMMae9KJ8tr9cDtAb
X-Received: by 2002:a05:7022:60b:b0:11b:9386:a37d with SMTP id a92af1059eb24-127398466d9mr5205084c88.44.1771434932895;
        Wed, 18 Feb 2026 09:15:32 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb5622f2sm22285550eec.10.2026.02.18.09.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:15:32 -0800 (PST)
Date: Wed, 18 Feb 2026 09:15:29 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: swnode: restore the
 swnode-name-against-chip-label matching
Message-ID: <aZXyPjIjIDKCBLvs@google.com>
References: <20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com>
 <aZUIFiOYt6GOlDQx@google.com>
 <CAMRc=Md_x+DxmW742HRUW-jeg9_AW-stKkHUP9z13+M+POd4Tw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md_x+DxmW742HRUW-jeg9_AW-stKkHUP9z13+M+POd4Tw@mail.gmail.com>

On Wed, Feb 18, 2026 at 09:42:28AM +0100, Bartosz Golaszewski wrote:
> On Wed, Feb 18, 2026 at 1:31 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Wed, Feb 11, 2026 at 09:53:13AM +0100, Bartosz Golaszewski wrote:
> > > Using the remote firmware node for software node lookup is the right
> > > thing to do. The GPIO controller we want to resolve should have the
> > > software node we scooped out of the reference attached to it. However,
> > > there are existing users who abuse the software node API by creating
> > > dummy swnodes whose name is set to the expected label string of the GPIO
> > > controller whose pins they want to control and use them in their local
> > > swnode references as GPIO properties.
> > >
> > > This used to work when we compared the software node's name to the
> > > chip's label. When we switched to using a real fwnode lookup, these
> > > users broke down because the firmware nodes in question were never
> > > attached to the controllers they were looking for.
> > >
> > > Restore the label matching as a fallback to fix the broken users but add
> > > a big FIXME urging for a better solution.
> > >
> > > Cc: stable@vger.kernel.org # v6.18, v6.19
> > > Fixes: 216c12047571 ("gpio: swnode: allow referencing GPIO chips by firmware nodes")
> > > Link: https://lore.kernel.org/all/aYkdKfP5fg6iywgr@jekhomev/
> > > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > > ---
> > > Changes in v2:
> > > - check if gdev_node and gdev_node->name are not NULL before trying to
> > >   match the label (Hans & Dan)
> > > - use the right link
> > > - collect tags
> > >
> > >  drivers/gpio/gpiolib-swnode.c | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
> > > index 21478b45c127d..0d7f3f09a0b4b 100644
> > > --- a/drivers/gpio/gpiolib-swnode.c
> > > +++ b/drivers/gpio/gpiolib-swnode.c
> > > @@ -42,6 +42,25 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
> > >
> > >  fwnode_lookup:
> > >       gdev = gpio_device_find_by_fwnode(fwnode);
> >
> > By the way, should we extend gpio_device_find_by_fwnode() to use both
> > primary and secondary nodes?
> >
> 
> That's already done on a higher lever for all fwnodes in gpiod_fwnode_lookup().

How exactly? I am not talking about checking secondary node for the
fwnode that is used in the reference, I am talking about secondary
fwnode that might be assigned to the gpio chip and you need to check
both primary and secondary if they match with the fwnode that you call
gpio_device_find_by_fwnode() with.

Thanks.

-- 
Dmitry
