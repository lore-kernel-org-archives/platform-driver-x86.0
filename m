Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18682EC0AE
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 18:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772043973; cv=none; b=Ix7ypXDgc57d+YvS/c1IIKi3Lxvn64WtgBY3ye7q6RoB+n97FnYw38vuuPPNRDMTbbBExz5Kd5L1JVKmmR3NSyfiCsrY08d+CQpypBQsioo1jrw0l3Ut5PhHKleIfOWMm6eZ5aNMY1TE2iW3AWPGsCmEfl64vseXBOv8mVt62VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772043973; c=relaxed/simple;
	bh=v7HzTRvPbojAP+9SBo2Rr+jD4PIy4/P6E/hbZheiRs0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=oRtqPigyYC1bnm1mePxq/yWpBsJojXWMb8dw6Fc4GXUPA+25Fohlvu70HKWUcitw0ztHMaQEV4WxRVoodSc1goQzvHsKv2LdQ2lzFqBLqFfZpPSbY6kbABocjP/djQQzNWC2N6zAgkZUaV3mrS1K44+ySe269sKMsS7lIBkwffU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1tRiz1R; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1tRiz1R"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12776bebe9fso3628655c88.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 10:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772043970; x=1772648770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3zPxDAA9Z6j2aU+ElViDYNOSqkMrdJ3D+QE/kULkJ0w=;
        b=d1tRiz1RA7atpbW9du8kicr4ICEUCjGH1LnW+CAkZjjtCX6OnI3YihyhSS969R0zLT
         HPgskbTpfi/KY8yanExpTnuscWx80m2PMq7SFKTf/v1wtCEPWMux0o6TyGibrHL7v8bR
         8IZmUL3t8fcGsG5RqKKxGIp3ebaFELxmkTDuAcbqutNmAxy5KXUzO1NC1RzXzASBNoQd
         tcPWVddzd3guTi01x3OqsbyBLIkUr46ebcsfDnmNRLzJGjuwIdo83osZ/KW5jFfCMHwK
         0NNYKYiQkeAeT3IsY1DYYgW3sEUbhFOYAcIB7wCxVoliBzZ/9awGtCkUJ37HH2wyMXBz
         oS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772043970; x=1772648770;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3zPxDAA9Z6j2aU+ElViDYNOSqkMrdJ3D+QE/kULkJ0w=;
        b=q1TZw7nMc2LNXNhGbqct+03xiUlak7SOoDQL2HLer7xxnMOcNg9duBv+ojgUbdLdFT
         /WGg8pFXuG5KOvOByiL3KkR1jaL9OF+WsToSMOSU0QgOxQC82Wl3fp+Nkps2zUtsonyd
         rr1DyulYAdXpDnYbu1piRU0CtYPu+frgMQ1/WQtYVBQ3REjzLWQij6qBDe2lIyr+mh0l
         nHQzFdH7+0bWnZ49EAtgDTtjzsRtFfgifDs6OcWkxYoWVDKN5SnYW2W8Rx5VmRY7LZTp
         2bHYNZnZ4YssZA86FL5KZLG7sXGLWGKWd2kcPeNcc48BJ9r3E+o83N4RT2PR12ExTpAP
         KFnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnDGXA1yjAl2zrvLG+gvw4O5g9zkZYooAEF29BWTBjyeC2jaRVMg7ms1cEjuN402Iip+zZUKx/AZlDbHAJs1iN7ei/@vger.kernel.org
X-Gm-Message-State: AOJu0YxAY+SJLZ/2rpyXlyseJEj8hISpslaWPBcMi351dQ6aQmwD7/xg
	y9mMA3aTyoF+r/o1dWUUEh/uI8XgwzOFPuh+x6agjT/vTA+r7WpUabMc
X-Gm-Gg: ATEYQzyYxGABP4rCp2OGAXFgIBsTfMxkqyBtHzVGPv52V2QfYu/Ep/17EDNoiROv5GS
	pYFGirXXJKh/Wfe1fbNW5SXwlnO/f0r/N1IAQfiiIRWy1xyilXGLhv6iZT2uQMsujgLyLgpX/qs
	sU6mnZlba8WDOuD/7v1b+XtdDWt7dYMDmm1t1vv9f6So0HKqQXt3cuyOTTISAuf/N+74AJ6Wz+6
	WaEJ19qPcNmj723iocEINIJTcxPUlYKhk5GcYkdkjmbSfmImBXr7HPi8bKTY4sI9AcMkwdND/FG
	URjpiVpSGc4mQA65v3bSEHBsQAlhqS6rKdIR7NSjOlAxlHSFCoXhdWxUo2a81YBpRSTbGL1uFU1
	WICJYT/FblBhVtCrV2Tkc/5giu5lrO8/svz/L7VqbxbXCnit1PVCUiWrOoerMIm5XgYjbKUgnUy
	Zr87w9CjtQp+aIxIdhttwhhIqWXkdaoceXCOLMQ0jnkblk6m9SSGWTiWRMY1AmOXRYCsjwGmPM8
	bOLAHl+Pa9J0S6nFDH+Bw==
X-Received: by 2002:a05:7022:511:b0:119:e569:f26c with SMTP id a92af1059eb24-12786990d32mr739802c88.21.1772043969977;
        Wed, 25 Feb 2026 10:26:09 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af10476sm13520774c88.2.2026.02.25.10.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 10:26:09 -0800 (PST)
Date: Wed, 25 Feb 2026 10:26:11 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_0/6=5D_platform-x86=3A_le?=
 =?US-ASCII?Q?novo-wmi=3A_Add_fixes_and_enhancement?=
User-Agent: Thunderbird for Android
In-Reply-To: <d9543212244feba3f0dd5cab70e600c878540e7b.camel@rong.moe>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com> <d9543212244feba3f0dd5cab70e600c878540e7b.camel@rong.moe>
Message-ID: <E2D998A3-4CB3-4A33-BDA1-2D0834921369@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 25, 2026 10:02:21 AM PST, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek,
>
>Sorry for the late reply=2E I was busier (yet happier ;-)) than I had
>expected during the Spring Festival/Chinese New Year=2E

Not a problem, glad you enjoyed your time off=2E

>On Tue, 2026-02-24 at 04:31 +0000, Derek J=2E Clark wrote:
>> This series adds many much needed features and fixes to the lenovo-wmi
>> drivers=2E
>>=20
>> Patch 1 adds a macro to make assigning attribute ID's for capdata
>> cleaner and easier=2E
>> Patch 2 addresses bugs where devices that don't support exposed
>> attributes would still create the attribute, and also attempts to
>> identify the correct capdata and set/get methods as some legacy
>> interfaces don't use the custom mode in the method or capdata ID=2E
>> Patch 3 adds the remaining CPU attributes that weren't previously
>> exposed=2E
>> Patch 4 adds the GPU attributes that weren't previously exposed=2E
>> Patch 5 consolidates name constants in preparation for patch 6=2E
>> Patch 6 adds battery charge-type limiting when supported only by WMI=2E
>>=20
>> After applying Rong's series from
>> https://lore=2Ekernel=2Eorg/platform-driver-x86/20260210191938=2E137234=
-1-i@rong=2Emoe/
>> I found that there weren't any conflicts, so rather than combine
>> the series we can just review each separately=2E
>>=20
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>
>The patch series makes sense to me in general except for some issues
>mentioned in my previous replies=2E
>
>With style issues fixed, you can add
>
>Reviewed-By: Rong Zhang <i@rong=2Emoe>
>
>to patch 1,3,4,5=2E
>
>Thanks,
>Rong

Thanks, will do after we agree on some of the details=2E

Cheers,
Derek
>> ---
>> v3:
>>   - Re-add HWMON name const and jsut rename LWMI_OM_FW_ATTR_BASE_PATH
>>   - Fix linker warnings by moving acpi/battery include to the end of th=
e
>>     list=2E
>>   - Remove CPU/GPU OC features=2E These attributes are BOOL type and wi=
ll
>>     need a new constructor that I'll add later=2E
>> v2:
>>   - Fix gpu_mode misisng from attributes list=2E
>>   - Fix prototypes for power suppy patch=2E
>>   - Reorganize CPU and GPU attributes alphabetically=2E
>>   - Break out the patch consolidating the driver name cost=2E
>>   - Move some of the refactoring of attribute_id back to into patch 1
>>     where it belongs=2E
>>   - Fix some additional typos in function prototypes=2E
>> v1: https://lore=2Ekernel=2Eorg/platform-driver-x86/20260213081243=2E79=
4288-1-derekjohn=2Eclark@gmail=2Ecom/
>>=20
>> Derek J=2E Clark (6):
>>   platform/x86: lenovo-wmi-other: Add LWMI_ATTR_ID Macro
>>   platform/x86: lenovo-wmi-other: Limit adding attributes to supported
>>     devices
>>   platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
>>   platform/x86: lenovo-wmi-other: Add GPU tunable attributes
>>   platform-x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
>>   platform/x86: lenovo-wmi-other: Add WMI battery charge limiting=2E
>>=20
>>  =2E=2E=2E/wmi/devices/lenovo-wmi-other=2Erst          |  21 +
>>  drivers/platform/x86/lenovo/wmi-capdata=2Eh     |  13 +-
>>  drivers/platform/x86/lenovo/wmi-gamezone=2Eh    |   1 +
>>  drivers/platform/x86/lenovo/wmi-other=2Ec       | 605 ++++++++++++++++=
--
>>  4 files changed, 593 insertions(+), 47 deletions(-)

