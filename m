Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD8B4078E4
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 19:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153580; cv=pass; b=Bki6n0RO5lI1g8eiVT05StJsGvJlLsO6iYni7/ORyk7z4WIGbjOFt0pFlC3xZImL8M9hdcK3VSitAFvlElYM3XKA2VPVho+k16cHQUCKC1Ecs3gfqRJ8+LXTrS2iO9EkaQq8+EVPCx5Th/Bq2cBun0SpIeangwpHDWfD1uTVZkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153580; c=relaxed/simple;
	bh=QRVZQFbqvjFPart3fRGke1V12PvkaB+lO1okxukX11A=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pUgvoE/MJYyxmin2xYoN0mHd1vEEPHJYeFVw/pwtSxGe3TJjY/95KZ7yBCmM8eQeKaIEAUhQJuTgvQnWfVstGFDp4Vy5KUYf+d5iRAkuq4kyNikiQfaisC5ytur9houcHtZKB+sd/dJ37KtkdmaAIYzFoIrJrzB9HCpgZaZhU48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=YUDeK3V/; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="YUDeK3V/"
ARC-Seal: i=1; a=rsa-sha256; t=1789153556; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pat+NRw8CYLL0pST2De/69s6fdnxdk3Z9R9n2/Y3syjfi4r8vpmAsMv3DKtPMbTRj9Ah+QiSb5XJ8GQ++sB9pMti+Uqtnqz3kgHToI2IK8OpoSh4LcQOf7YsJygiuHVd6cBrn9/SsfYl77mtdEiBnqBg5x1dm5KlEVMFuTiLqXw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789153556; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=louvML/e0lDk39teeWvX60ZERhKk3FYrSU0xe0mBq6A=; 
	b=aC7khOfyiDg2bl7CeihMTkdWbhjzF59Qzh9TYmek/58w37BScvP0EziYSaLGQWV83E8dZ3XEoisUw9MjzZV2vSqeOx5nHav+SfYn8cQMN58oXzt/0aJy41XPS24SL/3+8nl32ZR4Mj5+OAPq9Ie6UWl9JhnBktfkdFainKfME4A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789153556;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=louvML/e0lDk39teeWvX60ZERhKk3FYrSU0xe0mBq6A=;
	b=YUDeK3V/US3eU6qlEtIGpyF6X33ixStPgxIw7PX/rpBrWY9g3ixJWYqvV4tTj1V4
	5mnNB6LaXEKIVOUNsj5d9GukTXPkej+vw+1xwamCnH6YxYMYZdn5+n+pANcIkTrBhMW
	zC0ndZT7KFUpn4avXkHtOXD/mk4pGbiFUZEuuNOHR28r8R9HKDitZyjgI2uYwVhKCkr
	oEcPOLIkcD/1YQHuM5xdLdYTUP8azBWYbuj2skdWD/+1LljjQsXYapyVV+15QlCnbkE
	GMjCrYVKJlkaeFA7Fziy8vFhWbAzIKi7uKVQ89RiRPXx5n6cJBJpZ8abMQbhTpoWNxt
	V0SpC/xI/g==
Received: by mx.zohomail.com with SMTPS id 1789153555733336.5954806788732;
	Fri, 11 Sep 2026 12:05:55 -0700 (PDT)
Message-ID: <ccceaca8dfbea7d0ad203066c44cd23c2c28db94.camel@rong.moe>
Subject: Re: lenovo-wmi-other: LENOVO_CAPABILITY_DATA_01 fails to register
 on ThinkBook 16 G6+ IMH (ACPI AE_AML_OPERAND_TYPE in \_SB.WMI5.GCD1)
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Charles
 <hanker007@gmail.com>, 	platform-driver-x86@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca
In-Reply-To: <E22512FC-87CE-4707-9CF8-B437388244A7@gmail.com>
References:
	 	<CAKtz0s8UYRQYW_0bh=0TMx47Axm-W-muEay-r3rqUBS1NHMPVw@mail.gmail.com>
		 <56c1c0bd65b2df9268cc0ad58b7733f4dceefc53.camel@rong.moe>
		 <E22512FC-87CE-4707-9CF8-B437388244A7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 03:00:51 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Derek,

On Thu, 2026-09-10 at 11:27 -0700, Derek J. Clark wrote:
> On September 10, 2026 8:21:56 AM PDT, Rong Zhang <i@rong.moe> wrote:
> > Hi Charles,
> >=20
> > Thanks for the report.
> >=20
> > On Mon, 2026-09-07 at 16:40 +0800, Charles wrote:
> > > Hi,
> > >=20
> > > Reporting a firmware AML defect that blocks the fan hwmon interface
> > > exposed by lenovo-wmi-other.
> > >=20
> > > Machine:
> > >   Product:      ThinkBook 16 G6+ IMH
> > >   Machine Type: 21LE
> > >   Baseboard:    LNVNB161216
> > >   CPU:          Intel Core Ultra 9 185H (Meteor Lake)
> > >   BIOS:         NJCN68WW (2025-12-17, latest available)
> > >   OS:           Ubuntu 26.04 LTS, kernel 7.0.0-30-generic
> > >=20
> > > Symptom:
> > >   The LENOVO_OTHER_MODE WMI device binds correctly, but no hwmon
> > >   device is created. Consequently fan RPM readback (fanX_input) and
> > >   target-speed control (fanX_target) are unavailable.
> > >=20
> > >   $ ls /sys/class/hwmon/hwmon*/name
> > >   ACAD acpi_fan BAT1 nvme nvme ucsi_source_psy x2 coretemp iwlwifi_1
> > >     (no lenovo entry; acpi_fan reports fan1: 0 RPM, always)
> > >=20
> > > dmesg:
> > >   ACPI Error: Aborting method \_SB.WMI5.GCD1 due to previous error
> > >               (AE_AML_OPERAND_TYPE)
> > >   ACPI Error: Aborting method \_SB.WMI5.WQB1 due to previous error
> > >               (AE_AML_OPERAND_TYPE)
> > >   lenovo_wmi_capdata 7A8F5407-CB67-4D6E-B547-39B3BE018154:
> > >       failed to register LENOVO_CAPABILITY_DATA_01: -19 (ENODEV)
> > >   lenovo_wmi_capdata 362A3AFE-3D96-4665-8530-96DAD5BB300E:
> > >       bound B642801B-3D21-45DE-90AE-6E86F164FB21
> > >       (ops lwmi_cd_sub_component_ops [lenovo_wmi_capdata])
> > >   lenovo_wmi_gamezone 887B54E3-DDDC-4B2C-8B88-68A26A8835D0:
> > >       platform_profile probe failed
> > >=20
> > > Note the asymmetry, which I think is the useful clue:
> > >   - LENOVO_CAPABILITY_DATA_00 (362A3AFE-...) binds fine and
> > >     successfully attaches LENOVO_FAN_TEST_DATA (B642801B-...)
> > >   - LENOVO_CAPABILITY_DATA_01 (7A8F5407-...) fails with -ENODEV,
> > >     because its AML back-end methods \_SB.WMI5.GCD1 / \_SB.WMI5.WQB1
> > >     abort with AE_AML_OPERAND_TYPE
> > >=20
> > > The "_00" variants (GCD0/WQB0) apparently work; only the "_01"
> > > variants are broken. This is an AML operand-type defect in the
> > > firmware, OS-independent.
> > >=20
> > > Verified present on the machine (all three GUIDs exist):
> > >   DC2A8805-3A8C-41BA-A6F7-092E0089CD3B  -> bound to lenovo_wmi_other
> > >   362A3AFE-3D96-4665-8530-96DAD5BB300E  -> bound to lenovo_wmi_capdat=
a
> > >   B642801B-3D21-45DE-90AE-6E86F164FB21  -> bound as sub-component
> > >=20
> > > Questions / requests:
> > >=20
> > > 1. Should hwmon registration be able to proceed with only
> > >    LENOVO_CAPABILITY_DATA_00 available? Since DATA_00 is bound and
> > >    LENOVO_FAN_TEST_DATA is attached, it looks like the RPM data may
> > >    already be reachable. If graceful degradation is feasible, that
> > >    would restore at least fan readback on this and similar machines
> > >    without waiting for a BIOS fix. Happy to test any such patch.
> >=20
> > Yes. The hwmon device does not depend on LENOVO_CAPABILITY_DATA_01.
> >=20
> > The current implementation enforces the binding between
> > LENOVO_CAPABILITY_DATA_00+01 and LENOVO_OTHER_MODE because of a
> > limitation of the device component framework.
> >=20
> > AFAIK, ThinkBook devices usually don't support any LENOVO_OTHER_MODE
> > method controlled by LENOVO_CAPABILITY_DATA_01. On my device, the
> > LENOVO_CAPABILITY_DATA_01 method is stubbed and always return a buffer
> > with zeros.
> >=20
> > Could you please dump the data from LENOVO_CAPABILITY_DATA_00 and
> > LENOVO_FAN_TEST_DATA via /sys/kernel/debug/lenovo_wmi? It would be
> > helpful to confirm if your device supports fan monitoring/tuning.
> >=20
> > >=20
> > > 2. Alternatively, is a DMI quirk the right mechanism here?
> >=20
> > (+CC Derek)
> >=20
> > I think there are two reasonable approaches.
> >=20
> > (1) DMI quirk. Both wmi-capdata and wmi-other need a WMI quirk table in
> > this case, so it's not very optimal.
> >=20
> > (2) Making WMI/ACPI failures non-fatal and provide empty data to wmi-
> > other, mimicking the behavior of my device.
> >=20
> > My preference is (2). Derek, what do you think?
> >=20
> Hi Rong and Charles,
> Thanks for the Cc. I agree with (2). Adding two DMI quirk tables will int=
roduce a maintenance burden and provide effectively the same results.=C2=A0
>=20

Thanks for your insights.

> I would caveat that, though, given how loosely Lenovo seems to adhere to =
their own spec, that it would be prudent to check if no capability data dev=
ices of any kind get bound and let the driver clean itself up unless the fo=
rce options are set. There's generally no reason for the driver to stay bou=
nd in such a case, and I can't think of a reason why a BIOS would ship with=
 nothing, but you never really know.

Then how about releasing most resources and passing NULL list to wmi-
other when no capability data is available? In this manner we can poison
the capdata device on WMI/ACPI errors by setting priv->list->count =3D 0 to
initiate the resource release.

This needs some improvements for both wmi-capdata and wmi-other to make
them capable to handle NULL lists. When it's done, missing cd00_list
should gate hwmon and power_supply_ext registration completely, and
missing cd01_list should gate fw_attr registration completely. If both
are missing then wmi-other unbinds all components.

Due to the limitation of the component framework, this is the best viable
cleanup approach. The drivers must at least register itself as a
component to coordinate with wmi-other.

Thanks,
Rong

>=20
> Thanks,
> Derek
>=20
> > I am developing a series to replace deprecated WMI API calls with calls
> > to the new ones, as well as making WMI/ACPI failures non-fatal. It shou=
ld
> > word around the ACPI bug.
> >=20
> > >=20
> > > Separately, on the same machine there is a second, independent
> > > firmware defect on the legacy ACPI thermal path:
> > >   \_TZ.FNCL references \_SB.PC00.LPCB.UPFS, which is undefined in
> > >   every ACPI table (verified across all 1 DSDT + 29 SSDTs). All 6
> > >   "Fan" cooling devices therefore fail on cur_state write.
> > > Full analysis of that one is in the Lenovo community forum thread;
> > > I can repost details here if useful.
> >=20
> > For the independent firmware defect, you may want to file a bug on kern=
el
> > Bugzilla with detailed information and acpidump so that it can be
> > tracked. If you decide to file a bug there, please CC me then.
> >=20
> > Thanks,
> > Rong
> >=20
> > >=20
> > > Thanks,
> > > Charles
