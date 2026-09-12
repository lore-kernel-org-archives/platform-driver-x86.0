Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE172F8EAE
	for <platform-driver-x86@vger.kernel.org>; Sat, 12 Sep 2026 14:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789222990; cv=none; b=LiXQY8hD1lTnsQ2ZA/X+xZThC3VdFGXahvpOcMMB4z0OB0uscTwD/Rsd2FmNK1QWujEZnD9jkzVFCCvDODV0EvAh9AJqlQs7Cv4NAeD2MHG4Fj+qH5G3Apbn7nwbGmwunio8pBJ1tGbmFTGwQG1YWYQ6YgJ4ZYhzdTpyE1mbqcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789222990; c=relaxed/simple;
	bh=h+mnp1ZH7PkZWYHTQ08UScm6XJtizXwPVvr5akaupbo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=oIQnPqEKy5nI6VkfcTGG8c1dWXV1Q2JwXVHDyhjljpwkK7Y4P25ZYdWIwywRvt4a8jgIowr3iUYnsF64ZVpmZIB40qput+6KseR5amcislQYhBHgrRN35Z1vYVcEAN4CfXGGSsATTMcIUgC6n9c4oLqk1Ry+9Uhc7yjofob/VWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q+4ph77C; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q+4ph77C"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so394837a91.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Sep 2026 07:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789222988; x=1789827788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oSGDlewF5Ki2IoO4f+stExDRjBubjeo8JuRGALEFDhg=;
        b=q+4ph77CGoeaykroY8pr4Xk+EPXAXPkOIlDhjjg89TwAehhpVi3af9ZxJQz+Kug/QM
         84pEwR5DkeF4pBSBF2+mN/7Ac7U+fzYtfIwFyjKJVNABnEVj3t++k85T7L0xJScr1O5J
         lZzR7qMBfn7lA2ygj0SpPoPT1DIxn1TA/cE5LnTMuU45PRwPCEBIo6+E0E/tZbu+tWWS
         t7l2xPoBRt9YnuvMZm0nNOTy1mkc3Pzxiicfr93IMEcSnzcZrRAJZHUFF8OuKgj+w+CN
         hy3x1oB4x0H9m2ELTVjofMEsz001aJgYCLqfOgF1kwJPpfCinRrhIcCzll0AciDBi1Cy
         cFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789222988; x=1789827788;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oSGDlewF5Ki2IoO4f+stExDRjBubjeo8JuRGALEFDhg=;
        b=JS3SY65O7CtdvzpjlPfSb8xr1Ek27bYkona/X0Fc2IBUabE9KOugw5IKlL8IuYhakR
         4EYT/oxgGV7t/tMbRv5FRsrKbd+VVaLciUGE1/o+jWXYe09upQVlRk/JMzeqGHYHWn6O
         AJyzBvhVxGDGLy2x32k0ml76fxUwahSpdOOpGN9bYOP9WklDsUedWDLtHwqHOriAWlGp
         J5DQCLgXWXlOPu3DvqCUUze42thJRC2PUGzsD8TTSZFNPyvSmHL3730hy2DUuiYbyZDJ
         H/724tPk4nd9coHXQd1hjtgP3bWb1VLBmv8Lt4/xLdlgpSSP6eglqE19gSVHuMoDxIvh
         LRfg==
X-Forwarded-Encrypted: i=1; AKwUvByjepe4231mH374eMmlwkp+JGfRYaRk0eunSV4V8/PuNLGqLw6vueyGk0ozmhb7bgXXy7Y6B5VCJpWnOTln/vBQfFSX@vger.kernel.org
X-Gm-Message-State: AFuF++n6NzIA+ykAMD7wpoz8XR+2fuildLBBzHfPYZlX7L799+fIcr8D
	F7mxK5Sn+fF16EoAHGYmjL92CaKg3Ry1EIvzwLPbKoP5aC004qMYOcmM
X-Gm-Gg: AYBFou0pDc4uwQOgqXtRlaooZBRCIwkBKeIhtpuW6K/bmlGMhKvA5TMQ52kh+D6+9+R
	3zpXxAZ1/nTc9fnj/b1NwxO/lf7LZMgcg13QBM3VDrm/EyQNxqpKL0NhjJG6aDP2HWdSBaRkP28
	5XDMh9KTLpq2G6+c0RmFLQNl6U/PCMBPQnviz6wAzYhUFB83JOyZpBuk9Hwx8Wqi080fnyX4foM
	vSrQZEIJ2inhU8YFnvvqIUAimB/A7qkF6Mk8rKbljAX60rkeoPZhrCLjpB9ujm9YFGpo1MLjsw0
	zta6kEF1+FFsNFweHE3393mb/7Q4lNCuVbB0XfGuCeNEckBHJwlkw8X3hPHAdDygSeDELT5wpkz
	EdAhprTO/drekIenJjBpXwx+1ocGXUS5V+r+PCfN4CCNYi7V6NmXqL6bE/4vdqZxMAd/9nkWYNp
	Zti6+xKbvhKrniqEhgzdmCSdpmDNBM6vbKu/Rg6BZb8j7LBNLm0448xw3XoRay4lAjYO+uksJq9
	F18KINj6U8mIdmrv5kixGjAmZhPAMNa/JY+JdR97SEnM3b2mxi6ySVeeGMtY978FNemGw==
X-Received: by 2002:a17:90b:3811:b0:399:e97:8d5a with SMTP id 98e67ed59e1d1-39dbc731c75mr5824943a91.25.1789222987918;
        Sat, 12 Sep 2026 07:23:07 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b78d59sm12967007c88.8.2026.09.12.07.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 07:23:07 -0700 (PDT)
Date: Sat, 12 Sep 2026 07:23:06 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>, Charles <hanker007@gmail.com>,
 platform-driver-x86@vger.kernel.org
CC: mpearson-lenovo@squebb.ca
Subject: =?US-ASCII?Q?Re=3A_lenovo-wmi-other=3A_LENOVO=5FCAPA?=
 =?US-ASCII?Q?BILITY=5FDATA=5F01_fails_to_register_o?=
 =?US-ASCII?Q?n_ThinkBook_16_G6+_IMH_=28ACPI_AE=5FA?=
 =?US-ASCII?Q?ML=5FOPERAND=5FTYPE_in_=5C=5FSB=2EWMI5=2EGCD1=29?=
User-Agent: Thunderbird for Android
In-Reply-To: <C62E5597-0375-4338-829F-DBC25EFB3322@rong.moe>
References: <CAKtz0s8UYRQYW_0bh=0TMx47Axm-W-muEay-r3rqUBS1NHMPVw@mail.gmail.com> <56c1c0bd65b2df9268cc0ad58b7733f4dceefc53.camel@rong.moe> <E22512FC-87CE-4707-9CF8-B437388244A7@gmail.com> <ccceaca8dfbea7d0ad203066c44cd23c2c28db94.camel@rong.moe> <8CF84187-B300-4357-AEF3-172A50B09AA6@gmail.com> <C62E5597-0375-4338-829F-DBC25EFB3322@rong.moe>
Message-ID: <9B9F810D-9491-418D-91C9-210762ED3B8B@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 12, 2026 1:06:07 AM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek, Charles,=20
>
>=E4=BA=8E 2026=E5=B9=B49=E6=9C=8812=E6=97=A5 GMT+08:00 08:31:14=EF=BC=8C"=
Derek J=2E Clark" <derekjohn=2Eclark@gmail=2Ecom> =E5=86=99=E9=81=93=EF=BC=
=9A
>> On September 11, 2026 12:00:51 PM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>> >Hi Derek,
>> >
>> >On Thu, 2026-09-10 at 11:27 -0700, Derek J=2E Clark wrote:
>> >> On September 10, 2026 8:21:56 AM PDT, Rong Zhang <i@rong=2Emoe> wrot=
e:
>> >> > Hi Charles,
>> >> >=20
>> >> > Thanks for the report=2E
>> >> >=20
>> >> > On Mon, 2026-09-07 at 16:40 +0800, Charles wrote:
>> >> > > Hi,
>> >> > >=20
>> >> > > Reporting a firmware AML defect that blocks the fan hwmon interf=
ace
>> >> > > exposed by lenovo-wmi-other=2E
>> >> > >=20
>> >> > > Machine:
>> >> > >   Product:      ThinkBook 16 G6+ IMH
>> >> > >   Machine Type: 21LE
>> >> > >   Baseboard:    LNVNB161216
>> >> > >   CPU:          Intel Core Ultra 9 185H (Meteor Lake)
>> >> > >   BIOS:         NJCN68WW (2025-12-17, latest available)
>> >> > >   OS:           Ubuntu 26=2E04 LTS, kernel 7=2E0=2E0-30-generic
>> >> > >=20
>> >> > > Symptom:
>> >> > >   The LENOVO_OTHER_MODE WMI device binds correctly, but no hwmon
>> >> > >   device is created=2E Consequently fan RPM readback (fanX_input=
) and
>> >> > >   target-speed control (fanX_target) are unavailable=2E
>> >> > >=20
>> >> > >   $ ls /sys/class/hwmon/hwmon*/name
>> >> > >   ACAD acpi_fan BAT1 nvme nvme ucsi_source_psy x2 coretemp iwlwi=
fi_1
>> >> > >     (no lenovo entry; acpi_fan reports fan1: 0 RPM, always)
>> >> > >=20
>> >> > > dmesg:
>> >> > >   ACPI Error: Aborting method \_SB=2EWMI5=2EGCD1 due to previous=
 error
>> >> > >               (AE_AML_OPERAND_TYPE)
>> >> > >   ACPI Error: Aborting method \_SB=2EWMI5=2EWQB1 due to previous=
 error
>> >> > >               (AE_AML_OPERAND_TYPE)
>> >> > >   lenovo_wmi_capdata 7A8F5407-CB67-4D6E-B547-39B3BE018154:
>> >> > >       failed to register LENOVO_CAPABILITY_DATA_01: -19 (ENODEV)
>> >> > >   lenovo_wmi_capdata 362A3AFE-3D96-4665-8530-96DAD5BB300E:
>> >> > >       bound B642801B-3D21-45DE-90AE-6E86F164FB21
>> >> > >       (ops lwmi_cd_sub_component_ops [lenovo_wmi_capdata])
>> >> > >   lenovo_wmi_gamezone 887B54E3-DDDC-4B2C-8B88-68A26A8835D0:
>> >> > >       platform_profile probe failed
>> >> > >=20
>> >> > > Note the asymmetry, which I think is the useful clue:
>> >> > >   - LENOVO_CAPABILITY_DATA_00 (362A3AFE-=2E=2E=2E) binds fine an=
d
>> >> > >     successfully attaches LENOVO_FAN_TEST_DATA (B642801B-=2E=2E=
=2E)
>> >> > >   - LENOVO_CAPABILITY_DATA_01 (7A8F5407-=2E=2E=2E) fails with -E=
NODEV,
>> >> > >     because its AML back-end methods \_SB=2EWMI5=2EGCD1 / \_SB=
=2EWMI5=2EWQB1
>> >> > >     abort with AE_AML_OPERAND_TYPE
>> >> > >=20
>> >> > > The "_00" variants (GCD0/WQB0) apparently work; only the "_01"
>> >> > > variants are broken=2E This is an AML operand-type defect in the
>> >> > > firmware, OS-independent=2E
>> >> > >=20
>> >> > > Verified present on the machine (all three GUIDs exist):
>> >> > >   DC2A8805-3A8C-41BA-A6F7-092E0089CD3B  -> bound to lenovo_wmi_o=
ther
>> >> > >   362A3AFE-3D96-4665-8530-96DAD5BB300E  -> bound to lenovo_wmi_c=
apdata
>> >> > >   B642801B-3D21-45DE-90AE-6E86F164FB21  -> bound as sub-componen=
t
>> >> > >=20
>> >> > > Questions / requests:
>> >> > >=20
>> >> > > 1=2E Should hwmon registration be able to proceed with only
>> >> > >    LENOVO_CAPABILITY_DATA_00 available? Since DATA_00 is bound a=
nd
>> >> > >    LENOVO_FAN_TEST_DATA is attached, it looks like the RPM data =
may
>> >> > >    already be reachable=2E If graceful degradation is feasible, =
that
>> >> > >    would restore at least fan readback on this and similar machi=
nes
>> >> > >    without waiting for a BIOS fix=2E Happy to test any such patc=
h=2E
>> >> >=20
>> >> > Yes=2E The hwmon device does not depend on LENOVO_CAPABILITY_DATA_=
01=2E
>> >> >=20
>> >> > The current implementation enforces the binding between
>> >> > LENOVO_CAPABILITY_DATA_00+01 and LENOVO_OTHER_MODE because of a
>> >> > limitation of the device component framework=2E
>> >> >=20
>> >> > AFAIK, ThinkBook devices usually don't support any LENOVO_OTHER_MO=
DE
>> >> > method controlled by LENOVO_CAPABILITY_DATA_01=2E On my device, th=
e
>> >> > LENOVO_CAPABILITY_DATA_01 method is stubbed and always return a bu=
ffer
>> >> > with zeros=2E
>> >> >=20
>> >> > Could you please dump the data from LENOVO_CAPABILITY_DATA_00 and
>> >> > LENOVO_FAN_TEST_DATA via /sys/kernel/debug/lenovo_wmi? It would be
>> >> > helpful to confirm if your device supports fan monitoring/tuning=
=2E
>> >> >=20
>> >> > >=20
>> >> > > 2=2E Alternatively, is a DMI quirk the right mechanism here?
>> >> >=20
>> >> > (+CC Derek)
>> >> >=20
>> >> > I think there are two reasonable approaches=2E
>> >> >=20
>> >> > (1) DMI quirk=2E Both wmi-capdata and wmi-other need a WMI quirk t=
able in
>> >> > this case, so it's not very optimal=2E
>> >> >=20
>> >> > (2) Making WMI/ACPI failures non-fatal and provide empty data to w=
mi-
>> >> > other, mimicking the behavior of my device=2E
>> >> >=20
>> >> > My preference is (2)=2E Derek, what do you think?
>> >> >=20
>> >> Hi Rong and Charles,
>> >> Thanks for the Cc=2E I agree with (2)=2E Adding two DMI quirk tables=
 will introduce a maintenance burden and provide effectively the same resul=
ts=2E=C2=A0
>> >>=20
>> >
>> >Thanks for your insights=2E
>> >
>> >> I would caveat that, though, given how loosely Lenovo seems to adher=
e to their own spec, that it would be prudent to check if no capability dat=
a devices of any kind get bound and let the driver clean itself up unless t=
he force options are set=2E There's generally no reason for the driver to s=
tay bound in such a case, and I can't think of a reason why a BIOS would sh=
ip with nothing, but you never really know=2E
>> >
>> >Then how about releasing most resources and passing NULL list to wmi-
>> >other when no capability data is available? In this manner we can pois=
on
>> >the capdata device on WMI/ACPI errors by setting priv->list->count =3D=
 0 to
>> >initiate the resource release=2E
>> >
>> >This needs some improvements for both wmi-capdata and wmi-other to mak=
e
>> >them capable to handle NULL lists=2E When it's done, missing cd00_list
>> >should gate hwmon and power_supply_ext registration completely, and
>> >missing cd01_list should gate fw_attr registration completely=2E If bo=
th
>> >are missing then wmi-other unbinds all components=2E
>> >
>> >Due to the limitation of the component framework, this is the best via=
ble
>> >cleanup approach=2E The drivers must at least register itself as a
>> >component to coordinate with wmi-other=2E
>> >
>>=20
>> Makes sense to me, yeah=2E
>>=20
>> Charles,
>>=20
>> Is that something you're willing to add to your series or would you pre=
fer Rong or I handle that?
>
>My series for the proposed approach is almost done=2E
>
>Derek, would you prefer integrating it into your series (if you have anyt=
hing to submit in this cycle), or should I submit it myself?
>
>Thanks,
>Rong
>

I don't have anything this cycle=2E I've mostly been working on HID=2E

- Derek
>>=20
>> - Derek
>>=20
>> >Thanks,
>> >Rong
>> >
>> >>=20
>> >> Thanks,
>> >> Derek
>> >>=20
>> >> > I am developing a series to replace deprecated WMI API calls with =
calls
>> >> > to the new ones, as well as making WMI/ACPI failures non-fatal=2E =
It should
>> >> > word around the ACPI bug=2E
>> >> >=20
>> >> > >=20
>> >> > > Separately, on the same machine there is a second, independent
>> >> > > firmware defect on the legacy ACPI thermal path:
>> >> > >   \_TZ=2EFNCL references \_SB=2EPC00=2ELPCB=2EUPFS, which is und=
efined in
>> >> > >   every ACPI table (verified across all 1 DSDT + 29 SSDTs)=2E Al=
l 6
>> >> > >   "Fan" cooling devices therefore fail on cur_state write=2E
>> >> > > Full analysis of that one is in the Lenovo community forum threa=
d;
>> >> > > I can repost details here if useful=2E
>> >> >=20
>> >> > For the independent firmware defect, you may want to file a bug on=
 kernel
>> >> > Bugzilla with detailed information and acpidump so that it can be
>> >> > tracked=2E If you decide to file a bug there, please CC me then=2E
>> >> >=20
>> >> > Thanks,
>> >> > Rong
>> >> >=20
>> >> > >=20
>> >> > > Thanks,
>> >> > > Charles
>>=20

