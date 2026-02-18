Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF871F8AC5
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 00:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771374670; cv=none; b=GYdSG6xh9RxXQFKUdLJDfFAc1IWNZyay1x3N8ADLHSbtKXDYaKnLgeixW2E3Pnva0YnJSa0Rm4EuOg9ATzOXkKpPI7KJUKMD1p49qA2fgK63M7hpWOE9Q4JKUkXL4YUgXnPjuCYf3A0ZSbXqq1UOELc3pUCu6PzTfNybQYAEPpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771374670; c=relaxed/simple;
	bh=Y2Fa0g/eiWnBGtl7TW6Y8Fxqa981wFYoJqnEQ9J5DTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvYw/A/IBh9cHLfj1Bekq2buaRij6rfwNtig6RI9LknE8KJ97lpcnNMZinA9hEEW8/ugm5qehDtPJKw89/mU2ZzUf1g4jVE6TTllvqTQY6//MPH6bTH6VVKdM79rzPVbKlPCS1+XF06+LCm5kv0GLg5kl1DOzOsY7KFMWb/s190=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7EHxQCQ; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7EHxQCQ"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12721cd256bso5879545c88.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 16:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771374669; x=1771979469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sg0v5gzcAHvCWeUv8SrWGgkElA1mA5SgiIxc3XoTrGs=;
        b=H7EHxQCQzO0WfhvoxtJjCdHi3nZgfw6X0lMl76bjBN+ISxt8UIMRJXOgOclTRkvAiS
         KIjaFFBIwXZQXJsdC+C0/Ir7YEatWth1NPmPVvFZMw1kBq8tVrL4On0Lyjb9zuXM9ASu
         WstOqUzxXOfgibQuEO+7WZDykWdDJJNpb7XSvzvIqQOiObLPRGBhiO17cseYCgWdGE8B
         KHVQL8yKMYH5SPtMymKssb2Y4drPGU/s9ipDzOH/kwfB2XR9OU/4baSn7yhmTzNWaahc
         S+bhmQDXzgixCo31wkGk7PRQLg6hWjqHtsMMZT9z2wLc6wOBRSuwe6gKZWT+uqIg70I4
         KrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771374669; x=1771979469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sg0v5gzcAHvCWeUv8SrWGgkElA1mA5SgiIxc3XoTrGs=;
        b=b59N6GZ7iwOUS6NqjDXjmQD/nZXX9gcyKTPMArZNdpF2VI3MiH678TpOp5lOG4fbBw
         gXPcOnajZz5ZRSV8UKpuvoX0ao5WrYcqibC8/tYkYh0bM6hzD5UzLIzUaQ/kELBAhXNM
         yDzwvz+6pgQD+1aw/a2M4gKHccfmlzSaeQFPAjo2/QsTJb/ZKT/aWw7aeaBVxhDfuHjL
         X7YCa9o2d49xb6KqTSLkfa8bR4Y1HfjBC84d7o3caUmd9szCQ8h/N9pWoEQWEt4Hb8Xu
         WwAR9aakxkw14SztbTFxP5+F0XeygcXeQG9bsETkCOZJ1CVP976uCGJhhfrX5HIkbmkK
         IkIw==
X-Forwarded-Encrypted: i=1; AJvYcCWr/2jrX75aNXvRgs09gjnh3iuWRQA994eHID7AOBO1/yjLWG4kyVo6pcRTcdEFcW8Rv0buG+1UppC7/HX6gA3r1kcv@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq4oodSIXtgMYRJeJoiC1ahD8J7k2d+zhayrT5lV0UaBXd5lJP
	drqp+dTRcvB0/EzYFsWll+eIMYfv1rMeoNqI/JiXUEBWVZVVG+Gnh2Ij
X-Gm-Gg: AZuq6aJYfY2G13q3ShphWNsOPb43BN10N/VkLTU8GmQttylnZ6GArde2tIWdGrTzxq5
	m59ER6mmPJ7RPYs80nzlkzVTGd9uT18LdXqJUeAPviemaHicy6LaKUDbiZRSilZQp9J6V0l95b5
	QZSGjKOlElzR3h2LrVElX+t4+tphMhZ8DIRapqiIvMs850ZZJXkFE9e1UvuF1h04lDdo8CQZGaW
	dfI1lkhMuKH82teIw/5dgVPm/xn/XfCeQGLFXZU96FxSETFQide6OFb4w3IW1ReifiNT2Z5vP0g
	5BdERgdBwfHGJLo1TBUmwomqaiC+9WcF2RxGa8AOv5R5WSnvSUMfPj+fbo7efh6jCIffJiHbqF3
	aKX7UnPBgzCLq69dW1qBjBxBBUEBBRYpnr4LkHLHUWyACpYDji58aGlSfvfPomF90EZDAI+rtNo
	mJM4Sv5x3hJV0NyfT01D5j6RNo6cdk/382BM0PGWj61i+39HDt8oQxN7kZjEuX2wlN
X-Received: by 2002:a05:7022:2393:b0:127:369e:5d54 with SMTP id a92af1059eb24-12741b71059mr5293643c88.13.1771374668482;
        Tue, 17 Feb 2026 16:31:08 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:968c:f102:3683:408a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb66bd17sm17035569eec.28.2026.02.17.16.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 16:31:08 -0800 (PST)
Date: Tue, 17 Feb 2026 16:31:05 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: swnode: restore the
 swnode-name-against-chip-label matching
Message-ID: <aZUIFiOYt6GOlDQx@google.com>
References: <20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com>

On Wed, Feb 11, 2026 at 09:53:13AM +0100, Bartosz Golaszewski wrote:
> Using the remote firmware node for software node lookup is the right
> thing to do. The GPIO controller we want to resolve should have the
> software node we scooped out of the reference attached to it. However,
> there are existing users who abuse the software node API by creating
> dummy swnodes whose name is set to the expected label string of the GPIO
> controller whose pins they want to control and use them in their local
> swnode references as GPIO properties.
> 
> This used to work when we compared the software node's name to the
> chip's label. When we switched to using a real fwnode lookup, these
> users broke down because the firmware nodes in question were never
> attached to the controllers they were looking for.
> 
> Restore the label matching as a fallback to fix the broken users but add
> a big FIXME urging for a better solution.
> 
> Cc: stable@vger.kernel.org # v6.18, v6.19
> Fixes: 216c12047571 ("gpio: swnode: allow referencing GPIO chips by firmware nodes")
> Link: https://lore.kernel.org/all/aYkdKfP5fg6iywgr@jekhomev/
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v2:
> - check if gdev_node and gdev_node->name are not NULL before trying to
>   match the label (Hans & Dan)
> - use the right link
> - collect tags
> 
>  drivers/gpio/gpiolib-swnode.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
> index 21478b45c127d..0d7f3f09a0b4b 100644
> --- a/drivers/gpio/gpiolib-swnode.c
> +++ b/drivers/gpio/gpiolib-swnode.c
> @@ -42,6 +42,25 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
>  
>  fwnode_lookup:
>  	gdev = gpio_device_find_by_fwnode(fwnode);

By the way, should we extend gpio_device_find_by_fwnode() to use both
primary and secondary nodes?

Thanks.

-- 
Dmitry
