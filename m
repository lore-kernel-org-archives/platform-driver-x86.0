Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D464C84
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Jun 2024 01:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718673854; cv=none; b=bA9T5NJ3K5JbTMSXvaR2aiHCkJEPUfHFPXgwFNmN+kcs7UBSjMa+LpLKy9aaCRxlE8Ls2zsS+v2vA2CICOAMOzdVrqfnRnxGROVR5s+9lHnqxd5w8PYTQsf86W5o2kAAtJbLUZwQTclbyWGdq7rl1EcPBn9dP9Sc4ZbQAopGQjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718673854; c=relaxed/simple;
	bh=0Ps5q83pMLNqILUCMyJFHb7A9WkMEVCQIXznvNtyr3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g89Pi+Y+Od5yeOxfrOoIsgdAchr7Jvp8AsEPT03Mqj1aPurW6e6jXN8udgnGyxpyCLZbIS7X4YsnwsPShr2p18sggiNSrIX6Y8OpI0EF27z7Z53plqMrfxbvLA4mQURhLVjDPhNiLPY92k9afRzbFokRAIA/w3Mu+jruw3J7uPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.it; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMYh7MuX; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMYh7MuX"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-6bfd4b88608so3462073a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Jun 2024 18:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718673851; x=1719278651; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Ps5q83pMLNqILUCMyJFHb7A9WkMEVCQIXznvNtyr3I=;
        b=PMYh7MuXuw53uj0s2RilUA1DoxQGedd9YUlAfdwntT9156lySySEmYl1POmY+xE8na
         gBEdA+e7oGCMOBVwnhrS8/mcj9yaNfP5FO75A7dzzFj1YI4IvI9EBzdmb48QEDUcbhGG
         I8K08bvt4pk7JhwrbCmq5ZfH4mmolaar9fz9katrHqG+x+SAVArSiMqbh85bN3XUgMrM
         7L5lsNu8zG++3dGyxRepMh1AQ5+YOkaGDeIyI5Yid3CVRV82H38FvrvbrSSL8ZqoRaLN
         XFj2v/tJlBSUe8to40f4+6P2Pg5gMDLJA3UJJ8ZmKm4pzg2XEilRLv+bbaYNIfyhJTe2
         qL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718673851; x=1719278651;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ps5q83pMLNqILUCMyJFHb7A9WkMEVCQIXznvNtyr3I=;
        b=rnE3ZeNf23bFJtRV6IlWj8tJ3lTmbtFdKA7r+eO8nrkayRXzjYtDO6wAVteHVhiSUO
         rrlFgcjSa7H0rjDaSZj2tXWVxpdoYFi3/bSdeMqIV3pQ90XqQwLmYe6XORQxIj+jlkwH
         FREPqV+B075I7dy8IdlFv20boeQMvG4G/OrlZ/rqgdmqMDaN8CfOIcn06vk2y8nbHQ1m
         u+j0YeahuZ80hmsbCPwIEZVfVcEX/pBWEK/i1Nb04tjwByBdkR4/DyN3zK409Dpo72zB
         Fc67mIrwjNoA7FGSPVE4Kunon0iWMU7DuL5BiR0Ji0AE685+CkTKQId1UvsN9Mz8qvxz
         HhsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk+jGegJfWiXp8BeZTA8jw5ohato4LHD+cZ5geTDvM0KEmXM3n2A/cbqMOCJOLI0ygZhpEkgJCVur4gqSyZVW0JZPDoCu9V+kZsHhuK3ZjtdkkEg==
X-Gm-Message-State: AOJu0YwNzyvzxBAW5V2uAffue2zjSI7tE85cv8yI9Dj1bRPKHonY1vxG
	1ooM5QCO8pCQ+frJp69Tkzp2Vr2DbBTvhq2humRNCLLo+HynDJ1q
X-Google-Smtp-Source: AGHT+IGjPtNh73bEf9pfPiaulBEgx5yNIvFCtnHK3mNBE7w0wL+iE3suf1b7epfF/5OiXoLunzMFUA==
X-Received: by 2002:a17:903:2341:b0:1f7:42ba:5b1e with SMTP id d9443c01a7336-1f8625da084mr123824345ad.17.1718673850834;
        Mon, 17 Jun 2024 18:24:10 -0700 (PDT)
Received: from taihen.jp ([2405:6580:2100:d00:7aad:671e:b4e6:e6fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855ee81a6sm85477095ad.148.2024.06.17.18.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 18:24:10 -0700 (PDT)
Sender: Mattia Dongili <malattia@gmail.com>
Date: Tue, 18 Jun 2024 10:24:06 +0900
From: Mattia Dongili <malattia@linux.it>
To: Armin Wolf <W_Armin@gmx.de>
Cc: =?euc-jp?B?TWljaGGPqcg=?= Szczepaniak <m.szczepaniak.000@gmail.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [sony-laptop] Hardware keys are not properly mapped on Sony VAIO
 UX VGN-UX390N
Message-ID: <ZnDhk4YvczQV0JhW@taihen.jp>
References: <50d7eef9-17c4-4be2-bb25-37d7b74048cc@gmail.com>
 <686d3c56-b95e-4081-bde2-d36a7c7ab2e9@gmx.de>
 <11bb0fe3-a252-4cdc-9903-dc35af794ddb@gmail.com>
 <694c5973-8f27-4f9a-9da3-829482884ab2@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <694c5973-8f27-4f9a-9da3-829482884ab2@gmx.de>
X-Message-Flag: Cranky? Try Free Software instead!
X-Operating-System: Linux 6.8.12-amd64 x86_64
X-Editor: Vim http://www.vim.org/
X-Disclaimer: Buh!

On Mon, Jun 17, 2024 at 12:48:13AM +0200, Armin Wolf wrote:
> Am 16.06.24 um 22:34 schrieb Micha=C5=82 Szczepaniak:
>=20
> > On 16/06/2024 20:18, Armin Wolf wrote:
> > > Hi,
> > >=20
> > > can you share the output of "acpidump"? The zoom-out button should
> > > report KEY_ZOOMOUT, can you also share the output of dmesg
> > > after loading the driver with the module parameter "debug=3D1" and
> > > pressing the buttons?
[...]
> > dmesg:
> > [=C2=A0=C2=A0 19.108393] [=C2=A0 T475] sony_laptop: detected Type3 model
> > [=C2=A0=C2=A0 19.108407] [=C2=A0 T475] sony_laptop: Evaluating _STA
> > [=C2=A0=C2=A0 19.115105] [=C2=A0 T475] sony_laptop: Device disabled
> > [=C2=A0=C2=A0 19.115115] [=C2=A0 T475] sony_laptop: Evaluating _PRS
> > [=C2=A0=C2=A0 19.115145] [=C2=A0 T475] sony_laptop: IO1 at 0xc000 (0x20)
> > [=C2=A0=C2=A0 19.115150] [=C2=A0 T475] sony_laptop: IO1 at 0xc800 (0x20)
> > [=C2=A0=C2=A0 19.115154] [=C2=A0 T475] sony_laptop: IO1 at 0xd000 (0x20)
> > [=C2=A0=C2=A0 19.115157] [=C2=A0 T475] sony_laptop: IO1 at 0xd800 (0x20)
> > [=C2=A0=C2=A0 19.115294] [=C2=A0 T475] input: Sony Vaio Keys as
> > /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/SNY6001:00/input/=
input6
> > [=C2=A0=C2=A0 19.115631] [=C2=A0 T475] input: Sony Vaio Jogdial as
> > /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/SNY6001:00/input/=
input7
> > [=C2=A0=C2=A0 19.118777] [=C2=A0 T475] sony_laptop: device allocated mi=
nor is 123
> > [=C2=A0=C2=A0 19.118791] [=C2=A0 T475] sony_laptop: I/O port1: 0xc000 (=
0xc000) + 0x20
> > [=C2=A0=C2=A0 19.118826] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([f=
f] [ff]) at port
> > 0xc000(+0x12)
> > [=C2=A0=C2=A0 19.118839] [=C2=A0 T475] sony_laptop: IRQ: 6 - triggering=
: 1 -
> > polarity: 0 - shr: 0
> > [=C2=A0=C2=A0 19.118844] [=C2=A0 T475] sony_laptop: Evaluating _SRS
> > [=C2=A0=C2=A0 19.128310] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([f=
f] [ff]) at port
> > 0xc000(+0x12)
> > [=C2=A0=C2=A0 19.130430] [=C2=A0 T474] input: Power Button as
> > /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input8
> > [=C2=A0=C2=A0 19.136861] [=C2=A0 T475] sony_laptop: sony_pic_call1(0x82=
): 0x0e0a
> > [=C2=A0=C2=A0 19.136899] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([0=
e] [05]) at port
> > 0xc000(+0x12)
> > [=C2=A0=C2=A0 19.136905] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: unknown e=
vent ([0e] [05]) at port
> > 0xc000(+0x12)
> > [=C2=A0=C2=A0 19.136927] [=C2=A0 T475] sony_laptop: sony_pic_call2(0x81=
 - 0xff): 0x000e
> > [=C2=A0=C2=A0 19.136949] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([0=
0] [05]) at port
> > 0xc000(+0x12)
> > [=C2=A0=C2=A0 19.136961] [=C2=A0 T475] sony_laptop: sony_pic_call1(0x82=
): 0x000b
> > [=C2=A0=C2=A0 19.136988] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([0=
e] [05]) at port
> > 0xc000(+0x12)
> > [=C2=A0=C2=A0 19.136993] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: unknown e=
vent ([0e] [05]) at port
> > 0xc000(+0x12)
> > [=C2=A0=C2=A0 19.137161] [=C2=A0 T475] sony_laptop: SPIC setup done.
> > [=C2=A0=C2=A0 19.137261] [=C2=A0 T475] sony_laptop: method: name: GBRT,=
 args 0
> > [=C2=A0=C2=A0 19.137268] [=C2=A0 T475] sony_laptop: method: name: SBRT,=
 args 1
> > [=C2=A0=C2=A0 19.137272] [=C2=A0 T475] sony_laptop: method: name: GPBR,=
 args 0
> > [=C2=A0=C2=A0 19.137276] [=C2=A0 T475] sony_laptop: method: name: SPBR,=
 args 1
> > [=C2=A0=C2=A0 19.137281] [=C2=A0 T475] sony_laptop: method: name: PWAK,=
 args 0
> > [=C2=A0=C2=A0 19.137285] [=C2=A0 T475] sony_laptop: method: name: PWRN,=
 args 0
> > [=C2=A0=C2=A0 19.137289] [=C2=A0 T475] sony_laptop: method: name: CSXB,=
 args 1
> > [=C2=A0=C2=A0 19.137293] [=C2=A0 T475] sony_laptop: method: name: GWDP,=
 args 0
> > [=C2=A0=C2=A0 19.137298] [=C2=A0 T475] sony_laptop: method: name: SLRS,=
 args 1
> > [=C2=A0=C2=A0 19.137302] [=C2=A0 T475] sony_laptop: method: name: RBMF,=
 args 1
> > [=C2=A0=C2=A0 19.137306] [=C2=A0 T475] sony_laptop: method: name: RSBI,=
 args 1
> > [=C2=A0=C2=A0 19.137310] [=C2=A0 T475] sony_laptop: method: name: CBMF,=
 args 1
> > [=C2=A0=C2=A0 19.137314] [=C2=A0 T475] sony_laptop: method: name: LNPW,=
 args 1
> > [=C2=A0=C2=A0 19.137319] [=C2=A0 T475] sony_laptop: method: name: GLNP,=
 args 0
> > [=C2=A0=C2=A0 19.137323] [=C2=A0 T475] sony_laptop: method: name: SCAM,=
 args 1
> > [=C2=A0=C2=A0 19.137327] [=C2=A0 T475] sony_laptop: method: name: GCAM,=
 args 0
> > [=C2=A0=C2=A0 19.137340] [=C2=A0 T475] sony_laptop: Found brightness_de=
fault getter:
> > GPBR
> > [=C2=A0=C2=A0 19.137388] [=C2=A0 T475] sony_laptop: Found brightness_de=
fault setter:
> > SPBR
> > [=C2=A0=C2=A0 19.137402] [=C2=A0 T475] sony_laptop: Found lanpower gett=
er: GLNP
> > [=C2=A0=C2=A0 19.137406] [=C2=A0 T475] sony_laptop: Found lanpower sett=
er: LNPW
> > [=C2=A0=C2=A0 19.137423] [=C2=A0 T475] sony_laptop: SNC setup done.
> >=20
> >=20
> > and the 3 buttons zoomin, zoom out, the third one
> > [=C2=A0 161.975552] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] [3=
1]) at port
> > 0xc000(+0x12)
> > [=C2=A0 161.975596] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_pic_call1=
(0xa0): 0x5c0a
> > [=C2=A0 161.975681] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([10] [0=
5]) at port
> > 0xc000(+0x12)
>=20
> Zoom in
>=20
> > [ 162.154768] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] [31]) at=
 port
> > 0xc000(+0x12)
> > [=C2=A0 162.154814] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_pic_call1=
(0xa0): 0x5c0a
> > [=C2=A0 162.154880] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([00] [0=
5]) at port
> > 0xc000(+0x12)
>=20
> Ignored
>=20
> > [ 163.327457] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] [31]) at=
 port
> > 0xc000(+0x12)
> > [=C2=A0 163.327511] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_pic_call1=
(0xa0): 0x5c0a
> > [=C2=A0 163.327563] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([20] [0=
5]) at port
> > 0xc000(+0x12)
>=20
> Zoom out
>=20
> > [ 163.516819] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] [31]) at=
 port
> > 0xc000(+0x12)
> > [=C2=A0 163.516856] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_pic_call1=
(0xa0): 0x5c0a
> > [=C2=A0 163.517008] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([00] [0=
5]) at port
> > 0xc000(+0x12)
>=20
> ignored
>=20
> > [ 165.206657] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] [31]) at=
 port
> > 0xc000(+0x12)
> > [=C2=A0 165.206700] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_pic_call1=
(0xa0): 0x5c0a
> > [=C2=A0 165.206805] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([01] [0=
5]) at port
> > 0xc000(+0x12)
>=20
> Prog 1
>=20
> > [ 165.365447] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] [31]) at=
 port
> > 0xc000(+0x12)
> > [=C2=A0 165.365491] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_pic_call1=
(0xa0): 0x5c0a
> > [=C2=A0 165.365548] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([00] [0=
5]) at port
> > 0xc000(+0x12)
> >=20
> ignored
>=20
> > Sorry i messed up and didn't use reply all, Im still quite new to this
> >=20
> That ok, mistakes happen :)
>=20
> I think the reason for you problem with the zoom-out key is that when son=
y-laptop
> iterates through the list of possible key responses, it first matches the=
 definition
> for SONYPI_EVENT_PKEY_P1 (0x20), which has the same key data as SONYPI_EV=
ENT_ZOOM_OUT_PRESSED (also 0x20).
>=20
> This causes SONYPI_EVENT_PKEY_P1 to be picked instead of SONYPI_EVENT_ZOO=
M_OUT_PRESSED.

That's right. The event mask is the same for programmable and zoom keys,
thus the conflict.

{ 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev },
{ 0x05, SONYPI_ZOOM_MASK, sonypi_zoomev },

> I am sending this mail to the maintainer of the sony-laptop driver, maybe=
 he can help us in this case.

Heh... I actually have a UX ultra portable laptop somewhere (a UX50
IIRC) but I'm not sure it'll even turn on. Those things are like 15~20
years old now.

I don't quite remember the idiosyncrasies of this particular model v/s
other models to be quite frank. On the other hand the module has a
'mask' option that you can use to allow-list only certain sets of
events.
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drive=
rs/platform/x86/sony-laptop.c?h=3Dv6.9.5#n94
(I'm glad the help text says "see doc" because I don't see this option
mentioned in the doc...)

The bitmasks are here:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drive=
rs/platform/x86/sony-laptop.c?h=3Dv6.9.5#n3365

--=20
mattia
:wq!
