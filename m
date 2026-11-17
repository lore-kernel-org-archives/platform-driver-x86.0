Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953994;
	b=4deMPFoGW6L0CIQHisit1ow0KaLzDZAOx/5sQzKJnBD8U89v7LTaD2MCGF6rFu+NqxBo
	 yQFuWn9sFIDa7FB7NEvM/PLqx9Y3LPKzeT2iSV6LMcvbpqECszT0E9El0vYUIrlCqsRJb
	 qoM+mLH5QTCU47ye/dj4aqnTQkjubxYsBFSr7guHrKgLxNmd2SvvzNvBsRCcLpCSR84ux
	 CiWxJMWIzEHfb+sLGrYP2LYzOw3esc2CLk+SvSaRNwpA9t0C5Xv6VgnEv6bfcIUXmI8Pu
	 DVeM+dMmtZzW1hJmlZoWCkZUh2xjV6j4AIJbVIghS7YuTSHvef3FrOMqUQjSjBubZkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953994;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=5cfZvWgDq4EGKm4OfOYCXYPJKLDw342llOPnH28jf38=;
	b=hzw6b0MQp1fqG55Vr4c3K4BvNnqNz7UPuiUvhMJJcDRdqRSsT5+zgydWQUyu+rNTeyLv
	 IanZoNJ2No8RE9AT+7gT+0YXJhDSLGdKr02T60TRXqBwY977yPVfw0Rcuw1MjuYf3ohd+
	 5qGeATenwDE5bKsoYLhLisi/A9eD6jM4MyJPFwiMhnjGIgk2yaRd5rjeOV7XM6+4utImp
	 VXgWqiN+RFJzNB9Cr8UaYHnFcl76MhXIcN4tSTGUF0HUTTlnUNAQZl9YKlhoph5qAkvVd
	 ZoRmvS6QeuocEDDUK1mh+/EU0ZILuZLInH5FAY6Q81QssevUU32jzPkh7vaLwgFDi8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=SkERno0P;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427A2606A31C
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 22:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 427A2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=SkERno0P
DKIM2-Signature:  i=1; m=1; t=1794953991;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:cMDpoMQnHILqT5iXVrJiW6FJ2TwA
   T8E090TBiKwtWq6qaxGzKPcbLOEav+lCC/fVVICtq5iJdBBzNchW613skWJpRArY2pn6yN3484W
   rJ55kxlwg7Pq4nFtP6rtrXomz7fhH9ue5jV2+5lUU7a/Lse6cnCtAydk09ghR09awQwrDvSQ2zb
   Qy5M/FIxKkdOULyMxE+fQiA+PHRIToLt6w/FqIXMm+0HBBZqaIwxbfESflqM3yaXVLsSkWwQXNN
   wXSBzMW8huYfLXa9tkrWAjkB3FpYfJ50s1W3qlWm3t6WZf9enHtPZ7movITOmhu8UwaQZFzXtFS
   izIW2CtQmFlSTw==;
Message-Instance:  m=1;
 h=sha256:
   07C/VKV48Sv7EHaTCizJauv9P7dBUEyZDDya69YdPlI=:
   5cfZvWgDq4EGKm4OfOYCXYPJKLDw342llOPnH28jf38=,
  sha512:
   rDuvvkyHPflNvhe2P0v6v3WT6xojWCaD1tqWy8N1kRjFpDKlO4vmqAcauGfvFNFfcUDJ7ur0C+QKzkQaHs/9/A==:
   TGYqWgMA5C8z2kqHFyDb25mjsxWM9s5ORvfQT42J+b9kBlgV1aoFrE1BsU7yXmJqfvIhJX4dW0V7cYCJworvIg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794953991; x=1795558791; i=w_armin@gmx.de;
	bh=5cfZvWgDq4EGKm4OfOYCXYPJKLDw342llOPnH28jf38=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SkERno0Psvx0sqJyWO+Z0dfO+sIotK9RU0LefKtWbFtCb5RwnyuhoGj578ZlMABs
	 0cLwshEqILs/y0zEO55rZlBApGdelhEITrGRJAkuygDfwSDiogz9Mn0//ak7E+A8K
	 qhWNUaR+2escTVFAeHzNJmcpBq+SvUww5tPvxlzepAjA9CTrdUfC7aixHIVtDQpV4
	 LBTUDIW09d69wCGoupCwzmf0FZFgBKnrAd8uqpmTgfB2vXEnbeKvL6aWRG/OMRhNZ
	 i2A7zMC79qo+N/humkxPJeY85s8Jqa0Tz+o11NqdmhdEB4euYO08OL/3liw590paE
	 XwHJXXkQ0XTd4yuAFA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MacSY-1wsSsv01xy-00dLOi; Tue, 17
 Nov 2026 23:19:51 +0100
Message-ID: <41519902-d1bb-4165-975a-aeb23591256e@gmx.de>
Date: Tue, 17 Nov 2026 23:19:50 +0100
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
Subject: Re: platform/x86: lg-laptop: Add LG Gram 16T90TP to keyboard
 backlight quirk table
To: Vorname Nachname <ivanhoe18109@gmail.com>,
 platform-driver-x86@vger.kernel.org
References: <CAF1sT3Wp67-+Ah4C2_L=rS_83Pg5vt00TCvHXLKFdzifS=yQcg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAF1sT3Wp67-+Ah4C2_L=rS_83Pg5vt00TCvHXLKFdzifS=yQcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2hzVl8a6kGmBHvqBRw89RXvRDWcA/9MGhfKSxmCgebnQE9dDBgi
 xVMk7uauTFrVWtIN0YS4xeXDeNjYOK05i23heSLMwgc66UUz1zNbhAnbvQRC+eCfaJUK9j6
 MhrwNS2ESvi/3XPP/GvcXDqdMK9XsFd5qk3D1tUqHZnmWjsgya5uYiO7rEYxv4FtrxNq5qX
 PQ3hsR/OpYvUszDNyxHbw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hAE4x4uSFoA=;9eX4HioGj8V2jAiuOvq5qJaZ6xr
 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
 pMexXl

Am 17.11.26 um 20:15 schrieb Vorname Nachname:
> Hi Armin, hi platform-driver-x86 maintainers,
>=20
> I am using an LG Gram Pro 2-in-1 (model 16T90TP-K.AA78G) on Fedora=20
> Workstation
> (Kernel 7.2.13-200.fc44.x86_64).
>=20
> Just like the 16T90SP model, the keyboard backlight is detected under
> /sys/class/leds/kbd_backlight (via LGEX0820:00), and changing brightness=
=20
> values
> updates the sysfs file, but the physical LEDs do not react at all.
>=20
> Could you please add the 16T90TP DMI entry to the new keyboard backlight=
=20
> quirk
> table in drivers/platform/x86/lg-laptop.c (alongside 16T90SP)?
>=20
> Here are the exact DMI identifiers from /sys/class/dmi/id/:
>=20
> grep . /sys/class/dmi/id/=20
> {sys_vendor,product_name,product_family,board_name} 2>/dev/null
> /sys/class/dmi/id/sys_vendor:LG Electronics
> /sys/class/dmi/id/product_name:16T90TP-K.AA78G
> /sys/class/dmi/id/product_family:gram Pro 360
> /sys/class/dmi/id/board_name:16T90TP
>=20
> If you need any additional ACPI tables, dmesg logs, or testing for a pat=
ch,
> please let me know and I will gladly provide them.
>=20
> Best regards,
> Gabor

Hi,

please check if kernel 7.3 fixes the keyboard backlight on your model.=20
AFAIK there was a commit for a very similar bug report included in 7.3.

Thanks,
Armin Wolf
