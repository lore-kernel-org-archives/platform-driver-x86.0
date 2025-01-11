Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BCE188938
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Jan 2025 09:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736587815; cv=none; b=CKoMuJz0jDbrel4myEFQtQPQegyj3XJHnC2yJLR9toUHidI3p8ZtZ+OOmOjkIA8LZf3odTPtAcMQw6ObrKZweushA2RY3y9yK0sZidou9JvU9kR4DIKfKf5zabNuefKJrUMLQcfOv1vJjYS/jeT6O0wS4yovTOmO+sXzOvMX4QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736587815; c=relaxed/simple;
	bh=ViBD/S/qRChhEFT2lYmVggLE5djFQjJSv7ko9zfY1s4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4GCFj8MuqrGO7GLPqjqePr8ZS6T78z9v4mMh59Uo/dnxxhTo375TaT0UrRDvGJZOKtSb5VcBOLd4cPJZ9ThUNApb1ZST+pUmkY4B2ew8ntK/nmYCRPeKrm8eYSdtYi2eocGCM/aRhFcsAm+iTNHWpcpZxdz0BW1KGBYSAM88uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GqAPvwMJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GqAPvwMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736587812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y9HWOpd1kFo8IsZN+wTCyr/kbNSNiDgq9iA7C+/DOxU=;
	b=GqAPvwMJ4/8wYPOWTOp9SKe8ICFoWgY8Joq3t2rKIf4QOy7US7Bqk5Bh1Amc5A/euQmJuX
	XQDWnHmhlShhWi4uyMqXzCRcqAy5WiwpfBToA6qquHsHXLuIW15koZVf8fpZHrxsGL3v3W
	j/nveZs07wIsfut1Zl5j8Py7QIQOogI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-KHNpsQVhNSqNYyc1FjaSfQ-1; Sat, 11 Jan 2025 04:30:09 -0500
X-MC-Unique: KHNpsQVhNSqNYyc1FjaSfQ-1
X-Mimecast-MFC-AGG-ID: KHNpsQVhNSqNYyc1FjaSfQ
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5d3ff30b566so2795950a12.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Jan 2025 01:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736587809; x=1737192609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9HWOpd1kFo8IsZN+wTCyr/kbNSNiDgq9iA7C+/DOxU=;
        b=OteKs5kArMSgZaCGBwtOkGbklQ2QJV1BkR53vaArnPb4blIYRCrdDGtSrPsLd5JGIU
         bIpliB5Q26CfkFwzVwuxO1O/EZLbk4iEkEMlHmUqxCVeVHvcuX2YD+O7LvAY2ltO0A4e
         tm3rVH8aQNvMHiU0Bf3gdWtubHkLcpDow0BFp+HhmgC+4DIp54uFyh7i86/cjncNN6iz
         J2BTRCmUvCWhoCFz7n4yHH7mai8aPbBWm4zC1UGiDhgfjVKd7RLT8IMZKNY6D9XrPprf
         qTXeptFty4m/OJ9NucSdMy+uIjVy2av9UV4xTpax3JCBaP9UsR1LL9DAqZE5Vv4jKm+1
         pkbQ==
X-Gm-Message-State: AOJu0YyRwBzGuPiFncs0solub5/5BPRi1MPTEI9AVuvGrBYwLtuH+7zV
	G07R/H5ONZYiWG0r9/IcXnX1xTdtAWYN73DciiOw0O2dvCpspkJGxM4VBQwahKa9bRoaMzITczi
	jgDleyku81khsW+mRLDg2Pegyf1RmeN0LUX3sr+75lf3jRQNnny3A/lF6evvSE2o4O+jI9b8=
X-Gm-Gg: ASbGncu5rRr99zPgacTBVbSKj+30vbFKPhm6Bj8g8Tt46wkWJ443rCht7KiWLv8cZS+
	bGemiuGYXOt6I0ObNTvntgAcdyqUhyFt0+xar807tKlq7ZxRE9sRlCITCLhA9yFj+rAR82mNZUZ
	sdGuh97+bxbmH8SmTs/Fosq/weVuXKAvUqW58jtJSjaM2SBIcGXQO6Ac8V70ghPc8NT93dFpsZ3
	+pBOu3D/l/UsXGFV+QepdHrqOhneJsPmqg6pzdpja6aI1DeNui+tQHzfRkhI3Uy9BGZa/AMKSDm
	cKe/NxYsCw2L5C6WKsxnw5IgsrHluKlCFv1zvtpDuogF0mmjKHfXbyl+CroldguOLihG2/qLEA2
	oI6Xp9QxiyKiqsnIQSCrjUDkUOocehko=
X-Received: by 2002:a05:6402:2548:b0:5d2:7456:9812 with SMTP id 4fb4d7f45d1cf-5d972e4e53fmr12367883a12.22.1736587808713;
        Sat, 11 Jan 2025 01:30:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVewQf98K1k+oLdng07919fz99ViqsBOOQof//OQgKd+naCcJXbbBO6tPuVdWsk6lABwHN1A==
X-Received: by 2002:a05:6402:2548:b0:5d2:7456:9812 with SMTP id 4fb4d7f45d1cf-5d972e4e53fmr12367872a12.22.1736587808286;
        Sat, 11 Jan 2025 01:30:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a4d49sm2368519a12.78.2025.01.11.01.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jan 2025 01:30:07 -0800 (PST)
Message-ID: <27cc3452-782f-4a9c-a762-b2bdf9ae1acd@redhat.com>
Date: Sat, 11 Jan 2025 10:30:06 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: fix
 race condition
To: yangchenyuan <chenyuan0y@gmail.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 zijie98@gmail.com
References: <20250111053557.1803140-1-chenyuan0y@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250111053557.1803140-1-chenyuan0y@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Jan-25 6:35 AM, yangchenyuan wrote:
> From: Chenyuan Yang <chenyuan0y@gmail.com>
> 
> The yt2_1380_fc_serdev_probe() function calls devm_serdev_device_open()
> before it calls serdev_device_set_client_ops(). This can trigger a NULL
> pointer dereference.
> This is similar to 5e700b384ec13f5bcac9855cb28fcc674f1d3593.
> 
> Fixes: b2ed33e8d486 ("platform/x86: Add lenovo-yoga-tab2-pro-1380-fastcharger driver")
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>

Thank you for your patch.

> ---
>  .../platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c  | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> index d2699ca24f34..1a4e66464a7e 100644
> --- a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> +++ b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> @@ -199,15 +199,15 @@ static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = devm_serdev_device_open(dev, serdev);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "opening UART device\n");
> -
>  	serdev_device_set_baudrate(serdev, 600);
>  	serdev_device_set_flow_control(serdev, false);
>  	serdev_device_set_drvdata(serdev, fc);
>  	serdev_device_set_client_ops(serdev, &yt2_1380_fc_serdev_ops);
>  
> +	ret = devm_serdev_device_open(dev, serdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "opening UART device\n");
> +

serdev_device_open() resets the termios settings such as flow-control,
so you need to move the serdev_device_set_baudrate() and
serdev_device_set_flow_control() calls to after the new location of
the devm_serdev_device_open() call, just like commit 5e700b384ec1
("platform/chrome: cros_ec_uart: properly fix race condition") does.

Regards,

Hans




>  	ret = devm_extcon_register_notifier_all(dev, fc->extcon, &fc->nb);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "registering extcon notifier\n");

