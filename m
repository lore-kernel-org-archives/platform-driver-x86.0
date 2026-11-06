Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977530;
	b=huibV4O97+g/cAUlg5dp7OH8onbg6F1DUoq9yU7ab7DFkgg6Y2n1rAomlJuIDqDje7rj
	 sF+atoZSe7dhuqQytr4jWzEpxlX9zXN8WiJJywjEdl7hKXLmC77AGRP+o1m2jYm18qAmH
	 mL0EwEoTIQRB+h/bBt0Aeeqg9pVRS1FpSHlsyNN4D6QF0p87vTcNpQ1BidDgHEDsq4I74
	 SVqIELqLCsScD+iCVDOC+ODBHOGFLCAtHSCuIBsAbsWrDIGQXnB0Sx3PTiP6Uffvjpgc5
	 lbVz5s2mXsFfCl7+2SiMnkC7oAr18EfqEmMzYpcOUW2hwhPKx7WoRzhXAy05w54zf9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WH5PAzwhIipOT/tQlM1/37pKGDYk3490K38z0vD3v0I=;
	b=3SCUWBqHykkuqguMAFT52HTPrKnhpcwjdAclYA3jOn+hMfOPUCETBtaW6emMMvBwuY5l
	 dc/403O8A4pNJ79mLrfTIgEWKalL28xIbcTV10bty2XIGx+SwymmX/tMndM+hLb/R27vM
	 VWNtQhygAa+U5zB92ebqfZfMjXk/dZGVy2ZOkkAL4cP89+Hd+dXGWgE9pfZd3+RdYLN+9
	 J8ImaX7QKqgCkevoFPC6hIOTswjVrprpnIdoD7aU9wXdujQ6Z+lHWLFl7sAaLofPIIgyn
	 dS4Cs3B0gxri7NQ4jsPLHiYL8+BtHhLnazSkGemiY/0l/bjW0MPeoBZbErv8Ten/eSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kx7TubHk;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876D1606A339
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 15:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 876D1606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kx7TubHk
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so474682a91.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Nov 2026 07:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793977530; x=1794582330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WH5PAzwhIipOT/tQlM1/37pKGDYk3490K38z0vD3v0I=;
        b=kx7TubHklvtCZ7E5nh7vfQ5sAJwZMBZckhG8KuQy+TstrTyum8jGg3qoQCPK6+Q1nb
         j8BxD3Q4RCS7Wwb2ybB9J3p7ZNIeRPrP2NpvHbvOJVrL0S3jlt6pIzzxXANUg4yeY7f9
         FOz5LZaFjcFJUe2cNFfqXNXpFcgc/RgFyUJeGvtx2U2rDERlMhGKEFykEZEJvdPWitDD
         teQ/4BBtY1tLFm3isB24yzjVH8Gc0beGyThen7HnRZ+3OBZ/8AGjUAi+x+1GZxfyfp7r
         FsCmWP1dtmsh+bHFihL3EnYSTgph/iL1TTPmfsZFXJT5Ql51/tx+eSFbn6GqWY2NanPd
         LkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977530; x=1794582330;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WH5PAzwhIipOT/tQlM1/37pKGDYk3490K38z0vD3v0I=;
        b=WJPvnYz/f8Tbo4fxIzX6k/8ho0uwHDFgu8r9r+nd7jPjY4rphRPwUp0K1MR9xbE+Ip
         xHfIDiI5arupzyaM84qaqesRtPkgIyuiqCzFpgekhnSizOzPu0xrp5Kbd7zIa6uSgHqn
         T67Tb7uA2QULB3G3oE5IlSBMhi66Qoe3B6yTmh1FArCBgh16QbY100PIuJaf/ezyWCp7
         Z2hisPs8QtpXldHEPDJkNZRt19sMP9jPoJ88F/93LICG11fSeYu3A60+8MEmM6lE+RC8
         YXtRBb5G1+hVfZ1+vuz1jpEHLy5fLXhZHPsBShQi3dKmJ1GQVHGp4LIlpEgnE/3xybk8
         0t6Q==
X-Forwarded-Encrypted: i=1; AL+hErHr8Ug7jjC1jnmVWmwOreM93VBKQSa+tGB5hWvCsl3R707D3HPzSzODJH+/24/Qmmdii2hLopJ/jvyZfKr1gv2F9+dW@vger.kernel.org
X-Gm-Message-State: APuU4Z/9A7wxiQhNl17sdBXarACS0mzgy63R0pphM5EqNxg5H/HQ7wxc
	lMYp+xOYRIP5T6lvqReW9gSdqVyU6YQhOvfmJpAiKV41vEV9tKb+qtYW
X-Gm-Gg: AYBFou0CvM7UExx5NJcu18/K9RN/wU+eqObOwvmIetpNQOjRCDjMZG83yVqfqOP7D76
	R9JSPnYY9AGHps6YWvOar0vI04eNgarSm7imOiHXIPMGgMsn0X8SYPr5TEZcRNWP7jbA26nNj+X
	x27JksjY+L/njMroY5IhTlXpbn2gPfEGDmVK04xfzHn7Cx2NSxt7oXJVOKNCZR3NI8BlTvT1dJZ
	vqYMmiTC4UTR11KDZD8uoPsEKjDLG4tNNHtPKP8TJf8SP1Txb4g45vm3B4kErnBCh/i6Ki7JmjV
	2wDX8VoGTDYvGjLnwrEwSHEXZewpJPZ35mU0HFYyG8R/PTpNSV+UcRU9/0+wEyr1dz7H3pwKKWu
	nEiqkM6fmOeJJMbcW3wYC0tgV2Fop2b8RDyMEUNnv/eRrqHRKHGnOIcSV8m0aTe3qSlfFrp89Ti
	h7KuMjvYxsZuEGkHYTDLaVAo8nfzefJZGPXMh1G4V08VVI/Exbsy/1fsiEgxwtuvjUjh5rvWezz
	6zhfUcVD7pXBHaMAgTbqn0GS+62dIQYS8JAhuuVv1VAZOIuBg3So0s5DDErhCDZ4TcVBZK3DgWL
	VVy7grW9FoyyOVQIMeDBvfwrce92zDab01beO9T2z1SBrqHEt58KC54MzdOp+1r7Zdi7z4Mpubn
	Hft8MrvhMAPT0Pg==
X-Received: by 2002:a17:90b:180d:b0:3b0:9deb:d990 with SMTP id 98e67ed59e1d1-3b0db6d93c5mr2662079a91.39.1793977529728;
        Fri, 06 Nov 2026 07:05:29 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:bfa8:849c:2010:a1c1? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc2775adsm95281a91.2.2026.11.06.07.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 07:05:29 -0800 (PST)
Message-ID: <78f9211c-3673-4c64-a1ce-8ea56ee13ae3@gmail.com>
Date: Fri, 6 Nov 2026 23:05:23 +0800
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
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Only expose kb_mode when
 it is supported
From: Mingyou Chen <qby140326@gmail.com>
To: Bozhen Peng <bozhenpeng93@gmail.com>,
 Anton Karasev <uselessfire@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 W_Armin@gmx.de, ilya.gladyshev@linux.dev, chris@miget.com, kento@kekto.ru,
 wolf109909@outlook.com, vlku.milos.fun@gmail.com, btx342@gmail.com,
 zsanya322@gmail.com, i@rsplwe.com, martiya.ar@gmail.com, nika@nikableh.moe
References: <20261008-bitland-kb-mode-v1-uselessfire@gmail.com>
 <b2b8aeee-08a5-479b-bac4-a38ac606a037@gmail.com>
 <da3a0f47-7e77-4bbb-a431-06c7ea6a78e3@gmail.com>
Content-Language: en-US
In-Reply-To: <da3a0f47-7e77-4bbb-a431-06c7ea6a78e3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/6/26 23:03, Mingyou Chen wrote:
> On 10/18/26 11:03, Bozhen Peng wrote:
>> Hi Anton,
>>
>> I tested your patch as posted on my MECHREVO WUJIE15 PRO
>> (WUJIE15 Series-HPT), using your stated for-next base:
>>
>> 98f039265e580291d5e76a11b2072541fbb1c393
>>
>> I booted the baseline and then the same kernel with only your patch
>> applied. On the baseline, kb_mode was present, but reading it returned
>> "Input/output error". With your patch, kb_mode was absent and I got:
>>
>>    kb_mode not supported (-5), hiding it
>>
>> The GET produces an ACPI AE_NOT_FOUND for HEC.LEDM on this machine.
>> With your patch, the probe still reports the ACPI error,
>> but kb_mode is correctly hidden.
>>
>> I cycled the keyboard backlight with Fn+F7 from off through levels
>> 1, 2 and 3, then back to off. All levels worked. During this check,
>> atkbd logged unknown scancode 0xf6 messages.
>>
>> This confirms the unsupported-kb_mode case on HPT. My keyboard backlight
>> is not RGB, so I didn't tested the supported RGB-mode case.
>>
>> Tested-by: Bozhen Peng <bozhenpeng93@gmail.com>
>>
>> Thanks,
>> Bozhen
>
> Hi,
>
> Sorry for the late reply.
>
> Attrs are not covered in this patch series.
>
> I might start a new patch series for this after the currently one is 
> merged.

Sorry about that, I replied to the wrong thread.

Please ignore this Email.

