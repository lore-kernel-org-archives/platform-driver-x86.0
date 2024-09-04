Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35691E1A17
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Sep 2024 18:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725473701; cv=none; b=kIXwMZT/gK5yVL4z5sleIwiSUifJ0qeZX/t6Yk3PyCT2vbNBOQSy36dAlqAa5fkoSgjukLro7pvvdbrw3CZuLWzO7h+z1KqGB4VveUhAEaluwJXYmDc6i308AdcE2m1HCTawITTz74fQA7EgGnlF1WJfCky2kvMg3Q5HZhnSQ60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725473701; c=relaxed/simple;
	bh=JE7FrUr9ZRXYVjbKEH+5C5hhfvQv+D7kDFcNqDjL/Xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OENQzp4d4cDNemdAPyNnPkeMdsivylT9u6z+rnHIMBYfvdbV5bWJGeLgLXWpDbMUgBKCh4grEfObFiNL1YxY6BYmsPJ+y8zwq1V9YDWfiW5qBuXYNekapdMrzFNJOUdtUMgJF2lBVDC4TIWbV/LJH08RiMVzA9Xri/kJDeW3rhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g7sxSrq0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g7sxSrq0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725473698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dD1j5j+d+ZV/X6VwIAW68Y78qSafx+14hxpI4ONjAaA=;
	b=g7sxSrq0/vp/7vtAhr+A6jF2UUtvUS+sCBdgS3Bz7zOM3vkHfwnQQKINW5uVFrJpfqOKUm
	M/yr2l4OzwuMAcVb9d0821inHvVNGU8nF2+p9pKKxBvQiD5SjrMksNZtqWVmOIMoUc9Cie
	KJCaJC73oeARqw4indMGn3+RS4sHVTM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-nvz-yuJNPXqZ0faRbbiAWw-1; Wed, 04 Sep 2024 14:14:57 -0400
X-MC-Unique: nvz-yuJNPXqZ0faRbbiAWw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a86860c87a8so556255466b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Sep 2024 11:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725473696; x=1726078496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dD1j5j+d+ZV/X6VwIAW68Y78qSafx+14hxpI4ONjAaA=;
        b=b/pk42o7X22Nqchq66wcUGg909brQuflIqLrCegHY1aWikPTuIdDSV/4Ai+5J5HZcV
         z6/o/mOBw/SKNRVTFRNYMgoeZHTO9/c8eWpw83zi3Dw9CqrQhwgoiaehLd06X5/E/+Qa
         6rTaWGZ6h4Qeoc0V+mu8P0Mp1OjEpBPGRHXRLMOHgMQu8P6TWpi+ew0lDuAKB5Fo7XKI
         VoLlYvCcp6PesiFnTpTw+kW+aJ227FnA9VHOSeiDWPNj8ZPeyA6PeKxwg33Dz6GJO5mx
         auTCG9hvuKvT6ItWpJBzoMpeAB3Hf5vbGCWVi0BGXJyfLN+aJMVZAP1Xjvyb+rLcPNh+
         FPDA==
X-Forwarded-Encrypted: i=1; AJvYcCWsD2NY5kEsi2ON6qGL0OACqrGsUJwycV1dqiZrAyE1+uECmHPgAKTaKjJjazxRCSXPS34p+fJr4ZhYnFMnEfWrOTxG@vger.kernel.org
X-Gm-Message-State: AOJu0YxgrueTeb6iTe7HFNAPDr2YFfbMCD5oN5EbLkRJIcbQJFYMEw1R
	OOQPg5s6nboKE1gj+tlZ0Ga+B2He1DDaNd7HaM8qfHVxp079lUNHlLq3hA8x/9VqPk+vC2E5XzE
	acoset2I949jTDepn+x7vpqbCP/Vqm6nj6t6VJAXamRAMgsEQWBeX1Rku8va++s2k1203Lwk=
X-Received: by 2002:a17:907:a08:b0:a86:799d:f8d1 with SMTP id a640c23a62f3a-a897fa74dfdmr1535025366b.47.1725473695559;
        Wed, 04 Sep 2024 11:14:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4D8jrkoQLQi7qWEZ6FQUqmY5y16zF6BjLZL9pM2G+xT9/k6q5edCaN5IPRr6DUVZm4bLrfQ==
X-Received: by 2002:a17:907:a08:b0:a86:799d:f8d1 with SMTP id a640c23a62f3a-a897fa74dfdmr1535024066b.47.1725473695092;
        Wed, 04 Sep 2024 11:14:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a623e306asm20017266b.206.2024.09.04.11.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 11:14:54 -0700 (PDT)
Message-ID: <8a106cfe-f7cd-4660-983a-feba627cdcab@redhat.com>
Date: Wed, 4 Sep 2024 20:14:53 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] platform/x86: ideapad-laptop: Make the
 scope_guard() clear of its scope
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Gergo Koteles <soyer@irl.hu>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Ike Panhc <ike.pan@canonical.com>, Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 kernel test robot <lkp@intel.com>
References: <20240829165105.1609180-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240829165105.1609180-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/29/24 6:50 PM, Andy Shevchenko wrote:
> First of all, it's a bit counterintuitive to have something like
> 
> 	int err;
> 	...
> 	scoped_guard(...)
> 		err = foo(...);
> 	if (err)
> 		return err;
> 
> Second, with a particular kernel configuration and compiler version in
> one of such cases the objtool is not happy:
> 
>   ideapad-laptop.o: warning: objtool: .text.fan_mode_show: unexpected end of section
> 
> I'm not an expert on all this, but the theory is that compiler and
> linker in this case can't understand that 'result' variable will be
> always initialized as long as no error has been returned. Assigning
> 'result' to a dummy value helps with this. Note, that fixing the
> scoped_guard() scope (as per above) does not make issue gone.
> 
> That said, assign dummy value and make the scope_guard() clear of its scope.
> For the sake of consistency do it in the entire file.
> 
> Fixes: 7cc06e729460 ("platform/x86: ideapad-laptop: add a mutex to synchronize VPC commands")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202408290219.BrPO8twi-lkp@intel.com/
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> ---
> 
> This has been Cc'ed to objtool and clang maintainers to have a look and
> tell if this can be addressed in a better way.
> 
>  drivers/platform/x86/ideapad-laptop.c | 48 +++++++++++++++------------
>  1 file changed, 27 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 35c75bcff195..c64dfc56651d 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -554,13 +554,14 @@ static ssize_t camera_power_show(struct device *dev,
>  				 char *buf)
>  {
>  	struct ideapad_private *priv = dev_get_drvdata(dev);
> -	unsigned long result;
> +	unsigned long result = 0;
>  	int err;
>  
> -	scoped_guard(mutex, &priv->vpc_mutex)
> +	scoped_guard(mutex, &priv->vpc_mutex) {
>  		err = read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &result);
> -	if (err)
> -		return err;
> +		if (err)
> +			return err;
> +	}
>  
>  	return sysfs_emit(buf, "%d\n", !!result);
>  }
> @@ -577,10 +578,11 @@ static ssize_t camera_power_store(struct device *dev,
>  	if (err)
>  		return err;
>  
> -	scoped_guard(mutex, &priv->vpc_mutex)
> +	scoped_guard(mutex, &priv->vpc_mutex) {
>  		err = write_ec_cmd(priv->adev->handle, VPCCMD_W_CAMERA, state);
> -	if (err)
> -		return err;
> +		if (err)
> +			return err;
> +	}
>  
>  	return count;
>  }
> @@ -628,13 +630,14 @@ static ssize_t fan_mode_show(struct device *dev,
>  			     char *buf)
>  {
>  	struct ideapad_private *priv = dev_get_drvdata(dev);
> -	unsigned long result;
> +	unsigned long result = 0;
>  	int err;
>  
> -	scoped_guard(mutex, &priv->vpc_mutex)
> +	scoped_guard(mutex, &priv->vpc_mutex) {
>  		err = read_ec_data(priv->adev->handle, VPCCMD_R_FAN, &result);
> -	if (err)
> -		return err;
> +		if (err)
> +			return err;
> +	}
>  
>  	return sysfs_emit(buf, "%lu\n", result);
>  }
> @@ -654,10 +657,11 @@ static ssize_t fan_mode_store(struct device *dev,
>  	if (state > 4 || state == 3)
>  		return -EINVAL;
>  
> -	scoped_guard(mutex, &priv->vpc_mutex)
> +	scoped_guard(mutex, &priv->vpc_mutex) {
>  		err = write_ec_cmd(priv->adev->handle, VPCCMD_W_FAN, state);
> -	if (err)
> -		return err;
> +		if (err)
> +			return err;
> +	}
>  
>  	return count;
>  }
> @@ -737,13 +741,14 @@ static ssize_t touchpad_show(struct device *dev,
>  			     char *buf)
>  {
>  	struct ideapad_private *priv = dev_get_drvdata(dev);
> -	unsigned long result;
> +	unsigned long result = 0;
>  	int err;
>  
> -	scoped_guard(mutex, &priv->vpc_mutex)
> +	scoped_guard(mutex, &priv->vpc_mutex) {
>  		err = read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result);
> -	if (err)
> -		return err;
> +		if (err)
> +			return err;
> +	}
>  
>  	priv->r_touchpad_val = result;
>  
> @@ -762,10 +767,11 @@ static ssize_t touchpad_store(struct device *dev,
>  	if (err)
>  		return err;
>  
> -	scoped_guard(mutex, &priv->vpc_mutex)
> +	scoped_guard(mutex, &priv->vpc_mutex) {
>  		err = write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, state);
> -	if (err)
> -		return err;
> +		if (err)
> +			return err;
> +	}
>  
>  	priv->r_touchpad_val = state;
>  

