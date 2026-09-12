Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8486D1E5724
	for <platform-driver-x86@vger.kernel.org>; Sat, 12 Sep 2026 00:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789173079; cv=none; b=qWVVJUlhA9+f7QN2amjJtAMFUFv2eoPy3JVq+5TJBI1cKA4T3/CQLFFx6qkRtVyDiLH7DXPt/VoMNZqlE6nNs6I0pGN88WyZE+sHOKOxI7yR/+r6cmCuUFFUj5/T2eakY+aaN4GCGx9htSIB3NeMlOcxUBHFlDyKAN6zeliZxlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789173079; c=relaxed/simple;
	bh=Z8au7up6Sa3ZJqd5y259IHId0Tx68AhOnB+oo/ZGYIE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Rjk0Dv57pPbznlP3FK8g/bAA0daTZfsHsLMJHWU47h4+L2ky/naX8Adc2sqHnExpxJWwaqXv1ILtJedX+TLTKI6WHbFT4qAbGqpS2XuWMmZYM+EfRTIv1UQ2YhcJbZ9VtmnkCmGtJFCDY8thSOSiUCxovnkN4+DowbISSecAVi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTyg2scX; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTyg2scX"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d8f265cbe6so15582385ad.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 17:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789173077; x=1789777877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bRBgaAlx+tPb1yy3iBgLT+JPTlNiUR/IUWpCsSFXe4s=;
        b=iTyg2scXtdPt4kMvoBWQL32RivLWh7o5ymwe/acNZMkw0FYm2KkrQMbNZf6qqdoKgb
         wYL8jemlmMyuvjDL3MD3LpETYwhhxP/kopXRBqUVutj2fz+vNp7hVurb9/D/PLlJBlEQ
         FCDccebi91Wg8k+nVclprBj0uB74Foa2SqfM9JxHgeXlIiQZe4m91y8DylCElIDy2ZGg
         pwB/NFWN5tOUTU3ppK8pJjVRwYV1AsFFBWxTvuF2XIBFHAtomVe575pBNm+DRbtAQRxm
         Ehdn4BT86hR0ffNUzP0GFXd07FKNLMCMt5ru4Or6KdSua92PMvkMxgW4OgNzZhlx9c5+
         r4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789173077; x=1789777877;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bRBgaAlx+tPb1yy3iBgLT+JPTlNiUR/IUWpCsSFXe4s=;
        b=F4AaAaWWXlVkCWGXgZS0TxeBtWRgYTIUzGbhyr71qyC0JjCb/lEDpW/EdvZACtBhMD
         nhLRpTN2ZHy/ZdeAjG9+5PKV53TxYFkSvGGkSk5Y4FV5KnTFY15PfO6SRa65EUJEXPB3
         Tq5WVi78vOJco+JNInBFkTvAN4d8Y6qZWDB+0Uxhjrg/f/wvWs+HimF1OukMNmjcuNnG
         /7dqXZlOEUB1AwmqLmucKbvw4vj3KGItnA4Xmht1q8nfnoBPSKE26SJlkdGGfHN4RWWS
         F2Nw/TDacMfIhym8nj+1f0+qdnwchrgjVNY+JrvxS7m2YVXNDtscZkxvqNwaZN1FKFt8
         7EYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZ9v8iUqwJLrV/UGcM3Bpyj10cqSlixlvKSw/qjZkvzxq64/lat5BtYN0NzlYob/kCj0SvDcNqQdvNJNhe+fydO66C@vger.kernel.org
X-Gm-Message-State: AFuF++lZAZ8uSX4pH+oVVSw9zs7ojhkXCzlO/MbT+O6hTONNabg+Nsyy
	KUoIN0ICOrd+grnNY9TxbiRAvWrj/ZIZvZ9RcASkcAzi/TNu1RYHurTS
X-Gm-Gg: AYBFou2IN5P1IegPV1lHwAnQGasHwarsFras5JANUfM7/etl45529EdY5xn3JhKTfcV
	2f+VnDjH357XXksYj3ckKJ+YCbLFTW3r0CufbSC1GkwltmRxDBqTUfmL9PX8gfaFTk01JtnVCDg
	VkY/jKbJgNSqdvr/vgU6jQXqd5xb2LU7YPdxY0n2qq8UIejuOaua6HdOm0WOomRMiXajOwo1AOJ
	MWYx/JKlNr4boPAz9XcBo/SjXDhKyyTodHUvlscnaXcXcctICdkMQ6jy2b/jtaN66+tDMsU82wW
	8ENKuUFQMudthfzdA2noSb5slepOxDE9OB1dLtRB3G/O71bI2gPSu42iULC+En2A3+9Sy++muU2
	Dg0iujzVZ2PC+eGv084eiFQp489e1ZaWGvXT91YC8ih8I7XLwx4hrQYOQGzKc4y9i5lJtolKKB+
	YemcxqIqYG9R2LFtY+v0J8JvL2XnjggGD96RAhp/p6pbu2xPhtnHLrFZsRGbkob6c6gs+H7nPIw
	UsqDo519DP8U9/wx7j7NJX2gsinYe6KhvzNGf5XZrAVIz8Wlhb8cmi/xQaf230un7Nao9t0S3iJ
	qr+u
X-Received: by 2002:a17:90b:51c8:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39d9bbc802bmr10245576a91.3.1789173076697;
        Fri, 11 Sep 2026 17:31:16 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e5193dsm9119439eec.10.2026.09.11.17.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 17:31:16 -0700 (PDT)
Date: Fri, 11 Sep 2026 17:31:14 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>, Charles <hanker007@gmail.com>,
 platform-driver-x86@vger.kernel.org
CC: mpearson-lenovo@squebb.ca
Subject: =?US-ASCII?Q?Re=3A_lenovo-wmi-other=3A_LENOVO=5FCAPA?=
 =?US-ASCII?Q?BILITY=5FDATA=5F01_fails_to_register_o?=
 =?US-ASCII?Q?n_ThinkBook_16_G6+_IMH_=28ACPI_AE=5FA?=
 =?US-ASCII?Q?ML=5FOPERAND=5FTYPE_in_=5C=5FSB=2EWMI5=2EGCD1=29?=
User-Agent: Thunderbird for Android
In-Reply-To: <ccceaca8dfbea7d0ad203066c44cd23c2c28db94.camel@rong.moe>
References: <CAKtz0s8UYRQYW_0bh=0TMx47Axm-W-muEay-r3rqUBS1NHMPVw@mail.gmail.com> <56c1c0bd65b2df9268cc0ad58b7733f4dceefc53.camel@rong.moe> <E22512FC-87CE-4707-9CF8-B437388244A7@gmail.com> <ccceaca8dfbea7d0ad203066c44cd23c2c28db94.camel@rong.moe>
Message-ID: <8CF84187-B300-4357-AEF3-172A50B09AA6@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 11, 2026 12:00:51 PM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek,
>
>On Thu, 2026-09-10 at 11:27 -0700, Derek J=2E Clark wrote:
>> On September 10, 2026 8:21:56 AM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>> > Hi Charles,
>> >=20
>> > Thanks for the report=2E
>> >=20
>> > On Mon, 2026-09-07 at 16:40 +0800, Charles wrote:
>> > > Hi,
>> > >=20
>> > > Reporting a firmware AML defect that blocks the fan hwmon interface
>> > > exposed by lenovo-wmi-other=2E
>> > >=20
>> > > Machine:
>> > >   Product:      ThinkBook 16 G6+ IMH
>> > >   Machine Type: 21LE
>> > >   Baseboard:    LNVNB161216
>> > >   CPU:          Intel Core Ultra 9 185H (Meteor Lake)
>> > >   BIOS:         NJCN68WW (2025-12-17, latest available)
>> > >   OS:           Ubuntu 26=2E04 LTS, kernel 7=2E0=2E0-30-generic
>> > >=20
>> > > Symptom:
>> > >   The LENOVO_OTHER_MODE WMI device binds correctly, but no hwmon
>> > >   device is created=2E Consequently fan RPM readback (fanX_input) a=
nd
>> > >   target-speed control (fanX_target) are unavailable=2E
>> > >=20
>> > >   $ ls /sys/class/hwmon/hwmon*/name
>> > >   ACAD acpi_fan BAT1 nvme nvme ucsi_source_psy x2 coretemp iwlwifi_=
1
>> > >     (no lenovo entry; acpi_fan reports fan1: 0 RPM, always)
>> > >=20
>> > > dmesg:
>> > >   ACPI Error: Aborting method \_SB=2EWMI5=2EGCD1 due to previous er=
ror
>> > >               (AE_AML_OPERAND_TYPE)
>> > >   ACPI Error: Aborting method \_SB=2EWMI5=2EWQB1 due to previous er=
ror
>> > >               (AE_AML_OPERAND_TYPE)
>> > >   lenovo_wmi_capdata 7A8F5407-CB67-4D6E-B547-39B3BE018154:
>> > >       failed to register LENOVO_CAPABILITY_DATA_01: -19 (ENODEV)
>> > >   lenovo_wmi_capdata 362A3AFE-3D96-4665-8530-96DAD5BB300E:
>> > >       bound B642801B-3D21-45DE-90AE-6E86F164FB21
>> > >       (ops lwmi_cd_sub_component_ops [lenovo_wmi_capdata])
>> > >   lenovo_wmi_gamezone 887B54E3-DDDC-4B2C-8B88-68A26A8835D0:
>> > >       platform_profile probe failed
>> > >=20
>> > > Note the asymmetry, which I think is the useful clue:
>> > >   - LENOVO_CAPABILITY_DATA_00 (362A3AFE-=2E=2E=2E) binds fine and
>> > >     successfully attaches LENOVO_FAN_TEST_DATA (B642801B-=2E=2E=2E)
>> > >   - LENOVO_CAPABILITY_DATA_01 (7A8F5407-=2E=2E=2E) fails with -ENOD=
EV,
>> > >     because its AML back-end methods \_SB=2EWMI5=2EGCD1 / \_SB=2EWM=
I5=2EWQB1
>> > >     abort with AE_AML_OPERAND_TYPE
>> > >=20
>> > > The "_00" variants (GCD0/WQB0) apparently work; only the "_01"
>> > > variants are broken=2E This is an AML operand-type defect in the
>> > > firmware, OS-independent=2E
>> > >=20
>> > > Verified present on the machine (all three GUIDs exist):
>> > >   DC2A8805-3A8C-41BA-A6F7-092E0089CD3B  -> bound to lenovo_wmi_othe=
r
>> > >   362A3AFE-3D96-4665-8530-96DAD5BB300E  -> bound to lenovo_wmi_capd=
ata
>> > >   B642801B-3D21-45DE-90AE-6E86F164FB21  -> bound as sub-component
>> > >=20
>> > > Questions / requests:
>> > >=20
>> > > 1=2E Should hwmon registration be able to proceed with only
>> > >    LENOVO_CAPABILITY_DATA_00 available? Since DATA_00 is bound and
>> > >    LENOVO_FAN_TEST_DATA is attached, it looks like the RPM data may
>> > >    already be reachable=2E If graceful degradation is feasible, tha=
t
>> > >    would restore at least fan readback on this and similar machines
>> > >    without waiting for a BIOS fix=2E Happy to test any such patch=
=2E
>> >=20
>> > Yes=2E The hwmon device does not depend on LENOVO_CAPABILITY_DATA_01=
=2E
>> >=20
>> > The current implementation enforces the binding between
>> > LENOVO_CAPABILITY_DATA_00+01 and LENOVO_OTHER_MODE because of a
>> > limitation of the device component framework=2E
>> >=20
>> > AFAIK, ThinkBook devices usually don't support any LENOVO_OTHER_MODE
>> > method controlled by LENOVO_CAPABILITY_DATA_01=2E On my device, the
>> > LENOVO_CAPABILITY_DATA_01 method is stubbed and always return a buffe=
r
>> > with zeros=2E
>> >=20
>> > Could you please dump the data from LENOVO_CAPABILITY_DATA_00 and
>> > LENOVO_FAN_TEST_DATA via /sys/kernel/debug/lenovo_wmi? It would be
>> > helpful to confirm if your device supports fan monitoring/tuning=2E
>> >=20
>> > >=20
>> > > 2=2E Alternatively, is a DMI quirk the right mechanism here?
>> >=20
>> > (+CC Derek)
>> >=20
>> > I think there are two reasonable approaches=2E
>> >=20
>> > (1) DMI quirk=2E Both wmi-capdata and wmi-other need a WMI quirk tabl=
e in
>> > this case, so it's not very optimal=2E
>> >=20
>> > (2) Making WMI/ACPI failures non-fatal and provide empty data to wmi-
>> > other, mimicking the behavior of my device=2E
>> >=20
>> > My preference is (2)=2E Derek, what do you think?
>> >=20
>> Hi Rong and Charles,
>> Thanks for the Cc=2E I agree with (2)=2E Adding two DMI quirk tables wi=
ll introduce a maintenance burden and provide effectively the same results=
=2E=C2=A0
>>=20
>
>Thanks for your insights=2E
>
>> I would caveat that, though, given how loosely Lenovo seems to adhere t=
o their own spec, that it would be prudent to check if no capability data d=
evices of any kind get bound and let the driver clean itself up unless the =
force options are set=2E There's generally no reason for the driver to stay=
 bound in such a case, and I can't think of a reason why a BIOS would ship =
with nothing, but you never really know=2E
>
>Then how about releasing most resources and passing NULL list to wmi-
>other when no capability data is available? In this manner we can poison
>the capdata device on WMI/ACPI errors by setting priv->list->count =3D 0 =
to
>initiate the resource release=2E
>
>This needs some improvements for both wmi-capdata and wmi-other to make
>them capable to handle NULL lists=2E When it's done, missing cd00_list
>should gate hwmon and power_supply_ext registration completely, and
>missing cd01_list should gate fw_attr registration completely=2E If both
>are missing then wmi-other unbinds all components=2E
>
>Due to the limitation of the component framework, this is the best viable
>cleanup approach=2E The drivers must at least register itself as a
>component to coordinate with wmi-other=2E
>

Makes sense to me, yeah=2E

Charles,

Is that something you're willing to add to your series or would you prefer=
 Rong or I handle that?

- Derek

>Thanks,
>Rong
>
>>=20
>> Thanks,
>> Derek
>>=20
>> > I am developing a series to replace deprecated WMI API calls with cal=
ls
>> > to the new ones, as well as making WMI/ACPI failures non-fatal=2E It =
should
>> > word around the ACPI bug=2E
>> >=20
>> > >=20
>> > > Separately, on the same machine there is a second, independent
>> > > firmware defect on the legacy ACPI thermal path:
>> > >   \_TZ=2EFNCL references \_SB=2EPC00=2ELPCB=2EUPFS, which is undefi=
ned in
>> > >   every ACPI table (verified across all 1 DSDT + 29 SSDTs)=2E All 6
>> > >   "Fan" cooling devices therefore fail on cur_state write=2E
>> > > Full analysis of that one is in the Lenovo community forum thread;
>> > > I can repost details here if useful=2E
>> >=20
>> > For the independent firmware defect, you may want to file a bug on ke=
rnel
>> > Bugzilla with detailed information and acpidump so that it can be
>> > tracked=2E If you decide to file a bug there, please CC me then=2E
>> >=20
>> > Thanks,
>> > Rong
>> >=20
>> > >=20
>> > > Thanks,
>> > > Charles

