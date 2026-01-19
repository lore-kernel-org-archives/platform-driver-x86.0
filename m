Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44AF2ED15D
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jan 2026 20:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768854198; cv=none; b=Au7AjxLiFhYFUk1v7MOltRDMEliDJtIRaozNIaP7aStBajq/rTl5PWPqF95bLrwhjegeGZisxQFAgR+X+G4uJAO9AerFa5OFEHbJbLo3nEgr7Mgle93JaqN4sDzCqswiotjYgkKyuJuksMSwuvFqBjuPk6XFWLTBolJ76oxMAaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768854198; c=relaxed/simple;
	bh=n/jb49OY9R2S80JQO3ZaIBCNkQzzVzM8eLNoe2sL3Bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XF9nVechtOxhtsc+yu5xhw9TScNyHHRKb2W1ereo+WxIuOEznf64hdviKYukqvDNAPDRJwHKPwbv3ZS3OUMDGvuN/wyxp1GYCWxFJnnhZlJmXmPeuaMVhxclmTHFZ6/YXUd69yFofu0w1db4Fr3zYW+TCek2eiVYMJxS3s+YVgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl; spf=pass smtp.mailfrom=vdwaa.nl; dkim=pass (2048-bit key) header.d=vdwaa.nl header.i=@vdwaa.nl header.b=QF798XhN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Jyx8hdTc; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vdwaa.nl header.i=@vdwaa.nl header.b="QF798XhN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Jyx8hdTc"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 878CAEC0070;
	Mon, 19 Jan 2026 15:23:14 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 19 Jan 2026 15:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdwaa.nl; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1768854194;
	 x=1768940594; bh=86vOLFDEsniKZERYsWKI6hTgBvsNJnvNYt105iuOlk4=; b=
	QF798XhNIrNBfhWnqG9iM7E9xb+d5MMVa4Z/daXCiQkFYIXr2XVl+HpKqdrslwNR
	nf0r0Js8Ku/k0jKjJuy5K5JILCOQ72uBhdzqpwl+gUATdEYI513NeHtjTjRLqwqC
	Zjm2NfFN4PgJg+uNahsBFv5IxYIJ5Vk8ohjB9LcXnbDt8caHwvZGRxWokeQ3NXB9
	uiHgt5+tTrSS3ptXKxs3Vq9ykAR4rUpS2k3T1LaOHL4NlWmEBYvM70VOU3pY718g
	9K19ZpS6axQpN7bySdPNBtABBL4E6AyCrRE54z1jQMdyE3CdqqQecv7zoAsNdDl+
	vUjN7Bojk/55IBtiqGKL9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768854194; x=
	1768940594; bh=86vOLFDEsniKZERYsWKI6hTgBvsNJnvNYt105iuOlk4=; b=J
	yx8hdTcKV7STPfVB0ZDuKiaB2nP2mI0Iyr+jimocyA/aObRZV3W8GeIQZwNrdcRg
	dHSvj2C01XnU8ViCLLxKNr/ECWNM4fnFBMDpzrq81H6NAjnVYHOaFsXzry5i6IO4
	1j+XN36h+mg7q12IfwaTnQbdLHIF38gN5lHS7vQtNFtPn3q2IOvZW6FVw1WyEuM5
	9nHGxO0VzeTl28Zvu9YQHN4nhsGmKDhgFQEdPKWDVTOyOsv69r8vGp+5FkfweTkW
	rK0pz1kkO7j7J/hB4W7pJENkiIJLbAtY0VuE2MtZ/RqWQiQA9Fyqd208hB213nHx
	FWEuuGwGjXzph0TKUVKtg==
X-ME-Sender: <xms:sZJuaTxayAPAARNzN8bveTD8xXxyy-02sIer__QOAEN4jBoVW9GUpQ>
    <xme:sZJuacx9UVp_44S0erz5VgfQ381EmQ6gmJqo041XyMkqmEJIDLpCaujWugF3mEcS_
    _f_Pr4ndbxL8GPN3eTdbn0JtCDThrxNd0ZDshyB641UGiltNX-BF3Jv>
X-ME-Received: <xmr:sZJuadaU3cCARkAMZ4F7Dj_sSTaq1tNUSXlrciiMTyJPVZdexyAYxzgoCOT7a6K_vfWn-vHIryc2GJeFosowsdUfUE_80A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeekheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeflvghllhgv
    uchvrghnucguvghrucghrggruceojhgvlhhlvgesvhgufigrrgdrnhhlqeenucggtffrrg
    htthgvrhhnpeeugedtgfevleefvddvkedtfffghfejjedttdffvddvudfhheetueefgfdv
    teejgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hjvghllhgvsehvugifrggrrdhnlhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtohepfigprghrmhhinhesghhmgidruggvpdhrtghpthhtohephh
    grnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhinhgv
    nheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehplhgrthhfohhrmhdqug
    hrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhr
    vgguvghrihhksehhrghrfigrthhhrdhnrghmvg
X-ME-Proxy: <xmx:sZJuadX8VP_pTHwoNA1D4P5ywpRpGzk1cEycVdfneBzU8eBJAGyuSg>
    <xmx:sZJuabhM7DLHuERjwEeQT_6j4QurkkiEzhhQc5LCkECuqDCMp97Vag>
    <xmx:sZJuabs7mzzHhckZGASnnF41ihITKXjVZAPbId3E2XhBlFJz_xl0zA>
    <xmx:sZJuaU7L6chdo7qJgurBH196e7lpJ1hpCCBsp2V09qja9e0RANTTEQ>
    <xmx:spJuafjnHnn68PmfzTmtyxWxhXN4skEsJtLF8MgIc08QsskWN8i2uG9L>
Feedback-ID: i2d0446dd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jan 2026 15:23:13 -0500 (EST)
Message-ID: <d6991fd3-21a2-467c-99a3-9742e70977d9@vdwaa.nl>
Date: Mon, 19 Jan 2026 21:23:10 +0100
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
In-Reply-To: <90ba47db-fe4b-4f1e-aadf-160d44c6930c@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/26 14:52, Armin Wolf wrote:
> Am 05.01.26 um 18:10 schrieb Jelle van der Waa:
> 
>> This patch upstreams a part of the out of tree acer wmi battery
>> specifically the battery charge control and battery temperature. [1]
>> On my Acer Aspire A315-510P battery calibration did not work as expected
>> so for now this is left out.
> 
> Nice work. There are some issues with this patch but nothing too serious.
> Can you tell me more about the calibration mode issue on your device?

Thanks for the review and sorry for the slow response. When I enabled 
the calibration mode on my device the device started to charge but never 
discharged successfully. I want to take a bit more time to investigate 
this properly. On my thinkpad device enabling calibration mode 
discharges the laptop till ~ 0% and then switches over to AC power.

Greetings,

Jelle van der Waa
