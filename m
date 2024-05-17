Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5325576D
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 May 2024 13:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715954205; cv=none; b=l21w9E4bkOQ8fwkztAfYWCQ19AuvCPT7mxVyrxe+JMHgme02hShos5+xVZ6LG4Nryu25hPCfRgnTpgX/oGtTP7orUoavf5UJ9BRmdkMdu1AeJ0Eqs6226JEQLqCdsp0Tg4CxRXul89YYDa9FttQRWcsdogQ7CKLNfVpv1vapdkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715954205; c=relaxed/simple;
	bh=85xZDnDHg0ctOUONvLSzzw2Gjs8WKUZf9n6mO7yIEvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bxyviDZFoCM8fsdwe/itTJmd0Frsf6QjNSoo6LUOWE1FwukgxvcJ8o/+/o1SBqb11DEn1rrgl4Ff2RyVLVzJQhF3XJ2hXIuEB7UXiPYiPOs4DOmQPXil+9Q6d1g3NbBspRrctMln8ETdaJ3CGgR0Cz9Om5U7Qg59FwP8XpGeiPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=goKXTK7b; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="goKXTK7b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715954202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P7da4zZe/RF0iDJq87qxBFBAAOnLcIktWW2v8Eq4LzE=;
	b=goKXTK7brnKij1BdejNx2n9Y94/5DngK9uPIVR+kMy/iLHgSmJBua5ZdeUxTJ3aJyllCTN
	pw1c7gQEEOodxrpP82l67rgEvMUKznxzYich3dSo+enhQ1dChDrMDlh1WXveYRAWtPWHmw
	PAm+MuvEe7WLlig9SIgTcLnLCQ3A46c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-t8RTPKf9MbSieEu6LNdn7w-1; Fri, 17 May 2024 09:56:41 -0400
X-MC-Unique: t8RTPKf9MbSieEu6LNdn7w-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-57504f874e3so1360671a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 May 2024 06:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715954200; x=1716559000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7da4zZe/RF0iDJq87qxBFBAAOnLcIktWW2v8Eq4LzE=;
        b=pMRcIWeMZBjIoHeUeUbLPLNi2k0c2uHyQd0crMRXyHJBr/tDAjprytvPj6W318We2a
         HX4DlU9lb37EQRAZLjGw83hS0E3p77QnzorIEUuth2kBQ96Yd+k6VldYl6OnOUSABQFf
         wt3LLaFX9bNbQ4+xuy/Fq88SzhbCbAvFtbbCaJWuTFbR4nW7rrJyHOvCCZTAEAVJ6Kks
         nPw3vZZr/YQ0FyCZcCC1g7C6FV7BYTtzG+AXCZ+nX3UPSzpuyOQdxfNuaqRunN9w11TF
         IVSDvvln8D0NNduPXJlbXiJUzlm8r2VXCQJkJdFSxZpYRgkGve4vh59ATj1m9ZaJTvY+
         NFJw==
X-Forwarded-Encrypted: i=1; AJvYcCW8guwA28r/1qCH4rSbrAQDXOb5V5tKjk7LquEuJSsVePh+BYB2SUprKD9BuIPBPc8hiAfvY6+7/gNcDvn9USeN61aajonPktC6329yrtp9x2XtCA==
X-Gm-Message-State: AOJu0YwRiAEZm5R3sku4hSj69sGikY9IYVwWSl4NnIoXCwFNpir68VoR
	y0J7rOjfbRmWGlBGO0PRVxfm5FicsrjWHkbHprWSVpLxrH2vBbCwLXvAQe0ZrvsJIt20AJcLJDu
	2AJfG2Y7cYRgNAVEba8ltwPTfwDzX5JIs3Oh+4Tv1dWJKLh9uDbxl6xfS3GdVtzrXqOup8nU=
X-Received: by 2002:a50:99da:0:b0:572:a731:dd16 with SMTP id 4fb4d7f45d1cf-5734d67f01amr17872665a12.28.1715954200281;
        Fri, 17 May 2024 06:56:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDnhd61w8IViEbd5Wb5xJ7rYxtWXpCIrhQZrwnP2FPvfYqXbBDQtp/u50nwrTnTZ5fqaAwng==
X-Received: by 2002:a50:99da:0:b0:572:a731:dd16 with SMTP id 4fb4d7f45d1cf-5734d67f01amr17872642a12.28.1715954199928;
        Fri, 17 May 2024 06:56:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5752136c97bsm316897a12.77.2024.05.17.06.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 06:56:39 -0700 (PDT)
Message-ID: <b5a5db11-43f4-4543-bedd-c46daf840e9a@redhat.com>
Date: Fri, 17 May 2024 15:56:38 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: ISST: fix use-after-free in
 tpmi_sst_dev_remove()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Zhang Rui <rui.zhang@intel.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com
References: <20240514092656.3462832-1-harshit.m.mogalapalli@oracle.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240514092656.3462832-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/14/24 11:26 AM, Harshit Mogalapalli wrote:
> In tpmi_sst_dev_remove(), tpmi_sst is dereferenced after being freed. Fix this by reordering the kfree() post the dereference.
> 
> Fixes: 9d1d36268f3d ("platform/x86: ISST: Support partitioned systems")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

This looks obviously correct to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Still would be nice if one of the Intel maintainers for this
can ack it.

Either way I'll merge this for the first pdx86 fixes pull-request
for 6.10 (when I get around to merging the first round of fixes).

Regards,

Hans




> ---
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

