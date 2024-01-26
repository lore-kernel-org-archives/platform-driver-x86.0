Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778B21DFF9
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jan 2024 19:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706296555; cv=none; b=Bd46F5qNbx25Kxq7J6XqQQfCznn28QJo/rOez9nIIIU5xgbosTYPnND7MVyYhDBfWRL/haYmblrr8TQbYmX0e+3YMAaL4gHfqvqZTnS/n3SZrtBKXyBTZJFLf3gjs2nb6JY4a5lRLOqgVX2OnMUCxQAmxP11jqw3GkixPb/DSGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706296555; c=relaxed/simple;
	bh=CPz6IphhHcCv1pvz7ku8eRTbqDnlf92LhPvbtfZZLds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sddt1ckrkQd/sqcUSVj1SnKD3op8Ybe5Mo6/K8F9Pb3cfUt5j4jDLCVSfJ3qSuhYqtQeOD6pXr5LiFDPDFI8O8ca+l0vx/QAu5WFyZABApV+Hsk9wgPPR1feQ9o4Kb4xUfIHLIfVFbjZUXD439EicA34gY/yIpNqBsy6Q+QApjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bmT3fEHX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bmT3fEHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706296552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2PCC1hEtHrtY1vayDgnlvhtp45fpLTLJLLB8DBarJHg=;
	b=bmT3fEHXUxFmQaHq9ALTK4fg1kLHKNjoo8qrw5Y9kfPVIx25VBKYI8vXOJH/0RdsNZM4iv
	Xw0f8F+zvMdUp8Yjbo5I2ZWM9/oaas3VpyoEF88NtZRLUzucLFTgZ8AFbMvJfFDa1Nul6g
	4h1Se3RjjW6h3ycO65Nypr9Fs7mlfQc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-4NV6H_57N26mPw0LbK1bsg-1; Fri, 26 Jan 2024 14:15:48 -0500
X-MC-Unique: 4NV6H_57N26mPw0LbK1bsg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-33932e8b3e6so400313f8f.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jan 2024 11:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706296547; x=1706901347;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PCC1hEtHrtY1vayDgnlvhtp45fpLTLJLLB8DBarJHg=;
        b=spo9egVhebNx04uM+5t7t4E/k+ZPivXX70LPFcGy0EaFXSE6+sVWbjZ/rNbRBfnKM7
         tvdOAH4OUf9IQlsR/o8bu2yhgN12lruC2rQIFJsCS9YqpBZ72Jr2ToA0ziLMPK24P3Mp
         FC59h/HcK9YEN/90u0ML0/AOL04VMFrw2sdvWBOaaR//X6cLRTzOgI098g9DQkR5RDSO
         ZC0KLEmbJ+x6QoivJQNRjCmAjPsfTFFEayDa1pIKI/1hjYLKNqq8v/s3ohGen1R27i82
         QAtlmxoKN+5FZzwfQgwk/xXylknDgR25a+TM/smzsc4mq5PRAX0zY2VnQA1HoandeWT/
         ZZ0A==
X-Gm-Message-State: AOJu0Yz91EtR7Ass7f7QaL7eAnkpOTvksriJj+zptlJx3rMT946e7EPo
	D7TPGmTqLsjJi7ftASoskdvNB9j65RNOT+FAsRv2ybD3P5YBT9HDf6dxpDem9vxO4w7q86oWF/v
	x8qEZCZGcNJabVmjgDe3WRkyTMPMjhIEae6WZVbbAvBP7ru2oOIAoJdEHEAV9wExV593YHNI=
X-Received: by 2002:a05:6000:d81:b0:336:b937:3d0e with SMTP id dv1-20020a0560000d8100b00336b9373d0emr113232wrb.14.1706296547569;
        Fri, 26 Jan 2024 11:15:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtf0pQMMiFvVdyAYQa5EQODP2uJgiUqjQsvHdNI8WvL3y7uNYPUhmayX4/5JI/UfbWKh5PrQ==
X-Received: by 2002:a05:6000:d81:b0:336:b937:3d0e with SMTP id dv1-20020a0560000d8100b00336b9373d0emr113217wrb.14.1706296547263;
        Fri, 26 Jan 2024 11:15:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g17-20020a1709067c5100b00a34a45c8a37sm930564ejp.145.2024.01.26.11.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 11:15:46 -0800 (PST)
Message-ID: <4e360838-36a9-41c0-a1d5-f369ed78cf04@redhat.com>
Date: Fri, 26 Jan 2024 20:15:46 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] platform/x86/intel/ifs: Call release_firmware() when
 handling errors.
Content-Language: en-US, nl
To: Ashok Raj <ashok.raj@intel.com>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, markgross@kernel.org
Cc: Jithu Joseph <jithu.joseph@intel.com>, rostedt@goodmis.org,
 tony.luck@intel.com, LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org, patches@lists.linux.dev,
 pengfei.xu@intel.com
References: <20240125082254.424859-1-ashok.raj@intel.com>
 <20240125082254.424859-2-ashok.raj@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240125082254.424859-2-ashok.raj@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/25/24 09:22, Ashok Raj wrote:
> From: Jithu Joseph <jithu.joseph@intel.com>
> 
> Missing release_firmware() due to error handling blocked any future image
> loading.
> 
> Fix the return code and release_fiwmare() to release the bad image.
> 
> Fixes: 25a76dbb36dd ("platform/x86/intel/ifs: Validate image size")
> Reported-by: Pengfei Xu <pengfei.xu@intel.com>
> Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>
> Signed-off-by: Ashok Raj <ashok.raj@intel.com>
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>

Thank you for your patch/series, I've applied this patch
(series) to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in the pdx86 review-hans branch once I've
pushed my local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> ---
>  drivers/platform/x86/intel/ifs/load.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/ifs/load.c b/drivers/platform/x86/intel/ifs/load.c
> index a1ee1a74fc3c..2cf3b4a8813f 100644
> --- a/drivers/platform/x86/intel/ifs/load.c
> +++ b/drivers/platform/x86/intel/ifs/load.c
> @@ -399,7 +399,8 @@ int ifs_load_firmware(struct device *dev)
>  	if (fw->size != expected_size) {
>  		dev_err(dev, "File size mismatch (expected %u, actual %zu). Corrupted IFS image.\n",
>  			expected_size, fw->size);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto release;
>  	}
>  
>  	ret = image_sanity_check(dev, (struct microcode_header_intel *)fw->data);

