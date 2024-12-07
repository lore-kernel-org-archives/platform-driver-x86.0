Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C364642D
	for <platform-driver-x86@vger.kernel.org>; Sat,  7 Dec 2024 19:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733598086; cv=none; b=EHBO0cQK403dKsEUZmVvehHsM/OQ9zpZQvcHJcVw6A/X8qDLJ2ox2VxP7dssK3J/K6bsPzm0YNqmPrzjtUcSVAkVXlL04TjadDC/8HfshETrRVO5g6pjS76n18l9nGnEXR1Ow8hB13Qgm9FhSoJLkJWGp5xhkaOYxV80d8nAlIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733598086; c=relaxed/simple;
	bh=JUfNFnkXcWyZHNBC3IA+Goni2GJEAJr3mtXnJ0CZDRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=a3AhuvLV7OnMbzBmcJOEAEDHEY/vh94jmg6JXzHxzj+BfkrzhWf3ipUc2Z/jnNX9AoAI16RNoC0f33gQ8sohs49TD37LrGcop1oToSixLZLzj2jGxF3HY2VKND692fx05QO04LVH7WnORdnf+XlJyB2mLgfrLvVt2fKkqBa2gpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=lhQlbejW; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="lhQlbejW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1733598081; x=1734202881; i=w_armin@gmx.de;
	bh=JUfNFnkXcWyZHNBC3IA+Goni2GJEAJr3mtXnJ0CZDRo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lhQlbejWexhKLYy2OdgRA66wCIFtoSMcMge38Lb2vv7vPNyXFsEohdjEMTVx3DPP
	 iLsReClU5typmQaA6Trf37x6+aIpcNBNGFMy0JBAtlJIWsXQu20BfkYfoohkpYCR1
	 c8DTF/7VxkiFO0y+uGb41IU9uVSyNOsNZap7m5pt9U55bh7qAQVvNOiKDbiE2+SCx
	 pnCe958RpCkJLXxTJYY0OfprneTXhopEBY7zAEbcuuMHZX8VtWOlz5koi8cjbLn5X
	 by6M8lTYwuRyYQ01UrtkaScSQ+L9IuE5xgcQcth+JoCnZe0utaFcIScbLgb4BMkCt
	 CaywzV/D3zUzd5WDZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MSt8W-1tCwnv3Ago-00KSX1; Sat, 07
 Dec 2024 20:01:21 +0100
Message-ID: <6aab4f00-ba91-43ec-a5db-8d8e62c37268@gmx.de>
Date: Sat, 7 Dec 2024 20:01:21 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regarding Your work on hp-wmi
To: Sharan Kumar <sharwesh2005@gmail.com>
References: <CACGGMP13h+VskpoAMg4rShZC0QWM48ibXpARLmCEiQHvLL=P8A@mail.gmail.com>
Content-Language: en-US
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CACGGMP13h+VskpoAMg4rShZC0QWM48ibXpARLmCEiQHvLL=P8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Rzw6TB0b8rwvXJdnluhFXkoxEC6oaV1t++7bCimZgl03RQKG1t2
 xve2aRuCeff3yNYEAMuZUMWmBQ9Qfy6kyEPfVKkshWWKF2yIGMpzqrD0sVrZO12lKrPrF1c
 u8YBx2IFGRC1ISoWDyFU14oqLmFjtMFqAPEiCuLQI7Qojh052s271xrh4vtobalwTs+4zkb
 GqZYyu5rB4At8MrEUUf0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bosYh3RudlI=;qkXQdra7Oo/Ez2286r9TLX3RUDw
 QObBhq4Z7G6hUqPTBbSTjSGKzRA/RgrkiEsqD5C0bf3U7DFIn6kHsOggCtVHaSHT3iNC0O5T/
 /WKEUQlz9uRdbEwbjnrjNtbd5IFSKzeAAX6WIY6GX5N4sNIfyQUgzrPogLFBphr7joL80F3Yy
 75nJ9F67CHdSURee436pWHHy4KCiuwSqA+mTBIvr44+1cxZTdOdxPrOYacxQHyDWbKjNBCZDR
 6e/qYb0bU1Y7cFmO9K3A9IjyA4d100qDoJoWVgLQhjWI6vXLExa+9eyX4yXnOW82/5bT969O8
 JWsQAmjKXzWiHD4jXBfYsP43fxVYrIou6OVCdvil+d9b1X/DjbcisTSZdQATSIReXUa+WN0vQ
 4z6E7xEv9kxASbmMy2WbcP14UocpRsX06+kc7QmCzYvO3xio7IRWsWkBQ5shkimfcQPNuJkz4
 DBTxVzkYGcvKjeED7thSIYx340mNQjSTBYgTfoPuZ5dk9D48gR7ui5TWkXHfP7Xj6d5KC7+V6
 K6/+R6tHUgZgB8yl18W95Cg12A31qdHhRTVTI3YG5mf065r52YmdxYSE4V5ZrQ7kMsy2d1fo/
 X6QIoI/Vo5uNospJiOwX6QnYx0Aj6mhaTr6BP25hFWQs6hdy1skQ0d1jUpcrAIsF55fu7/KIQ
 ovMM1J+a0gzzevWYvi//VqZvcBbJDnVqBh5mzjI/7YKEE4YD0zZ4QeZqB/4Vd0A8ViUJedDdd
 bCQ3G2SITpMdktt6a/qxae4IrPqRN/tx6XVkG4LleRS0V9D4MTwDHDABABU3mUDZjlG9ugkYr
 wLZoBXuS8qeWLild1chDnEKvv24zWMCiCsWYshkwKMGxcIiSV3A9XocrI1VgtBkJhDOQyGZP9
 D+MqdYRAC/ktUktPzAJmTEgFhiogQNKuXzEPapoERMe+592xArquLMWGDc7Kk/Ey1rv1jtrff
 GyPFZRNpfNkj1YpZzVkNUy+CW4tlbwrmYXJO0DpU6mer3ND5A8kdkbYDY/cwTFpQQVHR39GRE
 LbJDTA3Q30QthE0F/izdxE7bZzg70PPf/V4yFGj7EW3ZjCDFZHgvs9r3yVQf3uzrXgMEayVbu
 zBRTPSLqF9vrpf+/47ye6VjbzbQ9V3

Am 07.12.24 um 15:02 schrieb Sharan Kumar:

> I was testing the hp-wmi module for linux and found that you
> contributed to that file. So i would like to get your advice on that
> because wmi commands for to set(eg:to set keyboard backlight) is not
> working in my laptop and i don't know how to move forward.I would like
> you to give some suggestions on that.
> thank you

Hi,

i have no direct experience with this driver, as i was doing only some WMI=
 cleanup work.

However in general providing the output of "acpidump" is very helpful in s=
uch cases. I CCed the
x86 platform driver mailing list, so maybe someone can help you with this.

Thanks,
Armin Wolf

