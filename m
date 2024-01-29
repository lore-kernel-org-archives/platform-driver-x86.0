Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3C754BEE
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jan 2024 08:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706517587; cv=none; b=ILKfjTapKCxFgbgN+o99Y3qiYPEZItrhGmqPtta1ixmYplsTbMibIq2dFObQ2KZPGYsAdNkdJeeLxbX3yD7r4ryvv0F2w6NOxtp1BBJgKotnsZjvpVgnBLSuvDR/yXMm33dS5lq332i2odD1Z2r9clHZZd6yCApMgUd9LrFnLW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706517587; c=relaxed/simple;
	bh=4yZ89r1Hsazz2TJ5Dgl6xuBfA2vUUCpLWcqAGNhN1M0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XbZR2LOUPBDYgs75SwiAXX7BFvbNIeA5sd31OhGasHldmCGdBvMc3WV9kFAOTF4AuEKjcT2h6CarBGb5YV0NThAnTS6zAMbYj2yCxIpA+WH8Qgl2FtD3OhSzRZQ81izlthgscKoYXe4BI2WR+XXhIqMboklHYM3m0sr8daELISY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iTpg+3k4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iTpg+3k4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706517585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SO879PgboMkQ1Vjya3+F+gDiRM6F/d/6qw5VF+2GLTI=;
	b=iTpg+3k4udr9lICVBEyK6nFCORA5DO1nQ8i5XSJ5lZUZKVqTzy2FakA1nBme2lYeo7AHiJ
	bNkvgSpNcxd5i6OFS8jzF70rc6AekM/B5cIVbUXQF/R9XT9JX2kyg3PiUfZtApUMcibjgG
	d/sFrdEGVCZoW3G7myYbFp4ckvq6SkI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-L7nwDxEjM6KmR7XxPgHO2Q-1; Mon, 29 Jan 2024 03:39:41 -0500
X-MC-Unique: L7nwDxEjM6KmR7XxPgHO2Q-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a35bcf841a0so28964966b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jan 2024 00:39:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706517580; x=1707122380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SO879PgboMkQ1Vjya3+F+gDiRM6F/d/6qw5VF+2GLTI=;
        b=ef0Lpvhp2Hcg4w7v3RJp3pOndcc81n+m4wiEX96E4Tb0fdTdIWRPFkTC07NoOBC8EY
         JzwwS3NdnQdwLe6zZUtrWuk1IaZnE7EnDaRgS8VY+y75YKPrvPtTkcyhoC1BiAVta6ba
         PvoJosNsn5ynpx9ayGvpkRYCLasEJ/CBb9AioLQ+uU7AYzafKjoxG00cegRUgECJVAe5
         Ubpp87S/h6ts9WZ8pUiafEGIYrY1rBxOqe0Cb1JGHZi/qc1f3l7YSXL7zIVQKKNdhWbh
         SnLDz8eKam0JKn/f3eCt4rgX5Es9XTc40XWCUwspeO82pbALaKZo2LHhgANZuF/fRIy/
         etEg==
X-Gm-Message-State: AOJu0YwMs7ejiz1S5AIXAQ1uadlogP9As1BtugmQv2JVW4gdZ8ifASB2
	st5eV/2wE2G/BmGCTX6kEm46c2OR6y02GfkLr0OFK7/yG8I+eDxndX5udMfc5oPIPUON5hi5LSE
	J1IkLoc25ahTBNSILfOUY83fWjWDxpuIb9uHmDpVAHFrVs3pRRXFzclwCYUzWidG67BlYtjE=
X-Received: by 2002:a17:906:398c:b0:a31:805b:4172 with SMTP id h12-20020a170906398c00b00a31805b4172mr3644573eje.9.1706517580470;
        Mon, 29 Jan 2024 00:39:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGr/OOLnIBJUikDcSEfxL6gQVOu//FnOkvwdqEx58htCO3kPCq7MVbE3yW/Y7UO2B5jcyOQAw==
X-Received: by 2002:a17:906:398c:b0:a31:805b:4172 with SMTP id h12-20020a170906398c00b00a31805b4172mr3644554eje.9.1706517580175;
        Mon, 29 Jan 2024 00:39:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l26-20020a170906415a00b00a3590fb191csm1447881ejk.150.2024.01.29.00.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 00:39:38 -0800 (PST)
Message-ID: <846463ed-e43e-406d-ac5a-c2fbe79b348a@redhat.com>
Date: Mon, 29 Jan 2024 09:39:37 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] platform/x86/intel/ifs: Call release_firmware() when
 handling errors.
To: Pengfei Xu <pengfei.xu@intel.com>
Cc: Ashok Raj <ashok.raj@intel.com>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, markgross@kernel.org,
 Jithu Joseph <jithu.joseph@intel.com>, rostedt@goodmis.org,
 tony.luck@intel.com, LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org, patches@lists.linux.dev,
 stable@vger.kernel.org, gregkh@linuxfoundation.org, heng.su@intel.com
References: <20240125082254.424859-1-ashok.raj@intel.com>
 <20240125082254.424859-2-ashok.raj@intel.com>
 <4e360838-36a9-41c0-a1d5-f369ed78cf04@redhat.com>
 <ZbchziXFXPvIWP4s@xpf.sh.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZbchziXFXPvIWP4s@xpf.sh.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/29/24 04:55, Pengfei Xu wrote:
> On 2024-01-26 at 20:15:46 +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 1/25/24 09:22, Ashok Raj wrote:
>>> From: Jithu Joseph <jithu.joseph@intel.com>
>>>
>>> Missing release_firmware() due to error handling blocked any future image
>>> loading.
>>>
>>> Fix the return code and release_fiwmare() to release the bad image.
>>>
>>> Fixes: 25a76dbb36dd ("platform/x86/intel/ifs: Validate image size")
>>> Reported-by: Pengfei Xu <pengfei.xu@intel.com>
>>> Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>
>>> Signed-off-by: Ashok Raj <ashok.raj@intel.com>
>>> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
>>> Reviewed-by: Tony Luck <tony.luck@intel.com>
>>
>> Thank you for your patch/series, I've applied this patch
>> (series) to my review-hans branch:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>
>> Note it will show up in the pdx86 review-hans branch once I've
>> pushed my local branch there, which might take a while.
>>
>> I will include this patch in my next fixes pull-req to Linus
>> for the current kernel development cycle.
>>
> 
> FYR.
> 
> [ CC stable@vger.kernel.org ]
> Missed CC: Stable Tag.
> 
> This (follow-up) patch is now upstream into v6.7-rc1:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=25a76dbb36dd
> 
> Looks like linux-6.7.y needs the above fixed patch too.

If you want to see this patch in the stable series please
submit it, with a reference to the upstream commit, to
stable@vger.kernel.org yourself.

Regards,

Hans



>>> ---
>>>  drivers/platform/x86/intel/ifs/load.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/intel/ifs/load.c b/drivers/platform/x86/intel/ifs/load.c
>>> index a1ee1a74fc3c..2cf3b4a8813f 100644
>>> --- a/drivers/platform/x86/intel/ifs/load.c
>>> +++ b/drivers/platform/x86/intel/ifs/load.c
>>> @@ -399,7 +399,8 @@ int ifs_load_firmware(struct device *dev)
>>>  	if (fw->size != expected_size) {
>>>  		dev_err(dev, "File size mismatch (expected %u, actual %zu). Corrupted IFS image.\n",
>>>  			expected_size, fw->size);
>>> -		return -EINVAL;
>>> +		ret = -EINVAL;
>>> +		goto release;
>>>  	}
>>>  
>>>  	ret = image_sanity_check(dev, (struct microcode_header_intel *)fw->data);
>>
> 

