Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393EC53ECE4
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 18:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789064884; cv=none; b=fED84/wQ9TnbmA5Pz3n3MAq3I2zhn7+dxzKqInnrOxecTN1yzmDRMJV2F82whvD7WoljiWnYzyyVGG28FOzS0YMnt8gUWTEqSFRvR+ZvxZQrkfU2o1Y5+Z3fQd29aJsSQ55Jslmpdb4s9HX7Zyk4FX37CTWBoipxKyuqwH91NNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789064884; c=relaxed/simple;
	bh=gl76kPnji7/SjmEJkKirwkR/9jklfosMmKXFSu19XnE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=MQYLIIjmgbASflOIjVOtuZYWwr/4OxGz+bxDUzXs6BsYXktxORH2zb5Y/Mpb7CiTXTOqDYIcSLsrKoNNDIe8uDZt3+furF9PCSSsS/5/Sx0USthJYlnpW0LeFCR4YzIhtz5EIB5jOzQS/kA8DLNXRLjs8TkFFbPos5GYNfy8arA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHnHXsvL; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHnHXsvL"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2dcff8f44f2so28545235ad.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 11:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789064869; x=1789669669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M2WLzhDSGlJRIwT4fgBi4Xunvyq+ZSixXhqcDyi3QeA=;
        b=SHnHXsvLecueYdrOa9NKBsMFTwrajV1PoyXGma1RB6xe95AyvwcZZQTsCZE1C25Fz/
         oatei9lYBLWnBt3OcCRwPjXxco5ZCjQA9hdVbQJwis0nejgl3sB7vQxgUVrUNYDt5h0y
         xDTshNtLmDyo5VvedgODHb+QE244FS+S/Dr58B66JmoU3sI8u/sAjjs/DCKeBxt+10vN
         BEgTh3Q8EOaqJUSQXW7WeYD7QXsHp/sl3JSJ5QUl7BGzL4z4/rH1Slyaid6rLnBeMOtT
         4me6aYuYjJ+zbZWN7z/k/8LZ43NEJN7ceQcNxhIAdNyQbB7aEo4c8SSaVFBE5iLdG2NE
         n0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789064869; x=1789669669;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2WLzhDSGlJRIwT4fgBi4Xunvyq+ZSixXhqcDyi3QeA=;
        b=KLY9DaEchGItWVtigcwrcC9esyf22Ot4yRgDyrUyI7I0X39zekINPi7pvt7Kaqrfd7
         X9QlcWlQ+Gd+5b0tDYRXS075e6IHGdLCnZwSZZmn3evxHx2I4IvDdj989KY7v6A++xki
         5CR7rp19477gWzDO4B64RSVD/03gJnxWSbJPDMNKsw5rOkLHuzMl8K3CxYNbM4bl2pZD
         DmJefzE8A4RnDDx+YgTKB94CMN4dRIb5SgFLEHcBlHd30grfi+vNYy7exGsvBYWYlH+O
         YmVxca6bYS6B03mBop5H+9vqoYaLKbKPU+Y1gz58LncF9+/4gTwqP47Qc5UJvtF1kS0s
         mHBg==
X-Forwarded-Encrypted: i=1; AKwUvByN0LWSEpQB/8R+kCmhbZmxgHh92oLoEL/8ZyLmp7FGD3XEooC4AxPz5/7BC4jY9sS6rckjj9XdxrkSSKfWtYvJ8EH6@vger.kernel.org
X-Gm-Message-State: AFuF++lHEXkf5TRHwnQf4w/DDo+7YWk8u3aHPtbeQZ0A0sDDt7jUlham
	GIu5g1oxPN4HN0KqXf3s/y3PvfBOo8mrANaclRggpLLsgatXWt+H+J+h
X-Gm-Gg: AYBFou1UkdxyKn5kSe7Xjiu0gxHKJGyZbH+EgrfWCNq/FN2TrwCPYXn0E4cn7uW10uu
	lW8XOPCBAJhr3Sk7gIGrzeB61HausN0FpsoTcMaVZ75TyTA37ma7qvussxJNOgtM1OgwAORDESi
	CzR1ZsLCexj1Z+dpl/4KZx511tmKzYubDlOcMCMgVljU+Q3uvn+jzSEomtHMWUdvX05XW2XTfPU
	Ewdgv0a6EfsjrC1xRapPpOvjXjoi2jHhYObTkSnGpLloqEGLhhOFWuKJofoRfc9iPeC3sQVwMmd
	8Dz8l95wwzL5yWccLKYkR3M6kuMGQKQJuljonoUOZdEzsP6yyx+O6Tpm4ELSbLvYCwGNt15pijr
	ukylAuLAo6NEDRznfjyJOZB95Qzhjjv6aTmyB4vUl/XFydqTdzJKQ9/5gry5l3J9Zj15I7ysM1B
	Ckw/cifrgYzW5KnliNNcc2Cx2AmYJ4IvxT+4DqjafUICitYX0LBL3sjGyLaIwZjAYdJ+lezf7Lt
	4nqVdxLI70iS21qzJ4AVA034deG6rXIKX5bgackm1bvo2KlZ7qlV4CiJqjy4r0pamc0qQ==
X-Received: by 2002:a17:90b:3d48:b0:396:5f7f:52f5 with SMTP id 98e67ed59e1d1-39b260e13e0mr64472132a91.3.1789064869037;
        Thu, 10 Sep 2026 11:27:49 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-339770f0489sm24941258eec.8.2026.09.10.11.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 11:27:48 -0700 (PDT)
Date: Thu, 10 Sep 2026 11:27:46 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>, Charles <hanker007@gmail.com>,
 platform-driver-x86@vger.kernel.org
CC: mpearson-lenovo@squebb.ca
Subject: =?US-ASCII?Q?Re=3A_lenovo-wmi-other=3A_LENOVO=5FCAPA?=
 =?US-ASCII?Q?BILITY=5FDATA=5F01_fails_to_register_o?=
 =?US-ASCII?Q?n_ThinkBook_16_G6+_IMH_=28ACPI_AE=5FA?=
 =?US-ASCII?Q?ML=5FOPERAND=5FTYPE_in_=5C=5FSB=2EWMI5=2EGCD1=29?=
User-Agent: Thunderbird for Android
In-Reply-To: <56c1c0bd65b2df9268cc0ad58b7733f4dceefc53.camel@rong.moe>
References: <CAKtz0s8UYRQYW_0bh=0TMx47Axm-W-muEay-r3rqUBS1NHMPVw@mail.gmail.com> <56c1c0bd65b2df9268cc0ad58b7733f4dceefc53.camel@rong.moe>
Message-ID: <E22512FC-87CE-4707-9CF8-B437388244A7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 10, 2026 8:21:56 AM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Charles,
>
>Thanks for the report=2E
>
>On Mon, 2026-09-07 at 16:40 +0800, Charles wrote:
>> Hi,
>>=20
>> Reporting a firmware AML defect that blocks the fan hwmon interface
>> exposed by lenovo-wmi-other=2E
>>=20
>> Machine:
>>   Product:      ThinkBook 16 G6+ IMH
>>   Machine Type: 21LE
>>   Baseboard:    LNVNB161216
>>   CPU:          Intel Core Ultra 9 185H (Meteor Lake)
>>   BIOS:         NJCN68WW (2025-12-17, latest available)
>>   OS:           Ubuntu 26=2E04 LTS, kernel 7=2E0=2E0-30-generic
>>=20
>> Symptom:
>>   The LENOVO_OTHER_MODE WMI device binds correctly, but no hwmon
>>   device is created=2E Consequently fan RPM readback (fanX_input) and
>>   target-speed control (fanX_target) are unavailable=2E
>>=20
>>   $ ls /sys/class/hwmon/hwmon*/name
>>   ACAD acpi_fan BAT1 nvme nvme ucsi_source_psy x2 coretemp iwlwifi_1
>>     (no lenovo entry; acpi_fan reports fan1: 0 RPM, always)
>>=20
>> dmesg:
>>   ACPI Error: Aborting method \_SB=2EWMI5=2EGCD1 due to previous error
>>               (AE_AML_OPERAND_TYPE)
>>   ACPI Error: Aborting method \_SB=2EWMI5=2EWQB1 due to previous error
>>               (AE_AML_OPERAND_TYPE)
>>   lenovo_wmi_capdata 7A8F5407-CB67-4D6E-B547-39B3BE018154:
>>       failed to register LENOVO_CAPABILITY_DATA_01: -19 (ENODEV)
>>   lenovo_wmi_capdata 362A3AFE-3D96-4665-8530-96DAD5BB300E:
>>       bound B642801B-3D21-45DE-90AE-6E86F164FB21
>>       (ops lwmi_cd_sub_component_ops [lenovo_wmi_capdata])
>>   lenovo_wmi_gamezone 887B54E3-DDDC-4B2C-8B88-68A26A8835D0:
>>       platform_profile probe failed
>>=20
>> Note the asymmetry, which I think is the useful clue:
>>   - LENOVO_CAPABILITY_DATA_00 (362A3AFE-=2E=2E=2E) binds fine and
>>     successfully attaches LENOVO_FAN_TEST_DATA (B642801B-=2E=2E=2E)
>>   - LENOVO_CAPABILITY_DATA_01 (7A8F5407-=2E=2E=2E) fails with -ENODEV,
>>     because its AML back-end methods \_SB=2EWMI5=2EGCD1 / \_SB=2EWMI5=
=2EWQB1
>>     abort with AE_AML_OPERAND_TYPE
>>=20
>> The "_00" variants (GCD0/WQB0) apparently work; only the "_01"
>> variants are broken=2E This is an AML operand-type defect in the
>> firmware, OS-independent=2E
>>=20
>> Verified present on the machine (all three GUIDs exist):
>>   DC2A8805-3A8C-41BA-A6F7-092E0089CD3B  -> bound to lenovo_wmi_other
>>   362A3AFE-3D96-4665-8530-96DAD5BB300E  -> bound to lenovo_wmi_capdata
>>   B642801B-3D21-45DE-90AE-6E86F164FB21  -> bound as sub-component
>>=20
>> Questions / requests:
>>=20
>> 1=2E Should hwmon registration be able to proceed with only
>>    LENOVO_CAPABILITY_DATA_00 available? Since DATA_00 is bound and
>>    LENOVO_FAN_TEST_DATA is attached, it looks like the RPM data may
>>    already be reachable=2E If graceful degradation is feasible, that
>>    would restore at least fan readback on this and similar machines
>>    without waiting for a BIOS fix=2E Happy to test any such patch=2E
>
>Yes=2E The hwmon device does not depend on LENOVO_CAPABILITY_DATA_01=2E
>
>The current implementation enforces the binding between
>LENOVO_CAPABILITY_DATA_00+01 and LENOVO_OTHER_MODE because of a
>limitation of the device component framework=2E
>
>AFAIK, ThinkBook devices usually don't support any LENOVO_OTHER_MODE
>method controlled by LENOVO_CAPABILITY_DATA_01=2E On my device, the
>LENOVO_CAPABILITY_DATA_01 method is stubbed and always return a buffer
>with zeros=2E
>
>Could you please dump the data from LENOVO_CAPABILITY_DATA_00 and
>LENOVO_FAN_TEST_DATA via /sys/kernel/debug/lenovo_wmi? It would be
>helpful to confirm if your device supports fan monitoring/tuning=2E
>
>>=20
>> 2=2E Alternatively, is a DMI quirk the right mechanism here?
>
>(+CC Derek)
>
>I think there are two reasonable approaches=2E
>
>(1) DMI quirk=2E Both wmi-capdata and wmi-other need a WMI quirk table in
>this case, so it's not very optimal=2E
>
>(2) Making WMI/ACPI failures non-fatal and provide empty data to wmi-
>other, mimicking the behavior of my device=2E
>
>My preference is (2)=2E Derek, what do you think?
>
Hi Rong and Charles,
Thanks for the Cc=2E I agree with (2)=2E Adding two DMI quirk tables will =
introduce a maintenance burden and provide effectively the same results=2E =
I would caveat that, though, given how loosely Lenovo seems to adhere to th=
eir own spec, that it would be prudent to check if no capability data devic=
es of any kind get bound and let the driver clean itself up unless the forc=
e options are set=2E There's generally no reason for the driver to stay bou=
nd in such a case, and I can't think of a reason why a BIOS would ship with=
 nothing, but you never really know=2E

Thanks,
Derek

>I am developing a series to replace deprecated WMI API calls with calls
>to the new ones, as well as making WMI/ACPI failures non-fatal=2E It shou=
ld
>word around the ACPI bug=2E
>
>>=20
>> Separately, on the same machine there is a second, independent
>> firmware defect on the legacy ACPI thermal path:
>>   \_TZ=2EFNCL references \_SB=2EPC00=2ELPCB=2EUPFS, which is undefined =
in
>>   every ACPI table (verified across all 1 DSDT + 29 SSDTs)=2E All 6
>>   "Fan" cooling devices therefore fail on cur_state write=2E
>> Full analysis of that one is in the Lenovo community forum thread;
>> I can repost details here if useful=2E
>
>For the independent firmware defect, you may want to file a bug on kernel
>Bugzilla with detailed information and acpidump so that it can be
>tracked=2E If you decide to file a bug there, please CC me then=2E
>
>Thanks,
>Rong
>
>>=20
>> Thanks,
>> Charles

