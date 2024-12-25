Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6530213FD86;
	Wed, 25 Dec 2024 08:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735115701; cv=none; b=baWNp1237jo3NtHvZcZCEVdy347o3vrFLfqZRcwnMFVOWoWdi5EF6ml7DfpVoPM2rsWErkILRygDUAbezL748XBV+5fvhtKnG3V1YXgzrEmr3Wi1a3QgNJlVYxUOvRJtyhzdGWMeOgLJEojgzFbPiN6Ew2c+744WG+JXql3xcgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735115701; c=relaxed/simple;
	bh=yZk83rB4MN6IzEJ37vUFzbAaC9sDsOHYpsTbvjnxSr0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=DI3QUU3g3AhRjdcLTXzXBvXgFdAR4htZmbXRVCQFQKIF2nLDbdrEh8AVWFwjjMwKqYTNAkPL6oa6P9MNFsk4q5pGdZ6XcEax/H4tb1LxnrfPTU+i6HfevL8nmXM4kgLmr0VhziT71VD40QQ+1ZQ5q3tAJMkWCEbVTe/I52mBMJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MF1XQFXx; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MF1XQFXx"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso4786094a91.3;
        Wed, 25 Dec 2024 00:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735115699; x=1735720499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z9wvBPs6961kLFo3zvmprRIYn/OU2kr5wrUr3JghB2o=;
        b=MF1XQFXxEarjdf3cG09l1TqCv7BfgGgi207jwVs9eE6BFpnP0p3NgD2zZYB/Ty/FQe
         VK7rGkvdbxyVCYtUVWYNDxiAuzCjkOqnC0aB4ndEOKqjaYAyQuEBC3V569AmleQLm32d
         EXvbT8sAoM4fBxc9RHPXCu5OGE1J3RvwFqFz8BUY/jKtS8YsGg1tUJ0cxTMnm+epzH1q
         9IjvGvU26sTIPaylodQkY5PrvIsQXoL4vA9HObGDDt1ZjbwjcBUnNglt2aQv/L40vLrw
         xx5N0hi0avJGIf+1FllfW38VMFZFkYEfZLmKOIl2ClHfQW+7wLKvwxavdH9307OCbDGB
         d/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735115699; x=1735720499;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z9wvBPs6961kLFo3zvmprRIYn/OU2kr5wrUr3JghB2o=;
        b=U41uVt8kdnDUVwJP27TWWScVSC+3k5gIuq/X/AYkH26R9IpAUmLLLgQW3Q39io+6ei
         MfZg30Kma/RB/yH60S3+2mDjUxbBloCtGo4f6hBDIyP8TQ6UlPvLY9rkNFGOXITmhp66
         9EY6oydKAc3uEm2omBbAV9SFuxZshtA2//ctaNujfnal8m8sdeGbdBhpqHbrUUjQp3CP
         NfX46SeMBXUsXTFXeCMIBqPfvp0YvW77ykHW4AwDLZw6SpiG89B56o6i0k4q9CVMCPPQ
         TwF6t78xT86obf9GCqhA6fOUk5PkukiHrTU25Bxm2TSAa99BszcZy2ft8a4NSsEbLQQu
         Zokg==
X-Forwarded-Encrypted: i=1; AJvYcCV6vybb1JBCQkHBmxoGfmbkTjCutMyZUw+cShBS2wW0PPHwFku8ZjWyEMiezAaeuTtgAI5MB1RtW9JQ0teAWpBQdyv+wg==@vger.kernel.org, AJvYcCVIwyjXoX//Usm1g6TxbbHt37dkX0A2jyC2urAxD7231laf1V19aorhIdK+iupsd/w1UwyccJg74+Nh/Gsa@vger.kernel.org, AJvYcCX5c2UN0uYeZW98SP84V6hJ98/5LdyhXOSVm+JWDbuixI4wUfJZrNIWLfP1B2nUL72DjMaMYXj2gqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfutnYEzku+ypgsifaEsuLFPqAO8RGFPquvLyU0tRTlH578WRa
	OJ3c/zWPQCSJfzDzLUnQxAwzg7NekIc37r2PlynZIhvNCQVSWLAe
X-Gm-Gg: ASbGncuknb6LQy6gFHHAPaPGA9vvywwQalNl3PAz3dq91AOW8sXA0WEIBmzd//qgnvd
	d33B1yWX22AZCtEFOITV1lPcWPljKDbY7xgTs/CGJL/WGM0iOWEFjk6IdoHpDUN6TbU1NY4ImKJ
	lVjh/+SdaQVZpBTFtQQ5br3yoNUUqvttpILSqUw62YjTDKOGLHTKmL3WkpdJmRbskgD/79V+OVF
	LnClNZPNx57xwtzO+zpUQAry4JwwooUiu0Pe2WRU953UuIl/5aQsjmoWVTsNA==
X-Google-Smtp-Source: AGHT+IE8SKXtkvmMBK3Ydry2yCRtBlpS3t5Qp0W5z34e3Ocb3Uh6TL6R2JjbawJ0w2bnqhrZWHevPQ==
X-Received: by 2002:a17:90b:6c6:b0:2ee:b8ac:73b4 with SMTP id 98e67ed59e1d1-2f452ee4fb6mr24875761a91.36.1735115697154;
        Wed, 25 Dec 2024 00:34:57 -0800 (PST)
Received: from ?IPv6:::1? ([2607:fb91:160:4100:ad2:fe52:5206:995])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed82d273sm13545484a91.30.2024.12.25.00.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Dec 2024 00:34:56 -0800 (PST)
Date: Wed, 25 Dec 2024 00:34:56 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: "Cody T.-H. Chiu" <codyit@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 ike.pan@canonical.com
CC: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Luke Jones <luke@ljones.dev>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86: Add lenovo-legion-wmi drivers
User-Agent: Thunderbird for Android
In-Reply-To: <7b1d0298-4cdd-4af7-83e6-9e6287387477@gmail.com>
References: <20241217230645.15027-1-derekjohn.clark@gmail.com> <20241217230645.15027-2-derekjohn.clark@gmail.com> <7b1d0298-4cdd-4af7-83e6-9e6287387477@gmail.com>
Message-ID: <99246696-4854-4EEB-B782-FD8C13D9D723@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On December 24, 2024 9:25:19 PM PST, "Cody T=2E-H=2E Chiu" <codyit@gmail=
=2Ecom> wrote:
>
>On 12/17/2024 17:06, Derek J=2E Clark wrote:
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
>> =2E=2E=2E
>> +config LEGION_OTHER_WMI
>> +	tristate "Lenovo Legion Other Method WMI Driver"
>> +	depends on LEGION_GAMEZONE_WMI
>> +	depends on LEGION_DATA_01_WMI
>> +	select FW_ATTR_CLASS
>> +	help
>> +	  Say Y here if you have a WMI aware Lenovo Legion device and would=
=20
>like to use the
>> +	  firmware_attributes API to control various tunable settings=20
>typically exposed by
>> +	  Lenovo software in Windows=2E
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called lenovo_legion_wmi_other=2E
>> +
>>   config IDEAPAD_LAPTOP
>>   	tristate "Lenovo IdeaPad Laptop Extras"
>>   	depends on ACPI
>
>Hi Derek,
>
>Thank you for the initiative, love to see we'll finally get a driver deve=
loped with the help of official specs=2E
>
>Perhaps it's common knowledge to the crowd here but I'd like to call out =
right now significant portion of the support on Legion ACPI / WMI came from=
 ideapad-laptop which explicitly detects it:
>
>https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/torvalds/linux=2Egit/=
tree/drivers/platform/x86/ideapad-laptop=2Ec?h=3Dv6=2E13-rc4#n2108


Hi Cody,

Doing a quick search of that GUID on the Lenovo Legion WMI spec there are =
no matches=2E Perhaps someone at Lenovo can shed some light here, but the I=
deaPad driver grabbing that GUID shouldn't interfere with the GUID's we're =
working on here=2E

>Per my observation majority of users have no idea this is the case becaus=
e of the misnomer, adding another set of drivers with Legion in the name ex=
plicitly, that don't support those features would double the dissonance=2E

It appears the feature sets are quite different=2E This seems to enable us=
e of special function/media keys on some (one?) Legion laptops, and it also=
 tries to register an ACPI based platform profile=2E While the driver does =
load on my legion go, only the amd_pmf and lenovo-legion-wmi-gamezone drive=
rs have platform profiles registered under the new class at /sys/class/plat=
form-profile/ so that isn't a conflict=2E I think that the ACPI method may =
only work on the yoga laptops that are supported by this driver? Again, may=
be one of the Lenovo reps can comment on that, but it appears to predate th=
e Custom and Other mode WMI GUID's=2E

>I wonder if reconciling this is in your planned scope? If not IMO at leas=
t this should be called out in documentation / Kconfig=2E

Reconciliation wouldn't be in-line with the WMI driver requirements outlin=
ed in the kernel docs as each unique GUID needs to have its own driver in t=
he current spec=2E It is possible we might need to add a quirk table in the=
 future if we want to add function keys support for the Custom Method or Ot=
her Method function keys in the future=2E Since the Go has no keyboard I ca=
n't confirm if the IdeaPad driver is functional on more legion laptops, but=
 considering the DMI quirks that are used in conjunction I would assume sup=
port needs to be added explicitly=2E

If someone wants to add documentation on the IdeaPad driver and what it pr=
ovides that would be good=2E I'm not familiar enough with it to really do i=
t myself=2E

>PS: I'm a developer myself but at lower level kernel domain I'm just a us=
er so hopefully I'm not just adding noise here=2E
>
>- Cody

- Derek
