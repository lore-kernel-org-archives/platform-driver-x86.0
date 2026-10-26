Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009133;
	b=3ImblYtNt9Xb5tWrTUNJNDCHVJwZ9HKUkgcXVtACRYrasfwU+A39tDEeBkg/wwCydQgi
	 j7KuoGpQdFvRWRrG0sSgknOvFKc80HhROqAghkv2tgBxlT8k+jFTPf2gNI91RfbTBf7L9
	 l1I9ePH81xProFA/uR3hlb8LBf10KMzhdR8ICF4RUtOo9dww86OO3ykJTb/HOcY7eLeFn
	 HXiy6S4o/5bwYDQXqlxPj5PVDyfNX2557oSbgP0EPFQYwx6H4TflmoeSHpHfF1sDuTKZH
	 2q7Uyzz00oO3qL1SRvLgCtTv2w2RAsZAv6w2w6oUm33f02hBIj4rrtkD6CAMz22e45g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=T+aX9Q4ROQnpcVK7Jjk1SxNchobadyriKnLi3sg6Z+c=;
	b=h+yRToAPvPbdbkU4aX+9hfuraYoXmtGr/Zz4gf5EAY5o91nY7haQDW9+uao6eBd95STw
	 J43hup7+AZFpC5KGjuHMgh9/9iHw90RKTSoSpunm0SAVr0ed03NBAZqDY549oaK4whWJu
	 nT0Xwe2JNdRpl0OI1x8OOpEGzTmeUAIS3uIhfbBpzBZ2KAA1YSgPJu728lA4mkhpCVTb8
	 tJW4qc2hlZrxTWy7RFAmXp44h3yTygcyjDSoNeNFM3yyLHzPFaTNKKMClTauRzkGiRHP4
	 vLZeQ9S45rXRGkwnLHjZ2oIb4c/opDL5eGoBQG/SBXl/0k8O3toCXJruPwSNWoUbL8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hkepGJ+9;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D62D606A33C
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 10:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D62D606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hkepGJ+9
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a05b210703so1068800b3a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 03:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009132; x=1793613932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T+aX9Q4ROQnpcVK7Jjk1SxNchobadyriKnLi3sg6Z+c=;
        b=hkepGJ+9KZADoCTSL0KhXQsjDFns/ciXEafHmmJCT571jx+wlW2ACZbarIJnUpNGVY
         wM97afGqXfQSaYAN5Gk7WkcFV+pHCmvI6vPgmzelyRx6YWAdbZYtTVi0Y45w8sal6+kk
         OeSdFWGkZv7CnHuY+k84ayZODVjqi/4k+uDAVYOtBK4jWckfaHg/MgYFNtuQoddz444V
         pPUlUn4kK2ghGGIbUiBofU+l7y2rMz0e0ZCfoNf3ZMSg0dSSsw0yHwgYoq2JgQ9xSEMz
         yhTNrv1j9bdfPFKDXHch5zLBOc5LBcT9khgva1X7pi4SLxhZ4l+jij/Lj5IbvyybNsKR
         tG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009132; x=1793613932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+aX9Q4ROQnpcVK7Jjk1SxNchobadyriKnLi3sg6Z+c=;
        b=e3omHOiNhFfBvFXVsCRxtEvipm6lDI6Ic422co9MoDcK7HW8pxF8eCIytHkCg7zh4j
         a1VLffQv57k7Gunb6paivTabLH9Ha+DnyO7xKkkaNVYjwrINrnwX0iD0yFfhB5fXYBw/
         3LlNi+NLV3D1Mq3wRgdvVZnDT7TZyPKkQ8zyK1QEHO0xqehOJkxqBlP/dNoMEPGnGglS
         MBWlRHDpU20AXHTsh4dZnGaQx8DqS4AVVssRFixvWbhyX80OV9xYNz+NFSVMJfDtkpu/
         F+Vve4GWLyEr3D15dwG+8z6vnxYuDdX4YS+IKcEOByU3zf/lUokCt8iSOoP4k6r+mtbZ
         xP9A==
X-Forwarded-Encrypted: i=1; AKwUvBw/J9VTM2FU9dd3Ktlg1RgsUg8sQ8Kq9b8CASQj0uhVjHMCZku8U6qJaC6F/lm1hdsMwO89Z8Wc3TWkLU6dPCrEUsz+@vger.kernel.org
X-Gm-Message-State: AFq9FYIXs4DGdwg0dmaRR3Bp9avolbdhBt67KWWcgpNBSl4L3uqprZ1U
	OSxMtJ4UgGo0YrTZjfRGWZy8XWixqwGrNrvcQfp9PoIYu2pee+WU+6X1
X-Gm-Gg: AYBFou1uweW+Bb2NE1VcXl5ZI+6RRP9GDKTREE05Gpcw+SC/dMgh7mk90AYou43GbQV
	cxiK75Fm9M5qYx1RN+hpwWCFE7rnAWESRtI5OnPelD5Gpm00PA3EUAzmgRIor5GdZEH1SQ7siFZ
	/Ptem/leO3aVMxxNvR+H5PiPQG5KvJowEpeqho1UK2R4Qt7KjUaDpqx9PdeW6T3ZxevM+I2pxEt
	0typ0cRYYdubHFXc5u+bBrqxXnlQCsEUVBXkvzBEdL4j9Ph0YAZsM8a7xcrngDHPaTZhdlOQRLb
	YZ2YRVSoxhMIdY7Pv9QI+aKGHI1kq9TJxD2YwxgeSW9ncmOS2lJLg5R4HjNvRWQBtfsJwtFGq3B
	vpVj7BK0UoXWGZVgwnBeOEbuUTFc2jK3f7bqfActh13m0L4RPwdvQ06sPhQnMgGEpa5xJ1lzFRh
	7WjgH/vhJS4iZA6tDAiKhvUNcLnzz4NMM1+GZIWZ8xbmyoZ5a6V7yHenG4k3H5MtpQADeh2IKD9
	38RijtBU+4Zu7VbqsnV0FlxvGG38pEgeyzoPluoKl228VrdBaRGPe8McaU27tae6QCgarQ9YqWs
X-Received: by 2002:a05:6a20:c85a:b0:3d3:adbf:777c with SMTP id adf61e73a8af0-3e7bfa64f75mr3257808637.24.1793009131937;
        Mon, 26 Oct 2026 03:05:31 -0700 (PDT)
Received: from ?IPV6:2408:8210:2436:950:3934:2b73:344c:e6fc? ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c0fdfefsm1078943b3a.50.2026.10.26.03.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:05:31 -0700 (PDT)
Message-ID: <84658f6a-4eb2-4deb-a174-842a2cd187bf@gmail.com>
Date: Mon, 26 Oct 2026 18:05:26 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86: bitland-mifs-wmi: Don't fail suspend
 or resume on profile errors
To: Chris Taraszka <chris@miget.com>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 KentoNion <kento@kekto.ru>, Matias Civadda <matias.civadda2342001@gmail.com>
References: <20261025195456.43414-1-chris@miget.com>
 <20261025195456.43414-3-chris@miget.com>
 <5360953a-ed8a-450b-93c2-f55876af8600@gmail.com>
 <CAAcRvKM2CQeJLWDnUhQJ+pKxiduY3XakeBbJCTbnY8=beE5MLw@mail.gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CAAcRvKM2CQeJLWDnUhQJ+pKxiduY3XakeBbJCTbnY8=beE5MLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/26 17:48, Chris Taraszka wrote:
> On Mon, 26 Oct 2026, Mingyou Chen wrote:
>> What value does the firmware respond?
>>
>> This patch fixes the suspend problem, but it hides the real driver
>> problem (unsupported profile entry).
>>
>> I saw 0x04 in your patch "platform/x86: bitland-mifs-wmi: Add Xiaomi
>> Book Pro 14 quirk".
>>
>> If result.data[0] in laptop_profile_get actually equals 0x04, the
>> function should be succeed, but it doesn't.
> Hi Mingyou,
>
> It does succeed with patch 1. The firmware returns 0x04 (I also read it

Apologies, I misunderstood; I assume the "patch 1" you referred to is 
the one that adds the MAINTAINERS entries

of my v13.

> back from EC 0x68), and with the TM2424 entry laptop_profile_get() maps
> it to performance. Since then the machine has suspended and resumed
> several times without the warning.
>
> The test in the notes was run without patch 1 on purpose, on the v13
> default table, where 0x04 is not listed. That is the state of every
> Bitland machine that has no entry yet: the TM2424 before patch 1, the
> TM2107 before Matias' patch, and whatever model comes next. On those,
> the aborted suspend is what users hit first. Before I knew the mode
> values, logind retried the suspend every 15 seconds with the lid
> closed, and the laptop drained about 40 Wh in one night.

This is a good point, so

Reviewed-by: Mingyou Chen <qby140326@gmail.com>
>> Is there another no_set (for read only) profile entry for the
>> performance profile?
> No. GET only ever returned 0x02, 0x03, 0x04, 0x09 and 0x0a here, and
> all five are in the table.
>
> So patch 2 does not hide a problem on this machine. On a machine
> without an entry it keeps suspend working, and the "Failed to save
> platform profile" warning still shows that the table needs an entry.
>
> Thanks for the review of patch 1.
>
> Chris
