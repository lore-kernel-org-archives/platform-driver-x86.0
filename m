Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5491FC0FC
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 19:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774380636; cv=none; b=Wni5eNJeC5DaudDMraNIoQOcXhXWBboyzVMBv5KQaD+P8TBqYYbBjD4tiTb8/xk919AKjaWxF//Aw0BvENqcdyIkZfyP9rVmmT2n9mxAmqg/TuHNWgHNw4h7FvfnE0iSKii4fE51X2YYim1QOFRTRdQkNr9RofvkcGPaxQAU744=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774380636; c=relaxed/simple;
	bh=ymgKGPoeooEQoQbbgNnuqeErx2rALRbAoc4yda2b9dI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VYmTJJYfkeUxHWdbWBbENZumO2ev4mTpMLbelbguG9WZqzxk7wV8txjDmeYjcRlDt2CBpBKX88BUdCNUdtE/qDmc91I6LHLxLbehzXe4Hc7QMF5Cdpy6OI133Ld6yZBJd2erZM/Aao9JjSAa4ZT/bZ2h2vqhV9gcOvqos4cj0MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=P0Gc/IB+; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="P0Gc/IB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1774380632; x=1774985432; i=w_armin@gmx.de;
	bh=0HsIwagGHGVsrfaDsdsLrmCAfvgAbHqK6rWf1QSfl5s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=P0Gc/IB+rt4WCm9Na3zzTAFKu6F12bObrx8XQbgbAsc+ygElaDzBAqmg+os7LXgq
	 1GxkbxCv+3JIm3AB+KiRsXA+a3vIY6X9/hcniP2TtxCE0mmonxWXLDbQfBcz8nXZP
	 oijkexRAZfUCvLX1upNQySBp5z1bxuK49BxSRCt/gqIbSbhfimgtr4CB/3YGp1mSK
	 8Y+K3pMre0QtVP45dk0rI3uOvVs1PfuViU3qjArnvEztyAkgb4QBBJ+ijW3GfJ861
	 HiGIjDQrpajoGhqR7LD/H+GYehS4F91K0U4U8QZEZqd7PLmkoFawvw4+cgBFvWl6m
	 Y8VW1kWJ2jB/gcluQQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MK3Rs-1vqCfe0eNS-00Nqdr; Tue, 24
 Mar 2026 20:30:32 +0100
Message-ID: <05ae0012-db1b-4826-a466-f706d2a57cc7@gmx.de>
Date: Tue, 24 Mar 2026 20:30:31 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Internal keyboard non-functional on linux on Medion Laptop -
 NTC816 (Intel IPF) has no driver, PS/2 fallback produces corrupted scancodes
To: Ian Jensen <ianmoellerjensen@gmail.com>,
 platform-driver-x86@vger.kernel.org
References: <CAJ0oKyQTEJit294y=fs2s2nzhzUs_GQzsgMswDNs==zkdiqz0g@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAJ0oKyQTEJit294y=fs2s2nzhzUs_GQzsgMswDNs==zkdiqz0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WGwxia5+BPUZcwaJSrGSDrFw5NucikfXBhlGwzw3LLHXyyBt5PS
 FfAbFEbJxAAdgvGH7rqrheFoZpDxp4rWwZAgap3998a5xr8lYJwVaxmR7KFACqEV5sVczUT
 FN2HmYRSTFKdy1VnGm8QVMeGSgs7dMlKggbIunWQlpjLb+ox8VfiNpPynrLAHJlMv/lpiQ9
 y+xoWgaKQOhpQZiIwpFkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OlEcolilu9Q=;q9SofPZ0+b5zCthzo4VwH7NNvpK
 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
 nxObyWuVmv+uONw==

Am 24.03.26 um 09:36 schrieb Ian Jensen:

> Hello, I have been advised to send you an email regarding an issue=20
> about a missing driver that causes the internal keyboard on my laptop=20
> to be totally useless.
>
> Hardware: Medion Signium S1 OLED (MSN 30040793)
> Kernel: 6.19.6-200.fc43.x86_64
> Distro: Fedora Workstation 43
>
> The internal keyboard does not work at all in Linux, not even the capslo=
ck button works. The keyboard works in Windows and in GRUB and the touchpa=
d works fine. An external keyboard also works fine.
>
> On Windows, the keyboard is exposed through this device chain:
>
>    INTC816 (Intel Innovation Platform Framework)
>    -> ButtonConverter\ConvertedDevice
>    -> HID keyboard (kbdhid driver)
>    DEVPKEY_Device_Service: kbdhid
>    DEVPKEY_Device_Stack: \Driver\kbdclass, \Driver\kbdhid, \Driver\mshid=
kmdf
>
> On Linux INTC816 does not appear to have a driver. It does not appear in=
 /sys/bus/acpi/devices/ or /sys/bus/ishtp/devices/. The Intel ISH modules =
are loaded (intel_ishtp_hid, intel_ish_ipc, intel_ishtp), but only a senso=
r hub (8087:0AC2) is present on the ISHTP bus. The keyboard is not enumera=
ted there.
>
> ACPI devices with INTC prefix: INTC1001, INTC1046, INTC1048, INTC1055, I=
NTC1078, INTC1092, INTC109C, INTC10A0-A5. No INTC816.

Interesting, can you share the output of "acpidump"?

Thanks,
Armin Wolf

>
>
> The BIOS presents a PS/2 emulator via i8042, but it produces corrupted s=
cancodes. Examples:
>    - H  shows 0x20 (Set 1: D)
>    - A shows 0x03 (undefined in Set 1)
>
> The corruption is not a simple offset and does not match any known scanc=
ode set. This appears to be a firmware bug in the scancode translation.
>
> IRQ 1 is not showing an interrupt storm (~10 interrupts per keypress), s=
o this is not a stuck interrupt.
>
> Boot parameters tested:
>    i8042.nopnp=3D1 i8042.direct=3D1                         -> corrupted=
 input
>    i8042.nopnp=3D1 i8042.direct=3D1 atkbd.set=3D1             -> corrupt=
ed input
>    i8042.nopnp=3D1 i8042.direct=3D1 atkbd.set=3D2             -> corrupt=
ed input
>    i8042.nopnp=3D1 i8042.nomux=3D1 i8042.reset=3D1 i8042.notimeout=3D1  =
-> no input
>    acpi_osi=3D! acpi_osi=3D"Windows 2013"                   -> no input
>
> dmesg:
>
>    i8042: PNP detection disabled
>    i8042: Warning: Keylock active
>    serio: i8042 KBD port at 0x60,0x64 irq 1
>    input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0=
/input/input3
>    intel-hid INTC1078:00: failed to enable HID power button
>    ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}: enum_devices_done OK,=
 num_hid_devices=3D1
>
>
> The closest existing driver in-tree is drivers/platform/x86/intel/hid.c =
(handles INTC1078 and similar). INTC816 would presumably need a similar AC=
PI driver that enumerates the child HID device and routes it through the i=
nput subsystem
>
> I have attached my systems info
>
>
