Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC5D25B087
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 23:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791416938; cv=none; b=P/1lXougORLHBkn6nYIRRjB+0JvQ130yxslGkFq54dLVyBGP4Ti5jDKKjMhMO9PJzPG+wMz5Vr9hKbquE3+pBlQUf1WlZxdFbny4O3AJztUOOz523AOBuQlpEg7BE/XTgSiRm6gPLuAZ73VXHV9dt7D9YRA26d66xmbPgyvii2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791416938; c=relaxed/simple;
	bh=0kdEACa1arjr4/7HifAxH65KcSQSq3AUD5lMMQF8pJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pNQ8cFtADvqvQGpLCT9rQn3Po6yVZ19r6LFuNPVWGGgC9bEQMRHbB/dwPv7NKIF34nwRCR1EMm0s/EdL+37PSz8z0l3pwHycV42/371Q5pD/u41MW1kdpikmSwGp/gUn78mxC3PmTu2DMIlRuDOLgPMoMOby5IDJwlYyosQvyiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=AyNFw78g; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="AyNFw78g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791416931; x=1792021731; i=w_armin@gmx.de;
	bh=0kdEACa1arjr4/7HifAxH65KcSQSq3AUD5lMMQF8pJs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AyNFw78gARKv2fCTnImuJ7LSbuhrdNKbQE2Pgp8Lk4RwPHrY9x6uVqopjuQPpdWX
	 EQ80MuzEMNqOfARRIJu4rnKtaVU96/XwBZCE9vwxj+x8DucftvK7pS9q+TsDJjoAC
	 mt8yrThg0I1vl8gMrIdphdk0KCavqXO6NmPUPgAzdrFtodErRzMsKxdhgWlqVZMK2
	 Y/DXKw0GVAR1k91/MbPFEQqoWXGwyFgRq6aLZXGdq13srM2cgldklptdtWnep0zx2
	 4FWKxCSZaxjJ3L0JWDcxyj6PpOAriCgCpuIGu4jjEPFWrqrqs5U1QBO0hXOARjfqq
	 YqMU1yUoKB+5Qzg6jQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mt75H-1wQ4C21QID-016dU4; Thu, 08
 Oct 2026 01:48:51 +0200
Message-ID: <fdb4e182-d1e9-49d9-9870-1af7eb268b4e@gmx.de>
Date: Thu, 8 Oct 2026 01:48:50 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Hardware support request] uniwill-laptop: MECHREVO Yilong15Pro
 GM5HG0A keyboard backlight
To: bifangknt <bifangknt@qq.com>
Cc: platform-driver-x86 <platform-driver-x86@vger.kernel.org>
References: <tencent_36699D13D174660E0D76C4F5EFB825D86609@qq.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <tencent_36699D13D174660E0D76C4F5EFB825D86609@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bT4XeVt327qDOy5fHnpKcR44MPSp4oSMbJ4i2mz46BIilVuE836
 2q9M48GOVAKupqe9kPvLlzWUhqncOMHcxZaI/Bt9wfxSTihXBHacHT8WqHbP9JsO807Og4B
 q9RUPcHQFbv3+Sua7fguBdkHOXNipvF/+NzGVqTr1Xh6wSriC5ZFDQ5Ub3hwjVRuTxjxQor
 jgCtk3zq6L8hKnHzHRWfQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CpsUwrft2cE=;nadenGufdQG2B3+UXpSN4L2JHPZ
 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
 fulhJHkw==

Am 07.10.26 um 23:31 schrieb bifangknt:

> Hello Armin,
>
>
> I would like to request keyboard backlight support for the MECHREVO Yilo=
ng15Pro GM5HG0A in the uniwill-laptop driver.
>
>
> System information:
> - Distribution: Fedora 44 KDE
> - Running kernel: 7.2.8-200.fc44.x86_64
> - DMI system vendor: MECHREVO
> - DMI product name: Yilong15Pro Series GM5HG0A
> - DMI board name: GM5HG0A
> - BIOS version: N.1.09MRO19
>
>
> With the stock Fedora kernel, no keyboard backlight LED device is expose=
d under /sys/class/leds/.
> KDE displays a keyboard backlight slider with "nan%" and cannot control =
the backlight.
>
>
> I checked the uniwill-laptop DMI table in v7.3-rc6 and could not find an=
 entry matching this machine.
>
>
> The machine exposes the INOU0000 ACPI device at \_SB_.INOU.
> A read-only probe using its ECRR method returned:
>
>
> PROJECT_ID =C2=A0(0x0740) =3D 0x19
> AP_OEM =C2=A0 =C2=A0 =C2=A0(0x0741) =3D 0x80
> SUPPORT_2 =C2=A0 (0x0766) =3D 0x94
> RGB_RED =C2=A0 =C2=A0 (0x0769) =3D 0x00
> RGB_GREEN =C2=A0 (0x076a) =3D 0x32
> RGB_BLUE =C2=A0 =C2=A0(0x076b) =3D 0x32
> BIOS_OEM_2 =C2=A0(0x0782) =3D 0x18
> KBD_STATUS =C2=A0(0x078c) =3D 0x00
>
>
> I then tested a small out-of-tree module limited to keyboard backlight c=
ontrol, using the EC register layout from the upstream driver through the =
ECRR/ECRW ACPI methods.
>
>
> It successfully turned on the backlight and exposed a multicolor LED dev=
ice with the following values:
>
>
> brightness=3D1
> max_brightness=3D4
> multi_intensity=3D0 50 50
>
>
> KDE subsequently displayed the brightness correctly and could control th=
e keyboard backlight.
>
>
> This confirms that the backlight can be controlled using this EC interfa=
ce.
> However, I have not tested the complete upstream uniwill-laptop driver w=
ith a DMI entry added, or its other features such as fan and power control=
s.
> Suspend/resume handling of the backlight has not been tested either.
>
>
> Could support for this model be added?
> Please let me know which additional diagnostics or tests would be useful=
.
> I can provide the probe and temporary backlight module sources if needed=
.
>
>
> Thank you.

Hi,

can you load the uniwill-laptop driver with the module param "force" set t=
o 1 and check:
- which sysfs attributes documented inside Documentation/ABI/testing/sysfs=
-driver-uniwill-laptop work
- if the lightbar (if present) works
- if the keyboard backlight works (and its maximum brightness)
- if the battery charge mode works (battery will still charge to 100%)
- which sensors are available (CPU/GPU/Primary fan/Secondary fan)
- if the "health" attribute under the battery power supply device works

Thanks,
Armin Wolf

