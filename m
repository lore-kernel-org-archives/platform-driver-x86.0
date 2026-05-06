Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A6844A710
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 May 2026 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778070612; cv=none; b=tTmXoFaDuLKkiEigA669q7mPk/zV7iWZjtG09lWC3inyzoK9cyk7P90CcI1dwPY3gZbwaCmUPwmxgpVB4V4MbOCa0CJNrH9q32l5ZOuorXtKm+DpDEIpCx+PVW96syFK1CxXa9KZcSNoBhWzSKs37YR5EEt0W3eLuDURzUojjRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778070612; c=relaxed/simple;
	bh=MKraGsaY64TdowrcBfUnmvV/lp8zO9yRfaITY1wDRw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uy7ZTEeuMEs4xwZy/WGOp/Iy4yd2JMRK4dPJ+2txGno6FeiwSmhb4moFuW7foTtkMzIsUBYX8jYbzwWsasZJ4GxhreVE66rwPi6KYhrheZPaRoVS0R4kVGakkUpNzQ1oeJlZr1eRvcAGvM40XVWGIV8TJ9yFlGYlb5X8EXUKlVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=B/KbFDPV; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="B/KbFDPV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778070601; x=1778675401; i=w_armin@gmx.de;
	bh=iAvK92FT0w0r3nnptoFLhkK5b57zpdrRvBnbpvYXApA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=B/KbFDPV9SZTvuakZY5sgOjZwbIozcIu2ldE4uZtRjd5eUHOKsW0jGVJ2ksQ8RQg
	 BueJCr7tuvGIl2Hi4ZjG6bs0AbVU/suLZ/ust1566y9kkIDoODA7K8P4PSPISB9No
	 2ddzAJPsxQ/qdguJCfO2W0E99ettdt9XSWPgjVoqaEOWdTFiklPITE1QlbwE6KNBS
	 v+hZyceXKyA7beBNwU0GejsXB82pZsR8jK8ZI+KNOnAxGduTMorjsTAQKacjX0YdI
	 S7HD64i972fP7vpWa7leWPysW1Ww7lrV+H1psJ797UuHBfqFVNrUZH7F2sRyfvrNy
	 fd8KoRpL5coqBpP94g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIwzA-1w0Kg71hyU-00TNFP; Wed, 06
 May 2026 14:30:01 +0200
Message-ID: <3383c0e3-ae96-405d-9513-3866a9c0bbf8@gmx.de>
Date: Wed, 6 May 2026 14:29:59 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: asus-wmi: kbd backlight brightness keys not forwarded as input
 events
To: =?UTF-8?B?5rGq5rWp54S2?= <wanghaoran505@126.com>,
 platform-driver-x86@vger.kernel.org
Cc: luke@ljones.dev, denis.benato@linux.dev, corentin.chary@gmail.com
References: <aea86975-3db1-49cd-9c17-80145a492779@126.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <aea86975-3db1-49cd-9c17-80145a492779@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BwLXPMAbcesJSYqOXZC9nPiI2G+8UwcHB46GoSBBN4jBPpzeSi6
 rm1W690Yv+1izSlmTYGQg5iYWR0xwoNEzh4vlXpK6EWUXWeKfU7X4yXSUNyN1a9yQNxRYfD
 mljiPZHg7TT7M87CnVQiLo/C6xcTJBHQ31rvm8xeCpJyfHgAbVS/fmkNwBHNSL+J4RjCGWQ
 lxQt9oGOjsj02ZFw0TgFA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:523YcoQ4urQ=;z1YFB9w49HNVKheQFRXZOCpEyzV
 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
 O57DdeD85qYSXPg==

Am 06.05.26 um 14:02 schrieb =E6=B1=AA=E6=B5=A9=E7=84=B6:
> There is a bug in asus-wmi's handling of keyboard backlight brightness=
=20
> keys.
>=20
>  =C2=A0=3D=3D Problem: WMI key events 0xc4/0xc5/0xc7 are not forwarded a=
s input=20
> events =3D=3D
>=20
>  =C2=A0In asus_wmi_notify() (asus-wmi.c, around line 4551), when the dri=
ver=20
> receives
>  =C2=A0NOTIFY_KBD_BRTUP (0xc4), NOTIFY_KBD_BRTDWN (0xc5), or=20
> NOTIFY_KBD_BRTTOGGLE
>  =C2=A0(0xc7), it calls kbd_led_set_by_kbd() and immediately returns wit=
hout=20
> calling
>  =C2=A0input_report_key(). No EV_KEY event is ever delivered to /dev/inp=
ut.
>=20
>  =C2=A0The conventional behavior (as seen in thinkpad_acpi, dell-wmi, et=
c.)=20
> is to
>  =C2=A0emit the corresponding input event after handling the brightness =
change
>  =C2=A0internally, so that the keystroke remains visible to userspace.
>=20
>  =C2=A0=3D=3D Impact =3D=3D
>=20
>  =C2=A01. Wayland compositors and other userspace tools cannot bind or r=
eact to
>  =C2=A0 =C2=A0 these keys, since no input event is generated.
>=20
>  =C2=A02. Because the driver only updates its internal state variable=20
> (kbd_led_wk)
>  =C2=A0 =C2=A0 without emitting input events, userspace has no way to ob=
serve=20
> brightness
>  =C2=A0 =C2=A0 changes or persist them. As a result,
>  =C2=A0 =C2=A0 /sys/class/leds/asus::kbd_backlight/brightness is always =
0 after boot,
>  =C2=A0 =C2=A0 regardless of the value set in the previous session.

Hi,

this driver uses the "brightness_hw_changed" sysfs attribute of the LED=20
device to signal changes (using poll() notifications) to the LED=20
brightness caused by hotkeys. Emitting an additional input event might=20
cause userspace to increase the LED brightness a second time, so we=20
cannot do this.

What do you want to archive exactly?

Thanks,
Armin Wolf

>  =C2=A0=3D=3D Suggested fix =3D=3D
>=20
>  =C2=A0After calling kbd_led_set_by_kbd(), emit the corresponding input =
event
>  =C2=A0(KEY_KBDILLUMUP / KEY_KBDILLUMDOWN) before returning, instead of=
=20
> returning
>  =C2=A0silently.
>=20
>  =C2=A0=3D=3D Hardware =3D=3D
>=20
>  =C2=A0 =C2=A0Model:=C2=A0 ASUS ROG Strix G16 G614FR
>  =C2=A0 =C2=A0Kernel: Linux 7.0.3-zen1-2-zen x86_64
>  =C2=A0 =C2=A0USB ID: 0b05:19b6 ASUSTek Computer, Inc. [N-KEY Device]
>=20
>  =C2=A0 =C2=A0/sys/class/leds/asus::kbd_backlight/max_brightness: 3
>  =C2=A0 =C2=A0/sys/class/leds/asus::kbd_backlight/brightness: 0 (always =
after boot)
>=20
>=20

