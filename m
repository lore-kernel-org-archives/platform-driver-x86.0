Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2A227FB37
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 21:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762981808; cv=none; b=m4vgaQrGVFDvco7+9UZVZlUBUJqc1+fTJq6q4VXrjfQ4UDW9t9PBy3dO5/hg8+oQOUU5XHeW+ffYRUOFLmLCC3raot/Ai+8FITyn2nuRb4Y/Pg5Vtq0V+qw2Zr9SMx5J7UiPcJvGaHG5jisrYjaoMNEgEsfW08WNjlqJz8+2fqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762981808; c=relaxed/simple;
	bh=3KeLYpoxQunGwePMrGw9Ag8kDi0pL6I47mlzQXLbZbo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=WpTavogueEh+Uorl6uW/HcQkeMl4VCFt7YR63gkp6jI1/X7beHw9F59kyLFdPVYC8JC/vCfbHG4Eweqc+pOFbvHg+dwzY9AMjzCrwBYL/+JMUZ+eL+RLaZvG5WkbaAgLO+pDshzZSQtv5V3Jr/HnmleTRnJV/CB3OY60efy5l30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzXaEggd; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzXaEggd"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34372216275so105805a91.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 13:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762981805; x=1763586605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iK9hwywVCoA1owwArThQ0iGrOFP6QXJhSt+mBhrCefg=;
        b=bzXaEggdBF7zyHCMWT9uYGuMR0WlMBzNddiJbxsn8vBUEO5LFZv2I3PE3h+FAOZggs
         N/quX5dU4ouADzl5u8VfMOfsOV2BoWhsG7+W+dz7RK0lyz4kdzYwRDENYM0H38lpgXdU
         R60c/AVrGUF5bp9xRi+XwKAgDftXozHw3MguFIHw01l/LtrAG10mNt8qbnnLRLAhHpLY
         hxFsHOOv9BdOl0B4gzHhJx6EbXIbdXXa0ZqnorNVkegtKufksgPE4ipIV2ONVzbv8xdU
         f6OY/X7niYfEvjuoMKgoZf1AsdE1qxq1Rfs2I2ZlTA9XX7/90gE4lM2eMyxHNUr56hJi
         sn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762981805; x=1763586605;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iK9hwywVCoA1owwArThQ0iGrOFP6QXJhSt+mBhrCefg=;
        b=fm1+9AEEOU0SRpKViGqvnrVFUcLPgCuIivektwzdlwlm39+pfeYporWgXpRJ8Z5a27
         iILpwCFm5p5PtD/IJTc0v+Vqf1bjog2yvFWaCGP+fB//WU3UdwcrOlIw/LyA6IxavgiF
         tYirTWoOriJ1MlNi2KuTGpigArqje9msPF01eXiL5951XAxaPqA4AWYR2TaBCxim/JFM
         ASNRERLbZ7aEnTLGOcOlBJdyzTb5+npK5fAXaO1BgJJ3cgDb50a5egDQWGaKy5+OHWWV
         Qk5zDZbmRNdQoNdOauicGjmkSZ6GvbVXrK30tjbm8DXAKis8mn1sFxN7C9ku6vmYDpb7
         KUVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmZv+JKMQKCqVsd+8uCTk26+X2grEbr/cn22dWtwPEqGl4BhcAs1wRYnm1ifJQUNeJgqzULkr9U9KkZX41tJ9wC961@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb/aYrwi4JYo9cdMKIVLmktnxLqedQ+67HFMzGbUge1FNxmtUk
	cy3qeh6qOZ2aDqQUqzSa23jDl4DQW0Ci+D4pi/34qpZAtgA8t3Dt48JqyjIlocF/
X-Gm-Gg: ASbGncuhdBpMuZJUS4fNSsseC2slqsYZPNaDiwxi9v7yVrBSGsNxoUgz+Km6coX2dXz
	eDNtTcayaPrHx+xFBXL4kXo1cZuJtMNXFhBBsbEBBn9Hi4XL0D45Vs9FMlu6pbBXE8ulZw7bON0
	F9UZ8VaoNpFTJ1QRQ6Dos6l9V+NMP4L8ELpr+VIGcQoLK61fPw/Brlin89dApXDBFgDMKNy5WSi
	XwUSqzcurakKovz09chQrwCRmHxzKG0oeJ+VaANt4H/aAM+RrJmktifn04wFZGkBpjmnqRDg+ka
	gqAd9W+GqSJF3oJyXiz5I7IWlhUMuTGhB75izHbZwjTCjI+cEVC8wXWYfgeNkOa5RFV2LwKy5RR
	XPoJP61eV0j5n8Cxhytz5e8n6glxdCoBBYpeY7W+ICoC/u3XO7IkeOWG7RRLjjhv0LSCWHX2zIX
	rIDOdl8aJ0Hl1dAxjy/6iYPo9uUtLIEHBpeZ9yWF++F19+1yL7jd9nT9WORjfovmtwgiaiFhI=
X-Google-Smtp-Source: AGHT+IHGmuARPThpnwcferH+2Fz0BRD/2zZnyupg6Za/IMYh6KBq2OjFyv6xSKw5IW/55mxOopvWyw==
X-Received: by 2002:a17:90a:8c10:b0:341:194:5e7c with SMTP id 98e67ed59e1d1-343dde6f7ebmr4302109a91.24.1762981805360;
        Wed, 12 Nov 2025 13:10:05 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9635007sm19900217b3a.2.2025.11.12.13.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 13:10:04 -0800 (PST)
Date: Wed, 12 Nov 2025 13:10:04 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Mario Limonciello <superm1@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
CC: Armin Wolf <W_Armin@gmx.de>, Len Brown <lenb@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-acpi@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/3=5D_acpi=3A_platform=5Fp?=
 =?US-ASCII?Q?rofile_-_Add_Extreme_profile_option?=
User-Agent: Thunderbird for Android
In-Reply-To: <d660801f-8551-4940-8555-1059e9d565f7@kernel.org>
References: <20251106212121.447030-1-derekjohn.clark@gmail.com> <20251106212121.447030-2-derekjohn.clark@gmail.com> <701898dd-3310-e86d-7499-fca5a445447a@linux.intel.com> <d660801f-8551-4940-8555-1059e9d565f7@kernel.org>
Message-ID: <1558D575-0F14-418E-ACD7-7B7420C622BF@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 10, 2025 9:17:12 PM PST, Mario Limonciello <superm1@kernel=2Eor=
g> wrote:
>
>
>On 11/10/25 5:14 AM, Ilpo J=C3=A4rvinen wrote:
>> On Thu, 6 Nov 2025, Derek J=2E Clark wrote:
>>=20
>>> Some devices, namely Lenovo Legion devices, have an "extreme" mode whe=
re
>>> power draw is at the maximum limit of the cooling hardware=2E Add a ne=
w
>>> "extreme" platform profile to properly reflect this operating mode=2E
>>>=20
>>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel=2Eorg>
>>> Acked-by: Rafael J=2E Wysocki (Intel) <rafael@kernel=2Eorg>
>>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>>> ---
>>>   Documentation/ABI/testing/sysfs-class-platform-profile | 2 ++
>>>   drivers/acpi/platform_profile=2Ec                        | 1 +
>>>   include/linux/platform_profile=2Eh                       | 1 +
>>>   3 files changed, 4 insertions(+)
>>>=20
>>> diff --git a/Documentation/ABI/testing/sysfs-class-platform-profile b/=
Documentation/ABI/testing/sysfs-class-platform-profile
>>> index dc72adfb830a=2E=2E9bee8deb4dc9 100644
>>> --- a/Documentation/ABI/testing/sysfs-class-platform-profile
>>> +++ b/Documentation/ABI/testing/sysfs-class-platform-profile
>>> @@ -23,6 +23,8 @@ Description:	This file contains a space-separated li=
st of profiles supported
>>>   					power consumption with a slight bias
>>>   					towards performance
>>>   		performance		High performance operation
>>> +		extreme			Higher performance operation that may exceed
>>> +					internal battery draw limits when on AC power
>>>   		custom			Driver defined custom profile
>>>   		=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>   diff --git a/drivers/acpi/platform_profile=2Ec b/drivers/acpi/platfo=
rm_profile=2Ec
>>> index b43f4459a4f6=2E=2E78da17e16d9b 100644
>>> --- a/drivers/acpi/platform_profile=2Ec
>>> +++ b/drivers/acpi/platform_profile=2Ec
>>> @@ -37,6 +37,7 @@ static const char * const profile_names[] =3D {
>>>   	[PLATFORM_PROFILE_BALANCED] =3D "balanced",
>>>   	[PLATFORM_PROFILE_BALANCED_PERFORMANCE] =3D "balanced-performance",
>>>   	[PLATFORM_PROFILE_PERFORMANCE] =3D "performance",
>>> +	[PLATFORM_PROFILE_EXTREME] =3D "extreme",
>>>   	[PLATFORM_PROFILE_CUSTOM] =3D "custom",
>>>   };
>>>   static_assert(ARRAY_SIZE(profile_names) =3D=3D PLATFORM_PROFILE_LAST=
);
>>> diff --git a/include/linux/platform_profile=2Eh b/include/linux/platfo=
rm_profile=2Eh
>>> index a299225ab92e=2E=2E2bf178bde2b5 100644
>>> --- a/include/linux/platform_profile=2Eh
>>> +++ b/include/linux/platform_profile=2Eh
>>> @@ -24,6 +24,7 @@ enum platform_profile_option {
>>>   	PLATFORM_PROFILE_BALANCED,
>>>   	PLATFORM_PROFILE_BALANCED_PERFORMANCE,
>>>   	PLATFORM_PROFILE_PERFORMANCE,
>>> +	PLATFORM_PROFILE_EXTREME,
>>>   	PLATFORM_PROFILE_CUSTOM,
>>>   	PLATFORM_PROFILE_LAST, /*must always be last */
>>>   };
>>>=20
>>=20
>> I wonder if "extreme" is the best name for this? Given the description =
you
>> gave above, perhaps "max-power" would be more descriptive (and we alrea=
dy
>> have "low-power" so it kind of feels fitting the theme too)=2E
>>=20
>> I don't have strong opinion on this so if you guys feel this suggestion
>> would not make things better, feel free to voice it=2E :-)
>>=20
>
>I don't feel strongly here, either sound find to me=2E
>
Fine with me=2E Extreme is the vendor (marketing) specific phrase but the =
low/max-power symmetry is nicer=2E I'll try to spin a v3 today or tomorrow=
=2E

Thanks,
Derek
