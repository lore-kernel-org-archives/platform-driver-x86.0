Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B684323B60A
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 21:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758316920; cv=none; b=RYwgK9nNpZ5lnmcdcIGNQFURCMFL3WWUAyS+nnrmAosvXznxMsBBEnPO6sM7J10enpVdXa0zoXHPBBpA7dPKqD9/SNggSCDZ4Pyasn4mAvqAMfoaMaq40JFtNX3VnXEVZ0o0LvfoPg84z9JcP8P9XolO71bzOf608CnXIB2EN08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758316920; c=relaxed/simple;
	bh=2E3mUBxH6R6Jug+ATNrGmXgQzZyUHAlwKykD5PH+RhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLe7PxZi6cWgZTW2IW2mPLjCPMLV2HeDvoNLhDg44uCO2PJPVLDiEIGuOKTXPyfDJMxK5ENkBsDBY++m1rx4ODFib4hoae7VXqx4R5n6LHrxpgHanpCGHS9Cses9tjgBupNFbbO2NtchazXSokcBK8Zn4pUmrkAwOU4ijeBOKbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHx28OaP; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHx28OaP"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2445805aa2eso26081125ad.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 14:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758316918; x=1758921718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U+G5BcJeXL6jDC2bAibkklgz8WdwIScxof/3Q9gcq9M=;
        b=dHx28OaPX3uHpx0R1XnCwagNlUq2dTYn4vmQ6cm2w3X8N6MPRInBq2jJ5pFmFwraKg
         agVawfYANqsrWqUxj6Q5YPbU3zW592WDR/JL9/VGn15Ol28hF6dqpLcVb1cAcDTIYXnc
         SiyYdZncu8gWakKVlgmJ7/utdty12dtAeW9Gys58ed6ZgzAN/VEa6v65jjwsQ5ckOsD6
         JGUWMSzPO7KoohDSsR+4K5I4K1/RGWcO1HWSJvk71aBC/BZ1dS4qTXDXfrKgYx+KDwWx
         xdySYnSBr00E4LZycAWn6ItHQJZJZIfB2BgffepLYAmzPkJBmSb8sJiF9hb50F0MnoZk
         qFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758316918; x=1758921718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+G5BcJeXL6jDC2bAibkklgz8WdwIScxof/3Q9gcq9M=;
        b=Y1p3jRzNIfmd6qUOxAw54GYeMPxQTRKV633uX685pV2o8abIuww3suWwDWGFQ2vxlL
         dz/1BuEoH5JPSCLkC5Qixnlh5yasINkT4fvD3rZY0RPAP627NHFyq/Q1YumE6pivsYb1
         /svQuNA34GJLBK3xSDhQbYiSj+lxzGA0/VgQH1NAPY5H1zkYDLcQHupoIOgWhEhhp+w0
         dODnaVrpocqSPAOR9oCFgFQezBn10qrEWc6Y5YNBQQ5jJEEHluym7a9kHgKMmt/zOELf
         pNnvEu4Us+MpUwJasPwoe4uvytUu9rhWC8b1ujIDq8HPJHXV/TcL6O1RSp+WyIgwh8kY
         UqrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSMglup7861Y8UTrsz+EWlxHc6h7xyjBSrWiCkyTPejvjE/HHycWYs5CAGQBZwU7SiVhMqYaMIGkevtrIcgHT8bqxh@vger.kernel.org
X-Gm-Message-State: AOJu0YyKaodVY8nn4Ye1Qgwn9RNXFcdpzKrCJjMvTwW86D/yz7gABXjU
	ISvCchlpH/cDlGfa9tHBcpZSlXhbkJmLDT0nxKNlOEv5H5C6zdw+ZJDQg1XtVA==
X-Gm-Gg: ASbGnct6CZBCM2kJR2XmCNQlh565xSb7juucCAk6Bw9L0zBH3VBBeC1rUHQ8rDSddj3
	TMEQlIuQcoeXqKQp5Zut1Ghw8XfvPaWe53H8JGZM6UxgUDX7jVALgjBJ1KOnx4wO452Vwoi1fWK
	KAXGUNa9lMvDJMaVn7/QlYDqFJmFzbwfysYUEd7DNSfGc+UyZUMUGflmtAdBH5F7i+LW50Tupwj
	cBc7P9JCvcSQvMnAr0mpyLbd32is7iliM+hKK0sLQZnYc1YPlq/SMcBbZAG3IZzmkUJO47PrI4d
	wQhIrMYintXxJ27Txy15R0jONPIy1bgT2oV6ZovXkf4CZwqlkTTWSEoPceP/PodUpqmB5mNvb2J
	P0FfrFRwB8j3GzouSVTHNLB4=
X-Google-Smtp-Source: AGHT+IHorHQlFTnVCe5ov/QTPuyR/Y4MFsYkLceh7+ZdUsDWDbJsmQQ7ToA9HVIPBaE6+4IcBOkXJQ==
X-Received: by 2002:a17:902:f64e:b0:246:80ef:87fc with SMTP id d9443c01a7336-269ba563fb1mr74693975ad.45.1758316917923;
        Fri, 19 Sep 2025 14:21:57 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5621:6657:a035:d5ee])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800541adsm64377475ad.4.2025.09.19.14.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 14:21:57 -0700 (PDT)
Date: Fri, 19 Sep 2025 14:21:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Arnd Bergmann <arnd@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] x86-android-tablets: convert to use GPIO
 references
Message-ID: <ley47cmpwn5lhacf7ddfufeaqhe7rqemmkp2sjrhxitdv3l6cm@ktafyk6eeeft>
References: <20250810-x86-andoroid-tablet-v2-0-9c7a1b3c32b2@gmail.com>
 <bc463249-a159-466d-8804-399805b8fa3f@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc463249-a159-466d-8804-399805b8fa3f@kernel.org>

Hi Hans,

On Fri, Sep 19, 2025 at 09:53:53PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 11-Aug-25 4:22 AM, Dmitry Torokhov wrote:
> > This series came about because now software nodes can be used to
> > describe GPIOs (via PROPERTY_ENTRY_GPIO() macros) and I would like to
> > eventually get rid of gpio_keys_platform_data structure.
> > 
> > So while I was doing the conversions from GPIO_LOOKUP() tables for
> > gpio_keys devices I decided to convert the rest of them as well. Maybe
> > some time in the future we can drop support for GPIO_LOOKUP() and rely
> > on device properties exclusively.
> > 
> > This is completely untested.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Thank you for this series. While reviewing this I've found
> a couple of issues. I've fixed these in my own tree and
> I'll send out a v3 with this fixed + some extra patches.
> 
> The issues which I've found and fixed are:
> 
> - lenovo_yoga_tab2_830_1050_init_codec() is missing a pinctrl_put()
>   in error-exit paths after the pinctrl_get_select() succeeds
> 
> - Adding a swnode to the yt3 spi device changes the name of the SPI/codec
>   device and the sound/soc/intel/boards/bytcr_wm5102.c machine driver looks
>   up the code by name, update the machine driver to use the new name.
> 
> - In the "convert Yoga Tab2 fast charger to GPIO references" references
>   the fwnode is added to the wrong device. The node should be added to
>   the "serial0-0" device but that gets instantiated by
>   drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
>   I've made yoga-tab2-pro-1380-fastcharger.c propagate the fwnode set on
>   the platform-device to the serdev it creates to fix this.
> 
> - Fix the commit message of "platform/x86: x86-android-tablets: convert
>   gpio_keys devices to GPIO references" which contained a stray reference
>   to wm5102.

Thank you Hans for looking over the series and fixing up all the issues
that I introduced.

> 
> I've also added some follow-up patches with some cleanups, see the v3
> cover-letter for details.

I've reviewed ones that I felt comfortable reviewing, thanks again.

-- 
Dmitry
