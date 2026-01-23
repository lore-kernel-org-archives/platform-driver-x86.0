Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A18D2C11C9
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Jan 2026 19:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769196948; cv=none; b=SyaD+gnkwLsJNn55wRtf9pZcU5jFoYbM8aRyfHaXPUelzs3xme2K17EkmbT0QkPMsCq3Nx1cbHBmAtixL0SSESkBSCscOwu+zAM4tFZwex40VwB39PmP3wgW3fPVjeZnsSxPFhcIxhmJyA6OQkPfAXhsG6mbREuRWs7ED0o6JLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769196948; c=relaxed/simple;
	bh=5ThLMQP2HgdP1hB4U2sK4oFSx5CPMB5GmUtYPjwJqxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+3LCCJjmfpd+wd3hihM3Ris1IKKvCmfzFtdKGYHNjnTQNmc8mEhanvK/P4a3/qUHcUrj/yVaRfVdDk7stFw75mZOHZx7nuAsE9fGjQQ2Q0PFZUWBX2N91o3WLkZ0en5wdwoT/gPAUcN4bm37f6kf0O/CTUP4IkLWj5lv/sXUyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl; spf=pass smtp.mailfrom=vdwaa.nl; dkim=pass (2048-bit key) header.d=vdwaa.nl header.i=@vdwaa.nl header.b=hcIvvBol; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Jmnw3zmR; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vdwaa.nl header.i=@vdwaa.nl header.b="hcIvvBol";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Jmnw3zmR"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AED287A0181;
	Fri, 23 Jan 2026 14:35:43 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 23 Jan 2026 14:35:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdwaa.nl; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1769196943;
	 x=1769283343; bh=V7DHwlu1iGnNZAxrqrLdXliZMADsxRJdslxNrIW9Ads=; b=
	hcIvvBolYGDfiMP7jSV3mz2gFTsOff0aTNAD29ZiCN5OqrjmhxYGxYgCUyGxpkVl
	5ls6oaHm1zlDHr8yryGoJ3Zi1FurWOyZx3F4UKL0uFvyWIhi7S3fGO8s7xQZ+v0R
	VRvBFvUUWPhCpFSZOwMUnbeFSusE092m1Pl8DJxYwBIW7UIXfnsv/F1LZ+TuXHpr
	l+/VHyrOVb2Z0KNbJ31xmhWsMFEJf0C4qVg182MfTLS/uWmFxy87j84acb05ifPw
	ojXPiw06SfvOBTTu4Flws9mzCHIzgFPcpBiDDDO0KzKN5Y0alf9gvQd6NOl4X1NX
	BEFQ4aqdai6dLc6G1hAuRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769196943; x=
	1769283343; bh=V7DHwlu1iGnNZAxrqrLdXliZMADsxRJdslxNrIW9Ads=; b=J
	mnw3zmRYAOsaAaos5zsrK0lAG6YK+4oXZChi4hbD9WyLJpwHs9VhwU0TQ64A5t/X
	Idcwe4MMKeWYNm0jDNNgz7o2TTQ8VW9QJPTmk1P9wcfz8XdHi5LiKDBGsfT00EFc
	5KOJzOOB++JEKvf4eskTNqPx80RdKmrdatZwfq6VPKiOWVMzp6kxxzAPCmjEABz8
	Efa36o6g/lksxe9s5SbmpgoFOcywe1RpDcZa3OkWFlA+9lX+gdjx0kkzdNlMX9YE
	aJ9zvfHYs4LOnKmFlMNFUMJWMj31561OXFzQeJceUjA9VLNTmVoF/+n7t0FHu0iS
	ki9mbqq9OEh1y9ds4JGhA==
X-ME-Sender: <xms:js1zaaOZqGEMtQTIx6Ub-Rs4HcbZSdzqDb2Lvu3jmBrsaLId6BWl_w>
    <xme:js1zaacGt5D4PPMafwjBjvvIUB13cy6Lp-8ThYOAoZRPf-p8I-7WehxS7vEx4VoUR
    JRsRL_Ak4idjSv6Kfo7RRlDfIt1Z5R7AUOI2cmwq9hkx7z8TRBT9YbL>
X-ME-Received: <xmr:js1zaRWc8TYUE3s2M0iepTqOEvvpqsNig0Jw94q6TFEXPCyOR2XuJDef9f-CMPI01GkF6E8ugDHLC-e620DooISzHFT05w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeelkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeflvghllhgv
    uchvrghnucguvghrucghrggruceojhgvlhhlvgesvhgufigrrgdrnhhlqeenucggtffrrg
    htthgvrhhnpeeukedvudekkefgvdeljeefudevtdehhfejvddtleehveefjeffteffleet
    ffejhfenucffohhmrghinheprggtvghrrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhgvlhhlvgesvhgufigrrgdrnhhlpdhnsggp
    rhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeifpggrrhhmih
    hnsehgmhigrdguvgdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpd
    hrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehfrhgvuggvrhhikheshhgrrhifrghthhdrnhgrmh
    gv
X-ME-Proxy: <xmx:js1zaaiscpT0AB135kF1ww5bkkxzPcVMK6Dr3E8OHnmv7p_RwPbA_g>
    <xmx:js1zaY-7C21mKsgKB7Ed7Jzx1XonjAYRM10INUWVW8Y2LqCeok8UbQ>
    <xmx:js1zaUaXxtmjIU9snnI7yKaYoyzMtUMGz8a7lLpSVOxdfrLdsfuPhg>
    <xmx:js1zaX2nwpbFOAkZHRKKX0bnop9wnXx3O8bj6I7FL8krD9qHOLZVBA>
    <xmx:j81zaSJ8VR_xUPK-2HpA88Mcio5faEUaFYkD2Hb2LZkGknmv8Sdom98w>
Feedback-ID: i2d0446dd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jan 2026 14:35:42 -0500 (EST)
Message-ID: <c7fd5031-7837-4570-b804-b63a496b0961@vdwaa.nl>
Date: Fri, 23 Jan 2026 20:35:40 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] add Acer battery control driver
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Frederik Harwath <frederik@harwath.name>
References: <20260105171024.227758-1-jelle@vdwaa.nl>
 <90ba47db-fe4b-4f1e-aadf-160d44c6930c@gmx.de>
 <d6991fd3-21a2-467c-99a3-9742e70977d9@vdwaa.nl>
 <5dae062d-3e16-4c2c-80b7-45a2c713a93a@gmx.de>
Content-Language: en-US
From: Jelle van der Waa <jelle@vdwaa.nl>
Autocrypt: addr=jelle@vdwaa.nl;
 keydata= xsBNBE6QLAIBCAC3O6LmF+GKvOh7IV00TG+EKAQHAwjESnHGJOW58lKK7eAYn62ZM1uy0+6h
 yCMu5PD7+ND6U1gcgTTHYwNK8AaJt7yY4FRssgdcJk59uJBwROZtllotClJ893CuB6Wgr68b
 07gIRbENYrB8rEoGfpUG//8/ep7sY8PS03jnFb4ll6mPlUE2oQVdYOlXgF4f9qkkIi4SQeE2
 MTuERaOrDuUNDlroJ7Yfx3J/rL5Qjn578/TKCAxg0pns6VIA/P9spRGmLhT4zP+OxZXeSZme
 IxcwFdJJXHr4oGaZvqe1yHlMmKR98rrIfPWhkw2Ls/XIZIxf6prT0XyczbzBnC2y1JyNABEB
 AAHNIkplbGxlIHZhbiBkZXIgV2FhIDxqZWxsZUB2ZHdhYS5ubD7CwHsEEwECACUCGwMGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheABQJUX8WhAhkBAAoJEMBghjN8UHc+mFwH/jjN+Qob4O36
 YiieajRwVLGuYdUDt9Z655oQYU8V4qbWf2tjUtqTYXrxLnaY6xQoYouRz9yFbh9dIKZb67ir
 7AeVgCOtWVesGxAlGH6EY5JBZcsN0v0ScsivqQAv/Mv+4HK+XM57YlyRagD8tkprYskioWHg
 OwQfXAO6nlm4BJHWO9bHJUMgiGs7I190IKQG7iLBnJuGjsOFuy5KTLpnv+w7twmz0H+pkUPe
 jVHfJlJWdN4v1PigpgpjOR6ZepSIggMk7dHsa6GNLUOzi61yYVFe60+EGXhwyJIqSt56a4oR
 jMUcXaOugGr+JwC8Eq7Pg2+aFk+8fbe0oUzZJucHGnDOwE0ETpAsAgEIAK4Usb7B00WRxCZG
 HtM973F7V4OhOKv4kZKduxtu71bVUZsTuzn4h+m8guJ51uY/I2icUrN9gJG5aEzRqPuQi2L7
 KmZUjs3pscZWgUgiT8UZFDR6RuQ4k3CcWobsRCjYZdSblSZ8ccrLJE7xSbwKMXjAh2PEiaQT
 lS6wQbn6mHv4y3H9QVHs7+jXbmfHCxnVcwLqRmpuegSmezDaL5TlSc102voiXinhrWEZUvAB
 KDh6VuJ/60Y6zelCXVsEjRaApz90iXY1nifLhkHM8B2wG7Pum3V3X0Y0QTVD+z3EL1iq5mFu
 epKp//IOeeJN5iwHcRSJGy2s1oOzjRDyPv6v1AUAEQEAAcLAXwQYAQIACQUCTpAsAgIbDAAK
 CRDAYIYzfFB3PvDuB/0dI13hSYHW27c2Rq8BaGbIhXYYETtPD5B25/P1JJ5OQZkPmVq+vSHw
 uzUaDZHy3ZcwE+xFXzlkwXGdWos07JUGo74zV3HfeZxVEPv0HB9ACqQVU/JKjLZNj2SfhgzL
 4F+O4Zgdsf0YaZG09F5PbMvbhoCZLfAaKWz/4fLEfhrDJLhrphUyPDXosn0UxPkDv0iiixn4
 V+bEZ5/wd8dRWi58R/iND+gRGsBREm5SpzdhnsarwoX6YdsQ449379enDNUN7jV4C3Gkon2s
 VwI2ZZbS10cY8rFSAV/CJA2E9daRoz40DI0tgXgLBAVhy7y5HWZJsDZexU0HFKJfkDi7RUPj
In-Reply-To: <5dae062d-3e16-4c2c-80b7-45a2c713a93a@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/19/26 22:19, Armin Wolf wrote:
> Am 19.01.26 um 21:23 schrieb Jelle van der Waa:
> 
>> On 1/8/26 14:52, Armin Wolf wrote:
>>> Am 05.01.26 um 18:10 schrieb Jelle van der Waa:
>>>
>>>> This patch upstreams a part of the out of tree acer wmi battery
>>>> specifically the battery charge control and battery temperature. [1]
>>>> On my Acer Aspire A315-510P battery calibration did not work as 
>>>> expected
>>>> so for now this is left out.
>>>
>>> Nice work. There are some issues with this patch but nothing too 
>>> serious.
>>> Can you tell me more about the calibration mode issue on your device?
>>
>> Thanks for the review and sorry for the slow response. When I enabled 
>> the calibration mode on my device the device started to charge but 
>> never discharged successfully. I want to take a bit more time to 
>> investigate this properly. On my thinkpad device enabling calibration 
>> mode discharges the laptop till ~ 0% and then switches over to AC power.
> 
> I see. Maybe the battery is first trying to reach 100% charge before 
> starting to discharge:
> 
> https://community.acer.com/en/discussion/688985/how-to-perform-battery- 
> calibration-from-the-acer-care-center-in-predator-helios-neo-16
> 
> But if you want to do a bit more research before adding support for 
> battery calibration then this is totally fine.

Thanks for this pointer, I tested this again this week and it indeed 
charges, discharges and charges again. I haven't verified if the bios 
shows any difference.

So my plan is to send v2 with calibration support included.

Thanks,

Jelle van der Waa
