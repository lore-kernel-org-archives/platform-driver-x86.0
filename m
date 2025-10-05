Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547391E49F
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Oct 2025 12:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759667576; cv=none; b=JLKKGt6nTtxKEFU4PRkE0rrmG03BIC2DafshFEtPgfXuTI9XldFaiGapzkwwahqvjvwvJhebCx3O2olqCL4yn1LphneLBIp3c6IInpJPsahJXkZMrRLYVJJWLFiQ11EY4YmgX/gvlYkKRdQZMr54kMiBjCfbXwOR2dsqOTGqRSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759667576; c=relaxed/simple;
	bh=isW39cBflKEuRL+cWorFd+Z/vYMoEyVFhVBij08XUFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sC4Pu3LaXxCXa0+7YPyD3xAdrrqPZYqQci64wWqqouYjA7RDXdLZXTY/nTSZlEucnQWvXRlZtfzmNDqmC2dWf9pgsSWhwH1ZWJVOGQiqBMVZMuq7GjGIcTz5zkDXjrd6iTaXX4Enc3Vn1CIPN2uNm53gDBLXJefgneJeFDOaCZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLMeXfqP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLMeXfqP"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e52279279so24976425e9.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Oct 2025 05:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759667573; x=1760272373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=isW39cBflKEuRL+cWorFd+Z/vYMoEyVFhVBij08XUFk=;
        b=XLMeXfqP7gEXqQenQT5Fyer4TufPr4kVjeCtrbUd8/Cqbw5MDg18/n6yVKDbtJ5GX/
         vy1PoT6ADsYKcet/LgyaN+VmfEiomg7Lcu4ZqAkr/w2EPJDP5eMwOeC5Y2wriizIVbEL
         FIw3nW3fZaMrFhoXsgpH1tMlyf0ljs6gwqacU+piuv9JwFZb+bJigHfvsjf17LCGt6Se
         6kRSPTjnlr2kMXH7aDgsGk5n67qqmdO1MRqoYH20F0mIdCAlCg9Nr+dHUmYmH88GVKVI
         OWF8TQUtOwyPYljrdc5nCC+v2ZAqfbgmIByfRcFOKbLS0UJlBYAn71KlsRq79CWoz8NU
         D+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759667573; x=1760272373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=isW39cBflKEuRL+cWorFd+Z/vYMoEyVFhVBij08XUFk=;
        b=Kw1ByIh33JDaCBpcVsxQp0tMSZKawQ/3bUvJnjKmh6CvvzCdcSYEUJ0/Pyd5+m7e+T
         1c2LgjWHb5QHb+bBOXhaqh+qcy7kOlxAaWYiUz24I37d4rqm7W2KGGOu5GCjUxEXWxIH
         a3HbQ40ZklggLEgKvpoaU9LfTF0LD1ziU0xgC2cvAACHHtVbEs39UZaPHypY0g2TOyJZ
         2b+2YGfJYTT9l2oA0QBysZY9L89uvHCi1ykJ6LBzIr+6bR07MlLm8YaG1bl33vkzTuB4
         SUZup4DmEmoxPpxkuhvsrXYlQ/RkYnsvCtB6Uoh5uueNtCyD6l9Jc02OauYcR7RbbviS
         rg6g==
X-Gm-Message-State: AOJu0YytuKLprRRygV8Uo/rd4/RsOxyaXZ9WcJD/lJoAIljOkcZ3CHvf
	5hQdYcWUsCayG/SN+bM97L0GpsYVaFacqOG2cclZoi/QsM3v+tx0GLP+
X-Gm-Gg: ASbGncuvHSmYhgCpmWeBlUSS5R/FrDYqIODWQgfxk5MVSo08bZDXIB6WgAT5S/XAMHG
	xm8kT3uESGRtJqlHzteqq7in0MSTTKhsA9Lkt4Za1Vq7B9FRzfINnwvD3ORWfDeZfyupwOEsuoS
	i2v8pdOramsMag3aqhOnb+/4N3vFJHEg0mCBDno6UXtNdgvfuO8fLfZ3JfVLz6PVaQqej5LX0Ex
	nhI+gf7Xf0zMsbvwN9rMw7dWt1iU3LY8MYrFqh+obcHe5iV8mS7LKsqJIZlQTOyh8C6b38Xlo25
	RmUBxHR7kiX+tuAXiZoKHB8brqGXdvpju3V0mapsnPe1eWdOvPLyuNhLQwrwcDEhYrgotUvILZ3
	x9IeQvdzs0ByxLPPj3Pp4lSMu2tUo/866pzCT2NlTKG1i/QNECQK3ojDR2NfP
X-Google-Smtp-Source: AGHT+IFk2T9s8yBTZY5YN/FN9+iyw79NZ9OXdGX+nVkPvugA8SSWCXDFYS1g0NfJLrnuJxR1kZ155Q==
X-Received: by 2002:a05:600d:41f3:b0:46e:3e63:9a8e with SMTP id 5b1f17b1804b1-46e7114735amr56865305e9.26.1759667572385;
        Sun, 05 Oct 2025 05:32:52 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e9719sm16522876f8f.31.2025.10.05.05.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Oct 2025 05:32:51 -0700 (PDT)
Message-ID: <92d61a7e-4aa2-4fb9-9d97-52e04b34df4a@gmail.com>
Date: Sun, 5 Oct 2025 14:32:51 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : [PATCH v12 8/8] platform/x86: asus-armoury: add
 ppt_* and nv_* tuning knobs
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "Luke D . Jones" <luke@ljones.dev>,
 Derek John Clark <derekjohn.clark@gmail.com>
References: <20251003185520.1083875-1-benato.denis96@gmail.com>
 <20251003185520.1083875-9-benato.denis96@gmail.com>
 <86282444-f489-49e8-892f-46ce655030b5@oracle.com>
 <34852b92-a859-4e18-ba2a-c3cab814c2b8@gmail.com>
 <18fb538c-0165-41bf-adbd-596d75b5cb9e@oracle.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <18fb538c-0165-41bf-adbd-596d75b5cb9e@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/5/25 14:30, ALOK TIWARI wrote:
>
>
> On 10/5/2025 5:52 PM, Denis Benato wrote:
>> On 10/4/25 13:42, ALOK TIWARI wrote:
>>>
>>> On 10/4/2025 12:25 AM, Denis Benato wrote:
>>>> +struct power_data {
>>>> +        const struct power_limits *ac_data;
>>>> +        const struct power_limits *dc_data;
>>>> +        bool requires_fan_curve;
>>>> +};
>>>> +
>>>> +/*
>>>> + * For each avilable attribute there must be a min and a max.
>>> typo  avilable > + * _def is not required and will be assumed to be default == max if missing.
>> Hello and thanks for your suggestions!
>> I am not understanding if you are suggesting of just fixing the typo or changing the phrasing.
>>
>> Thanks,
>> Denis
>
> only avilable -> available. 
>
Perfect, thanks. Typo fixed and new version coming in a few days to give others time to review.

 

> Oops, I had a typo in my previous reply :)
>
> Thanks,
> Alok
