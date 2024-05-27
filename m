Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AF613A24D
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 09:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716802190; cv=none; b=fOEtbtVvq9hZMX2lH6m+LJaY1upHtBcHC4OvRe4/V/zqjGWkK7I/g8P3pv90OtE093GR5k9gO4dD/I6pyHn51GLwDXQKilU3U6TbTi3km8eZDwNsA1rM+1sVAZwxbeGAXSu84h9vT5Zag04m3sUhWP6tcHEg10l3zlc1YE1uNO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716802190; c=relaxed/simple;
	bh=GVk5OV/h2v884ljEBZx1wxeGLOe6kBRIDF8Asd89Iyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SG9+mprkm2qEoW/iNZ1NVD3zp3ENOfnU54QrloTgPEdfhqVoXJDLo32zQdzQ+XdnKOgQJiPHwjmLrMjAeqF9JMOwaMKMBLAfFPYtXqxmQQbNyo9H5jU69hBbe2wsHuHkLtxp12YWcXKfVPHqcKOT3thkcShXvqj/uwSoWExn/P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qt+TIp/X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qt+TIp/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716802187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a2KHdQxlr+nCK+72i7BoiThRuJXfjIGAcKBIGrSIL78=;
	b=Qt+TIp/Xaivkay4KjM0URuYWq6SsiRecSq3TGBWjstDG2cWTkfC7VJt6Q6JlFh01hh1eK8
	oLv0cXBir9xW8y7bREWGx7qWbmFNMFCF+VxbGT6igKx22yOuQubiMhhfDbetBKDZsigY7W
	mnU7rftnBVLrAlBeQuiSnRFAyGnjAZo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-nyE134VwN5mD507MbfPaug-1; Mon, 27 May 2024 05:29:46 -0400
X-MC-Unique: nyE134VwN5mD507MbfPaug-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a5a84e7c884so286549166b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 02:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716802185; x=1717406985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a2KHdQxlr+nCK+72i7BoiThRuJXfjIGAcKBIGrSIL78=;
        b=wN92SviQ5l4jY5rD2foXRClevKV5Mb6+rg4if4JyqlDl8Qww0i/EMB1krNVswzUMs0
         XQT1NJYfhSqETmV2nM+TctMQWmz5fhHmvNV6TgqBGy6ZrSGrybMvmXxD5qmyFTKFJsg9
         teESNw9ggHmPPfRpcPwuP0WfFxWtGDxIRCnYGATYIjj0m81UzLQiqBEdCriIB35THweO
         ckWub1VJlhTBcnpDPqMy5AHj9mFQiQbXZL1God0Wuy78yaXDAUQYb8k1x0nAwJvjQwIe
         FU5nKnUdXkAmz8Qgky6NAo+8yXDGcE7Kd1OdzEqvhck1u47tJYK4n/VJl8ySacADSHme
         ylzA==
X-Forwarded-Encrypted: i=1; AJvYcCWrgSnvo2NPWgYJCEnyIz4W29lMLG8/FyllC+txPWL3AwcNbBDIsgxIGnQyT+7QcmgOIoC819F5rZ9aEmG+uJpW50jwo6Y+6OO19fw524+GOXZLuQ==
X-Gm-Message-State: AOJu0YyNptxMn8nNgf9Yf/2Fa8d3SGlPy/uv7BYrCmaygvUWi2G5YPh5
	/mkqh8Z/YIKufwuzmSNIgrKg/913quF6y2nWCJFOi3mrymjhw4YyLPt+yReZyDzxsTKaw5aIChk
	xByqZRoSRyJjUwN0d4QCCDfmy6n+RbO8KE3XPSEust/pZBVRPws6uFbXLrgqLYWN6KmcKZJA=
X-Received: by 2002:a17:906:b15:b0:a5a:15f6:157f with SMTP id a640c23a62f3a-a62641b42fcmr573358266b.14.1716802185024;
        Mon, 27 May 2024 02:29:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY7hYRzJQt/K0T3Xo6dt+GVQ6bfmi9PMBGZAhv1A5DH1gxbNqtbSUlQN9ac3tQ+gdHgt1I2Q==
X-Received: by 2002:a17:906:b15:b0:a5a:15f6:157f with SMTP id a640c23a62f3a-a62641b42fcmr573356966b.14.1716802184553;
        Mon, 27 May 2024 02:29:44 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c9376edsm466532366b.59.2024.05.27.02.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 02:29:44 -0700 (PDT)
Message-ID: <e6db0add-e290-4fac-b90c-da264939693d@redhat.com>
Date: Mon, 27 May 2024 11:29:43 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: ISST: fix use-after-free in
 tpmi_sst_dev_remove()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Zhang Rui <rui.zhang@intel.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com
References: <20240517144946.289615-1-harshit.m.mogalapalli@oracle.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240517144946.289615-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/17/24 4:49 PM, Harshit Mogalapalli wrote:
> In tpmi_sst_dev_remove(), tpmi_sst is dereferenced after being freed.
> Fix this by reordering the kfree() post the dereference.
> 
> Fixes: 9d1d36268f3d ("platform/x86: ISST: Support partitioned systems")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> ---
> v1->v2: Add R.B from Hans and fix commit message wrapping to 75 chars.
> This is found by smatch and only compile tested.
> ---
>  drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> index 7bac7841ff0a..7fa360073f6e 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> @@ -1610,8 +1610,8 @@ void tpmi_sst_dev_remove(struct auxiliary_device *auxdev)
>  	tpmi_sst->partition_mask_current &= ~BIT(plat_info->partition);
>  	/* Free the package instance when the all partitions are removed */
>  	if (!tpmi_sst->partition_mask_current) {
> -		kfree(tpmi_sst);
>  		isst_common.sst_inst[tpmi_sst->package_id] = NULL;
> +		kfree(tpmi_sst);
>  	}
>  	mutex_unlock(&isst_tpmi_dev_lock);
>  }

