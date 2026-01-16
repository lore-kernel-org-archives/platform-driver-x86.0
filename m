Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA539336EE5
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Jan 2026 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576311; cv=none; b=gyou+bDOw+lh1SiORpWXrsOUUioXgSnYgBJA6AtmIDbq8INR+kTDZdIABh+Me/3juUbVHPLFkEr0hXMwX5qapZU0VFjcqGyYExEKzEwYELyjkuFANnGStdxXQ4Lg/HUQmiBF/eOJpKxddbKBlt88LzZoUrfGqmUR7ePJpcpSxcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576311; c=relaxed/simple;
	bh=LHJz1cNbdJQq0/h8jrYMOKnwm3tV3jhv4dWCXIxIans=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DEd9kVHfIYbDRgedretPGCi/uaUZzLqcZDJ1cYoritt87VKttc/bWr7rszXNhKSIpjcTFL3S5Iz4atjyJ0xKwvhWFMqDIs8N+ppHTeESJsl1ZyMs9/jX2+vTJCH3Q8SRwhcfoN1seP0xipdZe5OdHPYYaWnNgw2CjdPa0Tf5mOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYKKhCwg; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYKKhCwg"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81f4e136481so1028158b3a.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Jan 2026 07:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768576309; x=1769181109; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oXeFz9RUH6z49b4qnoPEulCblA5c5mYZyI1OI75NppM=;
        b=EYKKhCwgfkbT+r5t475W4DqjJIS55JuR7DHiL6rDFUds5+jUSQiKfGoa72zT/A1qtj
         wQNurPFk0FRO9MTh/M8/G+EI9NX0NYtvlWDukBYDJeWMH+m75SMJolKi2aGN8HI7HC/I
         kt+Q3nQzyJ8x+2/otVHT5wb532IpkL/LZJbo/9mvIW3fChefz87ubJfdtRX91MC2J5xV
         KyZ2PwHchD1JfMsUdbxhc41FcszD4Ex7MEr65s2AK4NSjRK/DGd5zUdPj8WjiI2s5u6E
         5X0Uog/90pWC63K5FERZIuERUQUV3hlJkZBJe8eAcvtUOK9sxG8saDVS1NlCbVbjdDt6
         1yfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768576309; x=1769181109;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXeFz9RUH6z49b4qnoPEulCblA5c5mYZyI1OI75NppM=;
        b=ByZpFCgI8aUmr9ANfKlYaP2eIczSOWq9QF6B0rvVKbbbgo7S9IHaC3StTWSZP1MRBU
         LcrOIfj1pwAul5ZQr02XQl6eN198BR9fxVHrJOjDKriy5Mg6RmiwufnxSn3WthyWMmjq
         hWLk56NOBam0dIW3reptwfv3WkxSk0qYS9Eq4pCdpd0qb6KcnkeITTJYkrlSCjcN9F0S
         w8AE+3RpibUso1boXx1KigNu5f8m8xjEXB/wj4n4NHK+Ru2GLWoyx97Mywfp0vbR36vD
         5Gl8aUPRrNC5gqSIc8NwlJo5C23wRKLrl74Jf0M/MgyO6NZro/XUQ4rushjG/TOgrziN
         XHTA==
X-Forwarded-Encrypted: i=1; AJvYcCXwNJADhGzj8Q40oaeHPOuHItcTXVp6bevyxxKgS4lPjU81Jx+3XosUbt/z4CTnGS00a/AB/GY8isC+hsNN84BkppYZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+DN75GPOXTcUg+Zb4RC6yZA0WazBxyKVkbbd85CQuuqPgQ+1e
	CX5LBouGK442Rf8VDvrbCV0CB7Co4h7NErEaEO6638S2NdvBM8nqMp6A
X-Gm-Gg: AY/fxX4msRBG3F5qX1/aZGbhEFdCH//pXcbWOJ/dlTOobD5tSm827zwuhvUIBLW5zdw
	HYEk2WCrWw0CUZEsQfOCcK4BNspdwba5o/Gn+XInSifQuU2s6T+9CZ+EOE2SFQaWsGRsl+tkx6H
	8JJYyN2cV2jkaC7EvjOaixc08KWQcjZ9E0Ks+bPHwk9Ml7gH40jlPXGUAM56qVHOlMkSsswS+Ga
	GC6VaSBr+AYDc6kWi2DiNq0DZxunhFHu9yqA+eiIax1aXVCgTcFcdHITJF3RN4yh5hznSfD/RXo
	SRU3HiSGvZvPnSI6vpNSojrhh7G7OhZmxpn4/NFFuUHeKox6Ijq7grCVqUbkZP/lf4eTKNKRjtz
	uLM718BFPVkW/7w7cI52EEPfXgQl04Ioi7rDm77jNqTHfSIAToFqnQ6ZPF1D/azFWPXoLR8mXua
	iELWtv+tg0HN1d8xuZMZo=
X-Received: by 2002:a05:6a00:369a:b0:81e:cbb0:db14 with SMTP id d2e1a72fcca58-81fa17a1465mr2493656b3a.21.1768576309123;
        Fri, 16 Jan 2026 07:11:49 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108bf00sm2347192b3a.10.2026.01.16.07.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:11:48 -0800 (PST)
Date: Fri, 16 Jan 2026 20:41:40 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] platform/x86: hp-wmi: Add EC offsets to read
 Victus S thermal profile
Message-ID: <aWpKUa--tT0ZSRKG@archlinux>
References: <20251218124303.22024-1-krishna.chomal108@gmail.com>
 <20260113182604.115211-1-krishna.chomal108@gmail.com>
 <20260113182604.115211-3-krishna.chomal108@gmail.com>
 <60c0e7ad-f25e-4e73-668b-4bb08dbbb79e@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60c0e7ad-f25e-4e73-668b-4bb08dbbb79e@linux.intel.com>

On Thu, Jan 15, 2026 at 03:26:45PM +0200, Ilpo Järvinen wrote:
[snip]
>> +static int platform_profile_victus_s_get_ec(enum platform_profile_option *profile)
>> +{
>> +	int ret, i;
>> +	bool current_ctgp_state, current_ppab_state;
>> +	u8 current_dstate, current_gpu_slowdown_temp, tp;
>> +	static const u8 tp_ec_offsets[2] = { HP_OMEN_EC_THERMAL_PROFILE_OFFSET,
>> +					     HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET };
>> +
>> +	/*
>> +	 * Victus S devices have more than 1 EC layouts, hence we cannot directly
>> +	 * call omen_thermal_profile_get() like other platform_profile_*_get_ec()
>> +	 * variants, since it would only resolve to that 1 type of board. Hence
>> +	 * we iteratively query a set of candidates: tp_ec_offsets[] until we
>> +	 * find a valid thermal profile.
>> +	 */
>> +	for (i = 0 ; i < ARRAY_SIZE(tp_ec_offsets) ; i++) {
>> +		ret = ec_read(tp_ec_offsets[i], &tp);
>
>I'm not so sure about this. Reading EC offsets and hoping we find the
>correct one doesn't sound the best idea. I'd prefer we store the
>information like we already do for thermal profiles. Unless there's some
>other way to detect which layout it is?

I explored the Omen Gaming Hub (OGH) behavior on Windows to see if a WMI
query exists for readback. OGH appears to default to "Balanced" on first
run and tracks state via a profile.json file on the disk. Deleting this
file causes the app to lose the current state, suggesting that there is no
official WMI readback query. By implementing EC reads, the driver can
actually remain more consistent with the real hardware state than the
offcial software.

I agree that iterative EC reads are not ideal. However, since these two
offsets (0x95 and 0x59) cover all (or almost all) known Victus/Omen layouts,
the risk of "hoping" is low.

Storing them at compile time in the victus_s array as a part of
.driver_data is indeed the best thing. But since we do not know what EC
layout is followed by the existing boards in the array, we can take a
hybrid approach here:
1. I (and subsequent additions) will store their EC offset in the
    .driver_data field struct.
2. For already existing boards we will perform this iterative probe once
    during init, and store it somewhere common.
3. Then platform_profile_victus_s_get_ec() can simply use this "definite"
    offset to perform the EC read.

>
>FYI, I took the first patch of this series again into the review-ilpo-next
>branch as it seems uncontested and fixes a problem in the existing code.
>
>-- 
> i.
>

Thank you :)
