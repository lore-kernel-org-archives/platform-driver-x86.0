Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794134038;
	b=3Ul542p2TlWwoEkACpppZSkbH/UcWsHAVApHlVCTOd+BjZUp6FhT6EFv1sTbGbvdavvI
	 MSC+pFgMQgPY4MPXFW5voHjGqDWJlbRnJgASbXbYz8sY+WVnHboaYqhurP9bG5Fe+eEDn
	 S5FvJ4/6xDLt+0e5px64L7roEjm4a/PcPNMGYvzFZPhlmraGEjJwRvke1xs8XlsQvpQZg
	 LbtFXwzRhDaPsjipVQO89McpqqcjsAnqm6rDscwT1X6DmyPKsgu7I19Y/oG3qbNvO78oU
	 EafB++MD1G6NFlGgJ0LXjE2WSOvIsaV7oJTwQRUSkjuBZBcc3Z4WMuYGh+gX43fZoGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794134038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=glvGrWRT1QN/fE8UGYdsbVnUnNT1CZIwbxztIXMB48g=;
	b=NKXV7jWaCkA7j5I7l+L9JU/132BR/6ng/7UmQKJltnDLhlvMvFcJPOFIsjKnxgUJjkJH
	 KJfPfPx1SnmBHkxpxSX3VE6WOl7uDM/JtdxvGgxOseVadHftMLkKpSFIJhU2KA3ttcyKg
	 y7IwdjDk6FBkqHUiZFxL8IOZtAnNBCeKu9XjTxKsRlaYPbdfY972YV6RuOOIGLnNAAtD1
	 iGscF1YjFwdICiJ+wgLSJW0WJQGvsv821JDku+trmQYffFDkmeC1Zy+zasxLxjzv1Onh3
	 BB7iMxJquqmDpVukXLTiU123juEaOQzvpot1hMnfxn+4VFgVUFkhiAeJGtVhAVrBz1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aZyBVlwC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C3A606A31C
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2026 10:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99C3A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aZyBVlwC
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adf89523d8so35491fa.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Nov 2026 02:33:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794134036; cv=none;
        d=google.com; s=arc-20260327;
        b=UtXFMyb7f+jZ5HhhcxbJbcmBnLEiH0r2yEdimwBTdPnsLBrAIlbtaPfDH3DC0B+4JJ
         OSE+MMZiDLsQMqbN2LhFDrHqCLqmguaIUNVQsz5caeqkViZd+24b1Djvzs+PTwRe75ck
         MqrL8IKIuFV6+MHutdYDa1gIOMEuIlCkkzEwBaK1ozgWAxx3s9iJbtMaoxG/ZVx2/8bC
         ioLCCczlh9H98UYEPwzl+H67OELVzoBA0y4BX+lTquqHtV/wKnfOFpBlrFAe6HUmrh1/
         oeGh1KYhzjL3OhfgVkUXts9oyKco0YygukFQrasOEORF1nJ8Fd0yXICXikh8UD5onRwn
         IkmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=glvGrWRT1QN/fE8UGYdsbVnUnNT1CZIwbxztIXMB48g=;
        fh=ClWgzjGDGPtJ9NdV7X44lnMnAQLn/jzpf3m/Ewp1KpY=;
        b=Sj6RwUHNAfCfFxhfFgI2N/EFSWhEvEkSU3aW2J+q0suq6y4yv51aXZHkm/1poy87Cs
         Lkj4y7qkBZWc2z+TpsQwGUmtOhM556gpfOOX4hWqHtqVeOU77YQiEluoHrvQ0MLdVIPc
         /U/P1kFiqblvmvHe6IeQfviwc0bAgH5ukglegVC6V6JgdRSTQZ4p5lBY4jZ4FkSHgAIW
         HlgYxMj0svZPKgv+THPgWljRHHv4js8saaGLWD5LWySxqtSqK93OAC0/Fpdadl33EtXg
         t9INxLwEYrJMQJYN3/sDMXTE1lOEP1NLeHNyeP/GE0NA8f28r76CcgZk61vsL79W2qXw
         my6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794134036; x=1794738836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=glvGrWRT1QN/fE8UGYdsbVnUnNT1CZIwbxztIXMB48g=;
        b=aZyBVlwCf3HtdIM+1sV0UWQdH2oSFkOc7HO3xGCc2YUHvHTXKYT7khh2XIxyNQ+mtv
         ASKuqDjU8ERXQwDKG9KaoDqfPNad9Ukvu/lAl6xSetw/JW7T2bE0av8FKX0Rsdq8Bkhk
         qFIx5stGz4MeP50q2tDAwKTLMmrax8Dp/bj9D9D0sIWULCizXkZP4q9MriCyyWoI0TFv
         SbG2YCAzt5VAVm9BKTHlVK9CTS9aYYhZgtNifmVAFMTo6qxN1QmDa6v1YVinqxIeXQXA
         N1/Wqf9Rc7JpqFLKV2qx6vi+v7qRbszs4wLnkL9fYoVjOX3qdUPV0ltxmtL9qIjtaNT+
         2T1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794134036; x=1794738836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glvGrWRT1QN/fE8UGYdsbVnUnNT1CZIwbxztIXMB48g=;
        b=dUMRbJleDfGKHm4pj5We7bhz6BfVu5HlDjQ1dYBLog8p1a+EwiBl71iG6an6E3emQg
         +0zyuukP7Bmgky6xL1RyDw8gRumMHZdKaBTIl/3GqKuM1ccqOW9GVHlHTjccFvcH9viv
         jHDw9oP9rIgtJxLRzHcFLvIuy88bzUBFJ1EuP2Kvc8cfNW0QDBqSOOMf8HVfuchJIxU/
         Q25jMPefrMDZNro0aLWOWBx2260MsAa/ZornOk3ndtulYdOP55yCwfmUDYLzyuBs+7qx
         7F5YPs4gxOcOjSM3iuhiWUy3QjaC2sX/e8EMgP7TwLiL7Loc0wK5HxPPDZzTEKOAj7K5
         BT7g==
X-Gm-Message-State: APuU4Z+JB5xCdLHPlIwh1v4aIP8AGlWkW2rlLjhxsyvAX3fjL4lz6St3
	50uppbf375dn8qK0w8CidTZ6adLkSSb27BzAIiyyVCaLgkYe2W1+7/gp9f6n1C6HKveVqDZ+CZr
	2L8Cvy2Y0fmqAN0HycqMkeJ0ohk4kP9M=
X-Gm-Gg: AYBFou1d3PQu7ZxtHdNC+vPy9PAtYr5EG01dZLTiZbyn/1hm+RAn7gs4otDgwrDrqV/
	fPancFotOoLf5dDN0cwCJPBcGwk8xGG91lnaLTTHOfXlYi7dYvbN1fOG1e7jahWxAuAYvKW8R7A
	r29feArFrzidbJPoJaWoXLSxAEbSyLlf0bYkr6zKt3syegyxZp2WAbMu6btRSzkNXU4Uc+7tDUh
	tNO02lnocYNBwodtrKrOu3b7KfqFjHpHPAHZIxHvhd6y4vcRVQ292gNgeeRgqfbHIYBuDZg02/B
	bSS7wttX4irGc3Dd4fuNN9FR+1PnLM1CSYFigGe0IEOxJIB0Fxdo5ler6HKy7mFc5NqjsuBoDyI
	Y4ej79GPPBW+V35MPGz0vX/TrTFNFT8g0oMXLidFKVYhFv2mWk4DZDO2AG0iJGa9roXci+Q==
X-Received: by 2002:a2e:7a04:0:b0:3ac:ddd5:55ee with SMTP id
 38308e7fff4ca-3adfa3a50cbmr2094571fa.2.1794134035626; Sun, 08 Nov 2026
 02:33:55 -0800 (PST)
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
 <atJc2J2hYrdI_Eun@archlinux>
In-Reply-To: <atJc2J2hYrdI_Eun@archlinux>
From: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Date: Sun, 8 Nov 2026 11:33:44 +0100
X-Gm-Features: AclHuK8RS4vQ3n6u4Bm4vCHvO6Hnt7D0ObPsJjucxe4puVLCmB39UPpPrbPa-oI
Message-ID: <CAPvUaSqAnLYVuzcq6Zq=hRp6JBoo8upjrsy=LSxnLdXuTyHDaw@mail.gmail.com>
Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP OmniBook
 5 16-ag1xxx (board 8DF4)
To: Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, W_Armin@gmx.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Subject: Re: HP OmniBook 5 16-ag1xxx: hp_bioscfg output and fan
results on all OSes

Hi Krishna,

A quick update on the OmniBook 5 16-ag1xxx (board 8DF4, BIOS F.12), in
case it helps with the HP side.

1. hp_bioscfg: the driver loads and registers hp-bioscfg, but the
attributes directory contains only Sure_Start and pending_reboot.
dmesg shows: hp_bioscfg: Returned error 0x3, "Invalid command
value/Feature not supported". There is no fan or thermal attribute, so
I can't read or change "Fan Always On" from Linux.

2. Fan behaviour: it isn't specific to the kernel or the OS. With Fan
Always On disabled, the fan stays off under load on Windows 11, Linux
Mint, Arch, CachyOS LTS and CachyOS 7.3.1-1. A full-load stress-ng run
(all 12 threads, platform_profile=3Dperformance) reached 92 =C2=B0C in abou=
t
35 seconds with no fan. A 2-thread run reached 83 =C2=B0C with no fan.

3. Timeline: BIOS F.12 has been installed since the end of July, and
the fan behaved normally until October. HP PC Hardware Diagnostics
UEFI still passes both the fan speed and thermal tests. A hard EC
reset and BIOS defaults changed nothing.

I've also reported this to HP and asked for a warranty repair. I'm
happy to test any further patches or run any commands on this machine.

Thanks for your work on the hp-wmi fix.

Lorenzo

Il giorno ven 16 ott 2026 alle ore 19:26 Krishna Chomal
<krishna.chomal108@gmail.com> ha scritto:
>
> On Fri, Oct 16, 2026 at 09:06:03AM +0200, Lorenzo Collevecchio wrote:
> >Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP
> >OmniBook 5 16-ag1xxx (board 8DF4)
> >
> >Hi Krishna,
> >
> >Thanks a lot for digging into the ACPI code, the explanation makes
> >everything fit: the missing GMCF call for HPWMI_GM, Local2 being left
> >as an Integer, and the -22 coming from that.
> >
> >I also tried your suggestion about the platform profile. With
> >HPWMI_READ/WRITE the errors should not appear:
> >
> >  Before: dmesg | grep -c WHCM  ->  3 (the three boot-time errors)
> >  cat /sys/firmware/acpi/platform_profile  ->  quiet
> >  After:  dmesg | grep -c WHCM  ->  3 (no new errors)
> >
> >On the fan: thanks for confirming that acpi_fan reads the EC value
> >correctly. Together with hearing the fan on Mint and on CachyOS at
> >idle, that makes me fairly comfortable that the 0 RPM readings are the
> >fan really being off.
> >
> >Your plan to query the fan count and hide pwm1_enable and
> >fan{1,2}_input when it fails sounds good to me. I am happy to test it
> >on 8DF4 whenever you have a patch, and I can rebase it onto a stable
> >kernel tree on my side if that is easier for you.
> >
> >I also tried 7.2.10-1-cachyos: dmesg and the hp-wmi hwmon folder are
> >identical to 7.2.9 (three WHCM errors, then the -22 message, and
> >pwm1_enable still present).
> >
> >Thanks again for the time you spent on this.
>
> Thanks, I will share the final proposed patch on your Bugzilla report
> (222138), and leave this thread for others to pick up the WQBC/WQBE
> errors.
>
> >Best regards,
> >Lorenzo
> >
> [...]
