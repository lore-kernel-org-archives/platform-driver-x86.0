Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398225;
	b=TOOAo4OwfWeQg8r2NI5bgblPSfnKXDJQoC3XqV3YB6+cocTiEVO/z4/uX8LmZrG/H7uK
	 FLRVQYYSg+F+nMFc+ECXb8aAbrlqTZEgz0ehFiomj3NEWwQWXzs3g9ZEgOcscwvtlYbDU
	 wcpBXwTxSKfy9vvUaxMPMyFf1zj3tXFZCHTcBejoRKgMVbSCiHmAHMn6jSDVuXbPSUr9y
	 znzNP7J1vbsPy7O9Jk4pfqBVdl4L6x85e91CbPB6Q4+O8Lq4gwWE7rpCfgjVKBHqrwhWM
	 QnFTBknuJlcZUPgMJPXICpLd27ASCxtt1M3/6cyP3RGqG0pV7tNXn4zK3hoo5ZImATA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=yYwVfjz75ut/AcgKweAfY5wR+RPlJVoxdZQtXPiJQlg=;
	b=qwhbm2QH54QC42F28OxsyLxpOnxGIMfk+uD+hWjLI8ZK+SIt9GKsFC34vmnkbITj75R7
	 XgH9Gx8EFH2nl+UzlY4Vb6XFxvqraCuhODU+eF8IfXLEzEJujSe3qZibEbzE/pw5eL9LX
	 Ys3mEBXDMYn3pzIwF1SgeTNHiwbnA8+iqTm9R7LLpgyM/JjZIPS9LKoiqtXb0qJiKFlLz
	 jHAlI1aQGsDCLLu7WAA2nJh8Iz11jgjWIR1UZ2m6kEmv7QUOqPYzU8hZNVyk4i2He60dj
	 7nPIBP3S1ulgGaerRrLAz15dsKYgeVI/HXyKrxAAl0UsElpMp7zLz7haErVlIwUIMcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GkBrgYTt;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3931A60A260A
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 11:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3931A60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GkBrgYTt
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso1059300a91.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 03:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794398224; x=1795003024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yYwVfjz75ut/AcgKweAfY5wR+RPlJVoxdZQtXPiJQlg=;
        b=GkBrgYTtU7u6UHv/UTwUFEB7spVdRbABy3BBTOoh+EAAn5uFaxfdZpiN7rnAsP36d6
         kuur1B1ucK+k8UU4t2RI92BK7QcCfZM5eIvgbHcE17kH1aIfq3LRh3AFs1u45bxNC/rz
         aIq7dtzcqPtzvvpFdlOszGYh/nEwoDwxsmTewBNC6+Eee3OAQJlac3ZWlwyWZEYzDMJo
         Ts3Pcdk63y0ep3rM0esVLWVOwB0Hx3/kCqwayb3VLI/1o0gbMpmV4oshKoZPSA8iLDzu
         +w7EPt+wjF6nzUoyDZDmOPPyKHLmTxgTEoJtie9fMRM45FaWKE6jXHEuQlx51VYHyaUZ
         MjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398224; x=1795003024;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYwVfjz75ut/AcgKweAfY5wR+RPlJVoxdZQtXPiJQlg=;
        b=DGEYe7oyiO9dfXDxntU6VzSlCPZLkpR+4VeJxAfLUdoR6LPHSC0Ottd79v3LeZ7PM8
         My4vqeL+Kna2H8zjbdsO8R0Ft09GxaChW09MAqZ+ObIxBpPOUtw+3K8Nezy/3WErhh/Q
         QXG1Vs91hDyp6SDFZXOGzArw6MkZY7kOh8+khHaDB8yaViDO+U5JODDwNozyIz7qeSYt
         lREbMyWC/HS/KyP1+aLT9sRbwIjppYQKT7091Hxnjot6ULYR4auWTwkEbVremM5jZXpi
         CVeWHPvF48DqZZ3MMWQrer7qV2rG22TYg/0+cSi70zyrYlC5FGCr4M5jh8J1HXCAUVpT
         Z5dA==
X-Gm-Message-State: APuU4Z95lLF19VvRgtx55KS3N/JT6FkYUKSoQgL+DB4WfFP85BikJrE8
	mOIlVXueJEeWTLqf45APtZ1TuAEXudRRaPmL9PFiQeEFYjl5BMmWJPBT
X-Gm-Gg: AYBFou0oxQrwkUAU35j8P0BGihG3YrJMNPesEddbvTr5EkzkCpDz64xVlI9NPPpITeQ
	w8U6ywhGdzfu8UP8AbzQnVTLwnMfILt4vEb9YHefkBRZ75wG6XJ07pzaLrBc98llmBbPtMTrsHa
	lTgmJbcWUXV+5M9FjflCO7zkFb/QObQZxU54H8u6ohLdY1KnjqeoDl3rIgMcdOYJ0RZviDdpNg3
	IkzgCnOn92rCcLG1kqfGeMPjRiV1o+pBXSaWnAaW7T/JsQclC878TmwDbx/3L/lwzuhykmTmeko
	ADE0MYNw8qTFPvG/8XO4c4jlV3hJZmDOANRXiDWQRWtbXZOcV52pfSyIPFO/jYDSt4NX73QJVTZ
	XaS8Z4KpN/qIW4GHTTGDpxYTE6J+j47y+OG6xFhxxqWAnLrvcwliEBWrumdDeovy60V3SrTWcOA
	YFGUqfLJ6nWY/3tP/EqnghXSD88rPMRsticLM/i5MUAfFUoShPc5XEYpG4jLOWCxy87SIGaO2QI
	gHLImce+V0QmEDAKIdt9hGuOZyRVSk9DdV9Ug/CGRTtMLWt+eOJiosBNig8BARdL0MmTU65CyO1
	Drq3DPxv6yyaPc6wCt//BJx/x5Kgv/FmIMua4ESkpgUsSx0uuA==
X-Received: by 2002:a17:90b:4c4c:b0:3b0:e2a9:3466 with SMTP id 98e67ed59e1d1-3b182eebe65mr2137944a91.16.1794398224505;
        Wed, 11 Nov 2026 03:57:04 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:a3fa:5561:c74e:50a4? ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e1f88casm4108769a91.12.2026.11.11.03.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 03:57:03 -0800 (PST)
Message-ID: <49e43ccd-fa28-44a0-9e8d-554868d0585e@gmail.com>
Date: Wed, 11 Nov 2026 19:56:58 +0800
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
Subject: Re: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles
 cannot be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: Oleg Rybalov <rybalov.oleg.dev@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 regressions@leemhuis.info, regressions@lists.linux.dev,
 shlyapugin@gmail.com, Musaev Ibragim <atomicus.xyz@gmail.com>
References: <CA+Kibh6FHk-QgmPsi4spmQ5MHGvt05xYHuRiiMMQdPP+31Z70A@mail.gmail.com>
 <f718e7cd-24f1-428b-b9f7-28bb1a923a11@gmail.com>
 <CA+Kibh6T9tPKwhSF2X5Jwoo8OUoieypuAyM4GBKVujUDWgpr-g@mail.gmail.com>
 <08e0f238-4330-418b-ae3b-fa7ce0f6ef62@gmail.com>
 <CA+Kibh4GtWjz97Fnxa3n8-B9+dTtcG5oPtn8b3HvcpUcR3Su_Q@mail.gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CA+Kibh4GtWjz97Fnxa3n8-B9+dTtcG5oPtn8b3HvcpUcR3Su_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 04:35, Oleg Rybalov wrote:
> Follow-up with what I found while testing, and a correction.
>
> [...]
>
> Not covered: the address comes from BIOS RMAPH5B0P0909 only;
> profile_get returns an error if STNM is outside 1..3.
>
> Cc'ing Musaev Ibragim, who tested the Redmibook side of this series on
> the same board and BIOS in July.

Please send your patch with git send-email.

https://git-send-email.io

