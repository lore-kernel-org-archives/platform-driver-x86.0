Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0AF2EA154
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 19:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775072276; cv=none; b=Hm79Sr+Y5+Oe39L693U2gHG2GpuYAwOtSqZOzCz+JGZcT4jfAcSH3D0UJbj91raa2Pb/tRoto3sYpEBNCxxwnB4DytUwvfLMA98rScSeALNyE3ftOVGB9EQxarheNGe6GJgBGKqxd/0d920nfyyjEJTcaoQ4qV8QdbvF7FghLg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775072276; c=relaxed/simple;
	bh=iJkYIFotof/OZo0YwsgEdL2JXCaB5R8gxv4uapcJaUM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=JK77rStAq52+gNQ6LTIewbRSUXxGhpFYD4WsdkRmx2RkahUeM1ZoU0ano6Bt/a7jfNGz29LU/Dr54efqIkF0OFHujySGlW5ekRC2DWasIo/HW+92oMUfTLal7XRJtnHpxE2UV8Vh4UHvdjoI7+e3gRyfpxVUQJ8+SdYF+ScYwbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcxpdFG6; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcxpdFG6"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c1632faeb9so326633eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 12:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775072274; x=1775677074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=InLPiE0X2jnGPaKtyTTjpM7XpuGceKnZmJhNoR6/S1o=;
        b=LcxpdFG62rwZ9unlwYPZVLIZW9vNhM7TVi4adT9kl1nFHRNCe3aNlneHeLdmSvCGZa
         VFN89D9omkrBoqjmh5jotzLgTHfLb/GqpmtHCc1Jupwr6iyWqR55IbpoZAPCJwoRsmkY
         JCllyET4UD+BLGP7p1yK+2YKgatiyZzG75PH0D9D3N8iUmB+Diee1CKP1V0gyMCJYusz
         LfoXxuBN9Qjdo/5vX9BwdMSC4xxDiiftDreei3+1Sl+Z3JZGrWh+EL1Wepl8IesL+Ojj
         H8WsRH2N65i2jKUWPQiPy/9EnQh/gnaiV+IR/HMvNPMxR/1iuUxx8Bf73AoG6KNgeFvS
         ru6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775072274; x=1775677074;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=InLPiE0X2jnGPaKtyTTjpM7XpuGceKnZmJhNoR6/S1o=;
        b=DmK1LmbAZsjBp4aZt4RIquHhHxGHebfSUrrkBk7VB6hpOfDNZMMmIkmv4faEqSieAx
         8N92KMosg3xqkVdfHowv6ao25+eKCYj9Og3EPJjkPN3dS8DgP2PLFv7Xzyw9GzadOfLO
         UDnjrJBau5/eJQlbS3XtNnIL6GBT2FWQiuUDF0/MNuvhLMhIXklipvZTHC7ptbjwN5cP
         kAaBSG0vs2jxwZRGFbbK6Ozmi8PxVwMVX78I2pNgcm9Q7/+rYDKC6aDglxNY05VisYnW
         WovuA9VHm5IXXGreUJ56nqqfTssCFd4aNaredZWv6oluDor0I10HutwiaVxCvooTkdbX
         L7Ag==
X-Forwarded-Encrypted: i=1; AJvYcCViohrrYPkAh8YYAxw/C786q+sJr7sY31DyjApU2YHFLfDbon/yScArNdAWoiYHYbjBT3+U8jlMyN0M1RSdS1RtCl1t@vger.kernel.org
X-Gm-Message-State: AOJu0YxCQwSYvDdpI8kHfr9OaIe7je19CoJlaC6mUNdLXg/ICSC9IoDh
	NGAp4LX3bq4wJO0CydXJT3KvIhiI2aPVH+njH8BaV3lRwQpVB/zttQqY
X-Gm-Gg: ATEYQzyF9r9BGnHAiOUaQJHhvTvg7Oc4CLtLVtTSWnwgU4zU6Oe18DCPmMq8Vrm76FF
	rIyBKxXBn43Dn+/JtpOJ3dCtx4eN4B53w75jZXriDe2A7aBk4K1GoNJRsxuYMRHGK2OZ3/5i4x7
	cSb4NupLdAvF20gmwkHc1LMOE8gV20gNjzHk8j/+5+8YBwiikgL86jCs5IHxS/a5TzqRhlOXYMt
	TkSizVbIiCwLD+ORlO2nHMEtxMBbPOaGCyFB0UcdIB+6AXfbOROET4jLrYm0KXelwnTWOtZvvNa
	QUcAg6+7fnTQlcPCvT5bXS70jE0NUNZBEmX3nIQ8H2TE27kesNWxp9+ZKIaspUkDDuhtDLZt3bd
	ZI/H7sX2R/dqSOXZzSHxxhi0AwXD7yTIDDEyBlNDUQSMJmR+TkQixiF0Of51EOReH3pYmovsTtB
	ZH9VWkvxMc68dYbRh6HIPCpx10JNs4hn2y3kUFrYytexay
X-Received: by 2002:a05:7301:1e84:b0:2c5:3b87:2ff0 with SMTP id 5a478bee46e88-2c930e6c555mr2729930eec.12.1775072273716;
        Wed, 01 Apr 2026 12:37:53 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2607:fb91:1beb:4a2a:ac39:c338:9a5a:68b1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7ce0075fsm594168eec.24.2026.04.01.12.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 12:37:53 -0700 (PDT)
Date: Wed, 01 Apr 2026 12:37:50 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_00/13=5D_platform-x86=3A_l?=
 =?US-ASCII?Q?enovo-wmi=3A_Add_fixes_and_enhancement?=
User-Agent: Thunderbird for Android
In-Reply-To: <499fa3efd5be054ffdda77dd00ad4d8d3391e073.camel@rong.moe>
References: <20260331181208.421552-1-derekjohn.clark@gmail.com> <499fa3efd5be054ffdda77dd00ad4d8d3391e073.camel@rong.moe>
Message-ID: <9E0EF7A3-D695-414E-BB06-60C7F2FBEE5E@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 1, 2026 11:44:51 AM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek,
>
>On Tue, 2026-03-31 at 18:11 +0000, Derek J=2E Clark wrote:
>> This series adds many much needed features and fixes to the lenovo-wmi
>> drivers=2E
>>=20
>> Patch 1 moves LWMI_FAN_DIV to be next to the rest of the fan attribute
>> defines in preparation for adding additional attrbiute macros=2E This i=
s
>> so the attribute macros can all be in the same place in the file=2E
>>=20
>> Patch 2 cleans up tunable_attr_01 by removing an unused pointer and
>> correctly assigning the members as u8 isntead of u32=2E
>>=20
>> Patch 3 fixes a bug when sending 32 bit arguments via WMI where the
>> second value in the args struct was uninitialized=2E
>>=20
>> Patch 4 moves all gamezone enums from the gamezone header into the
>> helpers header in preparation for the rest of the series=2E
>>=20
>> Patch 5 adds a function to make assigning attribute ID's for capdata
>> cleaner and easier=2E
>>=20
>> Patch 6 addresses bugs where devices that don't support exposed
>> attributes would still create the attribute, and also attempts to
>> identify the correct capdata and set/get methods since some legacy
>> interfaces don't use the custom mode in the method or capdata ID=2E
>>=20
>> Patch 7 adds the remaining CPU attributes that weren't previously
>> exposed=2E
>>=20
>> Patch 8 adds GPU attributes=2E
>>=20
>> Patch 9 renames a name constant in preparation for patch 6=2E
>>=20
>> Patch 10 adds battery charge-type limiting when supported only by WMI, =
or
>> when a module parameter to skip compatibility checks is set=2E The
>> MODULE_PARM_DESC macro creates one check and two warnings in checkpatch=
=2E
>> I reviewed other examples from the kernel and I am following the same
>> convention, so I left it as is=2E
>>=20
>> Patch 11 fixes a bug where the 'gamezone' and the 'other' drivers were
>> incorrectly coupled in the Kconfig, leading to side effects under
>> certain kernel configurations=2E
>>=20
>> Patch 12 adds a debugfs directory=2E
>>=20
>> Patch 13 adds a debugfs file for dumping capdata=2E
>>=20
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>
>The series LGTM except for some tiny issues=2E See my replies to the
>corresponding patches=2E
>
>Sashiko=2Edev reports some potential issues in the series as well as some
>existing bugs=2E
>
>https://sashiko=2Edev/#/patchset/20260331181208=2E421552-1-derekjohn=2Ecl=
ark%40gmail=2Ecom
>
>I've mentioned some in my reply to the corresponding patches=2E Besides, =
I
>am going to talk about existing bugs here:
>
>
>- tunable_attr_01 is a statically shared structure, but =2Edev is
>overwritten each time when the master is bound, which violates
>`=2Eno_singleton =3D true'
>
>AFAIK no device in wild has multiple wmi-other instances so it should be
>safe for the time being=2E
>
>Fixing it will need numerous fundamental refactorings to the attributes
>and conflict with patch 6 where =2Ecd_mode_id and =2Ecv_mode_id is added =
to
>tunable_attr_01=2E
>
>I don't really want to make this series too large and miss this cycle=2E
>Hence, I am going to fix it in the next cycle with some extra
>refactorings to get rid of attribute-specific show/store callbacks=2E

Might be good to collaborate on this=2E I wanted to add some callbacks & m=
acros for BOOL type attributes and rename the current ATTR macro/callbacks =
to specify U8 in the names=2E=20

I also wanted to add fan curve settings with pwm_auto attributes for devic=
es that support it soon, but that might be a big lift with such a large ref=
actor going on=2E I personally prefer to alternate between bug fixing and f=
eature adding per series/cycle if I can, this one just became a mix of both=
=2E

>For this series, I'd consider violating `=2Eno_singleton =3D true' a very
>minor concern=2E It should be fine to keep it as is=2E If we really care
>about it, we could set it to false temporarily=2E
>

I'll leave it for now unless Ilpo or Armin specifically want it changed=2E=
=20

>- Rebinding wmi-other leaks IDA
>
>- Failure in lwmi_om_fw_attr_add() followed by lwmi_other_remove()
>double frees the same IDA
>
>- Calling lwmi_dev_evaluate_int() with `retval =3D=3D NULL' leaks memory
>
>- Unbalanced component bind and unbind in the error path of
>lwmi_om_master_bind()
>
>Legit concerns=2E I will reply with a series fixing them=2E Could you
>incorporate it into your series?
>
>Fix patches should be the very first patches in the series so that
>backporting is less painful=2E I'd suggest rearranging the series like:
>
>patches in my fix series
>patch 3
>patch 4
>patch 11
>the rest patches
>

Sounds good=2E I'll try to get those changes incorporated and sent out tod=
ay=2E This series is getting out of hand as it is (from 5 to 16 patches now=
) so putting it to bed is high on my priority list=2E

Thanks,=20

Derek
>Thanks,
>Rong
>
>> ---
>> v6:
>>   - Incorporate Rong Zhang's debugfs and decoupling patches into the
>>     series=2E
>>   - Add a patch to clean up too many cross-references to wmi-gamezone=
=2Eh
>>   - Make lwmi_attr_id a static inline in wmi-capdata=2Eh
>>   - Added a patch  to fix a bug where ares=2Earg1 is uninitialized when=
 it
>>     is sent to the firmware=2E
>>   - Add supported checks before adding battery extenstion, and ensure
>>     both the new checks and the is_writable checks are not casting u32
>>     to i32=2E
>>   - Misc formating changes=2E
>> v5: https://lore=2Ekernel=2Eorg/platform-driver-x86/20260324221032=2E13=
33636-1-derekjohn=2Eclark@gmail=2Ecom/
>>   - Remove cv/cd_mode_id references that occured before patch 4=2E
>>   - Move lwmi_attr_id to capdata=2Ec with a namespace export=2E
>>   - Fix mixing include=2E
>>   - Make lwmi_attr_is_supported return bool=2E
>>   - Use switch instead of if for setting/getting charge type state=2E
>>   - Various formatting fixes=2E
>> v4: https://lore=2Ekernel=2Eorg/platform-driver-x86/20260312031032=2E34=
67565-1-derekjohn=2Eclark@gmail=2Ecom/
>>   - Use loop instead of back gotos for identifying the working attribut=
e
>>     ID=2E
>>   - Use function instead of macro to assign attribute_id, preserving
>>     types=2E
>>   - Removed unused defines and enum values=2E
>>   - Rename charging defines to clarify thier purpose=2E
>>   - Fixed various formatting issues from v3=2E
>>   - Added module param to skip ACPI check when loading the driver for
>>     the power supply extension=2E
>>   - Don't abort adding power supply extension if the ACPI handle from
>>     ideapad is not present=2E
>>   - Don't worry about symmetric cleanup when cleaning up attributes in
>>     an error state=2E
>>   - Reword Patch 8 commit message to be more concise=2E
>>   - Fix wording in Patch 7 to match the changes=2E
>> v3: https://lore=2Ekernel=2Eorg/platform-driver-x86/20260224043200=2E26=
80384-1-derekjohn=2Eclark@gmail=2Ecom/
>>   - Re-add HWMON name const and just rename LWMI_OM_FW_ATTR_BASE_PATH
>>   - Fix linker warnings by moving acpi/battery include to the end of th=
e
>>     list=2E
>>   - Remove CPU/GPU OC features=2E These attributes are BOOL type and wi=
ll
>>     need a new constructor that I'll add later=2E
>> v2: https://lore=2Ekernel=2Eorg/platform-driver-x86/20260215061339=2E28=
42486-1-derekjohn=2Eclark@gmail=2Ecom/
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
>>=20
>> Derek J=2E Clark (10):
>>   platform/x86: lenovo-wmi-other: Move LWMI_FAN_DIV
>>   platform/x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
>>   platform/x86: lenovo-wmi-other: Zero initialize WMI arguments
>>   platform/x86: lenovo-wmi-helpers: Move gamezone enums to wmi-helpers
>>   platform/x86: lenovo-wmi-other: Add lwmi_attr_id() function
>>   platform/x86: lenovo-wmi-other: Limit adding attributes to supported
>>     devices
>>   platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
>>   platform/x86: lenovo-wmi-other: Add GPU tunable attributes
>>   platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
>>   platform/x86: lenovo-wmi-other: Add WMI battery charge limiting
>>=20
>> Rong Zhang (3):
>>   platform/x86: lenovo: Decouple lenovo-wmi-gamezone and
>>     lenovo-wmi-other
>>   platform/x86: lenovo-wmi-helpers: Add helper for creating per-device
>>     debugfs dir
>>   platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capdat=
a
>>=20
>>  =2E=2E=2E/wmi/devices/lenovo-wmi-other=2Erst          |  19 +
>>  drivers/platform/x86/lenovo/Kconfig           |   3 +-
>>  drivers/platform/x86/lenovo/wmi-capdata=2Ec     | 128 +++-
>>  drivers/platform/x86/lenovo/wmi-capdata=2Eh     |  31 +-
>>  drivers/platform/x86/lenovo/wmi-events=2Ec      |   2 +-
>>  drivers/platform/x86/lenovo/wmi-gamezone=2Ec    |   5 +-
>>  drivers/platform/x86/lenovo/wmi-gamezone=2Eh    |  20 -
>>  drivers/platform/x86/lenovo/wmi-helpers=2Ec     | 136 ++++
>>  drivers/platform/x86/lenovo/wmi-helpers=2Eh     |  23 +
>>  drivers/platform/x86/lenovo/wmi-other=2Ec       | 689 ++++++++++++++--=
--
>>  drivers/platform/x86/lenovo/wmi-other=2Eh       |  16 -
>>  11 files changed, 891 insertions(+), 181 deletions(-)
>>  delete mode 100644 drivers/platform/x86/lenovo/wmi-gamezone=2Eh
>>  delete mode 100644 drivers/platform/x86/lenovo/wmi-other=2Eh

