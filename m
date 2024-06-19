Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA020224D4
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Jun 2024 08:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718785007; cv=none; b=dB3RSooI5piY3c4neLegRbEopC0Kb9+oNzXoe14aTPaDgBfAmHKWDgTCOyOaqFHdibgpyzB+H77cSJu+FMhoibXjuUUGgYp1FRw6mAqJ4wzIQW7rWWLitYLY3lbsz1EcUbHIprbDT6k07x4kfTO9pcCICWDPfxncetuMsyzyVF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718785007; c=relaxed/simple;
	bh=q48ScFicEgvGvnImr72BlQ/3MgykxneHdQ2X+tkqEyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQIwv2Y6RWN0qa0zJnYLEQbh69QQ9kQLl9fugJBxVCvmvEeTJT9YWD7Ye4aKhTF4n0Vl/2n/mPh11T8LIgzxNwHDmjnp93Qxphxq9OP6yHz88y7vJqLLRc8fCDbp+XLMXkd9w6wj9dK++EQls4ronjXV5wQmKvum66RXbK1epTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.it; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+DUB9rx; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+DUB9rx"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f44b45d6abso47496795ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Jun 2024 01:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718785004; x=1719389804; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lLO+snueWCG0J7NWYoy8WW38afw4snHIRVAP0pyyyao=;
        b=h+DUB9rxilBdolonZin0JbpcDWuAqbVSCDV2APp6GBVz8/engcQllR+xx90qA5GBaJ
         K9qwNRkyjYXp+kbx6E6fFX61kwjBkjuODxZc3fQBjyj8GTZe/4Oai5y4ai1kg290qLMV
         tc4YTb+wqNFDZ308rJCOJLnpiukaAWyc6Idnutvcz59v0+/IVGGN36vYL1DCKA0XY8I0
         d4HOZNsc2Fvlx+p4ekGxdpOnyQ0oOjZbiQWSxk9yzZDgt3enoQw26TgT/TTgptafiGuZ
         YRqbtywsBi2b9/RhnfMK2vf6NbCvFBiiBYD7mdOkZbVJ/KWCaF6gKILkiJ4raNNAmeXd
         pSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718785004; x=1719389804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lLO+snueWCG0J7NWYoy8WW38afw4snHIRVAP0pyyyao=;
        b=NiXJlC/LCCDNmsm1Cw1ym6RuKjXVZQA1yLvCXNc4SXo0a/XcjchGNmThMSzp7uKrNn
         KAsP5Y4f90HVbvCt5b0UOSAuPqz+jda0JWhbgKEf8O7qIUpXHxsOOjEiPDHKD8STkUUr
         9N0tV14bCplOnPqSJWUbIuSAQWoT90Nd2fEMK1Sc7h5muTRLXYFSyTBfc7t2DmDqoQe0
         8JqJA6yaqFvkjU2EGGpv8ZoOmIdbFGeav1mL+iMWrm9jWqUddNAzT+mumf1jSYxZnqm+
         mnfG2sIi5Ou4OxoLRCRtPQozHqA9huaqvVEzP1VqndjDqPLWkP1k+AwmhwCC9gKjcR8s
         an8A==
X-Forwarded-Encrypted: i=1; AJvYcCWde6EFxY/hHxejcJSklDpCYFWEkcjBT55+TPnMPweaCMuQwn0ac3urnHChU9F5emKQMDC6KIBjciS1i7iz4IJkOmLvtkxCWQqtAvtQwamru0O2dg==
X-Gm-Message-State: AOJu0YytEmUvxW3fPwM6YNOkC53+kd6IG32JZSpNEzxvmuLP/nYBkR75
	daGUGzLMMrQer7046eFALyD9Z67pbz1O4ZEGTSd8Ru7S8r1cqXPx
X-Google-Smtp-Source: AGHT+IGcERrWBNjv5iqS8m+K2a4bk9kJHFy5tWNMzeRusqeeOpMZOEcrhnXdBA9WMkLB3d3vmm1C3A==
X-Received: by 2002:a17:902:d2d1:b0:1f7:171e:5264 with SMTP id d9443c01a7336-1f9aa397429mr20530385ad.4.1718785003884;
        Wed, 19 Jun 2024 01:16:43 -0700 (PDT)
Received: from taihen.jp ([2405:6580:2100:d00:934f:5843:3f44:77ae])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e55e77sm111017135ad.12.2024.06.19.01.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 01:16:43 -0700 (PDT)
Sender: Mattia Dongili <malattia@gmail.com>
Date: Wed, 19 Jun 2024 17:16:40 +0900
From: Mattia Dongili <malattia@linux.it>
To: =?euc-jp?B?TWljaGGPqcg=?= Szczepaniak <m.szczepaniak.000@gmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org
Subject: Re: [sony-laptop] Hardware keys are not properly mapped on Sony VAIO
 UX VGN-UX390N
Message-ID: <ZnKT6E5_bFdOa1bt@taihen.jp>
References: <686d3c56-b95e-4081-bde2-d36a7c7ab2e9@gmx.de>
 <11bb0fe3-a252-4cdc-9903-dc35af794ddb@gmail.com>
 <694c5973-8f27-4f9a-9da3-829482884ab2@gmx.de>
 <ZnDhk4YvczQV0JhW@taihen.jp>
 <2c7aeda6-40a5-43e8-ad7d-c1ba4e8ee0c0@gmail.com>
 <617b732c-f044-46ca-a7eb-cade979386c7@gmx.de>
 <bb8ddd94-53e7-4824-94c6-f2ebff7d93ea@gmail.com>
 <c6f4cbb7-ced0-4dfd-8d58-42878a47329c@gmx.de>
 <ZnKOpP0sSklJh53i@taihen.jp>
 <3f3b63a3-7d6b-4f84-929c-41c9998f256d@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3f3b63a3-7d6b-4f84-929c-41c9998f256d@gmail.com>
X-Message-Flag: Cranky? Try Free Software instead!
X-Operating-System: Linux 6.8.12-amd64 x86_64
X-Editor: Vim http://www.vim.org/
X-Disclaimer: Buh!

On Wed, Jun 19, 2024 at 10:00:18AM +0200, Micha=C5=82 Szczepaniak wrote:
> On 19/06/2024 09:54, Mattia Dongili wrote:
> > On Tue, Jun 18, 2024 at 11:18:12PM +0200, Armin Wolf wrote:
> > > Am 18.06.24 um 15:08 schrieb Micha=C5=82 Szczepaniak:
> > >=20
> > > > On 18/06/2024 13:47, Armin Wolf wrote:
> > > > > Am 18.06.24 um 09:09 schrieb Micha=C5=82 Szczepaniak:
> > > > >=20
> > > > > > On 18/06/2024 03:24, Mattia Dongili wrote:
> > > > > > > On Mon, Jun 17, 2024 at 12:48:13AM +0200, Armin Wolf wrote:
> > > > > > > > Am 16.06.24 um 22:34 schrieb Micha=C5=82 Szczepaniak:
> > > > > > > >=20
> > > > > > > > > On 16/06/2024 20:18, Armin Wolf wrote:
> > > > > > > > > > Hi,
> > > > > > > > > >=20
> > > > > > > > > > can you share the output of "acpidump"? The zoom-out bu=
tton should
> > > > > > > > > > report KEY_ZOOMOUT, can you also share the output of dm=
esg
> > > > > > > > > > after loading the driver with the module parameter "deb=
ug=3D1" and
> > > > > > > > > > pressing the buttons?
> > > > > > > [...]
> > > > > > > > > dmesg:
> > > > > > > > > [=C2=A0=C2=A0 19.108393] [=C2=A0 T475] sony_laptop: detec=
ted Type3 model
> > > > > > > > > [=C2=A0=C2=A0 19.108407] [=C2=A0 T475] sony_laptop: Evalu=
ating _STA
> > > > > > > > > [=C2=A0=C2=A0 19.115105] [=C2=A0 T475] sony_laptop: Devic=
e disabled
> > > > > > > > > [=C2=A0=C2=A0 19.115115] [=C2=A0 T475] sony_laptop: Evalu=
ating _PRS
> > > > > > > > > [=C2=A0=C2=A0 19.115145] [=C2=A0 T475] sony_laptop: IO1 a=
t 0xc000 (0x20)
> > > > > > > > > [=C2=A0=C2=A0 19.115150] [=C2=A0 T475] sony_laptop: IO1 a=
t 0xc800 (0x20)
> > > > > > > > > [=C2=A0=C2=A0 19.115154] [=C2=A0 T475] sony_laptop: IO1 a=
t 0xd000 (0x20)
> > > > > > > > > [=C2=A0=C2=A0 19.115157] [=C2=A0 T475] sony_laptop: IO1 a=
t 0xd800 (0x20)
> > > > > > > > > [=C2=A0=C2=A0 19.115294] [=C2=A0 T475] input: Sony Vaio K=
eys as
> > > > > > > > > /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/SNY=
6001:00/input/input6
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > [=C2=A0=C2=A0 19.115631] [=C2=A0 T475] input: Sony Vaio J=
ogdial as
> > > > > > > > > /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/SNY=
6001:00/input/input7
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > [=C2=A0=C2=A0 19.118777] [=C2=A0 T475] sony_laptop: devic=
e allocated minor is 123
> > > > > > > > > [=C2=A0=C2=A0 19.118791] [=C2=A0 T475] sony_laptop: I/O p=
ort1: 0xc000 (0xc000) +
> > > > > > > > > 0x20
> > > > > > > > > [=C2=A0=C2=A0 19.118826] [=C2=A0=C2=A0=C2=A0 C0] sony_lap=
top: event ([ff] [ff]) at port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > > > [=C2=A0=C2=A0 19.118839] [=C2=A0 T475] sony_laptop: IRQ: =
6 - triggering: 1 -
> > > > > > > > > polarity: 0 - shr: 0
> > > > > > > > > [=C2=A0=C2=A0 19.118844] [=C2=A0 T475] sony_laptop: Evalu=
ating _SRS
> > > > > > > > > [=C2=A0=C2=A0 19.128310] [=C2=A0=C2=A0=C2=A0 C0] sony_lap=
top: event ([ff] [ff]) at port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > > > [=C2=A0=C2=A0 19.130430] [=C2=A0 T474] input: Power Butto=
n as
> > > > > > > > > /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input8
> > > > > > > > > [=C2=A0=C2=A0 19.136861] [=C2=A0 T475] sony_laptop: sony_=
pic_call1(0x82): 0x0e0a
> > > > > > > > > [=C2=A0=C2=A0 19.136899] [=C2=A0=C2=A0=C2=A0 C0] sony_lap=
top: event ([0e] [05]) at port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > > > [=C2=A0=C2=A0 19.136905] [=C2=A0=C2=A0=C2=A0 C0] sony_lap=
top: unknown event ([0e] [05]) at
> > > > > > > > > port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > > > [=C2=A0=C2=A0 19.136927] [=C2=A0 T475] sony_laptop: sony_=
pic_call2(0x81 - 0xff):
> > > > > > > > > 0x000e
> > > > > > > > > [=C2=A0=C2=A0 19.136949] [=C2=A0=C2=A0=C2=A0 C0] sony_lap=
top: event ([00] [05]) at port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > > > [=C2=A0=C2=A0 19.136961] [=C2=A0 T475] sony_laptop: sony_=
pic_call1(0x82): 0x000b
> > > > > > > > > [=C2=A0=C2=A0 19.136988] [=C2=A0=C2=A0=C2=A0 C0] sony_lap=
top: event ([0e] [05]) at port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > > > [=C2=A0=C2=A0 19.136993] [=C2=A0=C2=A0=C2=A0 C0] sony_lap=
top: unknown event ([0e] [05]) at
> > > > > > > > > port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > > > [=C2=A0=C2=A0 19.137161] [=C2=A0 T475] sony_laptop: SPIC =
setup done.
> > > > > > > > > [=C2=A0=C2=A0 19.137261] [=C2=A0 T475] sony_laptop: metho=
d: name: GBRT, args 0
> > > > > > > > > [=C2=A0=C2=A0 19.137268] [=C2=A0 T475] sony_laptop: metho=
d: name: SBRT, args 1
> > > > > > > > > [=C2=A0=C2=A0 19.137272] [=C2=A0 T475] sony_laptop: metho=
d: name: GPBR, args 0
> > > > > > > > > [=C2=A0=C2=A0 19.137276] [=C2=A0 T475] sony_laptop: metho=
d: name: SPBR, args 1
> > > > > > > > > [=C2=A0=C2=A0 19.137281] [=C2=A0 T475] sony_laptop: metho=
d: name: PWAK, args 0
> > > > > > > > > [=C2=A0=C2=A0 19.137285] [=C2=A0 T475] sony_laptop: metho=
d: name: PWRN, args 0
> > > > > > > > > [=C2=A0=C2=A0 19.137289] [=C2=A0 T475] sony_laptop: metho=
d: name: CSXB, args 1
> > > > > > > > > [=C2=A0=C2=A0 19.137293] [=C2=A0 T475] sony_laptop: metho=
d: name: GWDP, args 0
> > > > > > > > > [=C2=A0=C2=A0 19.137298] [=C2=A0 T475] sony_laptop: metho=
d: name: SLRS, args 1
> > > > > > > > > [=C2=A0=C2=A0 19.137302] [=C2=A0 T475] sony_laptop: metho=
d: name: RBMF, args 1
> > > > > > > > > [=C2=A0=C2=A0 19.137306] [=C2=A0 T475] sony_laptop: metho=
d: name: RSBI, args 1
> > > > > > > > > [=C2=A0=C2=A0 19.137310] [=C2=A0 T475] sony_laptop: metho=
d: name: CBMF, args 1
> > > > > > > > > [=C2=A0=C2=A0 19.137314] [=C2=A0 T475] sony_laptop: metho=
d: name: LNPW, args 1
> > > > > > > > > [=C2=A0=C2=A0 19.137319] [=C2=A0 T475] sony_laptop: metho=
d: name: GLNP, args 0
> > > > > > > > > [=C2=A0=C2=A0 19.137323] [=C2=A0 T475] sony_laptop: metho=
d: name: SCAM, args 1
> > > > > > > > > [=C2=A0=C2=A0 19.137327] [=C2=A0 T475] sony_laptop: metho=
d: name: GCAM, args 0
> > > > > > > > > [=C2=A0=C2=A0 19.137340] [=C2=A0 T475] sony_laptop: Found=
 brightness_default
> > > > > > > > > getter:
> > > > > > > > > GPBR
> > > > > > > > > [=C2=A0=C2=A0 19.137388] [=C2=A0 T475] sony_laptop: Found=
 brightness_default
> > > > > > > > > setter:
> > > > > > > > > SPBR
> > > > > > > > > [=C2=A0=C2=A0 19.137402] [=C2=A0 T475] sony_laptop: Found=
 lanpower getter: GLNP
> > > > > > > > > [=C2=A0=C2=A0 19.137406] [=C2=A0 T475] sony_laptop: Found=
 lanpower setter: LNPW
> > > > > > > > > [=C2=A0=C2=A0 19.137423] [=C2=A0 T475] sony_laptop: SNC s=
etup done.
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > and the 3 buttons zoomin, zoom out, the third one
> > > > > > > > > [=C2=A0 161.975552] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
event ([5c] [31]) at port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > > > [=C2=A0 161.975596] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
sony_pic_call1(0xa0): 0x5c0a
> > > > > > > > > [=C2=A0 161.975681] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
event ([10] [05]) at port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > >=20
> > > > > > > > Zoom in
> > > > > > > >=20
> > > > > > > > > [ 162.154768] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event =
([5c] [31]) at port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > > > [=C2=A0 162.154814] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
sony_pic_call1(0xa0): 0x5c0a
> > > > > > > > > [=C2=A0 162.154880] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
event ([00] [05]) at port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > >=20
> > > > > > > > Ignored
> > > > > > > >=20
> > > > > > > > > [ 163.327457] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event =
([5c] [31]) at port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > > > [=C2=A0 163.327511] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
sony_pic_call1(0xa0): 0x5c0a
> > > > > > > > > [=C2=A0 163.327563] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
event ([20] [05]) at port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > >=20
> > > > > > > > Zoom out
> > > > > > > >=20
> > > > > > > > > [ 163.516819] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event =
([5c] [31]) at port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > > > [=C2=A0 163.516856] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
sony_pic_call1(0xa0): 0x5c0a
> > > > > > > > > [=C2=A0 163.517008] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
event ([00] [05]) at port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > >=20
> > > > > > > > ignored
> > > > > > > >=20
> > > > > > > > > [ 165.206657] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event =
([5c] [31]) at port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > > > [=C2=A0 165.206700] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
sony_pic_call1(0xa0): 0x5c0a
> > > > > > > > > [=C2=A0 165.206805] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
event ([01] [05]) at port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > >=20
> > > > > > > > Prog 1
> > > > > > > >=20
> > > > > > > > > [ 165.365447] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event =
([5c] [31]) at port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > > > [=C2=A0 165.365491] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
sony_pic_call1(0xa0): 0x5c0a
> > > > > > > > > [=C2=A0 165.365548] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
event ([00] [05]) at port
> > > > > > > > > 0xc000(+0x12)
> > > > > > > > >=20
> > > > > > > > ignored
> > > > > > > >=20
> > > > > > > > > Sorry i messed up and didn't use reply all, Im still quit=
e new to
> > > > > > > > > this
> > > > > > > > >=20
> > > > > > > > That ok, mistakes happen :)
> > > > > > > >=20
> > > > > > > > I think the reason for you problem with the zoom-out key is=
 that
> > > > > > > > when sony-laptop
> > > > > > > > iterates through the list of possible key responses, it fir=
st
> > > > > > > > matches the definition
> > > > > > > > for SONYPI_EVENT_PKEY_P1 (0x20), which has the same key dat=
a as
> > > > > > > > SONYPI_EVENT_ZOOM_OUT_PRESSED (also 0x20).
> > > > > > > >=20
> > > > > > > > This causes SONYPI_EVENT_PKEY_P1 to be picked instead of
> > > > > > > > SONYPI_EVENT_ZOOM_OUT_PRESSED.
> > > > > > >=20
> > > > > > > That's right. The event mask is the same for programmable and=
 zoom
> > > > > > > keys,
> > > > > > > thus the conflict.
> > > > > > >=20
> > > > > > > { 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev },
> > > > > > > { 0x05, SONYPI_ZOOM_MASK, sonypi_zoomev },
> > > > > > >=20
> > > > > > > > I am sending this mail to the maintainer of the sony-laptop=
 driver,
> > > > > > > > maybe he can help us in this case.
> > > > > > >=20
> > > > > > > Heh... I actually have a UX ultra portable laptop somewhere (=
a UX50
> > > > > > > IIRC) but I'm not sure it'll even turn on. Those things are l=
ike 15~20
> > > > > > > years old now.
> > > > > > >=20
> > > > > > > I don't quite remember the idiosyncrasies of this particular =
model v/s
> > > > > > > other models to be quite frank. On the other hand the module =
has a
> > > > > > > 'mask' option that you can use to allow-list only certain set=
s of
> > > > > > > events.
> > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.=
git/tree/drivers/platform/x86/sony-laptop.c?h=3Dv6.9.5#n94
> > > > > > >=20
> > > > > > >=20
> > > > > > > (I'm glad the help text says "see doc" because I don't see th=
is option
> > > > > > > mentioned in the doc...)
> > > > > > >=20
> > > > > > > The bitmasks are here:
> > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.=
git/tree/drivers/platform/x86/sony-laptop.c?h=3Dv6.9.5#n3365
> > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > Thanks for response but I'm bit confused now, since they have s=
ame
> > > > > > event, and i only allow the zoom in/out keys, won't I lose the =
third
> > > > > > key? Am I missing something?
> > > > > >=20
> > > > > When using the "mask" module param, you will lose the third key.
> > > > >=20
> > > > > I think the underlying issue could be that support for the
> > > > > problematic 0x20 SONYPI_EVENT_PKEY_P1 was
> > > > > added in commit 1cae71032183 ("sony-laptop: VGN-A317M hotkey
> > > > > support"), while support for you VIAO model
> > > > > was added in commit 3eb8749a3799 ("sony-laptop: add Type4 model").
> > > > >=20
> > > > > Commit 1cae71032183 was added after commit 3eb8749a3799, so i thi=
nk
> > > > > it will be enough to introduce a
> > > > > separate copy of sonypi_pkeyev[] without the conflicting 0x20
> > > > > SONYPI_EVENT_PKEY_P1 definition.
> > > > > This separate copy can then be used by the type3_events[] definit=
ion
> > > > > (which is used on you model).
> > > > >=20
> > > > > If the maintainer agrees with this approach, i can create a patch=
 for
> > > > > you to test. Are you able to
> > > > > compile kernel modules on your device?
> > > > >=20
> > > > > Thanks,
> > > > > Armin Wolf
> > > > >=20
> > > > I am using opensuse on the device, I can just add patch in the obs =
so
> > > > yeah rebuilding kernel is no issue, I could do the patch myself but=
 I
> > > > don't know how to make it device-specific.
> > > >=20
> > > > Thanks for help!
> > >=20
> > > Nice, can you test the attached patch and report back if it works?
> > >=20
> > > Thanks,
> > > Armin Wolf
> >=20
> > >  From 7c44c1d15f859647f19e5e2d9874432bb3a5cb92 Mon Sep 17 00:00:00 20=
01
> > > From: Armin Wolf <W_Armin@gmx.de>
> > > Date: Tue, 18 Jun 2024 23:09:36 +0200
> > > Subject: [PATCH] platform/x86: sony-laptop: Fix SONYPI_EVENT_ZOOM_OUT=
_PRESSED
> > >   on Sony VAIO UX VGN-UX390N
> > >=20
> > > It turns out that on type 3 models, the definitions for the programma=
ble
> > > keys partially conflict with the definitions for the zoom keys.
> > >=20
> > > This causes SONYPI_EVENT_ZOOM_OUT_PRESSED on the Sony VAIO UX VGN-UX3=
90N
> > > to be reported as SONYPI_EVENT_PKEY_P1. Fix this by providing a separ=
ate
> > > definition for type3 models without the conflicting key entry.
> > >=20
> > > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > > ---
> > >   drivers/platform/x86/sony-laptop.c | 9 ++++++++-
> > >   1 file changed, 8 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x8=
6/sony-laptop.c
> > > index 3e94fdd1ea52..0e1d099ac06a 100644
> > > --- a/drivers/platform/x86/sony-laptop.c
> > > +++ b/drivers/platform/x86/sony-laptop.c
> > > @@ -3451,6 +3451,13 @@ static struct sonypi_event sonypi_pkeyev[] =3D=
 {
> > >   	{ 0, 0 }
> > >   };
> > > +static struct sonypi_event sonypi_pkeyev_type3[] =3D {
> > > +	{ 0x01, SONYPI_EVENT_PKEY_P1 },
> > > +	{ 0x02, SONYPI_EVENT_PKEY_P2 },
> > > +	{ 0x04, SONYPI_EVENT_PKEY_P3 },
> > > +	{ 0, 0 }
> > > +};
> > > +
> > >   /* The set of possible bluetooth events */
> > >   static struct sonypi_event sonypi_blueev[] =3D {
> > >   	{ 0x55, SONYPI_EVENT_BLUETOOTH_PRESSED },
> > > @@ -3572,7 +3579,7 @@ static struct sonypi_eventtypes type3_events[] =
=3D {
> > >   	{ 0x31, SONYPI_MEMORYSTICK_MASK, sonypi_memorystickev },
> > >   	{ 0x41, SONYPI_BATTERY_MASK, sonypi_batteryev },
> > >   	{ 0x31, SONYPI_PKEY_MASK, sonypi_pkeyev },
> > > -	{ 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev },
> > > +	{ 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev_type3 },
> >=20
> > Based on the commits you found, the conflicting event was added for the
> > VGN-A series (a Type3 model). This change is effectively removing the P1
> > button handling for them.
> >=20
> > See 3eb8749a37990b505ab94466038c067444bbd7eb and later
> > e93c8a6819b217f4f4a490f67f26e02ff6b23b44: there used to be a Type4 model
> > that was meant to keep some of the events separate from Type3 models.
> > Perhaps reintroducing the distinction is going to serve us better in
> > this case?
> > The IRQ handler can be shared between Type3/4, but the events
> > can be in separate arrays, one for type3 and one for type4.
> >=20
> > What do you think?
> > Alternatively you could just swap the pkeysev lists based on the former
> > type3/4 distinction, i.e.
> >=20
> > +       pcidev =3D pci_get_device(PCI_VENDOR_ID_INTEL,
> > +                       PCI_DEVICE_ID_INTEL_ICH6_1, NULL);
> > +       if (pcidev) {
> > +               dev->control =3D &spic_types[2];
> > +               goto out;
> > +       }
> > +
> > +       pcidev =3D pci_get_device(PCI_VENDOR_ID_INTEL,
> > +                       PCI_DEVICE_ID_INTEL_ICH7_1, NULL);
> > +       if (pcidev) {
> > +               dev->control =3D &spic_types[3];
> > +               goto out;
> > +       }
> > +
> > +       pcidev =3D pci_get_device(PCI_VENDOR_ID_INTEL,
> > +                       PCI_DEVICE_ID_INTEL_ICH8_4, NULL);
> > +       if (pcidev) {
> > +               dev->control =3D &spic_types[3];
> > +               goto out;
> > +       }
> >=20
> > (and maybe include also ICH9 as type4).
> >=20
> > The output of `lspci` from the UX390 could also help making sure we get
> > the right distinction.
> >=20
> > >   	{ 0x05, SONYPI_ZOOM_MASK, sonypi_zoomev },
> > >   	{ 0x05, SONYPI_CAPTURE_MASK, sonypi_captureev },
> > >   	{ 0x05, SONYPI_PKEY_MASK, sonypi_volumeev },
> >=20
> I am here to deliver!
>=20
> Not sure which one you need so here are the main internal ones (minus wifi
> etc)
>=20
> 00:00.0 Host bridge: Intel Corporation Mobile 945GM/PM/GMS, 943/940GML and
> 945GT Express Memory Controller Hub (rev 03)
> 00:02.0 VGA compatible controller: Intel Corporation Mobile 945GM/GMS,
> 943/940GML Express Integrated Graphics Controller (rev 03)
> 00:02.1 Display controller: Intel Corporation Mobile 945GM/GMS/GME,
> 943/940GML Express Integrated Graphics Controller (rev 03)
> 00:1b.0 Audio device: Intel Corporation NM10/ICH7 Family High Definition
> Audio Controller (rev 02)
> 00:1c.0 PCI bridge: Intel Corporation NM10/ICH7 Family PCI Express Port 1
> (rev 02)
> 00:1c.1 PCI bridge: Intel Corporation NM10/ICH7 Family PCI Express Port 2
> (rev 02)
> 00:1d.0 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI
> Controller #1 (rev 02)
> 00:1d.1 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI
> Controller #2 (rev 02)
> 00:1d.2 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI
> Controller #3 (rev 02)
> 00:1d.3 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI
> Controller #4 (rev 02)
> 00:1d.7 USB controller: Intel Corporation NM10/ICH7 Family USB2 EHCI
> Controller (rev 02)
> 00:1e.0 PCI bridge: Intel Corporation 82801 Mobile PCI Bridge (rev e2)
> 00:1f.0 ISA bridge: Intel Corporation 82801GBM (ICH7-M) LPC Interface Bri=
dge
> (rev 02)
> 00:1f.1 IDE interface: Intel Corporation 82801G (ICH7 Family) IDE Control=
ler
> (rev 02)
> 00:1f.3 SMBus: Intel Corporation NM10/ICH7 Family SMBus Controller (rev 0=
2)

This is good. So ICH7, ICH8 and ICH9 would be type4, while ICH6 remains
as type3.

--=20
mattia
:wq!
