Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8077114F63
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dyi5FK+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702907466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C0IIG4uM93l8rTtXr9++HE6Nb11VQoEXQ0E2WhIPe74=;
	b=dyi5FK+qYRF6co9wAU4AgPTlUByfdfV0itVfTQpkoDtKEVr+bIhRvuhZl7zhtzOQimtz//
	EQg28cIjYgOdGsy7DUbd2gg3Nj3ORhBt3YzcGIWeJR9AgnXMVJP8219rsUVmcJH7cFrgP9
	AGnelqAq3c6YdseGlDrM2jleXXcoEoM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-421lxvXBM6q6YlrsrPX2qw-1; Mon, 18 Dec 2023 08:51:05 -0500
X-MC-Unique: 421lxvXBM6q6YlrsrPX2qw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-336695c701eso518603f8f.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 05:51:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702907464; x=1703512264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0IIG4uM93l8rTtXr9++HE6Nb11VQoEXQ0E2WhIPe74=;
        b=dE/9auE18fATfAjcxJsRuPjh5oQPzD1bz5NJN8etyiRpyaFAW4cyqJMCmj3jGbbUSz
         vogWqEaFiT2yoLagDdvcwnco9BDv9oFaSdzM1ga1I6JyqjQFI6UeXtoJP10uJv0P1dBY
         EwZcUri7UbaFPAqCwbPfKqjgXp+wOj0Zwo3WKhYSFzRhBgyAkZ79fjOGbCkplChbpF8M
         IJgmHhfYlB6IUxq/mNAcIabG7bOlTxfwD6bjMNWe3zlHyUCvWgKfthpW1+TrLpPnBpCp
         hDIAutKtxDqKpNvOuxHYuxP7TfvQBv/yhEdZgcBQUdXQwEnEDDWNkvtP5KK2CD05ts8q
         VfHg==
X-Gm-Message-State: AOJu0YxaFkToEtZeN6/9m6AWL+y0DP+oVmB4GB9Go1FYwxaR5DNbMWrW
	i9w31+c+DgB/+7IuHiNAvOElYccl4wckX8PeNbFu+kD1YGkVMI+E2hYdlakuRd3lMggwfl7m8in
	kO18mqZSKHyRovm9EqnwesULjhEoPvFV2s15uy9CDTg==
X-Received: by 2002:a5d:5264:0:b0:333:3ffe:dbcf with SMTP id l4-20020a5d5264000000b003333ffedbcfmr8271448wrc.101.1702907463830;
        Mon, 18 Dec 2023 05:51:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvK+q9XXTFnPXRG5D0HATNAXTAU6la5Zg96mrrCixp/qG5h0/AU7/8xCh3q+uKTHizwv9GRQ==
X-Received: by 2002:a50:cc0b:0:b0:543:5c2f:e0e6 with SMTP id m11-20020a50cc0b000000b005435c2fe0e6mr9473741edi.17.1702906169995;
        Mon, 18 Dec 2023 05:29:29 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id q24-20020a056402041800b00553165eb4f7sm1949159edv.17.2023.12.18.05.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 05:29:29 -0800 (PST)
Message-ID: <9950a6ac-3cc8-41bb-b93c-bb2e8af1f1a0@redhat.com>
Date: Mon, 18 Dec 2023 14:29:28 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] platform/x86: Create static func to handle platdev
Content-Language: en-US
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20231212103644.768460-1-suma.hegde@amd.com>
 <20231212103644.768460-4-suma.hegde@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231212103644.768460-4-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/12/23 11:36, Suma Hegde wrote:
> Create a static function and call platform device alloc and add device,
> which will simplify handling acpi and plat device probing.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Co-developed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp.c | 33 ++++++++++++++++++---------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 62a274c84f25..f0db7a480ace 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -552,6 +552,21 @@ static struct platform_driver amd_hsmp_driver = {
>  
>  static struct platform_device *amd_hsmp_platdev;
>  
> +static int hsmp_plat_dev_register(void)
> +{
> +	int ret;
> +
> +	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, -1);

Please use  PLATFORM_DEVID_NONE instead of -1, like the code
you are replacing did.

With that fixed this is:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> +	if (!amd_hsmp_platdev)
> +		return -ENOMEM;
> +
> +	ret = platform_device_add(amd_hsmp_platdev);
> +	if (ret)
> +		platform_device_put(amd_hsmp_platdev);
> +
> +	return ret;
> +}
> +
>  static int __init hsmp_plt_init(void)
>  {
>  	int ret = -ENODEV;
> @@ -574,22 +589,10 @@ static int __init hsmp_plt_init(void)
>  	if (ret)
>  		return ret;
>  
> -	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
> -	if (!amd_hsmp_platdev) {
> -		ret = -ENOMEM;
> -		goto drv_unregister;
> -	}
> -
> -	ret = platform_device_add(amd_hsmp_platdev);
> -	if (ret) {
> -		platform_device_put(amd_hsmp_platdev);
> -		goto drv_unregister;
> -	}
> -
> -	return 0;
> +	ret = hsmp_plat_dev_register();
> +	if (ret)
> +		platform_driver_unregister(&amd_hsmp_driver);
>  
> -drv_unregister:
> -	platform_driver_unregister(&amd_hsmp_driver);
>  	return ret;
>  }
>  

