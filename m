Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD984A19
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Feb 2024 10:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707906640; cv=none; b=LLavvG+uvIHB5T6mNPVeDffpkrADNLlV/dOt+z1oKDtLKzEflvCxkMSESHUTHQXft7Y20MSAFH+Kf2MbUPwvaQIldFVe8D22Is9r0lMmdCCxYf/qqyd9OiETjVLcEOWvw/ISlOLrs5k10O60nNFjE70Dbny2FGkr+2ss/A26bgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707906640; c=relaxed/simple;
	bh=9wmZo5oBZ3qhwE7wsyefd76xLjTNXlYW93S98tjkyW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YpiKR6s2jkIFgzsiOuFYcf/FEbq34okPepMBgZaPyj4rRYsSiSPeXreW8bjw4ACpJ9cw0GasmvNVr/RYbo5p+yqN2RY+AeXAy4IO8Zx0yiVPYQ8dbkXbhgRaTVVyI7AM3CjZRTf8Kd5cPje70z0Dqg7yUDEW4dqxTvMLTaXgNrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=abTcdDGs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="abTcdDGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707906637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXFyQU26WOQv4yZ5skZN3BzM4YQQydN96mr8jtbNYa0=;
	b=abTcdDGsurPDUK/oBi57HEBfNbXks6l5ynk/thKcp/J/+p2tAy4kl4WavH2jcZzv9NAJJU
	/6MBVGZsFnO/l5DNe3n02jHgEPbrQ7vyagycPGY/6FasUrV22pCnzL2HMfCUeQBRx3JQi6
	801dPwpz72HRjNuJAOA2NhQYZsx24KE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-4U2zkuMQOi24zk_jKilAEw-1; Wed, 14 Feb 2024 05:30:36 -0500
X-MC-Unique: 4U2zkuMQOi24zk_jKilAEw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-558b84a7eeeso3788436a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Feb 2024 02:30:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707906635; x=1708511435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PXFyQU26WOQv4yZ5skZN3BzM4YQQydN96mr8jtbNYa0=;
        b=mACcWQTafpMDOavQ9XCiG2ze7M9Ykj6B+uuc/NK0zGtJWypSqhuL1/i6bSXQSBaFTc
         GokR+bPE6LLblR02cNVIXbKbYUPZ6FSfFZ/ChUoZTbzqqqxop0Kdl0mhI+6qtvCRmeR7
         xpKGXCxwF3reALttX3XjYtUUH9aeHpxAEI48oE8MFCu/jB/aTBgUcderjWaiv5VxKzEh
         31CSMb2hdZ74Z34YdTlDlqi5Pb9H5T4Gg6uedIrvwdWfCfdmSEDO4d9k1F7m70mtwZcp
         GxaNQiCYoPHvkCOPFmnE9JJEpBLjGKttrfNIxS4q22tJDJkuLl6yP4fLSgwyae8XoHtd
         XtxQ==
X-Gm-Message-State: AOJu0Yzlf+S0s7iZs7ghA21V+arHPt/KDx8P6e0z575iWd5vh0gFC+hy
	iqY2Df9z72H/563KOtjesK1z6mpkRLHbXL7GxkgkyvV5WpGmtymhLrn2fizrZ1nEs96DbXaBm8b
	VgKCX06qBKDThJUb5dlNT5E1w2ISH+lUe8XVBcENgo4s4VOpzPiUiWsRo8gpLMr1mwUPaFWI=
X-Received: by 2002:aa7:d4cd:0:b0:561:e4aa:ef2c with SMTP id t13-20020aa7d4cd000000b00561e4aaef2cmr1811744edr.32.1707906635104;
        Wed, 14 Feb 2024 02:30:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGUvGr+1zNhEF3i6+pvkwOSwpJEopVKQ+HoZsXxH070+EE/R7M3kFwz6IPJO6S7jbdjE207g==
X-Received: by 2002:aa7:d4cd:0:b0:561:e4aa:ef2c with SMTP id t13-20020aa7d4cd000000b00561e4aaef2cmr1811727edr.32.1707906634701;
        Wed, 14 Feb 2024 02:30:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEj3GKhfgvdVw5w5Vo8vJ5n5AjJoCEeWsW/7fuBgDx9loUv16owbPhcbPBvlwgWjNo5ee/ur75HgB88LuOZzvvxz1znBgE2LYj+LcL/CafR+JLCSZLRYFW5abwt4t/MGoIhzD1dST3PD9RtHOkpkBzQshZ8FYsiGS9b4MLtA==
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id dj14-20020a05640231ae00b005623a3e1e49sm593100edb.95.2024.02.14.02.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 02:30:34 -0800 (PST)
Message-ID: <dfc7aeec-e858-4eab-b84a-f6d9513b2e97@redhat.com>
Date: Wed, 14 Feb 2024 11:30:33 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86/amd/pmf: remove smart_pc_status enum
Content-Language: en-US, nl
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 mario.limonciello@amd.com
References: <20240213073651.404220-1-Shyam-sundar.S-k@amd.com>
 <a51c26ae-ceaa-4492-a3f0-e15b83dacd3d@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a51c26ae-ceaa-4492-a3f0-e15b83dacd3d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/14/24 10:28, Shyam Sundar S K wrote:
> Hi Hans,
> 
> On 2/13/2024 13:06, Shyam Sundar S K wrote:
>> Improve code readability by removing smart_pc_status enum, as the same
>> can be done with a simple true/false check; Update the code checks
>> accordingly.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> v1->v2:
>> - remove enum smart_pc_status and adjust the code handling
> 
> Please drop this patch for your review list. I tested this on a wrong
> environment and seems like some more code handling is required before
> we remove the enum.

Ah yes, I see I missed that this also chnages the return value of
amd_pmf_init_smart_pc(). I assume that is what you are referring to ?

Regards,

Hans


>>  drivers/platform/x86/amd/pmf/pmf.h    | 5 -----
>>  drivers/platform/x86/amd/pmf/tee-if.c | 4 ++--
>>  3 files changed, 3 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index feaa09f5b35a..ff0d61a56484 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -351,7 +351,7 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>>  		amd_pmf_deinit_sps(dev);
>>  	}
>>  
>> -	if (!dev->smart_pc_enabled) {
>> +	if (dev->smart_pc_enabled) {
>>  		amd_pmf_deinit_smart_pc(dev);
>>  	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>>  		amd_pmf_deinit_auto_mode(dev);
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 16999c5b334f..66cae1cca73c 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -441,11 +441,6 @@ struct apmf_dyn_slider_output {
>>  	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
>>  } __packed;
>>  
>> -enum smart_pc_status {
>> -	PMF_SMART_PC_ENABLED,
>> -	PMF_SMART_PC_DISABLED,
>> -};
>> -
>>  /* Smart PC - TA internals */
>>  enum system_state {
>>  	SYSTEM_STATE_S0i3,
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index f8c0177afb0d..8b7e3f87702e 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -260,7 +260,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>>  	res = amd_pmf_invoke_cmd_init(dev);
>>  	if (res == TA_PMF_TYPE_SUCCESS) {
>>  		/* Now its safe to announce that smart pc is enabled */
>> -		dev->smart_pc_enabled = PMF_SMART_PC_ENABLED;
>> +		dev->smart_pc_enabled = true;
>>  		/*
>>  		 * Start collecting the data from TA FW after a small delay
>>  		 * or else, we might end up getting stale values.
>> @@ -268,7 +268,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>>  		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
>>  	} else {
>>  		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
>> -		dev->smart_pc_enabled = PMF_SMART_PC_DISABLED;
>> +		dev->smart_pc_enabled = false;
>>  		return res;
>>  	}
>>  
> 

