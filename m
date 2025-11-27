Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8E32773F4
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 14:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764254168; cv=none; b=l4g90HTxIQDZcSq+5l5qDlUJPac8NmRBjZg/3obmOgeV1Rn+lel39GZDKK5yVZ1lYCJhmuqrb+XmGczfEC/4427/I1aIBc4H/IS1SRMn86b4lQnxeV2PkZd2l5VPpyBarYuyHVcL9Drt3Ru5WnwyYQsZRlCpeyOLTyhawjp+WEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764254168; c=relaxed/simple;
	bh=y/w70PmgkgiljvltcnTxMbOWap97glwa/EjzZTFKfmA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=YuD15baMx4ya1FYGQLwe3W5CCKlDKta5UR7UBr+2eTcTSuYp6Mlp8hahN2w+9LV1yiOtW8/mtVO0Fk2DGYIUGwA7hN1K8F2PpOwOufulqGwdgq1tQ0JsaG8x7m9QPGJ52qxq2qLFIzA48RHyOhw1R0eSknwcCuIUSozFGaHMmZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnrYKOwx; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnrYKOwx"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3438d4ae152so1035452a91.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 06:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764254164; x=1764858964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WbONDNfo5P6URvv49uARRyWcfYc6EtU0aSI8NWvYcqA=;
        b=BnrYKOwx0zYlqh1aUcqOKFf3LapSU4LUju4z5lsrtF1tXuEidIJNxPWZSzt2LLmoAD
         Ql6bjzGGpQmvqvN1b1qFO+4QLXe828k8BqSQFhhFkoafZwXmH7YFQS8W6/h6BgXEQZnv
         ziA2mS4hjlZXQOHElXX6/SRj+L0rJpLUnJnKnY/+QNF3WN2Uiw4yhLIssXOlVum0uN0p
         UZEAdknLIrJgXttY8ZE5/9gqIiHdb9BIH7PVRy/0rBnWeg4OxNb3tCixV2SxPi7updHJ
         3TEUGVA6PwXEDLf21OKXXcnN1ziKALhNV+9lVk1ktsHgL/Pmx/WJtsOPqO2vvOCEw45t
         VbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764254164; x=1764858964;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WbONDNfo5P6URvv49uARRyWcfYc6EtU0aSI8NWvYcqA=;
        b=ciNmu0coCGhdIGtMt7P5kaSu7quqXcNSIsaB/2oIbJs+udTNB09m2x+d3oJt71Tyd+
         IpdwWHc5GQVMuwsadgJ9nYfZOPRnMW6Lfpplx6rWJZ+vXjyXICeiHgHFl8GGUYPGTk3f
         ajsIfoDX4VzlC46FbteS+y0Rw5IUboqhGuiGAWN4Ku1mytfP6BFs3CX+/pvUebLjtfJg
         m7hqc+w27IM+FpiLoSv+cmmBPo0tQz25hrYLu7ruZbEHQaUcq1A7A/M8juqZK0TmFOBy
         x2cVv/DUBXdZlhtDwis4JSvxNJ0YHt0fUgo7NiPjIpbQN0E3B+ilzmXDi6agIgLTrUix
         f+0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmtqanaatOhSqLlzgFI3nKYYlo4rBnVfnSbkvHLyHxlLvzNAd9yiiPkF5mEDIUptpvuHWAzFUaP0uvA4RItE8xBPE4@vger.kernel.org
X-Gm-Message-State: AOJu0YxDVuKt+kGA4DWcP9Ftdwb9WsOqNIhpBo0uvYQCLT8AyCNNaDdN
	5gCGcxc9iz3qJSaaJ9IjxIzRkuykZNR81yypiwVjNhZbqqfPFDSZuIUn
X-Gm-Gg: ASbGncv5OIByG4qmN+zOEvSiO1JihfeZ2IxyXQrDvW4SWjA4sfjSMZHHpC5vbFoJaMu
	5zJhO38IwdIQdwAnyfVMJSAqcI0K5Mosql8wOYefLcK6rmYPkuj0oseRalcbhyi3+yOduTI/9DK
	XFfU5K16+WFE8A9fCttaFrCLGqwWYCagvLwWePUgL0uNUPuqVAn5SCiVmxdHyaDiLU1NeB1AaEN
	1OJ8NvudiIHna+opNky3sxWSH0vdPpIi+KflWxyRyReCEwFSRVe88xCv/9d0iXIIkB2hhQ08hmJ
	+eIY3lYvstCKTUeoURNnRd87oDpDsG6AeaIDDXCtKslr6e9T+BWv2EWkKzotu0dBRNoiOMEeOR5
	d4bF1N7zE3ZL2DifSkVSZu0hBc1slo/GTxd8YuTpESEOZCzs7hAVo6+iwJTNRdB5X9JiRpfM92v
	heXlOnaCQpJ0F5pXPJOEYfZ8zBiCRmV0VtwGBEuElhHF0xE+wDdQOROQrd9LD9V+2ZteLs3F8GB
	DsWP9vwgw==
X-Google-Smtp-Source: AGHT+IGDH89O43VYWGivoRzsH/VMsd+fKZHuO3oJN/28fn5VsdLF5lsOBh224MfCX+i8kiHkoomAAw==
X-Received: by 2002:a05:7301:b0d:b0:2a4:4bb4:4712 with SMTP id 5a478bee46e88-2a7192e5b06mr13076983eec.39.1764254163482;
        Thu, 27 Nov 2025 06:36:03 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaee7076sm7209397c88.4.2025.11.27.06.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 06:36:02 -0800 (PST)
Date: Thu, 27 Nov 2025 06:36:02 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>
CC: Len Brown <lenb@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-acpi@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_1/3=5D_acpi=3A_platform=5Fpr?=
 =?US-ASCII?Q?ofile_-_Add_max-power_profile_option?=
User-Agent: Thunderbird for Android
In-Reply-To: <bf61e05b-74ac-28de-d8ea-4a909d6e5fb8@linux.intel.com>
References: <20251113212639.459896-1-derekjohn.clark@gmail.com> <20251113212639.459896-2-derekjohn.clark@gmail.com> <7050cadc-9cb7-4f9b-8393-247bddb56965@gmx.de> <CFD27662-0044-4AF3-8E66-65229324CECF@gmail.com> <e801bef5-158e-4422-9c23-93dc2210f734@gmx.de> <bf61e05b-74ac-28de-d8ea-4a909d6e5fb8@linux.intel.com>
Message-ID: <278FC60D-C084-44B9-A0DB-23FAC930458B@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 27, 2025 4:11:36 AM PST, "Ilpo J=C3=A4rvinen" <ilpo=2Ejarvinen@=
linux=2Eintel=2Ecom> wrote:
>On Mon, 17 Nov 2025, Armin Wolf wrote:
>
>> Am 16=2E11=2E25 um 20:01 schrieb Derek J=2E Clark:
>>=20
>> > On November 16, 2025 8:13:17 AM PST, Armin Wolf <W_Armin@gmx=2Ede> wr=
ote:
>> > > Am 13=2E11=2E25 um 22:26 schrieb Derek J=2E Clark:
>> > >=20
>> > > > Some devices, namely Lenovo Legion devices, have an "extreme" mod=
e where
>> > > > power draw is at the maximum limit of the cooling hardware=2E Add=
 a new
>> > > > "max-power" platform profile to properly reflect this operating m=
ode=2E
>> > > >=20
>> > > > Reviewed-by: Mario Limonciello (AMD) <superm1@kernel=2Eorg>
>> > > > Acked-by: Rafael J=2E Wysocki (Intel) <rafael@kernel=2Eorg>
>> > > > Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> > > > ---
>> > > >    Documentation/ABI/testing/sysfs-class-platform-profile | 2 ++
>> > > >    drivers/acpi/platform_profile=2Ec                        | 1 +
>> > > >    include/linux/platform_profile=2Eh                       | 1 +
>> > > >    3 files changed, 4 insertions(+)
>> > > >=20
>> > > > diff --git a/Documentation/ABI/testing/sysfs-class-platform-profi=
le
>> > > > b/Documentation/ABI/testing/sysfs-class-platform-profile
>> > > > index dc72adfb830a=2E=2Efcab26894ec3 100644
>> > > > --- a/Documentation/ABI/testing/sysfs-class-platform-profile
>> > > > +++ b/Documentation/ABI/testing/sysfs-class-platform-profile
>> > > > @@ -23,6 +23,8 @@ Description:	This file contains a space-separat=
ed
>> > > > list of profiles supported
>> > > >    					power consumption with a
>> > > > slight bias
>> > > >    					towards performance
>> > > >    		performance		High performance operation
>> > > > +		max-power		Higher performance operation that may
>> > > > exceed
>> > > > +					internal battery draw limits when on
>> > > > AC power
>> > > I am not sure if it is a good idea to allow platform_profile_cycle(=
) to
>> > > cycle into this
>> > > new max-power profile=2E The system could encounter a brownout if i=
t is
>> > > currently operating
>> > > on battery power when selecting max-power=2E
>> > >=20
>> > > Maybe we should prevent platform_profile_cylce() from selecting max=
-power?
>> > At least for Lenovo devices unplugging AC will automatically throttle=
 the
>> > ppt values to roughly equivalent to performance=2E It will look at a =
different
>> > WMI data block for the values when switched, so there's no risk for c=
ycling
>> > in this case=2E This seems like smart hardware design, but we've cert=
ainly
>> > seen bad hardware design so the concern is warranted=2E Perhaps it is=
 worth
>> > visiting if another vendor implements it differently? That being said=
, what
>> > you're describing would match up with how the physical profile select=
ion
>> > button works, so it would align with consumer expectation=2E I have n=
o strong
>> > feelings either way, but I'm a little concerned about meeting the mer=
ge
>> > window as this series fixes a pretty disruptive bug affecting 6=2E17 =
users=2E
>> >=20
>> > Regards,
>> > - Derek
>> >=20
>> If the physical platform selection button does not automatically select=
 the
>> max-power profile under Windows, then we should copy this behavior i th=
ink=2E
>> The changes necessary for that are fairly small, basically you only hav=
e to
>> extend the handling of PLATFORM_PROFILE_CUSTOM inside platform_profile_=
cycle()
>> to also include the max-power profile=2E So i would prefer if we modify
>> platform_profile_cycle() now has doing this later might be seen as a
>> regression=2E
>
>Derek,
>
>Any comments on this?
>
>I'd very much prefer to take this series in this cycle but this comment=
=20
>seems unresolved and has userspace visible impact so may bind us=20
>irrevocably to certain behavior=2E
>
>--
> i=2E

Ilpo,

If I'm being totally honest I forgot about this request=2E I can knock thi=
s out pretty quickly and send v4 today=2E

Thanks,
Derek
>>=20
>> Thanks,
>> Armin Wolf
>>=20
>> > > Other than that:
>> > > Reviewed-by: Armin Wolf <W_Armin@gmx=2Ede>
>> > >=20
>> > > >    		custom			Driver defined custom profile
>> > > >    		=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > > >    diff --git a/drivers/acpi/platform_profile=2Ec
>> > > > b/drivers/acpi/platform_profile=2Ec
>> > > > index b43f4459a4f6=2E=2Eaa1dce05121b 100644
>> > > > --- a/drivers/acpi/platform_profile=2Ec
>> > > > +++ b/drivers/acpi/platform_profile=2Ec
>> > > > @@ -37,6 +37,7 @@ static const char * const profile_names[] =3D {
>> > > >    	[PLATFORM_PROFILE_BALANCED] =3D "balanced",
>> > > >    	[PLATFORM_PROFILE_BALANCED_PERFORMANCE] =3D
>> > > > "balanced-performance",
>> > > >    	[PLATFORM_PROFILE_PERFORMANCE] =3D "performance",
>> > > > +	[PLATFORM_PROFILE_MAX_POWER] =3D "max-power",
>> > > >    	[PLATFORM_PROFILE_CUSTOM] =3D "custom",
>> > > >    };
>> > > >    static_assert(ARRAY_SIZE(profile_names) =3D=3D PLATFORM_PROFIL=
E_LAST);
>> > > > diff --git a/include/linux/platform_profile=2Eh
>> > > > b/include/linux/platform_profile=2Eh
>> > > > index a299225ab92e=2E=2E855b28340e95 100644
>> > > > --- a/include/linux/platform_profile=2Eh
>> > > > +++ b/include/linux/platform_profile=2Eh
>> > > > @@ -24,6 +24,7 @@ enum platform_profile_option {
>> > > >    	PLATFORM_PROFILE_BALANCED,
>> > > >    	PLATFORM_PROFILE_BALANCED_PERFORMANCE,
>> > > >    	PLATFORM_PROFILE_PERFORMANCE,
>> > > > +	PLATFORM_PROFILE_MAX_POWER,
>> > > >    	PLATFORM_PROFILE_CUSTOM,
>> > > >    	PLATFORM_PROFILE_LAST, /*must always be last */
>> > > >    };
>> >=20
>>=20

