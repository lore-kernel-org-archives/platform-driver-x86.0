Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E06312F399;
	Thu, 26 Dec 2024 07:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735197460; cv=none; b=U6H87KBjDlzu/lOJuCBjROW4Msg9NGaLgaNUSnv89+8mmGCcsiIj/5eT0HC7u6Y0uKCYrdeySAXYw04r1dDuGOc+68r2OaS7LAFnkkGhaDggCFZeK9g6QV+lt/zD/BAV4ScLMibZP1VPJczM2p12kvw/eJHFf2jMruL2adqfZ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735197460; c=relaxed/simple;
	bh=LJtuD2Rz+K4OqGq+sLa0uVxI/sv4OIn06jzMN1mTnZA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=lWgMNHiFgeva9goqX6n/EuYSP9goUVGLtcUqIoMtOHavuDAhLPUQW4MVJsy8WwCr3HnfGQfxyIAX4iqi9CV7iUHwGCdNKkflZYKlsbEAVb4srW21kF/VojXcHJ0QlEld8tZM78icKB8sR2FqRfykOiQ/6WrAoTeyiowUplxDL/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OehYJEqP; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OehYJEqP"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-216426b0865so69045465ad.0;
        Wed, 25 Dec 2024 23:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735197458; x=1735802258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pt1DRegcfsKx/YjNzEroyr/bDPKDv6plgRslI7ga9OM=;
        b=OehYJEqPZt1D3f02hm0NRlGUc+ACt2QPLO1zNf+2ZBGqAAeC8dKB4ubanNafXznrBQ
         ghpDqUrLOHBwH0Y4nlHHJgllAtpa5bFF/7iPn8zq1HptdgpIbe8QHMzZY4fX5wSHirGI
         rxsqnwaktizki2sM5S+9oBRqSpicrCHNmvkcwjoSPPh/I5PCzd4fa1UXu3sJf/ZzslXR
         +NqhblY/M2EXYU/Bu6dL7suE6rV/Fenk9TbhDML4gcuFG+pIf9WT3xUL8P85x98pyHVs
         OVyfFnqMGRphUzkhcl/7jNwwmAFxT+xM6xDpvX3jLFBlw5Tp7Si7NXrjik8bO3UD1Bgf
         2wgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735197458; x=1735802258;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pt1DRegcfsKx/YjNzEroyr/bDPKDv6plgRslI7ga9OM=;
        b=eg0p8bH/kf2RZECoqFDhAgmBrsbP7ngI5okCrDUxlp8hn3mQ5qO6DiU+QgwNPPChgK
         voLdYUBlqSSIfwobdpR4StmYwOWpQlP7vxUEOY7R4p6zqFkBwVft+eqK8Lns7rpTwbKF
         fEcpnp1Nd9MrcWKG7atyGhH0YFnL9EUUBgnzUbhrRicmCmFI/0vcouVWLlmDeyks9pRJ
         yWt2yxb8V0NNp2l0IRtMf+keBO/3B3ufQH+20wAsZk5BXueHXuVgddqDSLUoek4Qi9yY
         QyUruOxOf1jlJtfZbjQgNQVw1/2fqXFmlKbT4P9Jb1MaYTpRIfJgpGEPCR9pb5V5bU7Q
         Y8aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbieZmLphf2EjOBdh4nbmUsmtq79InP/ka6j73TCWncui4dA5YjHXu7DYfMy3jVD2o5ZHK5Cjfy0WVFAtk@vger.kernel.org, AJvYcCVQXKJ6xNS9gaiRetXwckAF8tuZdpiAJUEDqflfjtSdz1+Vi5OC/1NAgKNisCkr6VjdhqJtLHxmU8I=@vger.kernel.org, AJvYcCX+7K+kkmKJBq/y1sdl1/Jl2zMR4bj6QiiTZ9hLG3rh7/L6Ly8C/xJLMbpxo/8GwhxqrFMOoUa2wnJAf86sqzguYaKUfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSB4Xfc+LCh1isaUHpW8kFwUAFcLBQinYvbUNSvTq1pe1OwoAY
	R8iLLzqMwhuomleI25AsEGFFuOigff+7JhRQfc6kk+mde+CIQqWn
X-Gm-Gg: ASbGnct+zr65jcDqCJJNDdImqIxQwJjsVJdSTY3gRC0uOkrZrc4mGo8p0XLaj7IdQwd
	Vfn0cqkM0FweiNVQDAKs7lJnNDxdtEaJvz/VbZp4gzNV2hMUorS5hfswaH3Eh90/t+CTwnDLjRd
	+JTTqSDglj8Xg9H4HwbWlGcl0aCZ8MkQVRYs8qvcB9a/4r3OY5L42fUydEG3Wu0o1K9gIETI2cI
	BFqzz3mBPuF06uv5mYyV49S3oIHsVWRSV2elWrG8PxQSscCFeN/xL0VRw4ymw==
X-Google-Smtp-Source: AGHT+IGZTsgbd+TrNJdoTvvGpPv5L33ADNmDTVZOhayk5+Fm6I3KeS0U+qBDNBNYwKouxh/CgPmc+w==
X-Received: by 2002:a17:902:d4c4:b0:216:1543:1962 with SMTP id d9443c01a7336-219e6ea19bdmr323867615ad.23.1735197458138;
        Wed, 25 Dec 2024 23:17:38 -0800 (PST)
Received: from ?IPv6:::1? ([2607:fb91:160:4100:ad2:fe52:5206:995])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b1bsm114128875ad.277.2024.12.25.23.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Dec 2024 23:17:37 -0800 (PST)
Date: Wed, 25 Dec 2024 23:17:36 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>, "Cody T.-H. Chiu" <codyit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, ike.pan@canonical.com
CC: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Luke Jones <luke@ljones.dev>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86: Add lenovo-legion-wmi drivers
User-Agent: Thunderbird for Android
In-Reply-To: <a4b3f2ca-0c91-4079-bc69-d0a98000ce23@gmx.de>
References: <20241217230645.15027-1-derekjohn.clark@gmail.com> <20241217230645.15027-2-derekjohn.clark@gmail.com> <7b1d0298-4cdd-4af7-83e6-9e6287387477@gmail.com> <99246696-4854-4EEB-B782-FD8C13D9D723@gmail.com> <a4b3f2ca-0c91-4079-bc69-d0a98000ce23@gmx.de>
Message-ID: <1A14B7E7-4AF9-49A7-ABC9-BEDDC57C4DD4@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On December 25, 2024 1:11:32 PM PST, Armin Wolf <W_Armin@gmx=2Ede> wrote:
>Am 25=2E12=2E24 um 09:34 schrieb Derek J=2E Clark:
>
>>=20
>> On December 24, 2024 9:25:19 PM PST, "Cody T=2E-H=2E Chiu" <codyit@gmai=
l=2Ecom> wrote:
>>> On 12/17/2024 17:06, Derek J=2E Clark wrote:
>>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
>>>> =2E=2E=2E
>>>> +config LEGION_OTHER_WMI
>>>> +	tristate "Lenovo Legion Other Method WMI Driver"
>>>> +	depends on LEGION_GAMEZONE_WMI
>>>> +	depends on LEGION_DATA_01_WMI
>>>> +	select FW_ATTR_CLASS
>>>> +	help
>>>> +	  Say Y here if you have a WMI aware Lenovo Legion device and would
>>> like to use the
>>>> +	  firmware_attributes API to control various tunable settings
>>> typically exposed by
>>>> +	  Lenovo software in Windows=2E
>>>> +
>>>> +	  To compile this driver as a module, choose M here: the module wil=
l
>>>> +	  be called lenovo_legion_wmi_other=2E
>>>> +
>>>>    config IDEAPAD_LAPTOP
>>>>    	tristate "Lenovo IdeaPad Laptop Extras"
>>>>    	depends on ACPI
>>> Hi Derek,
>>>=20
>>> Thank you for the initiative, love to see we'll finally get a driver d=
eveloped with the help of official specs=2E
>>>=20
>>> Perhaps it's common knowledge to the crowd here but I'd like to call o=
ut right now significant portion of the support on Legion ACPI / WMI came f=
rom ideapad-laptop which explicitly detects it:
>>>=20
>>> https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/torvalds/linux=2Eg=
it/tree/drivers/platform/x86/ideapad-laptop=2Ec?h=3Dv6=2E13-rc4#n2108
>>=20
>> Hi Cody,
>>=20
>> Doing a quick search of that GUID on the Lenovo Legion WMI spec there a=
re no matches=2E Perhaps someone at Lenovo can shed some light here, but th=
e IdeaPad driver grabbing that GUID shouldn't interfere with the GUID's we'=
re working on here=2E
>>=20
>>> Per my observation majority of users have no idea this is the case bec=
ause of the misnomer, adding another set of drivers with Legion in the name=
 explicitly, that don't support those features would double the dissonance=
=2E
>> It appears the feature sets are quite different=2E This seems to enable=
 use of special function/media keys on some (one?) Legion laptops, and it a=
lso tries to register an ACPI based platform profile=2E While the driver do=
es load on my legion go, only the amd_pmf and lenovo-legion-wmi-gamezone dr=
ivers have platform profiles registered under the new class at /sys/class/p=
latform-profile/ so that isn't a conflict=2E I think that the ACPI method m=
ay only work on the yoga laptops that are supported by this driver? Again, =
maybe one of the Lenovo reps can comment on that, but it appears to predate=
 the Custom and Other mode WMI GUID's=2E
>
>Maybe we can remove the "legion" part from the driver name since this WMI=
 device seems to be used on other machines too=2E Maybe you can instead use=
 "lenovo" when naming the drivers?
>
>Thanks,
>Armin Wolf

I think you have it backwards=2E Per the spec only legion laptops will use=
 the GUID's for gamezone, custom/other method, lighting, or capability data=
=2E Removing legion from the driver name would probably cause more confusio=
n=2E The GUID in the IdeaPad driver is what seems out of place=2E I took a =
closer look at it and the functionality provided by the GUID he mentioned i=
s a notify for when Fn keys are pressed and none of the other GUIDs have th=
at flag implemented=2E There is a comment about it being for a legion 5 lap=
top but it may be the case that some IdeaPad laptops use it as well, I'll a=
sk some of the Lenovo folks directly and see if I can get a positive answer=
 if it is a generic Lenovo interface=2E IMO if we want to reduce confusion =
it might make more sense to move that GUID into its own driver at a later d=
ate, naming it lenovo-wmi-something without a specific product line, or if =
it's only used on legion laptops then calling it lenovo-legion-wmi-somethin=
g might be preferred=2E Alternatively renaming the IdeaPad driver lenovo-la=
ptop could work to disambiguate it=2E TBS i don't think it's a high priorit=
y right now=2E I'm going to focus on the gamezone and other method drivers =
for now=2E

Regards,
Derek

>>=20
>>> I wonder if reconciling this is in your planned scope? If not IMO at l=
east this should be called out in documentation / Kconfig=2E
>> Reconciliation wouldn't be in-line with the WMI driver requirements out=
lined in the kernel docs as each unique GUID needs to have its own driver i=
n the current spec=2E It is possible we might need to add a quirk table in =
the future if we want to add function keys support for the Custom Method or=
 Other Method function keys in the future=2E Since the Go has no keyboard I=
 can't confirm if the IdeaPad driver is functional on more legion laptops, =
but considering the DMI quirks that are used in conjunction I would assume =
support needs to be added explicitly=2E
>>=20
>> If someone wants to add documentation on the IdeaPad driver and what it=
 provides that would be good=2E I'm not familiar enough with it to really d=
o it myself=2E
>
>As long as both drivers use different GUIDs we can assume that they do no=
t conflict which each another=2E Anything else can be added later=2E
>
>Thanks,
>Armin Wolf
>
>>=20
>>> PS: I'm a developer myself but at lower level kernel domain I'm just a=
 user so hopefully I'm not just adding noise here=2E
>>>=20
>>> - Cody
>> - Derek
>>=20
