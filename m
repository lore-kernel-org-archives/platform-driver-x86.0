Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C1E1114
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Dec 2024 01:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734226621; cv=none; b=cxNPl6TAjRHOjStojVMiQU8QvQ+Ab/V3/3KxCc7e7ptn4hHYdEEohNBW19SkUlpp8eiWv9nKdA0i/H1o7ztubLcbqKIi6uwf6sg0kEzfk2o083bTmuKccHW+zhYoK7MtnDWE9Wikapw8qU1rdUL7D+2gK99OdPthuN7+rCG+e5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734226621; c=relaxed/simple;
	bh=aDDiFrjZPZKOyWatWCZRpnJFj8Uwb1SWbxPXYT5IUEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cz0CSb4NjEhVWjBBa8eAFeuHLg3MpX196Y/lO9ApIPrgpjYVCo0hRJDgkuVlC/2GpWKleJEfCYswuh3uPqILO3lMilPBWwsOU99eDyYfvTlO4Qqh/y16lUrL//SlDKFa3SGhpjMtECt95F4Im+jYIyRIvpE/mnEdOdWP5djBoM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=b9H0uFsL; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="b9H0uFsL"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-728eccf836bso2547613b3a.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Dec 2024 17:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734226617; x=1734831417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qAuVc47OrAJnSCWspBEIOoGAjeu//CVN/qE98yvAz1A=;
        b=b9H0uFsLaLeZHG3zp62VDIzqEMBlfCkbCQqksyuqyUkZUKijWDQYLzg+d+IMy5s0Ja
         vdD+AXAT/AIOU61KikXROyWnAauOeZEIuPM6eM+N1O8aNmKsjeFza8gpR4aBGVyEuCxR
         87Pr6mMUoNoBaPycoeeXSPPZCKyCJJ8PzXBAxKVpvDlnDqM//SvvM8tLDjbs4qZMBEZO
         /ixv0CqQ030mJlg5KS83IzHpq1evOODlKYLpdxYrMoLp1Vi95AxlgdRQcoqdhZhrD/Zk
         tXJenZrCzNTi1fYKe8JJWR9f8TM7IxNanfJpz+UpYtJFGmJVqnhTLRQeBLggsEE09Unt
         Utdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734226617; x=1734831417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qAuVc47OrAJnSCWspBEIOoGAjeu//CVN/qE98yvAz1A=;
        b=VMB/6RVFUz8SV0HF/zo1ADlSBqYRA+5MKYugAglDQkFK4Ae/SklBryRNXNbDw06asy
         iyn8HMCKZkSaS+MsVsTtgoEtjytJRoNz3T8uOeO4Rhep/ic6RqG1KySGoK08aqB4EQtZ
         cXiJfCGf7AkXpwKR7q4Un/I3HNxs10X2TT+V0kaBVSkXk/AeOK6BS3ESnbaoWmexfSQz
         pUJI6VFC0lWbb0zqJVgV2MuOTXAp76sptv+EmV7/dmwrE9LR4W/792mBF88QYB6s8tgS
         Wh2t5R530ZV8Tgx4gN61CGUZLGdUB+J7TGRaZF0wcCTAO9BXCdCKSl2UyNEAOhKGt3Wz
         B5Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWK9f4fmACJ1nU3GqLP1AEkMi2mFs3IVJxtW+glDTNpzRWXX4Nh5R/un1vTnP6Bm8WCq+xWm4rHzbiVF0/RdMBTrWjz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Dp6QpbKkA9eteKR55F/grOpjDjyUhq/cvZTU+U5uNgmOtn3i
	q7teNqKSmHgXK5WPB3HB0sT9Ef1z5u5WB2rvMRIEs6wUPuUJ8TKNn7t0M2k/2Hc=
X-Gm-Gg: ASbGncuhuDArNlo++DgN4DsaNHrqz+rFZNFjecGig+JVGDCnNqgdoJQSGRzDEQVX4Fd
	TVTsrw+TcawR3415QM+KHZeUkw2h1tpe+E5rBm0WG38I7I2GH+cmNOGr36pxZ9DjoQ/fFb9oQm7
	nOp1ooroIcNhr4YOTCUH1arxGM9oI1yRRHevQ604CJZas9uKiSF2P77te3mTQuSD4bOhgTEc0FM
	z5XbTJzYm10jPxWctAkcfg+8Vm9Gw7zHkZ2YBibV4fBcSLQW/QEqOMW68s5Bq11hZ0CxvgbvNqg
	DHsfwoP+cdmXg+k/PzTepQ6/f7SI6w5FKHXq
X-Google-Smtp-Source: AGHT+IHZO5IJIBJvVoTg0Rcc7EdygCFPIAJEgg0G0OQIfKzVbYZmBPQoGTiIroAiaGv7dP9a7KsJ+Q==
X-Received: by 2002:a05:6a00:3e10:b0:725:b347:c3cc with SMTP id d2e1a72fcca58-7290c27384emr12635610b3a.23.1734226617297;
        Sat, 14 Dec 2024 17:36:57 -0800 (PST)
Received: from ?IPV6:2001:f70:39c0:3a00:39e1:57de:eaa2:a1ed? ([2001:f70:39c0:3a00:39e1:57de:eaa2:a1ed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918b78f72sm2051480b3a.116.2024.12.14.17.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 17:36:56 -0800 (PST)
Message-ID: <ddaab383-d196-45d5-9534-c417e78232af@pf.is.s.u-tokyo.ac.jp>
Date: Sun, 15 Dec 2024 10:36:53 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: adv_swbutton: use
 devm_add_action_or_reset() for cleanup
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andrea.Ho@advantech.com.tw, Hans de Goede <hdegoede@redhat.com>,
 platform-driver-x86@vger.kernel.org
References: <20241211085821.3982351-1-joe@pf.is.s.u-tokyo.ac.jp>
 <e0782001-7a4f-e341-4ef8-1072904c9571@linux.intel.com>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <e0782001-7a4f-e341-4ef8-1072904c9571@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ilpo,

Thank you for your review.
I am currently submitting a patch to introduce the devm_ version of 
device_init_wakeup(dev, true) [1], and I would like to send a V3 patch 
utilizing it after it is merged.

[1]: 
https://lore.kernel.org/linux-pm/20241214021652.3432500-1-joe@pf.is.s.u-tokyo.ac.jp/T/#u

On 12/11/24 22:57, Ilpo Järvinen wrote:
> On Wed, 11 Dec 2024, Joe Hattori wrote:
> 
>> Current code leaves the device's wakeup enabled in the error path of
>> .probe() and .remove(). Also, the registered input device is not
>> unregistered. Add a devm_add_action_or_reset() call and cleanup these
>> resources in the callback.
>>
>> Fixes: 3d904005f686 ("platform/x86: add support for Advantech software defined button")
>> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
>> ---
>> Changes in V2:
>> - Use devm_add_action_or_reset().
>> - Call input_unregister_device().
>> ---
>>   drivers/platform/x86/adv_swbutton.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/platform/x86/adv_swbutton.c b/drivers/platform/x86/adv_swbutton.c
>> index 6fa60f3fc53c..5b07c42adfad 100644
>> --- a/drivers/platform/x86/adv_swbutton.c
>> +++ b/drivers/platform/x86/adv_swbutton.c
>> @@ -44,6 +44,14 @@ static void adv_swbutton_notify(acpi_handle handle, u32 event, void *context)
>>   	}
>>   }
>>   
>> +static void adv_swbutton_release(void *__input)
>> +{
>> +	struct input_dev *input = __input;
>> +
>> +	input_unregister_device(input);
> 
> Better but the input device is managed so the unregister call is
> unnecessary.
> 
> devm_input_allocate_device() comment says:
> 
>   * Managed input devices do not need to be explicitly unregistered or
>   * freed as it will be done automatically when owner device unbinds from
>   * its driver (or binding fails). Once managed input device is allocated,
>   * it is ready to be set up and registered in the same fashion as regular
>   * input device. There are no special devm_input_device_[un]register()
>   * variants, regular ones work with both managed and unmanaged devices,
>   * should you need them. In most cases however, managed input device need
>   * not be explicitly unregistered or freed.

Thank you for pointing out, will be fixed in the V3 patch.
> 

Best,
Joe
