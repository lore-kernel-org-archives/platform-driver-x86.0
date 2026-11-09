Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794265833;
	b=sn0OVIlLksekf7HtaInq5+mdzufwO5pIjuVPWsSkjw0uYHcOpL/MKxLSosMv6QyYMqRr
	 7mSUVfqNqx4c7oOttb+z4yIrxibAJwtoh4n1JhfmWlH9JCJhBZaTRVy0p9r6RC1q7GyRr
	 qXa1caIXgyMP/9QIbOj0zgvMrwZByh1pXb5S6AJfThl3t/GO1kc7Ty1Cg0EqvWYmFZ7By
	 HzBpDIr9Pu8V7EWo+qm+C+FaM0SG3VBM9B4k+SxziCIJ+K8BfHwb3SLfxZ+qKpy74T8Nq
	 CBSQ53vmtn1p2dfFMHUWk0ioFmS7GOUzl7PMNZpa1HPAzs8jdQExnbtQGnfMk9cXmJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794265833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CeN01vbNZQ47eEh9Avoe0zLX5olmSueBg1N4z40LWa8=;
	b=ECQL8GC7SEgW7dRZGiQQFdaUq4taLw6JKfOZsaqwjYzrzwL1icBzb6afcazOIP8gBCdh
	 mpmNi+YAu/9TGK+Rv6uTKNfSVmJfacy+z1kYCPS5nopaF8R50Qe5nOPa+py2kOWrk/rO9
	 cFjBFsLg3m0ReqUJz98CR60MshHhVSWf3s+l43vbZCZE2esu1ZkQazpo6PK/iWFgBkywj
	 ViLQyXWBtn+N41Mdlhwq0htMzgriA6LSMThxec4xDXTuucDgBBkZyuek5FbJ7cx+qPDtR
	 lY/kx4+bx0qYry8eB05/k3zWnKPguFMVImcMNnr6oZkW9ocj3bP4W1YEPAkjB2gN5Ig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EyvQ6R4u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BA6606A326
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 23:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0BA6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EyvQ6R4u
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37198ed3727so1925772eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 15:10:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794265832; cv=none;
        d=google.com; s=arc-20260327;
        b=CPWFkHLwx7nTKcO9KEIUJHjt3gzX9kj5SIQpvKfONs/L4NjH0EnPKctUig3HAjfwdE
         XPkKrLvLVIwgQR0LXvNvBLv7LWZEqArmkKoUREBMzICo7wZZ9Hr0C7sUiFlGvcYPkv6m
         vbDkW+lDZPHyWvCyerVVGuWNnmGfBpfWaABpbhdD0CxFUSY4eFw6T/NpcuZnN4k1JFEs
         LShPBhM+A5Ms6ye/7YNTnVUJ+vK4inSi6Jgjqs0UX31v4/o/pdv1A8kzYdg8CDM3o15l
         z0o92J7u2QJgoYIJyfbmTSz9hIPGNrZVnc8elLGDNr9CGj0wjJ58V1ZiVMx6EIPlqT1H
         joDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CeN01vbNZQ47eEh9Avoe0zLX5olmSueBg1N4z40LWa8=;
        fh=ypSZPC3sGxCUuUx0uno5tV4oAeHZjzyeeWiSBJ2tze8=;
        b=A5f5IWwe9GNV+GWs6fKDncyF/0tyTqo56aPODBxWIF2G807+VH+mH1WyI05zqB2Kit
         y124fgbPE4Q2GktbPpiWXEW73YaQgM7TXQ491y4Sai+cugVvJKtIzy0WgtZu2sluAsJX
         aAGxcN6/XWeyfN6/t1hdGK+lPd5uHs52I8XLYHk19z/5E5E5DikEmP+6N+sjZu33TxFC
         73WIyhppkatEn8tMjFydMXdAcwlzzbsK7KDE5vokAHAsrfuuyw9/H0ByBaIW1R1sCTR2
         Y8SzHDvHk5AnsrfQDad3hSoAUS3C6XBRkjXRMmdRDnO/uC/SgSMN1/P9LAcc5kSJjDsV
         Dvvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794265832; x=1794870632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CeN01vbNZQ47eEh9Avoe0zLX5olmSueBg1N4z40LWa8=;
        b=EyvQ6R4uuyXmviqq7ZVFqZIFzQlkiXqW9tfrgKAUWTUMgV7dMQBh1mEEhVmD4UEPb5
         Goo3/UnI9VUq5+7khqIGuT1ZRYmY6BlIQIp8HLMByVsQWd2cjM9jNCx67yvWhHBixbz7
         DNmzzau0JrGagxIBLKv7MHt92YwMo4fDKtmFeIHo3uJfMpv2FOWMg0pp4TxD40unWdsN
         KxZ6drl1lU+A/h20VoRB4e1EHzmFJ24GJ8LxHoR+2Vi9vpCzTjJH4tPZ4xgkAhZ8IxiB
         3jIbuH9mLBZRUVGxc10Yh40mt/eyFd9ZmXOZorIJfhdL6+ye+vUgiwCcWbouK0AYYo11
         NhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794265832; x=1794870632;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeN01vbNZQ47eEh9Avoe0zLX5olmSueBg1N4z40LWa8=;
        b=wS7Sn9TDiZUIj8T98IjBfGYCcmrZe6DQCuX8VFyI/q/16wfvLIr3G+BpQDG2RPIEX6
         bcN/KzXjSwuusYj0ddRHYU9n7wnEBMyiyzJKDmpqBvCYCOHLEpdXksit2sz1QxR0RvMr
         ZjCLGzACSjSe3oHY4dByXgnB3VE3S7pOLIololSpO2a/45n3b4Ipvvpa3weVZpYSZhK0
         9z6wpK77AxfukAwv56X19dSTlwn5xLAWAisGEcEmzLAl2ZK5tZ3hsdE49gA19I9CKEuw
         Yyn1Nh65+begLS5mMP5ltCZMiO/tskQTem1aNNSg0ekh80/pA8tECmAU/bJcv5AJAbXR
         bkzA==
X-Forwarded-Encrypted: i=1; AL+hErFauS+t9joA5iXN3AU6LH31ZenP3PgcatIlmtU7OoqgWQYy5pIZxRNFhXFSwHRWyBZMj3g/587Bh88L3E0nR9WNDF7d@vger.kernel.org
X-Gm-Message-State: APuU4Z/DeDgHCSaj3+aUxdIU7Z2FUOJxQG3Il6E5lSWCCIOPEXJNKrXO
	LlIFT7vQAbh33pfNR98w+M2UNa6tXUorWCjQT67zYFD/WEyL+cR4icmXhBBTDJAFjvLC91HTDS8
	f6BFXP4SOlsqIaJcjyXocLglnwppNV/U=
X-Gm-Gg: AYBFou3EUzsCZyXgxiESz85i5MP50YdsPSGINK5ccs8mU6hZ4j7CLcKQ0wsjwrQTnHy
	U5HpP/OQTicnv4WMISBElWFnyBGsWzAnp39a/47947Q7XyL48ylC0slFrvmpHdWADHHmhDgfKYz
	q0Mw8bZp/XI5l1lttURZiG3Y1QGaRjuxh+Z6MKwCBq552gAYRGWIgLWjXpUrpYtF36cV/3gXFyj
	n8Vx4y3NqSirCI8TtN+qM5dnJ1Zix1W8AGWiCs/UAqvrNuBfoUJUVpyc52osMy5YHqdNgDBxyJS
	7UcBDVlmjg3QCMBVoyhsXy+6t1Mgf+PBzxOy5NNMD/rqydtRXrTgpPAI2uBJ85J41j72JJhVa+h
	xk54/ls9y1U1Oy6WGnbXl8dSK2JbsgcLXjmof
X-Received: by 2002:a05:7022:3a0b:b0:14a:a6dc:9cbf with SMTP id
 a92af1059eb24-1b3b603b42cmr1305082c88.4.1794265831769; Mon, 09 Nov 2026
 15:10:31 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260925205226.883724-1-ciro.pedrini@gmail.com> <asR-FLwLfpyT8uOz@archlinux>
In-Reply-To: <asR-FLwLfpyT8uOz@archlinux>
From: Ciro Pedrini <ciro.pedrini@gmail.com>
Date: Mon, 9 Nov 2026 20:10:19 -0300
X-Gm-Features: AclHuK8TyNRcPp0b9z7lECemH9V0gwfILnthmI4geEHwNdHTffkXe_9drxx8YF0
Message-ID: <CAPKD0HdhnN6apu1jJpXEG1mAV1=GCA-rjBdt=xQsVX4KknW8mQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add OMEN board 8A17 thermal profile support
To: Krishna Chomal <krishna.chomal108@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Krishna, sorry for my late response.

Unfortunately, I can't right now. I fixed a power usage issue on it
(the performance mode wasn't really using the expected and reported
wattage, perhaps you encountered the same thing?) and it died a few
weeks later.

Guess it was used to running on low energy and decided "enough is enough".

It's at a repair shop now, so if it comes back to life in a few weeks
and you still need the dump, I'll gladly send it over.

El mar, 6 oct 2026 a la(s) 1:52=E2=80=AFa.m., Krishna Chomal
(krishna.chomal108@gmail.com) escribi=C3=B3:
>
> On Fri, Sep 25, 2026 at 05:52:26PM -0300, Ciro Pedrini wrote:
> >The HP OMEN 17-ck1xxx (board 8A17) isn't in omen_thermal_profile_boards,
> >so hp-wmi uses the generic thermal profile query. The firmware only
> >stores that value and never acts on it, so the EC stays in its default
> >mode and the CPU is held at 45 W whatever profile is selected.
> >
> >The board uses the OMEN interface (mode byte at EC 0x95, thermal policy
> >v1) and also needs the timed profile quirk: without it, the EC drops
> >back to the default mode about two minutes after each profile change.
> >
> >Add 8A17 to omen_thermal_profile_boards and
> >omen_timed_thermal_profile_boards.
> >
> >With this, all three profiles work and sustained package power under
> >load goes from 45 W to 56-79 W.
>
> Hi Ciro Pedrini,
>
> I was working a patch[1] involving omen_timed_thermal_profile_boards[]
> and needed some diagostic info. Would you mind attaching the acpidump
> for your board 8A17?
>
> Thanks!
>
> [1]: https://lore.kernel.org/platform-driver-x86/asPy5Q5wNYaMzTqJ@archlin=
ux/#m922ff6cf9a68285d2b0f64e578fd6d2d6fa573f4
>
> >Cc: stable@vger.kernel.org
> >Assisted-by: Claude:claude-opus-5-5
> >Signed-off-by: Ciro Pedrini <ciro.pedrini@gmail.com>
> >---
> >
> >Notes:
> >    Tested on 7.2.7, whose OMEN profile code matches for-next. Without t=
he
> >    timed quirk, EC 0x63 counts down from about 120 after each profile
> >    write, and at zero the EC resets 0x95 to 0x30.
> >
> >    8A13, 8A14, 8A16 and 8A18 appear in the same DSDT. 8A18 is in the OM=
EN
> >    list but not the timed one, so it may have the same two-minute
> >    fallback. I can't test it.
> >
> >    I used an AI assistant (Claude) for the ACPI analysis and to draft t=
his
> >    message. I tested the change on my machine and reviewed everything.
> >
> > drivers/platform/x86/hp/hp-wmi.c | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/=
hp-wmi.c
> >index 7ab81ce5f..76f489d5d 100644
> >--- a/drivers/platform/x86/hp/hp-wmi.c
> >+++ b/drivers/platform/x86/hp/hp-wmi.c
> >@@ -207,7 +207,7 @@ static const char * const omen_thermal_profile_board=
s[] =3D {
> >       "886B", "886C", "88C8", "88CB", "88D1", "88D2", "88F4", "88F5", "=
88F6",
> >       "88F7", "88FD", "88FE", "88FF",
> >       "8900", "8901", "8902", "8912", "8917", "8918", "8949", "894A", "=
89EB",
> >-      "8A15", "8A18", "8A42", "8A43",
> >+      "8A15", "8A17", "8A18", "8A42", "8A43",
> >       "8BAD",
> >       "8E41",
> > };
> >@@ -226,7 +226,7 @@ static const char * const omen_thermal_profile_force=
_v0_boards[] =3D {
> >  * "balanced" when reaching zero.
> >  */
> > static const char * const omen_timed_thermal_profile_boards[] =3D {
> >-      "8A15", "8A42",
> >+      "8A15", "8A17", "8A42",
> >       "8BAD",
> > };
> >
> >
> >base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
> >--
> >2.55.0
> >
