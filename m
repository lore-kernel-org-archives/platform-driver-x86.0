Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5525833EB19
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Jan 2026 17:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768928514; cv=none; b=cuUfpwEzR8bph71kwve2eX3l396hQqqeghE+lmJQ4ISiPfWcdZXV9w1nYtRW7kgTkLE1+6NeOOnN/BOCaeFNbaOeboGgwRoxujPod3I2B3c6CMPAdiSCz+KgzjangDtwpP/DqcwBRjpnLQRcNtPdEKgNYK1+Dge24rt4idZd/ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768928514; c=relaxed/simple;
	bh=PEGw9xBw4ogKYTSJT9z89Z7FQh9KBbg44pnlT/18sxI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=g8r3gk2KaqqB1dJ5UXYfsZ8tgzb4z6HLFmSDFmjGkYUytLQTut98GZSE0sBptM7+6Sd43tfUpPjgrrvW/2frt8CDQ9MVvZEgEnZ5sTdZrfjNV4T/w5DQqCTclrutr8aYp5lCb/ri0gnxMGZ5I4AYWjQw4+9Rrer88DB79m2jGSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRf33NAZ; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRf33NAZ"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12336c0a8b6so11791887c88.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Jan 2026 09:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768928511; x=1769533311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IUailGl3hB666dLaMWG2vrzy3Z8fMukkGgQryLbTNW4=;
        b=VRf33NAZuwZlZrDrhC7+EaIjHs01BeBpR2rh523c5lXap450HZptdPEyAbHGNMJyff
         or5GrNV9DnfYNtlxsi6gXaxOt0geFiNbg5Iv3s4uu5ud+t5yARRHQjxN4rNUCaL+MDJ1
         sxm66FJkxHA1M8xC46B3kdQ/wMsEkTHxCZMQACt5w4rDgGdZnOTdXAx5GtnuGoqSeXAf
         MqxtGqeKRWwBUd43OrpQW/ILy2uqH+P89YAml4tzM15AQCKog9GXnFSQrOB0xCCNhUA0
         YW9rktJyU1TDO4oWLLkZWOlbXUj0V9USF+nmg8wNhmo2pCuYD1ber+R9baoogL6Jlr/2
         nkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768928511; x=1769533311;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IUailGl3hB666dLaMWG2vrzy3Z8fMukkGgQryLbTNW4=;
        b=J4bbn21iyWxW5CyI3hXQ8jj5T6lcyoqSzRkQljBimXboILyphaoVeZF+QbF1Jnv00C
         zfrJQKRegqCvdX5/H/4huFf+oGq7xLAkcYvcYW9zAAO15CX9Z1iAPPzlOvHVquoTbCkf
         pLUo5uBjnHL4ZxXbeK81ObPex/TBRrAltxmmxXsJG4/DeQ54atNjYMsbHm0b0271PnoD
         4lOAuy7dWoFjO2aTLn4jgvf2+IOscaFR83GsajoonbeS2iIqv5wNJYS+OA/laWpuCZ1T
         yY0K0O8slyMIwlpD7m9pF9aF4m5QfqkqIDRx3/EibTmGWTi3Lvs1YshR9qVuMVFORyqN
         M8bQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0BUOD0DcPXTgAC1a2DT3itbpFwZqJVxTtx4NvzfBivJhWzqAgO5xtxiP5rYSWat5BP51X/DIL8qaalJgATsr2xV/4@vger.kernel.org
X-Gm-Message-State: AOJu0YzGZqecDmioaXvnJjUIL5HAYJAQ5eDManV0SfBwJTCmvl7dSKq6
	3kR4xz2FOiaXV4Dou7ngpBjL5uxcBF9bfy05BzYrWb2bmXkMWqighCdS
X-Gm-Gg: AY/fxX7f5n9xYQXzX1Q0Nof+IdheIHEV1bX/rVYZnozWia3UW4PSpgh+CAu8OowZOLl
	9Q9sUM6cvFTKXwH5Ew34gjLdCh6NZzjRPGbZ4ef30eiQm5Wwd2IRtHzBRwfu4RdDFasDILL9PtA
	zrID/ncAH3F62DY221DN5kKx1nVOpS8kwHLun4RIyeqDVvhBO3fXKHgHEb3ib7rCeajKkoZUE33
	dlXMGEfx5jXC68zBpSqDQ/VJagoI4XoIUa1brJy2z9eq+x4ZkOi0VxJPlKJqg3GCCwNI9jvsi2q
	hkwRk6DZ4UoesX1HZ8Qii7vVNo+lRY8EQzXTLc4rXu71Lct+rcAZCvyF0CFMG91dtTkQlg1gNp+
	AIsIJ8dp2khjtjbwxcu/Sw1qdjeKqmjrQbdJ6xYzx/kdWGI0KODL9WGea82REsFauf5Yz8Zrqbn
	NXl0g1d8XfvD/BTCdKXBfE9t0VL5CAnuWBOjq6R6O76Gh4iPZ65f6L5cW8c8Pka8aV3pgcLk8X/
	kxfPsNNxg==
X-Received: by 2002:a05:7022:418c:b0:119:e569:fb9d with SMTP id a92af1059eb24-1244a70c431mr12808662c88.12.1768928510832;
        Tue, 20 Jan 2026 09:01:50 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af108absm19903798c88.13.2026.01.20.09.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 09:01:50 -0800 (PST)
Date: Tue, 20 Jan 2026 09:01:48 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v10_2/7=5D_platform/x86=3A_Rename_?=
 =?US-ASCII?Q?lenovo-wmi-capdata01_to_lenovo-wmi-capdata?=
User-Agent: Thunderbird for Android
In-Reply-To: <c437e6e73d74b7aedd269328e1b0411a110444d3.camel@rong.moe>
References: <20260117210051.108988-1-i@rong.moe> <20260117210051.108988-3-i@rong.moe> <dc356678-4be6-3ba8-dd9e-18ba910f5e62@linux.intel.com> <c437e6e73d74b7aedd269328e1b0411a110444d3.camel@rong.moe>
Message-ID: <E7E469E6-8C93-4DB8-82E3-5CB82653984B@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On January 20, 2026 7:20:56 AM PST, Rong Zhang <i@rong=2Emoe> wrote:
>On Tue, 2026-01-20 at 16:48 +0200, Ilpo J=C3=A4rvinen wrote:
>> On Sun, 18 Jan 2026, Rong Zhang wrote:
>>=20
>> > Prepare for the upcoming changes to make it suitable to retrieve
>> > and provide other Capability Data as well=2E
>> >=20
>> > Signed-off-by: Rong Zhang <i@rong=2Emoe>
>> > Reviewed-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> > Tested-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> > ---
>> >  drivers/platform/x86/lenovo/Kconfig           |   4 +-
>> >  drivers/platform/x86/lenovo/Makefile          |   2 +-
>> >  =2E=2E=2E/lenovo/{wmi-capdata01=2Ec =3D> wmi-capdata=2Ec} | 124 ++++=
+++++---------
>> >  =2E=2E=2E/lenovo/{wmi-capdata01=2Eh =3D> wmi-capdata=2Eh} |  10 +-
>> >  drivers/platform/x86/lenovo/wmi-other=2Ec       |  11 +-
>> >  5 files changed, 78 insertions(+), 73 deletions(-)
>> >  rename drivers/platform/x86/lenovo/{wmi-capdata01=2Ec =3D> wmi-capda=
ta=2Ec} (60%)
>> >  rename drivers/platform/x86/lenovo/{wmi-capdata01=2Eh =3D> wmi-capda=
ta=2Eh} (60%)
>> >=20
>> > diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x=
86/lenovo/Kconfig
>> > index d22b774e0236f=2E=2Efb96a0f908f03 100644
>> > --- a/drivers/platform/x86/lenovo/Kconfig
>> > +++ b/drivers/platform/x86/lenovo/Kconfig
>> > @@ -233,7 +233,7 @@ config YT2_1380
>> >  	  To compile this driver as a module, choose M here: the module wil=
l
>> >  	  be called lenovo-yogabook=2E
>> > =20
>> > -config LENOVO_WMI_DATA01
>> > +config LENOVO_WMI_DATA
>> >  	tristate
>> >  	depends on ACPI_WMI
>>=20
>> This series is in the review-ilpo-next branch now=2E Thanks to all who =
have=20
>> participated in getting it into shape!
>
>Thank you for review and merging too! And thanks to Armin, Derek and
>Kurt for review and testing! ;-)
>
>> While reading it through once again while applying, I start to wonder i=
f=20
>> this config would be better named as LENOVO_WMI_CAPDATA ?
>
>I didn't thought of that when I substituted all occurrences of
>data01/cd01 with data/cd, but it's definitely a better name for me when
>it pops out=2E
>
>Hmm=2E=2E=2E Wait, we have
>
> 	=2Edriver =3D {
>-		=2Ename =3D "lenovo_wmi_cd01",
>+		=2Ename =3D "lenovo_wmi_cd",
> 		=2Eprobe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> 	},
>
>What about adopting the same name here to make everything more
>consistent? Having a unified name will be neater=2E @Derek, what do you
>think?

No preference personally, nobody is going to see the config option really =
since we just select it when we enable the others=2E Consistent naming prob=
ably helps folks who are unfamiliar with the different drivers for this int=
erface I suppose=2E

Thanks,
Derek


>Thank you all,
>Rong

