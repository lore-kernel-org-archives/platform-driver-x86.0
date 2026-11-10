Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.237
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322280;
	b=QQuTU+XLNPBrXR0pwYf5O3R3a4PVGgSyRpp1NmXh08R98vhwDtZqRYzGkI4MC2LsyLEQ
	 MPFXdOzYQTpwOckod4aByg/NFmqe2euj6+b7MRHpn3SmyDLLu0sM42Y5hzxWOUVMSi5Kq
	 SpCIFpC+1jXcroq8/Y3nLN8XtnzXsC4MSK9qy8Khw5AVGHeee5YTeueZaJZtVrntsCjCG
	 0LTRNVvNvlRSt/jUrJIKZ/r3r6rTtFV1GNM4MCcTjbnQBTbXTKHLIeoDn7cmk9ge2WmF7
	 OFHME9TuO8o/fzwkxx/d9PuOywEVPYxKSA+mKyT3jOoXlMjHy4EB9K8H7iasPGkuU1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322280;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Message-ID:In-Reply-To:
	 References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Correlation-ID;
	bh=Z2QrvPckdTqXqF6b/Y1BwCWMJS5W366ELwtDeHCqB1w=;
	b=cDf+lGVzvGkRWbs8TuxBgAlg9AdUPDNF6QmV3QciRfMzi0RD5nCxnAE/lNfw14hIZnJV
	 ANzELmG98XhUDq2zmQmSJqbQyePq4I1IpUrr0ucr3Tl+W0yqW259oBWepAAOGYDntO4iP
	 w/9+fbZzTOAfRbDFLktndf3ZIhx2zoehADi2TbB4StwwkKzhkV2BSAdV6WL7Muczy5DbD
	 XmXOmi6cvyx3kODCzjCl2KWIpvEY5LuRmScjkGukHp8BrnbQ1MNK3P//UzkspKVsV1xCF
	 0uX8AZpJADplRIVZCz3vBVRWvVJWCfWa6acnVeG8apCJ9WdSnl+KWVMOwwOP1MQk/mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GGgr+l6Z;
	arc=none smtp.remote-ip=95.215.58.237
Received: from mta1.migadu.com (out-237.mta1.migadu.com [95.215.58.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67328606A331
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 14:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67328606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GGgr+l6Z
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Z2QrvPckdTqXqF6b/Y1BwCWMJS5W366ELwtDeHCqB1w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794322276; v=1; x=1794927076;
 b=GGgr+l6ZErWOktyZEDOq5o5KKIK9zJkoRpK/VQFQwJcFHmE9WDxd2uwdt1UlHF22Fa015JUo
 j4DVwZQEhKT9dk7WKxtfae4i9tpFdHy+NPwlaY9LoZKftUkARkFTV8ZXh0ZmOxfcQZVkZZXl/T2
 vE/0YduPof98VboLSjyIhpTA=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bfcc651048cbffce;
	Tue, 10 Nov 2026 14:51:16 +0000
X-Mizu-Trace-ID: bfcc651048cbffce
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 15:51:02 +0100
From: Denis Benato <denis.benato@linux.dev>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Chipang Kao <prozac2734@gmail.com>, W_Armin@gmx.de, chipang_kao@asus.com,
	corentin.chary@gmail.com, hansg@kernel.org,
	linux-kernel@vger.kernel.org, luke@ljones.dev,
	platform-driver-x86@vger.kernel.org, scardracs@disroot.org
Message-ID: <e91e759b-d9ff-403c-a968-6fd19ca8707d@linux.dev>
In-Reply-To: <179432207917.2180.5316107179972885113.b4-ty@b4>
References: <20261110065630.270276-1-chipang_kao@asus.com> <179432207917.2180.5316107179972885113.b4-ty@b4>
Subject: Re: [PATCH v6] platform/asus: Move ASUS platform drivers out of
 drivers/platform/x86
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <e91e759b-d9ff-403c-a968-6fd19ca8707d@linux.dev>

10 nov 2026 15:48:16 Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>:

> On Tue, 10 Nov 2026 14:56:28 +0800, Chipang Kao wrote:
>
>> ASUS WMI and related platform drivers currently reside under
>> drivers/platform/x86/. However, with the emergence of ARM64 devices
>> utilizing ACPI WMI interfaces, maintaining these drivers exclusively
>> under x86 creates unnecessary architectural restrictions and Kconfig
>> duplications.
>>
>> To allow non-x86 architectures (such as ARM64) to select and build
>> the applicable ASUS platform drivers:
>> 1. Relocate all ASUS platform drivers and headers from
>> =C2=A0=C2=A0 drivers/platform/x86/ to drivers/platform/asus/.
>> 2. Create dedicated Kconfig and Makefile under drivers/platform/asus/.
>> 3. Update drivers/platform/x86/Kconfig to remove duplicated entries.
>>
>> [...]
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
>
> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent cycle or is clearly a regression
> fix.
>

Hi Ilpo,

v5 was resent without my reviewed-by, can you please add it back? Thank you=
.


> The list of commits applied:
> [1/1] platform/asus: Move ASUS platform drivers out of drivers/platform/x=
86
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 commit: 6e3b727ff3115a4f870bdcfafc3f6827c2=
d36676
>
> --
> i.

