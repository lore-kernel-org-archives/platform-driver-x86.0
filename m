Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792814504;
	b=laJ8u/SEN8rfykL/4PtTS446GIQw6uMDBeO6WeMPdJ0IIjL0d/q0rOFR720QfnuSnd5t
	 LaBeNrJTqElqHARrulmaXryJrM85BylX8ly+BlMgDZ6a17OHjs99d72He5xnPQxLA95us
	 CXffQzZPPdvl5MorR5sIRAJxUVrndPmCvGxQiYHvTzxgNRV+x7ZW6a4Nso/4d/zaWW+Oc
	 /dNLjvtvWr4NuUnKD718Zj/NtaDBoxe2JsZ8sugBdfBLwa7unMNO3X7TVHc6LtF/LRpJj
	 LhqWJ0WctjF4US7BkhDH6uOppxAgAjeo8gEpXjVtqytuyjxLkeEeM4GfgW8F91ZPrHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792814504;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=mp0eHvDYUCUbR4qMDj39s0a9SOwwSqfcFq4VcI5fipY=;
	b=QNmKU9Sztqlzic9MnDJVKrj6Xlpt0BY+5oO+MYZvY8D++/CL8bN4cLN4EhUU6djWOiuJ
	 yYldv99MFoNejGgLAj/z1uTWgEwP3mxuAKaAErYH3KBFza3rH5NtqafOystHXovT11ycN
	 fs9jEZgOL0D7tPwK7ulrtAU4guDMXiR9RjAGADEN+3dldcnYbCBpQHS8KXv/X2iOoNQdA
	 C4d59BFOXy1VscYa+42/z5yW5FYwNeP0cvZ0oQMxxh1KjbmoSptBy0uAScD7a6ctVvhTB
	 E2CKKLWMq9oI1zJSb9m2cR0L4wcoGZLvfiMPzjUd47HPYQrPpOTR7Do+1O3uY+0j9fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=br5C7TPv;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2C3606A31A
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 04:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD2C3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=br5C7TPv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792814500; x=1793419300; i=w_armin@gmx.de;
	bh=mp0eHvDYUCUbR4qMDj39s0a9SOwwSqfcFq4VcI5fipY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=br5C7TPvhQ/zTePq07LoSPPvxpax/EvEVLOYru+FC2fk8R4QYmmoKvfzLIwIhuoZ
	 5OwaA8STxU+ekO6qD4GduZHt89N7pITqv/Ione/l6aE7rF1YEtBpX+KtUfIIpD4S7
	 +/b6b2bH9SpowW78BNwRReThbpYdx9mZQiSkXkuG2MXaB0ZHPer9vjLd251iKr9G7
	 JmudtlHvbrmVNsNWUDL73mAN5wOZk+DvD1hgLMH0C4jCEMKNDzSIeLosn5RLkrrOr
	 YZ2C9Z9yBVsIcREfgK21eUHXT0BOtT8ym/Pr7NFK7RjGyXH/zdLomZkJ+yYdd9qIm
	 RX00uE4quJc264Itlg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Hdw-1xIoG62uXy-00CepP; Sat, 24
 Oct 2026 06:01:40 +0200
Message-ID: <e46ea453-5a56-4009-8b33-900166345905@gmx.de>
Date: Sat, 24 Oct 2026 06:01:39 +0200
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
Subject: Re: [REGRESSION] hp_bioscfg causes boot failure on model HP Laptop
 15-bs1xx
To: Julien <julien82453@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: regressions@lists.linux.dev, jorge.lopez2@hp.com
References: <CAJOGg3x1KWjXrMpXoCDEMAV10i4Utk8E+hoJx7UW6Lr3uDkbEA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAJOGg3x1KWjXrMpXoCDEMAV10i4Utk8E+hoJx7UW6Lr3uDkbEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VPfBtPskUbhTecWqI+6dDY+KYA6B4d4Nr8ADZ4bQ2+o0o++fGY9
 ggdI2qkkeIgN1ra3REKAIxx1ZDqFP9zbtaSmsiT4Z8dXZEqR6NmVTBfQIr2G1YfKmwMJc+d
 0M/bWwcfZpDb2hJ7Y7N+QRAoeJ+f/ntFp6ThLyrnTLzSjk8SoHzldrDNzrFIdT6wgWjUdrM
 PEce5UG/6xxjKXtnXsFbg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WjbpYBv7YL8=;Q5D9KU3iApOnJyR4Pv8q6X/E9Vn
 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

Am 22.10.26 um 16:29 schrieb Julien:
> Since commit 467d4afc6caa ("platform/x86: hp-bioscfg: Fix automatic
> module loading"), the hp_bioscfg module is automatically loaded on HP
> Laptop 15-bs1xx.
>=20
> This module causes the system to hang during boot. Blacklisting
> hp_bioscfg allows the laptop to boot successfully.
>=20
> Sometimes the screen will go black but there is no kernel panic
> screen. When I get to see logs, there are no messages related to
> hp-bioscfg. I suspect the system crashes before it can display them
> because on a normal boot the next message I would see is "Module
> hp_bioscfg is blacklisted".
>=20
> I think the hp_bioscfg module should be disable on this hp model until
> a fix can be found.
>=20
> #regzbot introduced: 467d4afc6caa
>=20

What happens when you load the module manually after booting the system?
Does dmesg contains any interesting messages in this case?

Thanks,
Armin Wolf
