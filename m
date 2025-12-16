Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0513933DEF7
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 18:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765911588; cv=none; b=l7s9GhmVJ5ajlALkL1eyfUccPYmZc4jKf+1UGGQ4rOVAWFb1W9o/1ZWgY4Fo5iRflGYV52eFMC9OnuW9e2U/aDWqL9Jd5+DQcMpJeIc+QIENdui0szAcBb7enM4nGZoS+4LXfOgUNeTg8hfskJHH8RguwlJH42l8eRUIhrbHAug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765911588; c=relaxed/simple;
	bh=avOXgWL5X9ApgoShaLm6qMqHQaEq+7udfqH5kdlpla8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvoNgSM4EWJeFPQjlYb4NBycNKv9WBNutqdwQjGa8xMyCj3I7voJwCCAoVNcQgsFYsRWJPhGhtPkaGUbTUoXpLP5bJx1WTHkawKE/ZPIZi2lQ6jTwMLJe4RzX32pd4C6ccSb7f3865KXW3SKU/162GqwmMyMZmzeRkBMhqULd0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCfhWvoW; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCfhWvoW"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29efd139227so61092285ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 10:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765911586; x=1766516386; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rZLoaXET2b0KFbXvlV6l5Djhr479B2aoPP1JWkIF6iw=;
        b=QCfhWvoWlLj5llUvZvQkx/0KKW4j8+X+2JkKqqHBAH75HB2r9wxExlwptqElue8dZl
         p1YIYz7vCaeYWVYRnioj9Z0hoerkJkOMga9u2btfleKncdEjyZT5Ks5d9/NDGudU6w0X
         X619aKyL6QMxAYDKCUcRMSuiVNfoEnUz1CTOHjAZQvrzpW5pJm6/xtdS7qExtKW2qR/f
         2MFT90s/tBhw/HgQl/kKjYwlmRkQAOuIli3GVbYrlKTmlhhAzrM7o9+6Gy84Xd6c4y/k
         mu4vK9ulWet2MYUWCZci98Ia84bRhqf5UwIuBQ5bEVjIV3VF+QDAdlmM+DOGX9z/w0Kg
         Iitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765911586; x=1766516386;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZLoaXET2b0KFbXvlV6l5Djhr479B2aoPP1JWkIF6iw=;
        b=iQ3GPXT8vUtDimNcMcDHWUrkpy8sB1U+6wn28nlIqRzDUEmPpyGWIqtEOPUbFF7Rzk
         TaYDLjTswv9DHBG8vsZwsTcYdjyGyl2RnyDqCTSU1kVEjypeVdDOs8XTYjWWN9pjnsVO
         Z7WX4ctiPYbZ2kTbtEZlgYGPHxk7WLLx0be3QwLe7ceME7WSnFF82SLASLkAUv+Vz2n+
         Adh7iq61dEniWh2MgdyKqvN+Qq5mcwTgwijZUQRuhHvjzFVshiW27rgkAcL2CkLbv0yB
         JhUUy93bRpQfclAYgMarRrF1jd/oubfJAPZQ4yhwMT7+gGad3ttbR+cOMpP2vEOYq42y
         ar8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1Rh4wjwUAaKWWsthnbjur2lbKyMCitjERBk8vij8uebq9bCKrHLN4K8RNIkgPqJ/FK4ATiCeK1ixf+smVdT5+1q2/@vger.kernel.org
X-Gm-Message-State: AOJu0YwBwOfuQ0iQhnIinexFIFIFYsLqTrSy26iNwFXS1NI1eSEZWD+h
	oO6cyG7Q2l05GZn3KNGgw4zoqilIRr7/7vAWtuc9GfqDm9VybUmsPvwQW46mVvtK
X-Gm-Gg: AY/fxX5oXtmOIJXCEHRPeqbLlA9taGjoUOhQ2aZmmrzgGFISBwFfrZfXTWpVr5/yh7h
	fpCLtZUtB3MFhrEjgVEA7MB+Scz8FrHTtxtgR9s2sDgU+sDeL2Cc7JKrwgoDTf8PaCA9G1rjPw4
	GG6aS5/FVx8Jv/ENnZef2b8b3GmIUWyV0hzr6dXot8BYWN7i/NQ3alTKpuEpalLbhH108b6Qena
	vs5LfsNDfIwhIX8/jbI6d2NmFOeC7J3ub4+NgFgFfp9bVSPZrYsbskbYDy/Hsr3FsegADOgGwAI
	kM/uKasMk5y9fufRReV4mcs8IHEOweMMsFD0Iq258ewt27EE1+RBASYYzUSJdpEO+a2f3FJ5Ykj
	P4VeCy/lcRf2d/0bxriqC8P4TlFSotIpq78UBSplKCwQG3ArGtrFy1C0PXen0DdbuagTULB0ztr
	qHFkoV7b7CelKC08M19So=
X-Google-Smtp-Source: AGHT+IEZ+H7a6pJXwgiyJQeuXtpBdaFqxn6mqGX6CQLFRVkcllVUkCrsprXNg0+43nfHYCYfbEt68w==
X-Received: by 2002:a17:903:46c6:b0:2a1:e19:ff4 with SMTP id d9443c01a7336-2a10e19111dmr73210775ad.29.1765911586210;
        Tue, 16 Dec 2025 10:59:46 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0cf143804sm82878895ad.73.2025.12.16.10.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 10:59:45 -0800 (PST)
Date: Wed, 17 Dec 2025 00:29:41 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: hp-wmi: fix platform profile values for
 Omen 16-wf1xxx
Message-ID: <aUGilpWofRetSNpZ@archlinux>
References: <20251216121338.124615-1-krishna.chomal108@gmail.com>
 <43d49656-7c7c-ec55-a448-9cc9321ab3b2@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43d49656-7c7c-ec55-a448-9cc9321ab3b2@linux.intel.com>

On Tue, Dec 16, 2025 at 03:07:37PM +0200, Ilpo Järvinen wrote:
>> +enum hp_thermal_profile {
>> +	HP_THERMAL_PROFILE_PERFORMANCE			= 0x00,
>> +	HP_THERMAL_PROFILE_DEFAULT			= 0x01,
>> +	HP_THERMAL_PROFILE_COOL				= 0x02,
>> +	HP_THERMAL_PROFILE_QUIET			= 0x03,
>> +};
>> +
>> +struct thermal_profile_params {
>> +	u8 performance;
>> +	u8 balanced;
>> +	u8 eco;
>> +};
>
>How do you envision this being used on the get side? You choose not to
>change the get side, so you didn't run to that challenge. Currently
>at least platform_profile_omen_get_ec() is sort of cheating as it maps
>multiple variants without properly differentiation them.

The get side for victus_s devices as defined in platform_profile_victus_s_ops
is platform_profile_omen_get(). That function simply returns the value
stored in the global static var: active_platform_profile. As far as
platform_profile_omen_get_ec() is concerned, it being called:
1. In omen_powersource_event() and
2. In thermal_profile_setup()

However both of these are irrelevant for victus_s devices, as it is
guarded by a if(is_omen_thermal_profile()) block. So basically victus_s
devices never actually reach that function. I believe that is because it
internally calls omen_thermal_profile_get(), which itself uses ec_read
to read the current thermal profile. This functionality was added in
commit 4c51ba9af42df, back in the year 2021. Since then the EC layout,
and some WMI calls have been changed in HP laptops. In fact that is the
reason victus_s list exists in the first place.

After some basic EC-dumping from Windows, I know that the EC offset for
these newer boards should be 0x59. If you want, I can add this new EC
mapping too.

So basically for victus_s boards, at least as of now, there is no
get side to read the actual platform profile, hence no challenges faced
yet.

>Is "eco" hp specific terminology? (platform_profile_option doesn't use
>that terminology at all.)

Yes "eco" is hp-specific terminology, but you are right, I will change
it to "low_power" in V3 for consistency.

>Wouldn't we want to include struct platform_profile_ops * somewhere as
>well so this framework can extend beyond just victus_s? (I'm not sure if
>it should be in struct thermal_profile_params or if should be separate
>from that, this whole platform profile code is so hard to read it's hard
>to infer what are all the variations.)

That seems like a valid direction but given the current state of the
driver (with its many static vars), I would prefer to keep this patch
focused on fixing victus_s thermal profile values. I can look into a
more broader refactor later.

>>
>>  static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
>> @@ -1672,25 +1708,33 @@ static int victus_s_set_cpu_pl1_pl2(u8 pl1, u8 pl2)
>>
>>  static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
>>  {
>> +	const struct dmi_system_id *id;
>> +	const struct thermal_profile_params *params;
>>  	bool gpu_ctgp_enable, gpu_ppab_enable;
>>  	u8 gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5% */
>>  	int err, tp;
>>
>> +	id = dmi_first_match(victus_s_thermal_profile_boards);
>> +	if (!id)
>> +		return -ENODEV;
>> +
>> +	params = id->driver_data;
>
>We should do this once at init time. Then you can mark the dmi table(s)
>with __init.
>
>Normally the pointer would be stored into a priv struct (which this driver
>doesn't have yet but gazillions of static vars).

Yes I agree querying the dmi table for every profile change is very
suboptimal. I will add that in V3 with yet another static var :)
