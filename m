Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86181FF5E3
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 23:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774913104; cv=none; b=pGGQN59MSMecf6GKLPJ1StWwV1tbezYfVDUcLWUBRsE9SUh696RVbAmfIxgxmtt0PsY5CMprUwXmrhFXSTOuHt9JJCJ9cjqTLRBcZdT2BdIGZtUFtJXbWGe+tuzCferKPOamFN2GtJVoAakF3BqiqKCYng+2kJK7Mr5R4p5Kcik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774913104; c=relaxed/simple;
	bh=s82Klk1wdMd28x51ncH54tjBvNUu3F3+ldXBp+y52xU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBBqView02S+np/5QaeJqVNJu64+P9pgZWmArm/EMq5C5hqZ6ivi2tYUdNYPMRVIcY3b3toMBFyVNce627oJsKLYl3soLutpbnebmghmlCD1LfgpLm6G6jh27QzJoBza7YFBe2ogNHgc53nUWR0lYR9a3Of/x50sfvAzdMuleE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=flRqC+Rl; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="flRqC+Rl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1774913100; x=1775517900; i=w_armin@gmx.de;
	bh=AJ2wLXij8KfZ8i6ccf+mcPfWnJDIFb9Ir6fvfi+bW6k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=flRqC+Rl7ygpsrSKnwea0aMEa0D1Z66Bon1Pa3D9hJfzuUdp+xrT45Xy8hHjYvcd
	 soKMn1IVG41ggEc7QAV+w25n1sbz7uhrrSOM+a9dUQAZ6kmJdMZC5PB8u4H8fqtv0
	 VjJRq60HFa8CDyqGl8vYwdoOtTUXg46I2NXK4oBHPy6LSMyOVcNUwRHQAzsoEl23W
	 lCcmD9EnWRxxvFTL9F5Lj8Cz2W0yOuih/1LRrZeEKKPEMrskIrM9uIeEXFe0tkdHL
	 OGPv82yv/w8DjG3LTo+gae3YYvGJZFOnksExkHbxsvNCcEkQ0INAc09Wir1+Y51AI
	 WVqWl7W8x4swQ+5Tyg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpDJd-1vjcge41r5-00jyaX; Tue, 31
 Mar 2026 01:24:59 +0200
Message-ID: <b773699a-ea2a-4304-90ea-851e9ee29dbc@gmx.de>
Date: Tue, 31 Mar 2026 01:24:59 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Internal keyboard non-functional on linux on Medion Laptop -
 NTC816 (Intel IPF) has no driver, PS/2 fallback produces corrupted scancodes
To: Ian Jensen <ianmoellerjensen@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CAJ0oKyQTEJit294y=fs2s2nzhzUs_GQzsgMswDNs==zkdiqz0g@mail.gmail.com>
 <05ae0012-db1b-4826-a466-f706d2a57cc7@gmx.de>
 <CAJ0oKyRU3=qBQvxaBycQYAyxCaVogzuVNv_M=4=npTkBF=X1zg@mail.gmail.com>
 <18a5bcab-84d2-4957-a053-dabbf900e85d@gmx.de>
 <CAJ0oKyR0VPXz887cJsF+oUZFYVD7QY3F3FXWbjAGZGTmFFV-UA@mail.gmail.com>
 <81b30359-7090-430d-8cb1-805cf2d6fcc9@gmx.de>
 <CAJ0oKySi8dLwbjM5UAgtCBRFEGAMpWZfLth=eWcMrBc3=YQqfQ@mail.gmail.com>
 <CAJ0oKySN-q4=RuFt3mTa-VESspRn+OWDSssFtGRJm82ZWGLaGg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAJ0oKySN-q4=RuFt3mTa-VESspRn+OWDSssFtGRJm82ZWGLaGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:837VNx3Jlk6igAzeUr3c0N4Kx5G0bUQYxmVdqbZPtcqiAMBeMhC
 RDR1GLd3fxmUk1fUBbGTfMwxQzyxzHFHWdCWFLZrvpTZJz03ZiaIR+P75syPDRRGXoU6dz4
 t1K4tKxB2UVPp1c0LWw9Gfci11tybobgyLd8NqpCQqt3NHI06lJPBURtEg7ZrndGYAPHEqb
 6qmQPY1VpFwJKoTMlMp/A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WGLkAUw+F6c=;nehjhjVjGs6xhvEAF5ohauAkei8
 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

Am 30.03.26 um 21:51 schrieb Ian Jensen:

> Hello, I am writing to see if my email containing the output of ls=20
> /sys/bus/i2c/devices arrived? I apologise for the extra email, but=20
> because communication went silent suddenly, I was wondering if I sent=20
> it wrong.

Sorry, i forgot to reply :/

It seems that your touchpad is enumerated using i2c and correctly detected=
, but i see no i2c entry for the keyboard.
I thus assume that the keyboard is indeed connected using the i8042 contro=
ller, i think your device needs some
sort of quirk. I was also unable to find any information regarding the INT=
C816 device, so i believe that it is a
purely virtual device not exposed by the hardware itself.

I also found that the HP Spectre x360 might have a similar bug inside its =
i8042 emulation. Lucky for us, the
Arch wiki contains a workaround for this: https://wiki.archlinux.org/title=
/HP_Spectre_x360_(2020)

Can you check if this helps on your model? Please also check the following=
 boot parameter combination:

	i8042.reset i8042.nomux=3D1 i8042.nopnp=3D1 atkbd.reset pnpacpi=3Doff

Thanks,
Armin Wolf

> Den tirs. 24. mar. 2026 kl. 22.27 skrev Ian Jensen=20
> <ianmoellerjensen@gmail.com>:
>
>     Yes, here
>
>     Den tirs. 24. mar. 2026 kl. 22.08 skrev Armin Wolf <W_Armin@gmx.de>:
>
>         Am 24.03.26 um 21:43 schrieb Ian Jensen:
>
>         >
>         > Yes certainly, my mistake
>         > Here it is
>         >
>         Thank you. Can you share the output of "ls /sys/bus/i2c/devices/=
"?
>
>         Thanks,
>         Armin Wolf
>
>         > Den tirs. 24. mar. 2026 kl. 21.37 skrev Armin Wolf
>         <W_Armin@gmx.de>:
>         >
>         >=C2=A0 =C2=A0 =C2=A0Am 24.03.26 um 21:28 schrieb Ian Jensen:
>         >
>         >=C2=A0 =C2=A0 =C2=A0> Yes, here it is attached (this is with no=
 launch
>         parameters, so
>         >=C2=A0 =C2=A0 =C2=A0> completely dead laptop keyboard)
>         >
>         >=C2=A0 =C2=A0 =C2=A0Thanks you.
>         >
>         >=C2=A0 =C2=A0 =C2=A0Can you please also share the acpidump with=
 the whole
>         mailing list
>         >=C2=A0 =C2=A0 =C2=A0(reply-all) so that everyone can access it?
>         >=C2=A0 =C2=A0 =C2=A0Also, it seems that the acpidump you have p=
rovided is
>         corrupted,
>         >=C2=A0 =C2=A0 =C2=A0likely because use copied it manually from =
the
>         >=C2=A0 =C2=A0 =C2=A0command line.
>         >
>         >=C2=A0 =C2=A0 =C2=A0Please use this command instead:
>         >
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 sudo acpidump >=
 acpidump.txt
>         >
>         >=C2=A0 =C2=A0 =C2=A0The acpidump.txt file should then contain t=
he full data.
>         >
>         >=C2=A0 =C2=A0 =C2=A0Thanks,
>         >=C2=A0 =C2=A0 =C2=A0Armin Wolf
>         >
>
