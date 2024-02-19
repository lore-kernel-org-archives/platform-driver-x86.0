Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8885E2D610
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 12:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708346943; cv=none; b=gogoLBhPXIjICgGm1xaAsowPnQ8DMz0gQLdxgGny4jrfL+JgsLEZO8RuXNQo7trHj8ryOB/iCpqnK17cN3dXeKA9nvgzO4oIj7HxavHSgoQ7U6+bJeBuVaRAp6HvLMZoJccl1rhUPJm64tGinA09J6454ayBFPQmg+RQUqG03As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708346943; c=relaxed/simple;
	bh=GGDirSYTTvOddcQLTlfmsHXI7gj8foGcyiO1hSj/A2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4DJXWn2fZifgv0O0rBWKsFLMri5+HwcGk7P0n1YQJASHkkS/zai5sx8Ew1+mNLVkFNq4w7KqXWC7tQJye1oGWwZIGPUF61zX4/3a8uwI3l3rrsr3KLgE5QZAkhONeKSdUAn+7dU7x54o4TsLhK/7vE7COxBiDTAJHrszTL8A6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HjQe/OeP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HjQe/OeP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708346940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2HO9D1tZA+2bQNY3mPYeOq80/FGHcl8CEUxhPw4igjw=;
	b=HjQe/OePJoPgN4P0mV6caYmclLRVsSx1g5BgSLWvUPQRGFtfY07npi0doDqh7Cg3taA+Rh
	vMwNWEE7m01MjAMJw+z/XZl3DX6tJcRHCCXhqcQE11wZLGX+iTRMi/GM1VJp0+9XHjjeiJ
	kGgxFodbucAGa7oJ4amorzdgPLakMrk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-0tNlKTrTMsCALSFE-6As1w-1; Mon, 19 Feb 2024 07:48:58 -0500
X-MC-Unique: 0tNlKTrTMsCALSFE-6As1w-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-68f5fc425ffso13758466d6.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 04:48:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708346938; x=1708951738;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2HO9D1tZA+2bQNY3mPYeOq80/FGHcl8CEUxhPw4igjw=;
        b=FMCU98M+zFXBFTbWz+4OubfX1sQ8hWDQODrkvKd4EOZPDH+6hIvxrvuZ0Boe6+Suky
         Dt8xwPtfnYBVUitAtmFppFfqkuEMhOREb00mvBWMeyd8GpP/tqRKIkkdvzP3HwHi3pU1
         JxjuRWm+596T+Bb6wClg0DRJFKi4pkGqGbTarUMIy6gNVvUFX8dWyHIlHwY2l1mLaQ45
         hfLCQ97ufQgA9Zg0xHtTcJLyBjc2m/4gxAdYFQ6yKrq7Zdd9+ZuT3+eusI1TLJ1aWyvo
         ygMBJE7Ww73DhpqrQ2z9LZDXcFZEdfMIcDjWQkbTpDwwgHj3+elxyVh+iVo7NYcxzQZf
         Em4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRy0rCmM2h+hHH0/E5OmJdYIwyRtGMZdztpDFR0ePEPLG2lGT0NY6YIPNUZhNWv/z3ZLBQwQ7iNC2XVdmnUVH1BZHVa+lj34GRZO0RRS9jnQcdXA==
X-Gm-Message-State: AOJu0Yw8G8OVRhjScWlpxljX2qIL92gwe3PZJ6FLwLS7BC/9NCJ4cAzD
	8e71uUFdCqeVcUx+/ebGiCk3j6T6+jmDEJKmwm87DeJIoneuTyWitGem2P0wxXDSXttmot8P0hI
	/Dngd7ToZOUQYo9SgWnZ/W7zwwDywGFh2waBt+tHxMOqc4QaS56IGYubZGKOO8/UMCLOujkc=
X-Received: by 2002:a0c:e1d1:0:b0:68f:6279:eb2c with SMTP id v17-20020a0ce1d1000000b0068f6279eb2cmr4376087qvl.63.1708346938508;
        Mon, 19 Feb 2024 04:48:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLXHmzQSvVTysExPFTX+wfn7k/R98wUjuT6EV9Smz1WJ6iodnJKhiJEqNvUqDT3j5/FMypQw==
X-Received: by 2002:a0c:e1d1:0:b0:68f:6279:eb2c with SMTP id v17-20020a0ce1d1000000b0068f6279eb2cmr4376079qvl.63.1708346938269;
        Mon, 19 Feb 2024 04:48:58 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id d11-20020a05621416cb00b0068d11cf887bsm3185712qvz.55.2024.02.19.04.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 04:48:58 -0800 (PST)
Message-ID: <4781fdcf-8a7b-48fa-aa4d-6e7bb7d56eda@redhat.com>
Date: Mon, 19 Feb 2024 13:48:55 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/hsmp: Remove NULL dereferencing code
Content-Language: en-US
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240130073415.3391685-1-suma.hegde@amd.com>
 <20240130073415.3391685-2-suma.hegde@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240130073415.3391685-2-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Suma,

On 1/30/24 08:34, Suma Hegde wrote:
> Do not log using dev_err() in case of !sock, which causes null pointer
> dereferencing.
> 
> Also remove unnecessary check "boot_cpu_data.x86_model >= 0x00", which is
> always true because its an unsigned type.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202401292056.qkUFS09Y-lkp@intel.com/
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202401291311.gzMCj6SP-lkp@intel.com/
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v1:
> Correct the email id for Naveen Krishna Chatradhi.
> 
>  drivers/platform/x86/amd/hsmp.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 1baddf403920..1927be901108 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -566,17 +566,15 @@ static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>  	struct hsmp_message msg = { 0 };
>  	int ret;
>  
> +	if (!sock)
> +		return -EINVAL;
> +
>  	/* Do not support lseek(), reads entire metric table */
>  	if (count < bin_attr->size) {
>  		dev_err(sock->dev, "Wrong buffer size\n");
>  		return -EINVAL;
>  	}
>  
> -	if (!sock) {
> -		dev_err(sock->dev, "Failed to read attribute private data\n");
> -		return -EINVAL;
> -	}
> -
>  	msg.msg_id	= HSMP_GET_METRIC_TABLE;
>  	msg.sock_ind	= sock->sock_ind;
> 

sock gets initialized like this:

        struct hsmp_socket *sock = bin_attr->private;

and bin_attr->private is setup before registering the file
and thus it will never be NULL.

So the correct fix would be to simply drop the check
rather then to move it.

> @@ -739,8 +737,7 @@ static int hsmp_cache_proto_ver(u16 sock_ind)
>  
>  static inline bool is_f1a_m0h(void)
>  {
> -	if (boot_cpu_data.x86 == 0x1A &&
> -	    (boot_cpu_data.x86_model >= 0x00 && boot_cpu_data.x86_model <= 0x0F))
> +	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
>  		return true;
>  
>  	return false;

This bit looks fine but this really belongs in a separate patch
as it has nothing to do with "Remove NULL dereferencing code"

Regards,

Hans

