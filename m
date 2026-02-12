Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839691E487
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 15:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770911377; cv=none; b=P/mqpsdkZg8YhCx8pAB4tU3qp67F3ORnjTFaV2FdD8AU0wUoSztV4YGTcGb94CFxe7O+VRZdP7/XR7VKryHAIuWYQ1aUMLsF0eByXA2dBodR4HHv1EuvEdwZEQyL9zeny57lKebLjb7MPfkkvIrh4OCT4YC1B4ja16Mf2GdPlu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770911377; c=relaxed/simple;
	bh=8Le+Hb4zm+L9TtGz4rRC7XL791ld13f+9nvgSl/zZAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXW39wA76Oy2SE+JQAtHwWDauhOWDR4SGjffEA+0pvq45/kplDQFVEVfApetLGQFTXLOf83BQmDBViMPUi54pXHIBvMkXbO/fpraWvlmKEDYXJ4NjAN5CpNARYIlkLrz2dTj0SBgweKF6wWBmottcVlkbd8GM3yaqLgZmoSqkJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaAhm/1x; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaAhm/1x"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1271195d2a7so75888c88.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 07:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770911376; x=1771516176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ggQS+LGP76yB5tMCjg4Mz8tBXoXmyDY3Mrbk+uJW4c=;
        b=IaAhm/1xjApg5T4CN96mqlp7ZDGHnOiLoBKK1/MfseoHBgJVBP33ahJr9JClNwcWFR
         CxDNAR3/+I3UU6PFLPLZoroy3uL0QT6wO1RuVX7oNs8tfGanbvxFbEco3RQXLnCbOAPJ
         cu9eEV/3VmlmSeJKePF0Bhye7hMnAYOdqf6e28asJvNbk9EL9Bp7gmBX1rgIg84WC3FF
         m9obvdESQEn2n5XYjo4u1rhVX/yQn/InuK9kjItROEkhC8fF+t0e1SkObBV6CAm4l5P3
         aO7zG2BP/CMh4TmNfY6H0cCFZzZB+A86CasxI9S3Soou5soTJBukZzrhu3/fuMkIubHX
         61QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770911376; x=1771516176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ggQS+LGP76yB5tMCjg4Mz8tBXoXmyDY3Mrbk+uJW4c=;
        b=oa0EK+jyZbH99vNJa60sBQ3tpJFhkdLd2SzeJuww+liKhaYPtsaUhiQsFbkEI2PT+e
         2IauRiYBYoldv9/zk8Jk9aMeL3conViMFS/zqe+SNWn2cQ6g3JzApIIAAQ7eR4SLWp6L
         MwcwRSb8VjxbOUMzC3QtJFn4q8wJQVlfzgFOJudF35idJ4Yp1BH237iv/dABcfVeHKXC
         pRfkrRuwL5lpW/nDcAI9ojWq9OwcLIFMbPgE8D8FBYvmtCx5DriVxCd67T/xnkQJlTMl
         bvMXeYIXH64rzQL7R4qOi16ZE7Z+g5cVM5vGhjkjglHdVJxq38x/mcOZNGenzYF4ex0H
         L5+w==
X-Forwarded-Encrypted: i=1; AJvYcCWbSYrkMto9whqfuDI3DRTWv2yG+2BYqPDxQsjoSCu0Mrzcqoc8nbQJETyF3IuZ2bNQLzDLbJxuWtzfBHV3QKV7eRNb@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp1dAfg2NFDMHUXwEZoRh8Owth1IHxtnBrTyWvogjA5/brm0i6
	BlNflk+0GmRbxf9ww1+vzW2Vt3BfV1ubFJWOWhdjFuG7cUWMHi3YrGne
X-Gm-Gg: AZuq6aJmJEbthG3KvK8RDTYsReeUOPhFDxgRraSWyM5AGOMkS6piHjBwlnWFpvUEat8
	PQngKsdNGX8tUDiGP5/MjAshKlCXvmgtiZITZwHrHu1+xvXE+Ys/pXivgpUwP4m2ik3OrVPG1PM
	4d32M2gC1H2RAwUr5qzMvh4P5dfUBVBAPdaBg2R8RIBJ0C2bvoohHG1iuMPxQhPWgFZSmfZ3G3M
	nVbN2/XQC/LdpgtIosCtVgwVxqNnecDt3hSypOVN9VJvPXoCOLLX8w95Ybv6BmBRp5/nVOQiYYv
	i6KUmvlc/ofUmlfcERZ4duyx+iZpNgEmsP0d6vKKHfXEB8nqesBs6V6RKSlGc64V7BqUFAy0UFd
	A0ijWXE6DDgSCThJKwt6Kc1YNLZtOLKE7wiAOriU3dJc2Wjes7g6nXC6mJAbdIQXy/LuH8L5ijh
	EZLpBrFMnD1iSFMOf0z6w2FT8YKq73LTsGKfpNKhdNjNaFnOR35N6QlJjlaUqPriA=
X-Received: by 2002:a05:701b:2708:b0:127:33c5:5390 with SMTP id a92af1059eb24-12733c5547cmr755769c88.11.1770911375361;
        Thu, 12 Feb 2026 07:49:35 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f5e:c935:ddee:63d0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1272a69ccb8sm5442006c88.4.2026.02.12.07.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 07:49:34 -0800 (PST)
Date: Thu, 12 Feb 2026 07:49:31 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	platform-driver-x86@vger.kernel.org, Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aY318Dg9gMU1KFvx@google.com>
References: <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
 <aYnqY4KPq2Gqj3Dv@google.com>
 <CAMRc=McfHM62ZxKdn=QDAmpjExDZwtqhpkLU_=1GE27bbMsirg@mail.gmail.com>
 <aYoOKBMAsTuwHKK0@google.com>
 <CAMRc=MenKFwfT2g2-aUZUsoBdOMaA4m2krJ18Wir=Rwede9JfQ@mail.gmail.com>
 <aYpC_XWNXiRmEdzo@google.com>
 <CAMRc=MecKXHOZSpKfeWzEQLgcddsstbhRQHahD8Hky=3KP4QHA@mail.gmail.com>
 <aY1K7z5oYFmwMy2b@google.com>
 <CAMRc=MfdeQhgQd9FzUt5JtynerzR52yWndbVJ5Xu-eVUwtvgJg@mail.gmail.com>
 <aY2rWc4bfeWqw1Zu@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY2rWc4bfeWqw1Zu@smile.fi.intel.com>

On Thu, Feb 12, 2026 at 12:28:41PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 12, 2026 at 02:01:02AM -0800, Bartosz Golaszewski wrote:
> > On Thu, 12 Feb 2026 04:44:05 +0100, Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> said:
> > >>
> > >> Agreed, I'm not advocating for using lookup tables. I'm advocating for using
> > >> swnode correctly.
> > >
> > > I am curious how would you approach to fixing
> > > drivers/platform/x86/meraki-mx100.c ? The GPIOs in question belong to
> > > "gpio_ich" which is a cell of a MFD PCI device (lpc_ich).
> > 
> > Something like this (compile tested only):

I see. I guess what I do not like about this approach is that it
introduces link dependency and may affect load order. I guess it is
ok...

> 
> So, as I understand the idea is to provide a reference to a standalone software
> node that is not connected to the chain of fwnodes for the device? It might work,
> but can't we do the same for any GPIO controller automatically at the time of
> GPIO device registration?
> 
> ...
> 
> > +const struct software_node lpc_ich_gpio_swnode = { };
> 
> (With name, please!)

That we could match against... /duck

-- 
Dmitry
