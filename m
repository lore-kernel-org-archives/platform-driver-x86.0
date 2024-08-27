Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD7B3C08A
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Aug 2024 22:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724796438; cv=none; b=aeh5ePckoabB6yNKEx9BzKNzCFg4ujvCpE/bU99ypG1n1c2X5nQb+VFAlO0Q0HtQZZ9LpamuehX4eQwLDGZ0xgRKa9EreF0d5qkUvSVeCBCovrLUSA6cP3/+dJfo5ZOu9zY247xzW+t6h5tMxNVQ6FVAIgAaT/t7cTQcKzZe6MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724796438; c=relaxed/simple;
	bh=rq8k19xSmJeAAT5nHd6I+FHf2xSiwXOC+oWIsw1NRuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LtcOBpF7fcDz/ZuOdjGo5Dl5Yb2nMb7S/dI7wAwRWBFTHy4tojL7XR9uhIhfdX7vDYKJHQNEsG83xfT2jQ2nZyMdtcFhLcQ93yWMhQcSbxYilwG+vHwX7N+byAPF0hhSTnf8/PnFisgKGWHHhJ0jkqiA5TX77ow6j7geWN5mtl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=n/Jy3oVG; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="n/Jy3oVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1724796434; x=1725401234; i=w_armin@gmx.de;
	bh=rq8k19xSmJeAAT5nHd6I+FHf2xSiwXOC+oWIsw1NRuA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=n/Jy3oVGkL6KeQb1vgvHb2AT8PIrcxF3jI0JJCP1Qxo45dkVxdm+0nQrzxkhVQZg
	 gW0pRxmerDOc83ROwSXz7G52vFxFMxjOG7lLYct5NcOxm/fRZzHs/S7qmTRX9eBQE
	 g2nr8fdBS2Cc6oDAhlO4knHDxRwyiO/K5dgcyO233w63R7254VrkfbTS+oKENCn5P
	 asFyqjzUzPcYmkIDuV44e8fwOXUnYD2SJLKYCOSlS7aGgb4fxcH2i6qWSYLvRCkof
	 XydPKZELgpjIWuPR9QeOZy6gZUSjZOYki5taFRrH4/H9dmQLDLJYlSuBEwNIXMRLr
	 7GgzgIxDLvloBEW30A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEm6L-1stpqz0dlz-00H3mi; Wed, 28
 Aug 2024 00:07:14 +0200
Message-ID: <4ad19bcd-8030-46d8-81f0-e4ca97fd3ea6@gmx.de>
Date: Wed, 28 Aug 2024 00:07:13 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Add Support for the Acer Predator Triton PT14-51
To: Rayan Margham <rayanmargham4@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <808c835b-3500-4345-a338-b0f8014d049d@gmx.de>
 <202FA1F1-967D-4D99-94A1-9649C7C9B6F6@gmail.com>
 <CACzB==6Hpp173CzcsOpU+epz13uDU5mpudX1xvZuMkphODTPAw@mail.gmail.com>
 <ecba8732-fbef-4e4c-b518-d5042fd18480@gmx.de>
 <CACzB==7=AUGXuAyDrQBRO35fap=ok7B8tSjaXY0tDPjn2qExyg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CACzB==7=AUGXuAyDrQBRO35fap=ok7B8tSjaXY0tDPjn2qExyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Lp1/gasQRy6HTWLGTGB8krdS8pTKwMG466zTuMg9Pnjtc6pMkM6
 l5ldz1nzy6oWIpm5/puy/N94Vg5iQoTTuHz6APJcK9JB0Ev1NLvaryfYxgl/u8aSwFUI3aM
 bysCZ0sazbVHaeLxJEy/F4S18KeU4pl/F4MjU+J7nIZBFFgJ5ehd8O6pRjhIm3MNX6x9vCW
 AZCReRUPgnLVdmGq+HoLQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QH+Mbjjbark=;J3ggZ25odfpFeAysCfMbTfs+F2x
 3jc3NNTR4s+p5Sa62TbRgLNpT3voJZsu8qBYmzp2OzOoYYaRYLiwcydIgbjmkhcO0CroJKbl0
 0w65CCFLoosH+XroaA35hb0z4vC9rHJ71+WqhxIOfqTjmDCzY7VIiz1qSPa6c0HzEbFNQTyeO
 Tko4LWKGMmsV2dSoiD9IDvVI4Ea4G9TejOYlRFhTkRRmA1/Zm+CaRoJNNewDgs7thExYr7hKe
 0kekXFMC8CHnvZsHjwtlCp5dvwqydni6SeF9+w6iT6z3rVHSwlLBgAxEYQaCQ1ARij5/ytBia
 cwBFWYfSY+u6Q3TnLlvTx1Xe5glzUDl3lspYRjL1EiEBhdc6NaHAbaX5a0NYq6I2uFiNLiz+c
 P5HGCfMXQw9GSA+9Xnm3lCoYLYjUeVje/bzqY1OSE2B64zM+ANxh3eL+N8kI0xt+X5+2fN6fx
 ZPHQV7fQIuXZnwCj8ZtFi3tTiNBfDWyfwdn1qPWsFajwiN1sYtQMJDLz6l/5OwJO0VhZRYSxP
 BDx9WcV5jCIH8HoD7rviUjFsLjhJLC78vZt/YBDwE7O40wan0296T4q6PCFOI0VF41jZr+Qpi
 O2/Mxv1TErdj4yQhtG64djCkrjZiwb6YuTJ99Rq1omcxAQ898Hd/gVM7HKzTW86Y72LUDRmAX
 Tzz1SNZpfd4QG429qsI2PGye5JP5qAhp/KhTrU8Ke2v6xtNxkr5El834MSBK6/C0Zrep6l7/B
 +fZBM9Zno3swrDT+qV5oU7OAfY6snN14chZTkdq/YKxYf5Z2IO0o1dd6Pi2vBPcqCLTySQBSB
 KOg3EGM3UNceNzwmpCxz1s8g==

Am 25.08.24 um 18:37 schrieb Rayan Margham:

> Hi,
>
>> Does the fan speed reporting work?
> No it does not, sadly, only the LED switching functionality works when
> the turbo button is pressed.
> Thanks,
> Rayan Margham
>
Strange. I will try to figure out how the OEM software interacts with the hardware.
This however might take a while.

Thanks,
Armin Wolf

