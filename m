Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE33326D68
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 12:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760531245; cv=none; b=UK9jTNFjFSAxGEiFYG5mSGwIiIvIpC16219HmlBl/QTSWckCPAXIAV6gDRwcc/K/gUcN4TQfA10TDuSQyMSOT2I0mxDSUBlfgvR1FufK+/O49kwmProDDO6sxn5ft7lbFRNBA9MjcirI+qA2z+NiJYhYT07TJec2c4lm2uhuTXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760531245; c=relaxed/simple;
	bh=aUedLoKamCVVxyfQfUAMTvYhMOssaT/HBZaPQZ62VXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SroY2ErsI9dHhDiZO1SuF9OqnYlag7eVic8KRFwLorPfZ9WDOCnrpdxHRKyeSZ/mPbFB06NNogzzIW0d9Z8VixHCaOdVpTu7z0R5oRK3TeLFIFy34x9sEwAyB+NkiEP89/huqe79MDppWVj3HlCFfP7nI+p7+RP23tuudpOvaMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kggi3Oau; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kggi3Oau"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-421b93ee372so3459033f8f.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 05:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760531242; x=1761136042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wjoMwghPIohukayZuKoD3nhrdjl4TgPiMFjbi9Rs2ZQ=;
        b=kggi3OausfVTItOIOXYoMEOqhRi8NYmPY3ahpQC1RmvWivK/BuwGKF2deu79YDnZ8/
         BLXC+yS12xXtRNzg7+A2hl6xBtXeqDMN6IPaXzBSWmKb7pFRjXB6GQ1Uunz2lszcYhzZ
         KrPmuBM9xrHh1CQ9VDeQuLYmgHAHNnyu936+WhKHAm2OIqqe7+XaBlXpspLrWUnrB9KQ
         +ZfvcQgxjsqdUWE8hv4ldikppo/msRcYCF9LFiaIGWzf/GunwY9tGpKrS8S3VeuoT0ov
         +ro2nHRbhgvpMmCQPcjWEMpD0jJ5Z+c2YH1peYGjR1Bmen1kXlipzaNYK1ZMD/hs/zDf
         P5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760531242; x=1761136042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wjoMwghPIohukayZuKoD3nhrdjl4TgPiMFjbi9Rs2ZQ=;
        b=XKoLcqs2XD/rn7PmuPcxMZv+kAL3kFYFsOHGNr2sqEQ7kj/zotF3FiZaH1jZK9lVtI
         ISM2lYLTDzsh9afNy+PXYGgew/o1ontlU5OHzLQ0DWj8+IXkVCQRxKcQG5NytozlIMNz
         Lvc3GQ0geBMuKTTpy/FOR7/JPV9E1Gf/y6a4JhqAOI3XkmwWKqnUw8QECYE55j5R5Shi
         9peYIHNlEu8E+3dQkj7puU2AAgfxqeGxtL4utUsmhfCpcS3dPsbRGImlZmCsSRlZDfhG
         S73xDJ5GQkjTMQjgigMVzUgHQepZWrd2gqnuVTH1TdObEqbEOg8m4EMVM3+oyAHEyOr/
         AUaw==
X-Forwarded-Encrypted: i=1; AJvYcCWg9ADtBchHNsBbquZPeToi5C1zxtt3aKx5CiqVZ498IVnygWSPEaM+75Z7ba4+Ho60Rmml3CgosN6D9GUBgZai5IbO@vger.kernel.org
X-Gm-Message-State: AOJu0YwSmPurwxsmXmCMAhgnMR/yRKTgmA42i7fTbXxnxFspjaww2+jH
	2aChQTkHhFLYjY20Wfpj5HmRp1T46JTTE9O0t7PxmO97uOIi5hoSxxxh
X-Gm-Gg: ASbGncuU3MfBp5l0kNZcOH7fnfy2WqGEWQR43p97vS1P5BRGLYEP8bs6DB1dKNJsd5r
	oS60QWs3ZXN6Bb/vEGul133NBHjnlnlj+1VHwWgkQsUym95zpTmqJWvCMpYbjMnA/EIzhdncZSN
	518WkUmTR8L/01IFpMcBYS6LIJPPEe//sLfZt1Ml7frtkDHXqNmWrlLCaaMj8H+nL1dJV1iP4/y
	7GcldZGyMsUgKzEN5EWfLygooG9xJA12yip5hnbHdPCyrYk+B0mdN8qT1NodCDNZkmY2w+N9bD/
	e2H5sewlzUtzsbduJGAj1QeqNWW7JblE2qGkzsRINejBCtiJUSFJ4LR9WuyOuqTw5YxM9RJmust
	sycY2+GjYNkN+4XTq1/63P6lTW3h47TaM4BzD2eeT8y0cw4YLRzgTlenvQBu/n5nmlA==
X-Google-Smtp-Source: AGHT+IGI57IQUmf9nN0SU1CXBFc9/Ki3m5/W+fcXygdYAFCm/ofKw82VShjxAzRHnUdy1iKY85Q3rw==
X-Received: by 2002:a05:6000:25c6:b0:3fa:5925:4b11 with SMTP id ffacd0b85a97d-4266e8dd4a0mr18552082f8f.42.1760531242037;
        Wed, 15 Oct 2025 05:27:22 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57cc0esm29129909f8f.6.2025.10.15.05.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 05:27:20 -0700 (PDT)
Message-ID: <ada4c640-1d35-4e79-bc00-e88bc60f646d@gmail.com>
Date: Wed, 15 Oct 2025 14:27:20 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/9] platform/x86: Add asus-armoury driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, "Luke D . Jones" <luke@ljones.dev>,
 Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com
References: <20251015014736.1402045-1-benato.denis96@gmail.com>
 <0752fcde-6c25-4cde-b35f-2204e24ff0f1@amd.com>
 <8e381c36-3bdf-a1d6-8e51-53243ba8bf4d@linux.intel.com>
 <97c56897-ed9b-4d4d-ba54-d6e2abbc8b0d@gmail.com>
 <66bb61ca-94ae-7f0a-ce9f-f5c13b51eb01@linux.intel.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <66bb61ca-94ae-7f0a-ce9f-f5c13b51eb01@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/15/25 14:06, Ilpo Järvinen wrote:
> On Wed, 15 Oct 2025, Denis Benato wrote:
>
>> On 10/15/25 11:38, Ilpo Järvinen wrote:
>>> On Wed, 15 Oct 2025, Mario Limonciello wrote:
>>>> On 10/14/2025 8:47 PM, Denis Benato wrote:
>>>>> Hi all,
>>>>>
>>>>> the TL;DR:
>>>>> 1. Introduce new module to contain bios attributes, using
>>>>> fw_attributes_class
>>>>> 2. Deprecate all possible attributes from asus-wmi that were added ad-hoc
>>>>> 3. Remove those in the next LTS cycle
>>>>>
>>>>> The idea for this originates from a conversation with Mario Limonciello
>>>>> https://lore.kernel.org/platform-driver-x86/371d4109-a3bb-4c3b-802f-4ec27a945c99@amd.com/
>>>>>
>>>>> It is without a doubt much cleaner to use, easier to discover, and the
>>>>> API is well defined as opposed to the random clutter of attributes I had
>>>>> been placing in the platform sysfs. Given that Derek is also working on a
>>>>> similar approach to Lenovo in part based on my initial work I'd like to
>>>>> think
>>>>> that the overall approach is good and may become standardised for these
>>>>> types
>>>>> of things.
>>>>>
>>>>> Regarding PPT: it is intended to add support for "custom" platform profile
>>>>> soon. If it's a blocker for this patch series being accepted I will drop the
>>>>> platform-x86-asus-armoury-add-ppt_-and-nv_-tuning.patch and get that done
>>>>> separately to avoid holding the bulk of the series up. Ideally I would like
>>>>> to get the safe limits in so users don't fully lose functionality or
>>>>> continue
>>>>> to be exposed to potential instability from setting too low, or be mislead
>>>>> in to thinking they can set limits higher than actual limit.
>>>>>
>>>>> The bulk of the PPT patch is data, the actual functional part is relatively
>>>>> small and similar to the last version.
>>>>>
>>>>> Unfortunately I've been rather busy over the months and may not cover
>>>>> everything in the v7 changelog but I've tried to be as comprehensive as I
>>>>> can.
>>>>>
>>>>> Regards,
>>>>> Luke
>>>> As a general comment that applies to a few patches in the series.
>>>>
>>>> The S-o-b means that YOU sign off on them, it's like a chain of custody.
>>>>
>>>> Any patches that you're sending need your own S-o-B, even if they're 100% the
>>>> same as the original from Luke.
>>> There's also Co-developed-by tag which may be appropriate in cases where 
>>> both have touched the patch.
>>>
>> I have re-read the submission documentation and confirmed I need at least
>> S-o-b for all of them. Is it acceptable if I simply answer to the email with my S-o-b
>> and Co-developed-by (on patches I have touched) or do I need to resend
>> the whole patchset creating a v15?
> Hi Denis,
>
> Please wait a bit with v15, I'll try to take a look at this series 
> hopefully before the end of this week and I suspect there will be more 
> changes needed as a result (not to doubt your effort but it's long time 
> since I've looked at it).
>
Sure! I will fix everything that needs fixing! I'm just happy seeing progress
since this is a work that is both extensively used (valve and other distros)
and very requested.

Thanks for your time!
