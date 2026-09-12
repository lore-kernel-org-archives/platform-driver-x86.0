Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE5137998A
	for <platform-driver-x86@vger.kernel.org>; Sat, 12 Sep 2026 08:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789200448; cv=pass; b=HaTe352QP7kP6DJIfdq4xMp9O++D4uZGJSHqX38pQCvigP4wsFCpzBxeuXxs0jo+cOs0V6tw0hR6FupBQUwZ7rbOU0Y99z6g8QYjgEuIdhUD4rnwXhn4WYWwcVc5U08LZSRnNP1J7WU2+Avtd9eD2oy4xsHTu7d86Ey8inz/1Kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789200448; c=relaxed/simple;
	bh=xCH7FJ8USqEGjY3Md4MPcMmEr9cz0U2MFXePUkddhy0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=QalxyuQa/S8BVz6OLvXR7rBx2+ICF5Saf0dii9hKQjtyjkGrqzHNdn2m775Yx3qc5zF48rmq2BEa5jZDCkKvnAp0plxwj9uHpgx5Xhz4kgypjLxFKNRNxEkDor+6mdp0H/QWX7uI50V7uQw9+LxlvjyMzG0J3fS7UkxIkydzXJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=ZX69YoAN; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="ZX69YoAN"
ARC-Seal: i=1; a=rsa-sha256; t=1789200440; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JoAELFeSOejod7QgVkGYW1OJmCMAESM6UdmDrt4zVwXXidC716zX7q8kKEKO/ua6gCMYM008wqRmxF5nIaF5qlMDPxe3UkJNKY+mI9bJOfaGme+KCW2DTXyR57tEaMs+4sl56HGZXnKBCtpzMBg+xjlkkT0emDXNtTRXQpknyf0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789200440; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vezIVjghIABFLXr0yqFIeUAfcY4eegf9lIl1yOUSlP8=; 
	b=cI4LXNWiqqQloeN+RdpDejfaM7uuEspIJv20g3O3YuwTZ3Fh0pImESZpmOisV83nl+TldgymyJGafxcVs0wHcadqnzyjJUXJCdOjRT0vvR21TY++oBpYWF4MUPfY1NPJp09p6VoRCyBVtvNQOOhp/Ad+g853+/rUMspW4dRv6H8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789200440;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=vezIVjghIABFLXr0yqFIeUAfcY4eegf9lIl1yOUSlP8=;
	b=ZX69YoANdfDbSBl70EaS6JR5WTIRfvjnVQ4bG3JW5AxXwVJ5DarfBgAOstHmNsBK
	XXa11EaL+96l7u9WoAvO8cmpEljo25wZGesN+lVrB7Rytz/Rxyz7kEe+Lj8QHj3cB0w
	MK4wK/N+Tg9IqpwiIliPULa2kZPCkCntG1qdmyoKmToyNV5SGlIBfPfEFRQBdv/CnTV
	Vy4OLP+Wr1z4byW/a7XZOCpmsW4W4ApxGVsux20+i0S/HWaIT6oerpPtdv9/Bb85ClT
	i6r1Hhazc4sBVHiDVqa2tSkXOi8XRV8mbbg5NkkfJEue2699aIYOJzDCMfyzQ8r5t2N
	ZrKeyWcIHg==
Received: by smtp.zohomail.com with SMTPS id 1789200439061921.9066607382894;
	Sat, 12 Sep 2026 01:07:19 -0700 (PDT)
Date: Sat, 12 Sep 2026 16:06:07 +0800
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Charles <hanker007@gmail.com>,
 platform-driver-x86@vger.kernel.org
CC: mpearson-lenovo@squebb.ca
Subject: =?US-ASCII?Q?Re=3A_lenovo-wmi-other=3A_LENOVO=5FCAPA?=
 =?US-ASCII?Q?BILITY=5FDATA=5F01_fails_to_register_o?=
 =?US-ASCII?Q?n_ThinkBook_16_G6+_IMH_=28ACPI_AE=5FA?=
 =?US-ASCII?Q?ML=5FOPERAND=5FTYPE_in_=5C=5FSB=2EWMI5=2EGCD1=29?=
User-Agent: Thunderbird for Android
In-Reply-To: <8CF84187-B300-4357-AEF3-172A50B09AA6@gmail.com>
References: <CAKtz0s8UYRQYW_0bh=0TMx47Axm-W-muEay-r3rqUBS1NHMPVw@mail.gmail.com> <56c1c0bd65b2df9268cc0ad58b7733f4dceefc53.camel@rong.moe> <E22512FC-87CE-4707-9CF8-B437388244A7@gmail.com> <ccceaca8dfbea7d0ad203066c44cd23c2c28db94.camel@rong.moe> <8CF84187-B300-4357-AEF3-172A50B09AA6@gmail.com>
Message-ID: <C62E5597-0375-4338-829F-DBC25EFB3322@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Hi Derek, Charles,=20

=E4=BA=8E 2026=E5=B9=B49=E6=9C=8812=E6=97=A5 GMT+08:00 08:31:14=EF=BC=8C"D=
erek J=2E Clark" <derekjohn=2Eclark@gmail=2Ecom> =E5=86=99=E9=81=93=EF=BC=
=9A
> On September 11, 2026 12:00:51 PM PDT, Rong Zhang <i@rong=2Emoe> wrote:
> >Hi Derek,
> >
> >On Thu, 2026-09-10 at 11:27 -0700, Derek J=2E Clark wrote:
> >> On September 10, 2026 8:21:56 AM PDT, Rong Zhang <i@rong=2Emoe> wrote=
:
> >> > Hi Charles,
> >> >=20
> >> > Thanks for the report=2E
> >> >=20
> >> > On Mon, 2026-09-07 at 16:40 +0800, Charles wrote:
> >> > > Hi,
> >> > >=20
> >> > > Reporting a firmware AML defect that blocks the fan hwmon interfa=
ce
> >> > > exposed by lenovo-wmi-other=2E
> >> > >=20
> >> > > Machine:
> >> > >   Product:      ThinkBook 16 G6+ IMH
> >> > >   Machine Type: 21LE
> >> > >   Baseboard:    LNVNB161216
> >> > >   CPU:          Intel Core Ultra 9 185H (Meteor Lake)
> >> > >   BIOS:         NJCN68WW (2025-12-17, latest available)
> >> > >   OS:           Ubuntu 26=2E04 LTS, kernel 7=2E0=2E0-30-generic
> >> > >=20
> >> > > Symptom:
> >> > >   The LENOVO_OTHER_MODE WMI device binds correctly, but no hwmon
> >> > >   device is created=2E Consequently fan RPM readback (fanX_input)=
 and
> >> > >   target-speed control (fanX_target) are unavailable=2E
> >> > >=20
> >> > >   $ ls /sys/class/hwmon/hwmon*/name
> >> > >   ACAD acpi_fan BAT1 nvme nvme ucsi_source_psy x2 coretemp iwlwif=
i_1
> >> > >     (no lenovo entry; acpi_fan reports fan1: 0 RPM, always)
> >> > >=20
> >> > > dmesg:
> >> > >   ACPI Error: Aborting method \_SB=2EWMI5=2EGCD1 due to previous =
error
> >> > >               (AE_AML_OPERAND_TYPE)
> >> > >   ACPI Error: Aborting method \_SB=2EWMI5=2EWQB1 due to previous =
error
> >> > >               (AE_AML_OPERAND_TYPE)
> >> > >   lenovo_wmi_capdata 7A8F5407-CB67-4D6E-B547-39B3BE018154:
> >> > >       failed to register LENOVO_CAPABILITY_DATA_01: -19 (ENODEV)
> >> > >   lenovo_wmi_capdata 362A3AFE-3D96-4665-8530-96DAD5BB300E:
> >> > >       bound B642801B-3D21-45DE-90AE-6E86F164FB21
> >> > >       (ops lwmi_cd_sub_component_ops [lenovo_wmi_capdata])
> >> > >   lenovo_wmi_gamezone 887B54E3-DDDC-4B2C-8B88-68A26A8835D0:
> >> > >       platform_profile probe failed
> >> > >=20
> >> > > Note the asymmetry, which I think is the useful clue:
> >> > >   - LENOVO_CAPABILITY_DATA_00 (362A3AFE-=2E=2E=2E) binds fine and
> >> > >     successfully attaches LENOVO_FAN_TEST_DATA (B642801B-=2E=2E=
=2E)
> >> > >   - LENOVO_CAPABILITY_DATA_01 (7A8F5407-=2E=2E=2E) fails with -EN=
ODEV,
> >> > >     because its AML back-end methods \_SB=2EWMI5=2EGCD1 / \_SB=2E=
WMI5=2EWQB1
> >> > >     abort with AE_AML_OPERAND_TYPE
> >> > >=20
> >> > > The "_00" variants (GCD0/WQB0) apparently work; only the "_01"
> >> > > variants are broken=2E This is an AML operand-type defect in the
> >> > > firmware, OS-independent=2E
> >> > >=20
> >> > > Verified present on the machine (all three GUIDs exist):
> >> > >   DC2A8805-3A8C-41BA-A6F7-092E0089CD3B  -> bound to lenovo_wmi_ot=
her
> >> > >   362A3AFE-3D96-4665-8530-96DAD5BB300E  -> bound to lenovo_wmi_ca=
pdata
> >> > >   B642801B-3D21-45DE-90AE-6E86F164FB21  -> bound as sub-component
> >> > >=20
> >> > > Questions / requests:
> >> > >=20
> >> > > 1=2E Should hwmon registration be able to proceed with only
> >> > >    LENOVO_CAPABILITY_DATA_00 available? Since DATA_00 is bound an=
d
> >> > >    LENOVO_FAN_TEST_DATA is attached, it looks like the RPM data m=
ay
> >> > >    already be reachable=2E If graceful degradation is feasible, t=
hat
> >> > >    would restore at least fan readback on this and similar machin=
es
> >> > >    without waiting for a BIOS fix=2E Happy to test any such patch=
=2E
> >> >=20
> >> > Yes=2E The hwmon device does not depend on LENOVO_CAPABILITY_DATA_0=
1=2E
> >> >=20
> >> > The current implementation enforces the binding between
> >> > LENOVO_CAPABILITY_DATA_00+01 and LENOVO_OTHER_MODE because of a
> >> > limitation of the device component framework=2E
> >> >=20
> >> > AFAIK, ThinkBook devices usually don't support any LENOVO_OTHER_MOD=
E
> >> > method controlled by LENOVO_CAPABILITY_DATA_01=2E On my device, the
> >> > LENOVO_CAPABILITY_DATA_01 method is stubbed and always return a buf=
fer
> >> > with zeros=2E
> >> >=20
> >> > Could you please dump the data from LENOVO_CAPABILITY_DATA_00 and
> >> > LENOVO_FAN_TEST_DATA via /sys/kernel/debug/lenovo_wmi? It would be
> >> > helpful to confirm if your device supports fan monitoring/tuning=2E
> >> >=20
> >> > >=20
> >> > > 2=2E Alternatively, is a DMI quirk the right mechanism here?
> >> >=20
> >> > (+CC Derek)
> >> >=20
> >> > I think there are two reasonable approaches=2E
> >> >=20
> >> > (1) DMI quirk=2E Both wmi-capdata and wmi-other need a WMI quirk ta=
ble in
> >> > this case, so it's not very optimal=2E
> >> >=20
> >> > (2) Making WMI/ACPI failures non-fatal and provide empty data to wm=
i-
> >> > other, mimicking the behavior of my device=2E
> >> >=20
> >> > My preference is (2)=2E Derek, what do you think?
> >> >=20
> >> Hi Rong and Charles,
> >> Thanks for the Cc=2E I agree with (2)=2E Adding two DMI quirk tables =
will introduce a maintenance burden and provide effectively the same result=
s=2E=C2=A0
> >>=20
> >
> >Thanks for your insights=2E
> >
> >> I would caveat that, though, given how loosely Lenovo seems to adhere=
 to their own spec, that it would be prudent to check if no capability data=
 devices of any kind get bound and let the driver clean itself up unless th=
e force options are set=2E There's generally no reason for the driver to st=
ay bound in such a case, and I can't think of a reason why a BIOS would shi=
p with nothing, but you never really know=2E
> >
> >Then how about releasing most resources and passing NULL list to wmi-
> >other when no capability data is available? In this manner we can poiso=
n
> >the capdata device on WMI/ACPI errors by setting priv->list->count =3D =
0 to
> >initiate the resource release=2E
> >
> >This needs some improvements for both wmi-capdata and wmi-other to make
> >them capable to handle NULL lists=2E When it's done, missing cd00_list
> >should gate hwmon and power_supply_ext registration completely, and
> >missing cd01_list should gate fw_attr registration completely=2E If bot=
h
> >are missing then wmi-other unbinds all components=2E
> >
> >Due to the limitation of the component framework, this is the best viab=
le
> >cleanup approach=2E The drivers must at least register itself as a
> >component to coordinate with wmi-other=2E
> >
>=20
> Makes sense to me, yeah=2E
>=20
> Charles,
>=20
> Is that something you're willing to add to your series or would you pref=
er Rong or I handle that?

My series for the proposed approach is almost done=2E

Derek, would you prefer integrating it into your series (if you have anyth=
ing to submit in this cycle), or should I submit it myself?

Thanks,
Rong

>=20
> - Derek
>=20
> >Thanks,
> >Rong
> >
> >>=20
> >> Thanks,
> >> Derek
> >>=20
> >> > I am developing a series to replace deprecated WMI API calls with c=
alls
> >> > to the new ones, as well as making WMI/ACPI failures non-fatal=2E I=
t should
> >> > word around the ACPI bug=2E
> >> >=20
> >> > >=20
> >> > > Separately, on the same machine there is a second, independent
> >> > > firmware defect on the legacy ACPI thermal path:
> >> > >   \_TZ=2EFNCL references \_SB=2EPC00=2ELPCB=2EUPFS, which is unde=
fined in
> >> > >   every ACPI table (verified across all 1 DSDT + 29 SSDTs)=2E All=
 6
> >> > >   "Fan" cooling devices therefore fail on cur_state write=2E
> >> > > Full analysis of that one is in the Lenovo community forum thread=
;
> >> > > I can repost details here if useful=2E
> >> >=20
> >> > For the independent firmware defect, you may want to file a bug on =
kernel
> >> > Bugzilla with detailed information and acpidump so that it can be
> >> > tracked=2E If you decide to file a bug there, please CC me then=2E
> >> >=20
> >> > Thanks,
> >> > Rong
> >> >=20
> >> > >=20
> >> > > Thanks,
> >> > > Charles
>=20
