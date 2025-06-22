Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125812BAF4
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Jun 2025 19:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750620435; cv=none; b=NPo+rZASDSS4SqrnQJZNdGYqBlxR1Cl2DTAEuv+H8XcrgaeXI+vVAGIrt0uHLHxHJxF7iqVgC80M5+vRs+RC8/6foVAKjZ1F7UGT8cbY6mC3OMn2d4Xlh4CPOmI9T5Yib+eX2q75zUpy24WwfOF3ytJxqMoe7b1eGvG8lwAGEt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750620435; c=relaxed/simple;
	bh=zSVIVogv8ArIjShYK7gxiLpWNYR9mU8lKbPw7mfJMU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Kk+bI3Y1TUsp2D99MD4UnqKK2zuN7T9V3JEC7Xls4gcb8Di2IjseBCvJTPaxPiAh5su/+xSVzedl2tQBUCVoLlFp96RsSFXhc4j1yYLtbDyYGoniqvuo2+dn7MpN8oRP5S2u84hjhrA9181Ry4NMiLZX7DcUR4Hi/t6Ny+zZ0Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=WSAtMh8a; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="WSAtMh8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750620431; x=1751225231; i=w_armin@gmx.de;
	bh=zSVIVogv8ArIjShYK7gxiLpWNYR9mU8lKbPw7mfJMU8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WSAtMh8aP7Hf1pd1gfxipgdxK+6dd/PwDMWJnwtIfVNS6qGBBT+iu2hSYZ+BcLgt
	 tlMKJlGkeyTrHHQndByxM2l5vYnTzM8KpftOt6WDDxxfULAdB1DtXOtSNBt8aXxQY
	 h82a4LJ8qMEKG3IOIN6yhLk6LGKiJTN+AlQbVVLqRQffTedxweFShu847waKq0Mf8
	 zWM7UScyxU0leLdJz8AKuejEtRGz+sBldoS66x8yFzBALA9norNcmcR/IzA3hlKN/
	 b2dVtHFm5pp7gPvA3no8OFnLjpjW6TbjG6BfeBS5ZB0F5WaJB7ZJfq7ChaYQVTaxR
	 5/54TXtiSduEO/UuRg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M89Gj-1uPpiH3O3H-006zWl; Sun, 22
 Jun 2025 21:27:11 +0200
Message-ID: <48e0d534-6ebf-4cd4-95c5-d74d1af10ac1@gmx.de>
Date: Sun, 22 Jun 2025 21:27:09 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: lenovo_wmi_hotkey_utilities probe failure regression on IdeaPad 5
 Pro 14ACN6 (6.15.x)
To: Andrei Tescula <atescula@gmail.com>, platform-driver-x86@vger.kernel.org
References: <2eda8f9b-9421-4068-87ae-ccfd834649bc@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <2eda8f9b-9421-4068-87ae-ccfd834649bc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:e3Inezg3TsBHaYTD0bhVDoporVrgANnAb166MDptkdrhjhVmLHE
 p5ACULB8h90GTAi8VSt5LFJw1JOQDmvElBHa9N4fX22xl1uj5RoktBzA6E44Kzy2y9Pbh0V
 xZkNGlb8HbiczwhsTTufIYTJiN5AEE57ZZagmvPRHxGAYr4mfvp44pmZbWbbk1B3WqbF9yz
 +LCjGFFbkXAj/2CzLZUbw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Enz7lKXtSY0=;ZN1zRUO09ss8CXfqXmNB/ZXxdh3
 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

Am 18.06.25 um 07:58 schrieb Andrei Tescula:

> Hardware: Lenovo IdeaPad 5 Pro 14ACN6 (82L7)
> BIOS: GECN39WW(V1.23) 10/30/2024
>
> Regression:
> - Working: 6.14.10-arch1-1 and earlier
> - Broken: 6.15.x
> - Also working: linux-lts
>
> Error message:
> lenovo_wmi_hotkey_utilities CE6C0974-0407-4F50-88BA-4FC3B6559AD8:=20
> probe with driver lenovo_wmi_hotkey_utilities failed with error -5
>
> Impact:
> - Error message appears in dmesg/journalctl
> - Functionality not affected (hotkeys work via ideapad_laptop driver)
> - Purely cosmetic but indicates improper driver probing
>
> Additional info:
> - ideapad_laptop module loaded and working correctly
> - All hotkeys (Fn+F1-F12) function properly
> - WMI GUID CE6C0974-0407-4F50-88BA-4FC3B6559AD8 probe fails with -EIO

Hi,

can you share the output of "acpidump"?

Thanks,
Armin Wolf

