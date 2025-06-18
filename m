Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6867211706
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 20:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750277272; cv=none; b=A2kzXg96aIcGyw5MZX8Dh9ML5zyAyhC9dDRbxsQlHqU3ExLwrUi9180QeSVygON1ca5UiHX6+GvsD39tbyLSvbaIzwOOPxNJVvWUawN/bsU44G8qUWhqqXexb/rM3Wm/0AjBuKxD7X+lCix2EU/T4uPPvhJkx/TH0H2+CYDfUAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750277272; c=relaxed/simple;
	bh=zEd+TP0aYMTYtgOac5+XGEcQ/O53nfp2NccnNwnk4zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bdKEhxvd6AfLgrcGhEAUqXcuBt6GmFHsZf+tdivqO2WEcyBerGvTxV/pGZrgTXl4LGSsHaSgU92U+6iMsKznmcvUsB12wU775bghAfmGMTvW3emtJZ804XlXFYZizBWbbzrF5i5a0fXGz9myUZDg4VdIEbwcWTtwrmn2UHENkV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=XxS8hxHY; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="XxS8hxHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750277267; x=1750882067; i=w_armin@gmx.de;
	bh=zEd+TP0aYMTYtgOac5+XGEcQ/O53nfp2NccnNwnk4zs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XxS8hxHY8xHtCVLCZn2MJlHAhvp/bKcc3T2rVYMJuGWVwdFYbepII5V1Rk4AppaW
	 OIfYzwlSsUSlqpBcq5MwKI5SBEzyRZH72FkL4EJ9fLqs3nCJ6+MMKDWHlIVHuBWC0
	 WmAhmwz5Wqx0Vgj16mCHFT2AcqaRLSvyevjvh5by+NSzQf4btFt3RrU8NicMRvf7g
	 i5AhuyKVd52ZvM24PUHBwHbQgSeJHwE0bqDhoVQ3gx3i7nzEdwdVxGxmi4g/A1vBG
	 NaKyATXl6WQgCmTza9/GbMhe0yIK0rpnnTagIoCvN9s8MCijuEuztfjpO7amckDtw
	 f5kir5xuNcm2YrfuVA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mo6qv-1v76aW0Kct-00msun; Wed, 18
 Jun 2025 22:07:47 +0200
Message-ID: <1536ce4a-5844-447f-9e86-197c71c6d364@gmx.de>
Date: Wed, 18 Jun 2025 22:07:46 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug] Acer AN515-58: Fn+F10 affects display brightness
 unexpectedly
To: Bugaddr <Bugaddr@protonmail.com>, "jlee@suse.com" <jlee@suse.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
References: <cwCuSGwTSU4nQ_hM-qWPNAzJwU2x4qLe_eo0tkxIFIycTeRWmDKjX7IzxJHcOVUPx_xAwjYC3GOV7MSk_LIqPs4HElFbPoSzYIZV5BHWe8Q=@protonmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <cwCuSGwTSU4nQ_hM-qWPNAzJwU2x4qLe_eo0tkxIFIycTeRWmDKjX7IzxJHcOVUPx_xAwjYC3GOV7MSk_LIqPs4HElFbPoSzYIZV5BHWe8Q=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:I+HXs/PwdBCVc2PIl2FfHcTbahY9hBkBHcU9/OzzWQ+H9/2tDha
 YFuRX7nNBd2CbQw0wUZviK/8i/V9iYmyVN3yqbV1sXJT5GCwMjZ4LugrZ7C0TS7AfWT+DJz
 G6hlRIqsxuiN+RrPxFl4UHiK2QdVAZNzSz0HdK52SsXI3WEBRJnGcuMa5MECMfIE6tjYKw9
 9gUMmcbCiSafPUhejmYng==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JGusxJbcMnA=;DMuq6+aM1HAevZpHteLtRp2GsG6
 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

Am 13.06.25 um 19:12 schrieb Bugaddr:

> Hello,
> I'm writing to report what appears to be a bug affecting the Acer AN515-=
58 laptop, and I would appreciate any assistance in investigating or resol=
ving it.
>
> When I press Fn + F10=E2=80=94which is intended to increase the keyboard=
 backlight brightness=E2=80=94the display brightness unexpectedly decrease=
s=C2=A0along with it. Furthermore, the display brightness continues to low=
er incrementally, until I manually press Fn + Brightness Up to stop and re=
verse it.
>
> After pressing Fn + Brightness Up, the display brightness behavior retur=
ns to normal, and the issue does not reoccur=E2=80=94however, from that po=
int onward, the Brightness Down key no longer works.
>
> This behavior is consistent and reproducible. I'm happy to assist with a=
ny debugging, log collection, or kernel testing as needed.
>
> Best regards,
> Bugaddr
>
Hi,

can you share the output of "acpidump"?

Thanks,
Armin Wolf

