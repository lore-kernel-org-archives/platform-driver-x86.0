Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07212D73A0
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 02:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789352421; cv=none; b=N/Lwbop9EtNsmEOeCL3K34fHDhdvjL8t8BhG01ZFnMx3fZCVedQ1WxsboRIR8x1QToannKReam60nT2K2uayuuDdtmb1xCKCBE8kFM49VLww/UjXdrSBpS/UrWnHRf+wNu4vwyr8vRdNixlL4EovpipSsIZLibXwxLUU001lkS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789352421; c=relaxed/simple;
	bh=ItUAaJ9Wdza/1n9xkRWUnVpV4ybgd/bt14CQdsSCP4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=El1Hewcq4Fm+cHxpH/L048ljwRgAOX4AEqwTLKi17PGtqv/5piGUvXnf5hD2a4YZz7pyVZS57tbGzTgGu8zWxaVvR7KiDetEcPPJSfvFp3MShfTgl6dOnoqH/NidA+kIcqrdqEM2Us8NUumzIb2SmWD+YEvzi+ix2DbNSQ9p9Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fR4ywe9v; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fR4ywe9v"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2679081a91.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Sep 2026 19:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789352420; x=1789957220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfLRzFeHvv0Zv9+KpeI9Bfuaw4G1ta+ZF3c/S1UYIso=;
        b=fR4ywe9v9RJefE+ErUkWfj95sPw9OQCOjr2bej5J0TvYTI72F0GbEdP4AAey3sCRlm
         WY/pnZJNZvFqjKGX2rvpq1H2HiJeBLOt6NIOS6Cb6cTKVAF0hQ1XCye1Riv1bwSxatkr
         92R3aSOLMt6d2hQXR4zCM1On4uo97x7h5URPj4tGR3WBaskEmPOdcaVm8WfYdgarbfYT
         UVOHeiIQU9qq5J0jQt1wUIPBjKAwUo6XEhEtN/wbItDdiSY3vwSseEG9TdkVzXEoS5md
         GAfvoFW6Owcg/i4GAMSxdWfe4T4rAWe/EPZViIRP3+ltCBLv+yRhBoE0W4V9357KzhUc
         pwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789352420; x=1789957220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UfLRzFeHvv0Zv9+KpeI9Bfuaw4G1ta+ZF3c/S1UYIso=;
        b=a18EOlXU+N6dY5DoqM5sLemtF8FDyPSn/kRDVgzfpUImkxhUjUi+tCjUJGTgrdzjPq
         l+w4n+gz045GhTYBEMFbXrYn+550fSDUozP04Xm2BYeGIrxiJOUO7cm4yrvComHFR3U1
         EeKGNwDNwziYhuJmsU1MugvP2aLoM4WwP/69u/EwF4+p7QDjyJC1VzU15g4wXv3BiNiM
         S34nQFOdmpfHMX1ndcRyR0KJA519amQ09stfHnNLBkaEuwHIBRx3wrnrCSD9r9hLleAr
         AWIYiXIghsHibZwcWCjI4ERMrNUJJb6IGs8rO3kvO6mfGwOhQhJ80J9YDNGkIj/gPcq1
         KMmQ==
X-Forwarded-Encrypted: i=1; AKwUvBywJSVG0L5i64At3ufrcfCOEljw/3oC3CHirutffsvVboKwXiKoBEw4Kesyov1XWlso3/2/1xGHTTNqCz16Rebl5YgU@vger.kernel.org
X-Gm-Message-State: AFuF++lj9T8icoEssYPTOs0cunBRQ4NZt/vfVqljZf7LeBlYC7JsSemj
	rhCCd8UOlWWnmxPMOO+/+keDA8QXYLiO57FKIL4C+HuwyUffyvJcqxvetARfuQPvsyo=
X-Gm-Gg: AYBFou25LmmFSeRzxJEEBZxO+5ws6iHxF483nTjAWsBubLm8BRmsMBIAyPBSxnlSxrq
	IMOlTohhq3cDGPgRckI5LfXf01JCby8De1wD9bKe00WLUbNkTasGlG6cbUyC0Euv3sKK5QTcqlg
	B7cFbux9YDWDORwIeLmmDAqsxBjGHyN5B8QqzxT7Gt71x5YK+GnjSPtUdi08oBF/Uzt9XmgRUub
	QLQ431HBMsW0Z73hvEgaBSDXCp0C87sKAH+TMdmCSeD5YuU/Xmtaa2Yf8xyxMZKgpAD9+lyGZR6
	INfLo99V/95Wc4O6uyK8uB+7BUPkWXng/y3wmpnM27t1ADJUK7+jpbumDNflwhCgYdJte9hmy3I
	bi2MiF/mm59RjjHDQa/6GMtRgTdyi9TrcEI9X5ah+py9zcDfGAtjHCTbSPm8LPeMbkP7FJIRTj1
	+OqTLYOoONmciGg23wCGHas2e9OqMsORJ24ojqo8rkURtgK3IFvxwDpSZJT5GUpACuI07y6xcSy
	wbwrTFEvqi7MzsY7or6XH2bFtNYsbcZL/8bc/HpOYOlocRa27kQ3HtHvg==
X-Received: by 2002:a17:90b:17cd:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-39debf88a21mr1358455a91.1.1789352419921;
        Sun, 13 Sep 2026 19:20:19 -0700 (PDT)
Received: from ?IPV6:2607:f598:b3da:2e70:b8cf:e0b4:f155:e178? ([2607:f598:b3da:2e70:b8cf:e0b4:f155:e178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a8a9sm22496831eec.13.2026.09.13.19.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 19:20:19 -0700 (PDT)
Message-ID: <99263485-90d4-4321-a434-8c6d1da6b53d@gmail.com>
Date: Sun, 13 Sep 2026 19:20:18 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Support WUJIE15 PRO HPT
To: Randy Dunlap <rdunlap@infradead.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Gladyshev Ilya <foxido@foxido.dev>,
 Mingyou Chen <qby140326@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <0da43a8c-1755-49fe-b8e2-403489297f06@gmail.com>
 <38c933e8-b026-42e7-8b68-6b469e39abe9@infradead.org>
Content-Language: en-US
From: Bozhen Peng <bozhenpeng93@gmail.com>
In-Reply-To: <38c933e8-b026-42e7-8b68-6b469e39abe9@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for catching this. I'll fix the underline in v2！
- Bozhen

On 9/13/2026 7:01 PM, Randy Dunlap wrote:
> Hi,
> 
> On 9/13/26 6:12 PM, Bozhen Peng wrote:
>> diff --git a/Documentation/wmi/devices/bitland-mifs-wmi.rst b/Documentation/wmi/devices/bitland-mifs-wmi.rst
>> index 9e86ecc29..fd966cf18 100644
>> --- a/Documentation/wmi/devices/bitland-mifs-wmi.rst
>> +++ b/Documentation/wmi/devices/bitland-mifs-wmi.rst
>> @@ -7,6 +7,37 @@ Bitland MIFS driver (bitland-mifs-wmi)
>>  Introduction
>>  ============
>>  
>> +MECHREVO WUJIE15 PRO (HPT) firmware variant
>> +-----------------------------------------
> 
> The underline should be at least as long as the heading line.
> 

