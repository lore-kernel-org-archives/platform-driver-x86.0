Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFE536C0BC
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 15:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771341919; cv=none; b=g8PIbeX8JVp72b+Kj8R2waqK7KMYAlMrBfWkJYXXtV9gv2UL3hYLbeJBCjasomfZJ1glkgkhw39IzhwQgMW9C0UfeNHXL39PsgpddU4Mkph9Opn8m8GrbouRvPKXPvUUkaO1tPfvRmQuMuApZ3H4rvdPuP3Uai7e0jFhKeKW5dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771341919; c=relaxed/simple;
	bh=H2qZEl9rpN7bH6pcAoBAqx/svzug0JMXYb4Drx6YPzE=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K/ICL7PPCZcNJ9ZUTWOq8ZeO9Ry2sQpcY/oQBTQ9Sg40Lhw6vGNXz1O5LAeNgUzU+VY1GRz3iVjtbrDeIiF6TNMhv3HDtuLHFj+0ZzQdFGPgVaJkNvzDVRCgvBMEGkIv5wASO3tqFhTrlnA0u93vxHuC36RezMpcnH8A5rnZCtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=TOmCy+AB; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="TOmCy+AB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1771341904; x=1771601104;
	bh=H2qZEl9rpN7bH6pcAoBAqx/svzug0JMXYb4Drx6YPzE=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TOmCy+ABq6DKQqxnXEPxbnDyOKkQ9FDlc0PuGO5E9uzTmctTSwT8iKBqNJwTPOs0g
	 D9G69BIRSIkzVAP9EUVSJa0XvYmflNPUhPgVi5S8tlIGZLNtkS+iq+ITUgq0jXJMcP
	 /iaXJLRq/5EZW6BqNj/2GtQ6WVjbsyQTloKzTIGqgBej+c2PKnf0UIZJ0fAqr3ICYS
	 r+hhkFrZvH375LTUAaPtnqdrrDCpPXHelDDh2jqlAqUvnWsfJTrdftKxkg6F+tZegw
	 Tu4FvnFRl0en+8kKoXjBr17Op5b6U2GkHZYy6k0RmZB77fKw3LdIVr+WbiEQt9MAL5
	 ECODoiSfe70Rw==
Date: Tue, 17 Feb 2026 15:25:01 +0000
To: Hans de Goede <hansg@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "metux IT consult\"" <info@metux.net>, platform-driver-x86@vger.kernel.org
From: Tj <tj.iam.tj@proton.me>
Subject: Re: pcengines_apuv2: LEDs/Input fails since v6.18
Message-ID: <54082217-0eff-49f6-b4f1-0daed58c2568@proton.me>
In-Reply-To: <ef96006e-ca94-4525-9727-4a6011fde7e1@kernel.org>
References: <b553243c-9ec6-4016-9fd6-d33f549a3dad@proton.me> <ef96006e-ca94-4525-9727-4a6011fde7e1@kernel.org>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: 492d1ac55b4b75bef9c47ddc6e00e55655422b45
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 17/02/2026 11:42, Hans de Goede wrote:
> On 16-Feb-26 20:01, Tj wrote:
>> Installed v6.19 recently and realised the heartbeat/network LED
>> configuration I'd set wasn't working. Checking the log I see:
>>
>> kernel: platform gpio-keys-polled: deferred probe pending:
>> gpio-keys-polled: failed to get gpio
>> kernel: platform leds-gpio: deferred probe pending: leds-gpio: Failed to
>> get GPIO 'apu2-leds/led-1'
>>
>> Looking through commits I found b8754092dfed4fc2fc
>>
>> platform/x86: pcengines-apuv2: Use static device properties
>>
>> After reverting it the LEDs operate as expected.=C2=A0This entered in v6=
.18
>> so will affect it as well.
>>
>> In v6.17 I see:
>>
>> kernel: platform gpio-keys-polled: deferred probe pending:
>> gpio-keys-polled: unable to claim gpio 0
>>
>> that is a slight variation on the v6.19 report. I've not pin-pointed the
>> cause yet.
> This should be fixed by this patch:
>
> https://lore.kernel.org/linux-gpio/20260211085313.16792-1-bartosz.golasze=
wski@oss.qualcomm.com/
>
> If possible, please give a kernel with that patch added a spin
> and confirm if it fixes things.

It fixes the LED issue but causes massive log spamming (10's per second)=20
related to the gpio-keys-polled:

[=C2=A0 =C2=A0 0.000000] Linux version 6.19.2+debian+tj (linux@iam.tj) (gcc=
=20
(Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #404=20
SMP PREEMPT_DYNAMIC Tue Feb 17 14:19:16 UTC 2026
...
[=C2=A0 =C2=A0 0.000000] DMI: PC Engines apu2/apu2, BIOS v4.19.0.1 01/31/20=
23
...
[=C2=A0 =C2=A0 6.025741] input: gpio-keys-polled as=20
/devices/platform/gpio-keys-polled/input/input0
[=C2=A0 =C2=A0 6.035231] gpio-keys-polled gpio-keys-polled: failed to get g=
pio=20
state: -52
...
[=C2=A0 =C2=A019.545273] input: Power Button as=20
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
...
[=C2=A0 =C2=A021.742226] input: PC Speaker as /devices/platform/pcspkr/inpu=
t/input2
...
[=C2=A0 OK=C2=A0 ] Started dbus.service - D-Bus System Message Bus.
[=C2=A0 OK=C2=A0 ] Finished e2scrub_reap.service - Re=E2=80=A6line ext4 Met=
adata Check=20
Snapshots.
[=C2=A0 OK=C2=A0 ] Started virtlockd.service - libvirt locking daemon.
[=C2=A0 OK=C2=A0 ] Started 819142] gpio=C2=A0 =C2=A032.-keys-polled gpio =
=C2=A032.-keys-polled:=20
failed to get gpio=C2=A0 =C2=A032. state: -52
1;39msystemd-machined.service -=E2=80=A6and Container Registration Service.
[=C2=A0 OK=C2=A0 ] Started systemd-logind.service - User Login Management.
[=C2=A0 =C2=A032.930711] gpio-keys-polled gpio-keys-polled: failed to get g=
pio=20
state: -52
[=C2=A0 OK=C2=A0 ] Finished grub2-common.service - Record successful boot f=
or GRUB.
[=C2=A0 =C2=A033.050784] gpio-keys-polled gpio-keys-polled: failed to get g=
pio=20
state: -52
[=C2=A0 OK=C2=A0 ] Started polkit.service - Authorization Manager.
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting ModemManager.service - Modem Ma=
nager...
[=C2=A0 OK=C2=A0 ] Started virtlogd.service - libvirt logging daemon.
[=C2=A0 =C2=A033.158927] gpio-keys-polled gpio-keys-polled: failed to get g=
pio=20
state: -52
[=C2=A0 =C2=A033.266709] gpio-keys-polled gpio-keys-polled: failed to get g=
pio=20
state: -52
[=C2=A0 =C2=A033.374696] gpio-keys-polled gpio-keys-polled: failed to get g=
pio=20
state: -52
[=C2=A0 =C2=A033.486644] gpio-keys-polled gpio-keys-polled: failed to get g=
pio=20
state: -52
[=C2=A0 =C2=A033.580268] NET: Registered PF_QIPCRTR protocol family
[=C2=A0 =C2=A033.594700] gpio-keys-polled gpio-keys-polled: failed to get g=
pio=20
state: -52
...

 From that point onwards the message is repeated approximately 10 per=20
second.

It isn't quite clear what triggered it because the log messages between=20
kernel and systemd are mixed up there but I suspect it is systemd-logind.

$ errno=C2=A0 <<< "error -52"
error -52 (EBADE Invalid exchange) found in /usr/include/asm-generic/errno.=
h



