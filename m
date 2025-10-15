Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DC121323C
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 12:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760529651; cv=none; b=Z7thNanCzwpcZW26Zgfgw/+hemLoMs1k4hHqglAlg8oxezym5szbJQD6qTWXZ8MzDZ+gGX5QvVlyPIlCtZdZl/ZOneiJX06nYyPtCCoVbYD09Bx9sqcxfIelAtsCQx5NXjjid0iwjX+3OuZbnrqC2vHP4xxSkdlmCK1aXHtiSE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760529651; c=relaxed/simple;
	bh=kLZr9sVPGysJ0WQNoZMtdptiRKlUbGQ7h3wzqBzYq1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=en0gHyMT3o1Un3beeLZBUnVOVP14aOouXas4zlmJYoC+Eaea/W0LHAofq5vD12OpfKnZncinUImqZnK1H2QqFgigK9w5Mi4LB/ri7oxrrxLeW/m3NcmvNbqBL6wMhpgAsjNBOxSznuLnOxalMXbv5GKsvxdhoFPL4uwJfbbL60w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QS694sIf; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QS694sIf"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42420c7de22so3057400f8f.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 05:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760529647; x=1761134447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vlCxjgb1MucHfxVVzfW5HOJJxIf6rICYOJSm1xFlMWI=;
        b=QS694sIfTd1baPvqfukpQG0xmzeTkCbOUo7542vNRgtwAGMTNypfwLOVKNNKc+Ou/+
         CjqOyUsRSocw6d/PQhaFBXd4R2QB/qBOJt3biWpmidR/nqdVNM/uYLhfeHraCcDoxHXF
         BmG8b3bW6xfS/i9qTDgLopKW2Mgr/pG3k/0WRa1SeASaAU8YW8tLMLfFQlQ/jQrozYkl
         SBCT+gweRauxLm3BDL2uvwyN4O7D9mHpeNOR5MQFQBg9IL0HCPd2qCAJvZGB3329ssE4
         tJr0e+ny8dyEZQ9DYSHdHwVI5qDE/juLw8Wrw7pDsjFFDGosn9X38SNTNonWTyefIb5Q
         joDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760529647; x=1761134447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vlCxjgb1MucHfxVVzfW5HOJJxIf6rICYOJSm1xFlMWI=;
        b=DmThPe+515qpvKtHrndxkcnd4ZiELaQ/aOn8bsqd/s6zSFctzCaHHxR4+N7Sk8gm9g
         LhmVgQaZpPYUA10Um++bOiGtY5QVx3js24Q0rgfCWGRE3c2d/nAL0P1c2jfFvgZx/E46
         DQO/ZWaE/rNW9dsZxMYQ/lwQhn/mWs5ZAlIuPkzhHfe7yB2tAkPJDzsQ6qv8cISeQQW1
         ucVVYsPtgWgnVxhWCkw6Z+J8hJ2e8+HNEduRHnSa+6e0Gdye1UyOPmuEgYMz+gjsvPeN
         +RqQvo1aWozKMMXW86xCga5F6Nvl/Az3P3ef2lfvkHO68PvAluyzLod3S+tjLmEpaNuu
         njMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3IN66vnk/oPCCt87LNwNL8HkSLjvx9MDLpcrjuu0eMdcCGrMjjRgNPw2sokmbapgTasxbhA0Mi1RLTQ2pkyHnMUNU@vger.kernel.org
X-Gm-Message-State: AOJu0YwkBdIGGyodO5a/dUb6vLM6hswJLz3X7EUV5oliFbaQZwmF0Bqs
	f51k5ARUavQsGWgO+mAWEMqFsLynZHNDAPhlGjZttpZSB8dL4kO/T+ZV
X-Gm-Gg: ASbGncvnt4jGCJUTQBlNZZYzyO3/E2LUB7zFSBSbLuE4E2/Cf2hjySgFx6ardZh1Xyi
	aubb/Pni7oSLp0AuqJKTzy/MK4w3oCghzKalto5shjq3RPuvVmp4EnVXs8PpNg9s2FOFLFYegQy
	dCjBO0jX8EZBaCBcicUfNlIe20rr7IntRF1Ic/d5g6s+x2GDW+B7S9xw16jYiXX+dmgI/cqzsNY
	t/8N53BP8Su8Q/vdkUL3/S89cJhuFzakPvF9f+N1DS4aKnJ9Xx8OjfFAmicNGO18b0pM4NQs7ID
	zoobTnjFz1evGPDP3Xss4Fb9kYcW1OQ+spFCM8PDs95ye55McZ8g5TuCZonA5HWbtDQSOzXWI7L
	AzT4U57Aku0l42UfW6nAkjYH3KRSsLghCnHZkpvmR09lr0hPRPLHAkCiTxlW+5HmByw==
X-Google-Smtp-Source: AGHT+IGsluqt3NGItIElnIoNT1i96LzPn1A4gXtu1b0U/YlCjJywSFxvMtfWVaqSmOialU+8CAzA6w==
X-Received: by 2002:a05:6000:240d:b0:421:a112:4010 with SMTP id ffacd0b85a97d-4266e8e8f53mr17557550f8f.55.1760529647378;
        Wed, 15 Oct 2025 05:00:47 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5d015esm29587532f8f.33.2025.10.15.05.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 05:00:47 -0700 (PDT)
Message-ID: <97c56897-ed9b-4d4d-ba54-d6e2abbc8b0d@gmail.com>
Date: Wed, 15 Oct 2025 14:00:46 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/9] platform/x86: Add asus-armoury driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, "Luke D . Jones" <luke@ljones.dev>,
 Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com
References: <20251015014736.1402045-1-benato.denis96@gmail.com>
 <0752fcde-6c25-4cde-b35f-2204e24ff0f1@amd.com>
 <8e381c36-3bdf-a1d6-8e51-53243ba8bf4d@linux.intel.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <8e381c36-3bdf-a1d6-8e51-53243ba8bf4d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/15/25 11:38, Ilpo Järvinen wrote:
> On Wed, 15 Oct 2025, Mario Limonciello wrote:
>> On 10/14/2025 8:47 PM, Denis Benato wrote:
>>> Hi all,
>>>
>>> the TL;DR:
>>> 1. Introduce new module to contain bios attributes, using
>>> fw_attributes_class
>>> 2. Deprecate all possible attributes from asus-wmi that were added ad-hoc
>>> 3. Remove those in the next LTS cycle
>>>
>>> The idea for this originates from a conversation with Mario Limonciello
>>> https://lore.kernel.org/platform-driver-x86/371d4109-a3bb-4c3b-802f-4ec27a945c99@amd.com/
>>>
>>> It is without a doubt much cleaner to use, easier to discover, and the
>>> API is well defined as opposed to the random clutter of attributes I had
>>> been placing in the platform sysfs. Given that Derek is also working on a
>>> similar approach to Lenovo in part based on my initial work I'd like to
>>> think
>>> that the overall approach is good and may become standardised for these
>>> types
>>> of things.
>>>
>>> Regarding PPT: it is intended to add support for "custom" platform profile
>>> soon. If it's a blocker for this patch series being accepted I will drop the
>>> platform-x86-asus-armoury-add-ppt_-and-nv_-tuning.patch and get that done
>>> separately to avoid holding the bulk of the series up. Ideally I would like
>>> to get the safe limits in so users don't fully lose functionality or
>>> continue
>>> to be exposed to potential instability from setting too low, or be mislead
>>> in to thinking they can set limits higher than actual limit.
>>>
>>> The bulk of the PPT patch is data, the actual functional part is relatively
>>> small and similar to the last version.
>>>
>>> Unfortunately I've been rather busy over the months and may not cover
>>> everything in the v7 changelog but I've tried to be as comprehensive as I
>>> can.
>>>
>>> Regards,
>>> Luke
>> As a general comment that applies to a few patches in the series.
>>
>> The S-o-b means that YOU sign off on them, it's like a chain of custody.
>>
>> Any patches that you're sending need your own S-o-B, even if they're 100% the
>> same as the original from Luke.
> There's also Co-developed-by tag which may be appropriate in cases where 
> both have touched the patch.
>
I have re-read the submission documentation and confirmed I need at least
S-o-b for all of them. Is it acceptable if I simply answer to the email with my S-o-b
and Co-developed-by (on patches I have touched) or do I need to resend
the whole patchset creating a v15?

Thanks,
Denis
