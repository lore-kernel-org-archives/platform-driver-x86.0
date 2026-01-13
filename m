Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548C322F16E
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jan 2026 14:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314423; cv=none; b=kq/dPDfc2ux1IDcXc492QkWB8RGp35vDugjVVLQ2tOzsF4FBBDeJ/OPVeepskGfJJkMs0KLVBeXHcSURkDO4y1SoQOSi/pOjr2wDDJKOACMnIT+Vtz25e9420M+1BhawVQQjlKwmyh9mPNfF/lsQzq0iapCb5sq5P3L7G3qkGEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314423; c=relaxed/simple;
	bh=e19lLrUJMOtiw6ahck1CoUedE686AkJBFFhfoUwkOis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSJ9D9Y+8ELchrp69N3cwq6TWplo5HESxoyzP7169AkMp1EAOsyAknLG11Umfvf3Hurj2+NnH8k3q5dJxHb8SyRlnymBp/LOu2naM+8t94r0qCq92YbP9nxwtxD6hzhc9tnuDO74z3Q7VEpMLH81Gg+QQXud5+YOxMYvX+Df4V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXtoGL9a; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXtoGL9a"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29f2676bb21so65010865ad.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jan 2026 06:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768314421; x=1768919221; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NrW6EyJdcj33KNQG2ssU1grXQT0aYPhM8H3WYRQamIA=;
        b=dXtoGL9a00vBdnAT1rZpGt/qHFL+nO2kipPcgzJ5SovcplgPwUmrPMnaEgutoYCtW9
         mOynzPmY6ncJjMzdGfgM8SlEzIdWu2wsNkKRE9N8V2PnX2tojMJDewhhcfRCo3OPw3ew
         KiVutOaf1/j/w7fSLNDDA6TKV4VFkve60GvCCoLuNnfJQwNDzbL0cGeqJqSxhSN/ZTSK
         0guT5C9WdBqRKi0SS7wWlnN7TEZVI/199cRIpSIE6WzokdGNChC7X7G47jzeOL9wCnKj
         1bqdy5YgeBC7IBpWgmHJLT5JFynlYpoXHHVb32dHI2dxN+A1MVCJTslTh4QQSIuM8lFw
         lCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768314421; x=1768919221;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NrW6EyJdcj33KNQG2ssU1grXQT0aYPhM8H3WYRQamIA=;
        b=EwlVKD2ywpuUr/Buisz3Tgb+b4rNaBnuN0oPdaoL8m7jjEsf43gOcJQbovjhDGROUr
         C1E6BTGEifDst24OTlEm/HjjdPuQPNV4p62h2mZa+KEPcW7HU5i/PLUMOO8ntHq70Jw2
         9unyGVHkE9DOMWVL9vj+fnGjsSOchpnBtrMZkT5j6p9Hqe6xuBwv9MK46a9urqynldOe
         tULVR3xefe0zEfK160PxeNSE3nVQvbZei4I5VlGExwkNe8tR3Tkn6uQxlQ0ijTvUQjz1
         ruOtUoAh1QQrIGku+GU0U6LjFw2Ncdcu0siTV9L3DOQl5C7fgaD5BqG5uXwR+cdkk/QI
         cZ6g==
X-Gm-Message-State: AOJu0YzQ3/uxUTnsZIH5ekv6IFRL3wVIq2Xcq6lFPvM283iGbW4bX+7Q
	iGVhP6HSOjLHSNba8VNYyrN9SArQMDXpVynzQ6LO9bqNvFoo0lEmmW/G
X-Gm-Gg: AY/fxX7z89lk3HNafMSczSTPAny/uS9Th7eJ2yCh4kyqsADhYf52srpVF2JEDpTed9t
	Hzcen4fiKfAEu24UH5NxfTZhHIqcQlBEbiQFK1MF2EsapwA2e3wR3DPtrYxIHTC8NkIeN6lN7xU
	jXoeqzSp3TK+4K6kSO5URZfW9CsPtr5XJ83vTeqQZxjGmVdbK2zjzulW214OC0z2FcniSzUQhoM
	5fcNy623BJ1FB6CTtNr7484v1zIgsosH+ir0L8Ra4MmPAw+aUH7n6fs2gFEfdej7KYKKc59//yl
	r+p5rgx8qeHlLqeGi3WHPUGhjx/cZGN4pyy9DMPqHc+RU1m7fTp2fUIqxGKFTdqujURBHjEm/GX
	iF4Jd3odau+pE380+CpAuw8R2Gnw3Hn8qAlJZ5yMFczVzb7XLx6HjZaGdjExD+Z2tXHkXFNtIS+
	OKXO2humsnxUz6mU3InQY=
X-Google-Smtp-Source: AGHT+IFmf3Gxn4YNtIcr1FOvcOzsBRRWslo9FE1P9Od1ArX1yXWFjnMor10t73RPUgG3vgr9Tzpw+g==
X-Received: by 2002:a17:902:e783:b0:29b:5c78:8bea with SMTP id d9443c01a7336-2a3ee4917ffmr226505995ad.33.1768314421434;
        Tue, 13 Jan 2026 06:27:01 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd495dsm206156005ad.96.2026.01.13.06.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:27:01 -0800 (PST)
Date: Tue, 13 Jan 2026 19:56:53 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Fix Omen 16-wf1xxx thermal profile and add EC
 readback
Message-ID: <aWZGNQKt61SzH14d@archlinux>
References: <20251218124303.22024-1-krishna.chomal108@gmail.com>
 <176823207511.9723.10021168845490287383.b4-ty@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176823207511.9723.10021168845490287383.b4-ty@linux.intel.com>

On Mon, Jan 12, 2026 at 05:34:35PM +0200, Ilpo Järvinen wrote:
>On Thu, 18 Dec 2025 18:13:01 +0530, Krishna Chomal wrote:
>
>> This series fixes incorrect thermal profile parameters sent for HP Omen
>> 16-wf1xxx and implements hardware readback support for Victus S thermal
>> profiles.
>>
>> The first patch refactors the DMI handling for Victus S boards. By
>> moving from simple string list to DMI system id table with driver_data,
>> we can now map each board to its correct thermal parameters.
>>
>> [...]
>
>
>Thank you for your contribution, it has been applied to my local
>review-ilpo-next branch. Note it will show up in the public
>platform-drivers-x86/review-ilpo-next branch only once I've pushed my
>local branch there, which might take a while.
>
>The list of commits applied:
>[1/2] platform/x86: hp-wmi: fix platform profile values for Omen 16-wf1xxx
>      commit: d8bf01424f9eb555bf13b802a8ddffbb49f221a7
>[2/2] platform/x86: hp-wmi: Add EC offsets to read Victus S thermal profile
>      commit: 2511dd4dbb76ef6914c9b45ccba2492da25d772d
>
>--
> i.
>

Hi Ilpo,

I want to inform you about a potential issue in patch 2/2. My implementation
assumed a strict correlation between WMI command types and EC layouts,
but I have discovered this isn't universal. Some boards (like 8E35, not
present in this driver right now) use Victus S WMI commands but retain
the older EC layout (thermal profile offset: 0x95). Directly using
offset 0x59 for victus_s devices would not work for boards like 8E35.

To fix this, I suggest updating platform_profile_victus_s_get_ec(), to
check both of these offsets for a valid thermal profile.

I can either:
1. Send a follow-up patch to implement this iterative check.
2. Send a v5 with this logic integrated, if you prefer to drop the
    current series from your review branch.

Please let me know which path you prefer.
