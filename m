Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874DF1E1310
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Sep 2024 16:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725469200; cv=none; b=hAehFhdyQcuXzCAdAp+Z2YrJb4BifcUlTFlnSuKmKdD/K2uq3zfidM/HUAzyQ+1/YAOMhhhlgX99rjAPYAAn2OAs4FCwz40AaoT++/Vq3eMuLs3d04Tx4ppuyrHOjSJM5bv0WfeLJTZ9YdWdFSuIFFYW/EZ9KpxF0qrhsnBNFr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725469200; c=relaxed/simple;
	bh=FdKFRjKxfqgZ4ZAePiUERmZ19meUV5QJp1p3+aRRUo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PSrH9bK322PbQKfe8nGmPXd0S7jHPQHW6zA2/sO+Khcj4RCM6DVGp2TwMd+go8AewlVLF9/1IzzNPDptsK2SU+I8sihaHK4ghtB/tYs8ipy/fmfHv8R+GKRhsQ5BW4jwtihY8v0hBAt6bDAnFIeo/6bAZY+j91j7Lax771SF6p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AW1Hv3Vu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AW1Hv3Vu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725469196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JS7JkB28x15FUN4FVJqrYpTRHNCrw4xEi/Lrret8yfM=;
	b=AW1Hv3VuqLS2Yo/M3d3wpTF41ueqYokknueFBHUkIzV3blG7pOF7IANrzlwvlWC9QZBJT3
	t/rkRrCUWSQaiFslbo58Y8cohNlhooFbvKvE/8h+RNO0ShG4BK82Cr3ASC05tDtcwjFWP8
	keULvcUazYFqfhm2gxSCbXzqR+FjjFQ=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-EdbafOloN_WNMcDjv9tQLg-1; Wed, 04 Sep 2024 12:59:52 -0400
X-MC-Unique: EdbafOloN_WNMcDjv9tQLg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5334af2a84fso7325450e87.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Sep 2024 09:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725469189; x=1726073989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JS7JkB28x15FUN4FVJqrYpTRHNCrw4xEi/Lrret8yfM=;
        b=jQrmqWYGgqmyqNxeKxX241i/vKY+asXS9ZShQrB6d9ZZh1WZXlQesBkXUqTYZ41Z+Q
         Ad6O78c0NR92TxzirFlXvnmsSQITq+mIk3nFbUiYpTWCEv8nwW9dpKG5FWDa2KvbhI5z
         7xXHmmTfm1FfTfCM3OPEn9QZcsPghIZpBTxRf5k5ThuyeRyiH8aIJ/r3EZeD7Ltbjncq
         VSqjd/JimfSi9AMvggfhbMcprUsqQSrafNpPIQxXBQn99R8WT4e6T+EI6SSI5j1HF7tW
         ozlGFveaXVQ1p/qgwr0hCHGfl4DapBJTPjBjf3edkno8jiZ2UsLjAhjO/51Y67Q6/+0q
         d9dA==
X-Gm-Message-State: AOJu0Ywj8Jcn3MHC3OfTa9AvtRtQWORRVugKIetlOTYctwHNxirbJZ7O
	107ZHS9S3JEGetFWK5Ft28ahrROZfuJv1r0bHEixFKvNRtcfDf6Kkss3tBKj3If6n4Efk6YHyNR
	Bbjo49PwQzkM/RqeXkLQOGqg1duhwTpd4reacRz6VG4KvoReEzTA1PWdm+vnTFlseWOLb13Zwaz
	fLTDM=
X-Received: by 2002:a05:6512:68c:b0:52c:d76f:7f61 with SMTP id 2adb3069b0e04-53546bb4d04mr9440200e87.56.1725469189437;
        Wed, 04 Sep 2024 09:59:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9B/Kw2sYApLrjKyz7ByJ58hLtcGIgW+Hr3O4jbaYLUgaa3c5CshLF9IIRJpnoQqDHMdCh2Q==
X-Received: by 2002:a05:6512:68c:b0:52c:d76f:7f61 with SMTP id 2adb3069b0e04-53546bb4d04mr9440182e87.56.1725469188788;
        Wed, 04 Sep 2024 09:59:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc56f114sm124404a12.57.2024.09.04.09.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 09:59:48 -0700 (PDT)
Message-ID: <371e1476-1b7c-4993-b481-132b7552b572@redhat.com>
Date: Wed, 4 Sep 2024 18:59:47 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: lenovo-ymc: Ignore the 0x0 state
To: Gergo Koteles <soyer@irl.hu>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <08ab73bb74c4ad448409f2ce707b1148874a05ce.1724340562.git.soyer@irl.hu>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <08ab73bb74c4ad448409f2ce707b1148874a05ce.1724340562.git.soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/22/24 5:38 PM, Gergo Koteles wrote:
> While booting, Lenovo 14ARB7 reports 'lenovo-ymc: Unknown key 0 pressed'
> warning. Because lenovo_ymc_probe() calls lenovo_ymc_notify() and that
> time the YMC part is not triggered yet (which is mandatory for this
> model). At the end of lenovo_ymc_notify() YMC is triggered by the
> ideapad-laptop driver and then lenovo_ymc_notify() will be called by WMI
> to report the actual value.
> 
> Add 0x0 YMC state to the sparse keymap to ignore.
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>

Thank you for your patch, I've improved the commit message to address
Ilpo's review comments and applied this patch to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=review-hans&id=a8a2253e84dc62b0d50943408c480188a0086263

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/platform/x86/lenovo-ymc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/lenovo-ymc.c b/drivers/platform/x86/lenovo-ymc.c
> index e0bbd6a14a89..bd9f95404c7c 100644
> --- a/drivers/platform/x86/lenovo-ymc.c
> +++ b/drivers/platform/x86/lenovo-ymc.c
> @@ -43,6 +43,8 @@ struct lenovo_ymc_private {
>  };
>  
>  static const struct key_entry lenovo_ymc_keymap[] = {
> +	/* Ignore the uninitialized state */
> +	{ KE_IGNORE, 0x00 },
>  	/* Laptop */
>  	{ KE_SW, 0x01, { .sw = { SW_TABLET_MODE, 0 } } },
>  	/* Tablet */

