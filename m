Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794164978;
	b=B9REK7sHBavyOq/L9GgDJJdFqggNJ4AtoW3SXE0c09bP4jdOduDv46YstLqbJArW3BdL
	 cMKPRt33XPb5j4p9EsRxSR4Uun7iGkSp7ktA/v/iGFgWYl/L8bNHdC19iQzCkGn3gKwWW
	 1k2AcKdYrrLyCK9uU0dmERT6qyjAXch9PhIF690SNT3/RrDtSf7aMgUbSZ75ORSVYnoIb
	 y7DJ8PeNRFUf4FK7nTQU73BeFkv6SCrBktNp0ODsPlTL7fs0VZlmlzKeUYAZhyFkIO4JS
	 X6xX1TjDPy2qxj4aHjeFVQXvNCa2oUV1pXdERWeZ+zIblZCzOTxYKwObPPeWcAeaJEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=nVPhrKJfbSmpnE1ryW+os71+IdLIXTokbMOzIHpkGpM=;
	b=oLxT5G9yDRFN8WfhuG86x9QOzWfo1jdEZRm+bJ42MaV8kPMeK3I/28k1cEllsgwd0jm+
	 qbXt0xjVCiAEx9yYhieZlhYOLWIUEgKAICeU68j47KirMnD20hluAbYpUwwwx9XCyeBNl
	 2G46eoM2bxTakb7sSbGDT/JASvntOEqoOmJ9Ng9OmOBmp6DuzWchg2gfxUdxrBsLOE5qq
	 jYBo+JTDSwe4/oHrmiuTabue0VwUvUWvs+ZByGpmvxwCN4gjBiUbrUEMGcpQeLv4vFDNZ
	 HVQucEDsOpGg8Q/f7xnemXjd5s3mu/WWLv4tbsOkI9bPbuoaLu9vo47MH/ASWX8tJZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nyqhPkoJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A653C606A31C
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2026 19:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A653C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nyqhPkoJ
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c0f0e04628so24667e87.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Nov 2026 11:09:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794164976; cv=none;
        d=google.com; s=arc-20260327;
        b=lgcomNMOwqhjg/ZEfFByYCtpQbnisYAP7kNQJ9hL3Fb9w6thb1sVHHZL7rOIFDbB7Y
         akbZqquWNCZ+Zpsol6TGPeMGGbwTphN25sCzf4Yd0pQl3uVzrT7tASe5P9CDHpPn1YsS
         hzgAB36kHcXWOxmnMtLtIJs2hYD4XjNl4UsWPWlajg1njHciNTw5l/okzpgFI/gE/rgK
         xG3IyvPpjCdT6gMT0QaUoB5ig9AgVdhHapq72TiTuh5+jrwUJ52axaLhw4k/2HvKWi7B
         8wQ3jhd20JTKR/XQuCBY5zcf/cdv1ECU1jA84byb23QO2QqKpUr7+kh1ztkwa2+oUTfv
         QWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nVPhrKJfbSmpnE1ryW+os71+IdLIXTokbMOzIHpkGpM=;
        fh=ClWgzjGDGPtJ9NdV7X44lnMnAQLn/jzpf3m/Ewp1KpY=;
        b=AYIg89nk28O66rMstHx0li4W2gYHClIZEKFZX5ZhM8DLR/BSYwa5qPQN1gqvm0iEP2
         L6e/iFmnNWhE0LTYh4mguzzuWa9Fe+5id9CNqCWJF/Q1cX9IjIcHtG+sqfzp52oVCwdn
         q5joxJbCxFZjxKQULNi5fF8mcfzi0FgFE0bvSJQhVZXgTBtgA9LaKnHk6H0XiorOZG+i
         LKy42P7y/DPWOQvZf31quf2zFbJhLa5cund3emcrIsZoTPiL9egfO8pgDxklq67IduUJ
         Q+YsVnn3EF/sX3J8jkJfMeAoDW7mXkaHtvC6Oz0XLYdQ8H7rDbFNpGJQ1pmMGOeKIA/i
         4E/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164976; x=1794769776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nVPhrKJfbSmpnE1ryW+os71+IdLIXTokbMOzIHpkGpM=;
        b=nyqhPkoJf4ud3o1TNoUahdgrSk8UAzNFro6L20LwdXi6pzsG1JFYz7/hq+yiq56Sos
         hIdYfIn7fBJakdI4m+bmVlv2y9vUaw91XeEMXFwCN8sKIUaSHTq9ec2wFyGVfwnFT0r/
         jRS0GMBjeJWcVqAl4vWKAMXmmzuHhp3dGlsb3RyGYTUlN1GB39Wqp+pH/S7ri2ksB40S
         mOul80aft9gc0KlaHVkXRUMipjiiw3PzmpaLddu4ZdbKPo+vFwtprGd+EM4UB48OkEK0
         tJEN+w2HClt45BB1n+TDYkVMWWZuZu74L/iNF9FE01IrMjVd6fGC/0U2X2oatkpDZsoj
         oCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164976; x=1794769776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nVPhrKJfbSmpnE1ryW+os71+IdLIXTokbMOzIHpkGpM=;
        b=htzlr623qP3M5h+shhdNIsGmqiTHcf+TV8RhK8GlC1GDH/gwTZtW3raaCr0V7SLyLl
         Cu0eMneH9F6goe7r8C//SHqq5uNLvWEis9qDrDppzvtzR3Ocaso+J1Dcwx1B1qVE7F+w
         RhZ8oF9SsTLHdwUYbn7px1hvvHr0bBU2522YBVczNN6QyQPN00yYkD1sbWiSNTaYBR1H
         QTvk66EQT9RnFpvGvL+ERbptNctDUS6zrc+mfScs/4nArzLHaFQCBcOg/k+AMUSgsNCy
         jsWHHWfXg2u638tTs4rnnIVE5TJE6nfBUZVoDNxNC2e/DACV5jGkbTytuLQqCT0322e0
         mUSQ==
X-Gm-Message-State: APuU4Z+D7v353Z4OOMjn1QALafuSOZNDlqZ6JlIm6f2uERWrgSxE7PlY
	aFficD49dx3djpzWZhX8gCMTAZUsKj7lFK9dG3i5e/Q5C0R2dPVjb+7tYqtyghyzxS9u4JSTPDn
	Cj8C74mOEArHLO7/9GDhDCDTsquBNXwo=
X-Gm-Gg: AYBFou3eCB9/6k97/WbBsF1BbGBwSuYR06RadOFXvxOO33MU/V5nMXvk/caBVyhoVj/
	FK1mDPzFfQ+740M/3hHbmc91/Eg0swCxHv9Aw83aKPACA1xtqbYYKsq7lwOo/QRbP9balGIK11F
	zW0JHCipiuqEQTuaLBzUnQqY7dn1FUvfNsyQ6zTFkx7L103sCRpl7T58cdlQcEO3ZzbUemeFLwK
	k4ESN1rcNf1uKBiaUCVGm+La3mcJRsXrT5/kYu5Hl7wTgE1/c316xWHBzh2t3LfMtVTQvaRR3fw
	0e1618+8SuPiJmu2vQxSR0/Krwvi7cQH7f88zDwADSp/R8aarw1L+577+tyzDxHYWZLCoL2Vlr0
	0xfKS+gCp+vbpAXwtglQ8dp6IhnKg/eUgOPKm5YvhkVntx6deGOi32pIvJAzTNPn8Cbj2dXKRMQ
	i7QmLnMFx/9p/4sKA=
X-Received: by 2002:a05:6512:6516:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c14bf215b5mr451239e87.0.1794164975540; Sun, 08 Nov 2026
 11:09:35 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAPvUaSo1D+1Tvk3-4TMiXw-ScBtY8Mu0FzO7R_EG6zrjYfjYqg@mail.gmail.com>
 <asxTYBiGy6lf6-Ki@archlinux> <CAPvUaSo-ubCOCYYPadY1C23y1Fd_AAhQLuVKWRa6F1XVh6mk_Q@mail.gmail.com>
 <asz7WqGzukhkYHGD@archlinux> <CAPvUaSrbWrBuvAi3R02xC8w8M5Yh97pVd3-+FBXLp3mPgG5cUQ@mail.gmail.com>
 <as0bOFOoaaw-smyB@archlinux> <CAPvUaSoBgAG=MX93vMhfEiEk5bYXGydFsGn8CpoCu_QVQRPTCQ@mail.gmail.com>
 <CAPvUaSpPVYc-5M72G0Hf9JPsbdAp2-4f-p5OetYbMKdLqm0PXQ@mail.gmail.com>
 <atEh9Gon95EFIq76@archlinux> <CAPvUaSpq2d5hkxTaqAL6rBoeHct68Y37C4nSpV+goGZ-QwrCsw@mail.gmail.com>
 <atJc2J2hYrdI_Eun@archlinux> <CAPvUaSqAnLYVuzcq6Zq=hRp6JBoo8upjrsy=LSxnLdXuTyHDaw@mail.gmail.com>
In-Reply-To: <CAPvUaSqAnLYVuzcq6Zq=hRp6JBoo8upjrsy=LSxnLdXuTyHDaw@mail.gmail.com>
From: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Date: Sun, 8 Nov 2026 20:09:23 +0100
X-Gm-Features: AclHuK_FNAfGTAsVxz4a8U8h_DJnTbqCdNj-mRMbyDEevkGVnR6kp2dma-lgvo0
Message-ID: <CAPvUaSpk3wKyedtwcJpKFeQ_DGRJNa2-wXwVGSzX_bCadWozsQ@mail.gmail.com>
Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP OmniBook
 5 16-ag1xxx (board 8DF4)
To: Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, W_Armin@gmx.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Subject: Re: HP OmniBook 5 16-ag1xxx: fan stays off, thermal tables
invalid, results after BIOS reinstall

Hi Krishna,

A follow-up on the OmniBook 5 16-ag1xxx (board 8DF4), with some new
data after reinstalling the BIOS.

1. Reflash result: I reinstalled the same BIOS with HP's official
installer (DMI reports Insyde F.12, bios_date 04/10/2026, i.e. 10
April 2026), then did a hard EC reset. With Fan Always On disabled, a
stress-ng run on CachyOS reached 85 =C2=B0C with the fan completely stopped
(acpi_fan: 0 RPM), and I stopped it there. So the firmware reinstall
did not change the behaviour.

2. Thermal data from the firmware: on every boot dmesg shows
   ACPI: thermal: [Firmware Bug]: Invalid critical threshold (-274000)
   ACPI: thermal: [Firmware Bug]: No valid trip points!
The only trip point Linux exposes is thermal_zone0 trip_point_0 (type
hot, 103000). There are no active trip points. Both lines are present
in every boot I have stored (4 to 8 Nov), before and after the
reflash.

3. A new intermittent error: ACPI BIOS Error (bug): Could not resolve
symbol [^^^^NPCF.DTGP], AE_NOT_FOUND, followed by Aborting method
\_SB.PCI0.LPC0.EC0._Q37 (AE_NOT_FOUND). It appears in only 2 of my 14
stored boots, one before the reflash and one after, so it is not
caused by the reflash and not present on every boot. It seems to
depend on an EC event.

4. Fan state: with the fan stopped at idle (0 RPM),
/sys/class/thermal/cooling_device0 (type Fan) reads cur_state=3D1,
max_state=3D1. dmesg also says "acpi-fan PNP0C0B:00: Using Microsoft fan
extensions". I don't know whether cur_state is meaningful on this
firmware.

5. Still the same as before: the WHCM/WMAA AE_AML_OPERAND_TYPE errors,
hp-wmi "Failed to apply initial fan settings: -22", and WQBC/WQBE
"CreateField of length zero". hp_bioscfg exposes only Sure_Start
(error 0x3, feature not supported).

I'm not claiming the thermal-table or _Q37 errors cause the fan
problem; they are just firmware bugs that are present alongside it.
The fan stays off under load on Windows 11 as well, and HP's UEFI fan
speed and thermal tests still pass, so I have asked HP for a warranty
repair.

I'm glad to run any commands, collect more logs or test patches if
that would help. I can send the full dmesg and the journal output.

Thanks again,
Lorenzo

Il giorno dom 8 nov 2026 alle ore 11:33 Lorenzo Collevecchio
<lorenzocollevecchio17@gmail.com> ha scritto:
>
> Subject: Re: HP OmniBook 5 16-ag1xxx: hp_bioscfg output and fan
> results on all OSes
>
> Hi Krishna,
>
> A quick update on the OmniBook 5 16-ag1xxx (board 8DF4, BIOS F.12), in
> case it helps with the HP side.
>
> 1. hp_bioscfg: the driver loads and registers hp-bioscfg, but the
> attributes directory contains only Sure_Start and pending_reboot.
> dmesg shows: hp_bioscfg: Returned error 0x3, "Invalid command
> value/Feature not supported". There is no fan or thermal attribute, so
> I can't read or change "Fan Always On" from Linux.
>
> 2. Fan behaviour: it isn't specific to the kernel or the OS. With Fan
> Always On disabled, the fan stays off under load on Windows 11, Linux
> Mint, Arch, CachyOS LTS and CachyOS 7.3.1-1. A full-load stress-ng run
> (all 12 threads, platform_profile=3Dperformance) reached 92 =C2=B0C in ab=
out
> 35 seconds with no fan. A 2-thread run reached 83 =C2=B0C with no fan.
>
> 3. Timeline: BIOS F.12 has been installed since the end of July, and
> the fan behaved normally until October. HP PC Hardware Diagnostics
> UEFI still passes both the fan speed and thermal tests. A hard EC
> reset and BIOS defaults changed nothing.
>
> I've also reported this to HP and asked for a warranty repair. I'm
> happy to test any further patches or run any commands on this machine.
>
> Thanks for your work on the hp-wmi fix.
>
> Lorenzo
>
> Il giorno ven 16 ott 2026 alle ore 19:26 Krishna Chomal
> <krishna.chomal108@gmail.com> ha scritto:
> >
> > On Fri, Oct 16, 2026 at 09:06:03AM +0200, Lorenzo Collevecchio wrote:
> > >Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP
> > >OmniBook 5 16-ag1xxx (board 8DF4)
> > >
> > >Hi Krishna,
> > >
> > >Thanks a lot for digging into the ACPI code, the explanation makes
> > >everything fit: the missing GMCF call for HPWMI_GM, Local2 being left
> > >as an Integer, and the -22 coming from that.
> > >
> > >I also tried your suggestion about the platform profile. With
> > >HPWMI_READ/WRITE the errors should not appear:
> > >
> > >  Before: dmesg | grep -c WHCM  ->  3 (the three boot-time errors)
> > >  cat /sys/firmware/acpi/platform_profile  ->  quiet
> > >  After:  dmesg | grep -c WHCM  ->  3 (no new errors)
> > >
> > >On the fan: thanks for confirming that acpi_fan reads the EC value
> > >correctly. Together with hearing the fan on Mint and on CachyOS at
> > >idle, that makes me fairly comfortable that the 0 RPM readings are the
> > >fan really being off.
> > >
> > >Your plan to query the fan count and hide pwm1_enable and
> > >fan{1,2}_input when it fails sounds good to me. I am happy to test it
> > >on 8DF4 whenever you have a patch, and I can rebase it onto a stable
> > >kernel tree on my side if that is easier for you.
> > >
> > >I also tried 7.2.10-1-cachyos: dmesg and the hp-wmi hwmon folder are
> > >identical to 7.2.9 (three WHCM errors, then the -22 message, and
> > >pwm1_enable still present).
> > >
> > >Thanks again for the time you spent on this.
> >
> > Thanks, I will share the final proposed patch on your Bugzilla report
> > (222138), and leave this thread for others to pick up the WQBC/WQBE
> > errors.
> >
> > >Best regards,
> > >Lorenzo
> > >
> > [...]
