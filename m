Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018CC368D46
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 15:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054032; cv=pass; b=DXO1R8esaAeUNA1Wj+pdkeh14aiKaD4tmzc9lcwXCmljhGTbQ7XCQzt17cFJBx6f00fZQagZshdw5e+1Wnwu4focVdTUYxbiyVCt+AV3aMhZlBwKC93SMpYi2DpCkkxKbeRrBGYPdCjEXxntzD1sTXHxIVW3UIvW6HyNSI5CnfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054032; c=relaxed/simple;
	bh=nt6+j1E/0l/oXDJLup6JCx8cKAHk6AZi7BqHR4zzwgo=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YTy5gsHiSV9g2r1foOyylB1p5kbWcwiIYJawKG1E4SoQp51k0kVsO9HvNE1928QjlGk/8e1M0TgtS8I/ZOgc4NxgUwvgnPCaN5Gy13+4cvqd7x9GYQ+fepmnskuhplsef8Ep4MgUNm3YITkxFNCBubwunnp1LeEP904rin4w30c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Jn6bMY/t; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Jn6bMY/t"
ARC-Seal: i=1; a=rsa-sha256; t=1789054024; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eod5BhOUHp6AUcL/pMRJG+C8Hy7fYurvES2tp29Q94AvoGM0chkbCK0/5aV3lHnWzXoaj01w70/KLQlGqYVe9Em/Y5cwIWl21GQXSeDIndWGbQpWjVnbiKOYlyUTJcJYfQIfRN4QVewaATiqV1oZ75SZDtTqeDcGgsAbbCSE9fk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789054024; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=N/myVJOANYEINkR6WaX7jT7+F3FZgwdznXa0zVXqHzk=; 
	b=mD4izwS2aMjPYItOHlOaAi2dZFEpBBeIfBxYx6tNtV8A11VE9Jl2YDIXnRJxb8HJdlPbD518Y4gD5HzvNiRa4+0JellSxu8cKDuFbO4d+AG0oCo3PrEz2UaF//DFAqLglGGlreXuDyW76s+ff+Jd2PfFXrcrrCIhG+0k1+yST4A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789054024;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=N/myVJOANYEINkR6WaX7jT7+F3FZgwdznXa0zVXqHzk=;
	b=Jn6bMY/tKjJ4JOkS052x7bzftdOzbPRuJiWmaUy0BsoL7L6UFi9e6OiCziUSqKb4
	Xf56CnxVE2zmJB0DqaYOb6fIvI1VWEK1xX6JjvwukzNqygY+0kL7Jcpk7SqWwD2ikWI
	TC7zeGtje5bTSICxcbTzu7FdkfkxXdH9AG1C6bpqdVylLcVBbRU2eA0c/K/hTyktU8x
	ORG2p3ssoz6Ga+fBKnmQ4P0F59lY1ETmm9DC0+3Jb4uqLcoomMwynT4aqEzljKo0knV
	km+1havJ3PgLUsZPBeGuY7DSMS9FRCtBbpr1QbMTSLE/7DlTGYFU1wIS/GyiEwNXw6G
	kt5TscsLlg==
Received: by mx.zohomail.com with SMTPS id 1789054024202662.4209108237463;
	Thu, 10 Sep 2026 08:27:04 -0700 (PDT)
Message-ID: <56c1c0bd65b2df9268cc0ad58b7733f4dceefc53.camel@rong.moe>
Subject: Re: lenovo-wmi-other: LENOVO_CAPABILITY_DATA_01 fails to register
 on ThinkBook 16 G6+ IMH (ACPI AE_AML_OPERAND_TYPE in \_SB.WMI5.GCD1)
From: Rong Zhang <i@rong.moe>
To: Charles <hanker007@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca, "Derek J.Clark" <derekjohn.clark@gmail.com>
In-Reply-To: <CAKtz0s8UYRQYW_0bh=0TMx47Axm-W-muEay-r3rqUBS1NHMPVw@mail.gmail.com>
References: 
	<CAKtz0s8UYRQYW_0bh=0TMx47Axm-W-muEay-r3rqUBS1NHMPVw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 23:21:56 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Charles,

Thanks for the report.

On Mon, 2026-09-07 at 16:40 +0800, Charles wrote:
> Hi,
>=20
> Reporting a firmware AML defect that blocks the fan hwmon interface
> exposed by lenovo-wmi-other.
>=20
> Machine:
>   Product:      ThinkBook 16 G6+ IMH
>   Machine Type: 21LE
>   Baseboard:    LNVNB161216
>   CPU:          Intel Core Ultra 9 185H (Meteor Lake)
>   BIOS:         NJCN68WW (2025-12-17, latest available)
>   OS:           Ubuntu 26.04 LTS, kernel 7.0.0-30-generic
>=20
> Symptom:
>   The LENOVO_OTHER_MODE WMI device binds correctly, but no hwmon
>   device is created. Consequently fan RPM readback (fanX_input) and
>   target-speed control (fanX_target) are unavailable.
>=20
>   $ ls /sys/class/hwmon/hwmon*/name
>   ACAD acpi_fan BAT1 nvme nvme ucsi_source_psy x2 coretemp iwlwifi_1
>     (no lenovo entry; acpi_fan reports fan1: 0 RPM, always)
>=20
> dmesg:
>   ACPI Error: Aborting method \_SB.WMI5.GCD1 due to previous error
>               (AE_AML_OPERAND_TYPE)
>   ACPI Error: Aborting method \_SB.WMI5.WQB1 due to previous error
>               (AE_AML_OPERAND_TYPE)
>   lenovo_wmi_capdata 7A8F5407-CB67-4D6E-B547-39B3BE018154:
>       failed to register LENOVO_CAPABILITY_DATA_01: -19 (ENODEV)
>   lenovo_wmi_capdata 362A3AFE-3D96-4665-8530-96DAD5BB300E:
>       bound B642801B-3D21-45DE-90AE-6E86F164FB21
>       (ops lwmi_cd_sub_component_ops [lenovo_wmi_capdata])
>   lenovo_wmi_gamezone 887B54E3-DDDC-4B2C-8B88-68A26A8835D0:
>       platform_profile probe failed
>=20
> Note the asymmetry, which I think is the useful clue:
>   - LENOVO_CAPABILITY_DATA_00 (362A3AFE-...) binds fine and
>     successfully attaches LENOVO_FAN_TEST_DATA (B642801B-...)
>   - LENOVO_CAPABILITY_DATA_01 (7A8F5407-...) fails with -ENODEV,
>     because its AML back-end methods \_SB.WMI5.GCD1 / \_SB.WMI5.WQB1
>     abort with AE_AML_OPERAND_TYPE
>=20
> The "_00" variants (GCD0/WQB0) apparently work; only the "_01"
> variants are broken. This is an AML operand-type defect in the
> firmware, OS-independent.
>=20
> Verified present on the machine (all three GUIDs exist):
>   DC2A8805-3A8C-41BA-A6F7-092E0089CD3B  -> bound to lenovo_wmi_other
>   362A3AFE-3D96-4665-8530-96DAD5BB300E  -> bound to lenovo_wmi_capdata
>   B642801B-3D21-45DE-90AE-6E86F164FB21  -> bound as sub-component
>=20
> Questions / requests:
>=20
> 1. Should hwmon registration be able to proceed with only
>    LENOVO_CAPABILITY_DATA_00 available? Since DATA_00 is bound and
>    LENOVO_FAN_TEST_DATA is attached, it looks like the RPM data may
>    already be reachable. If graceful degradation is feasible, that
>    would restore at least fan readback on this and similar machines
>    without waiting for a BIOS fix. Happy to test any such patch.

Yes. The hwmon device does not depend on LENOVO_CAPABILITY_DATA_01.

The current implementation enforces the binding between
LENOVO_CAPABILITY_DATA_00+01 and LENOVO_OTHER_MODE because of a
limitation of the device component framework.

AFAIK, ThinkBook devices usually don't support any LENOVO_OTHER_MODE
method controlled by LENOVO_CAPABILITY_DATA_01. On my device, the
LENOVO_CAPABILITY_DATA_01 method is stubbed and always return a buffer
with zeros.

Could you please dump the data from LENOVO_CAPABILITY_DATA_00 and
LENOVO_FAN_TEST_DATA via /sys/kernel/debug/lenovo_wmi? It would be
helpful to confirm if your device supports fan monitoring/tuning.

>=20
> 2. Alternatively, is a DMI quirk the right mechanism here?

(+CC Derek)

I think there are two reasonable approaches.

(1) DMI quirk. Both wmi-capdata and wmi-other need a WMI quirk table in
this case, so it's not very optimal.

(2) Making WMI/ACPI failures non-fatal and provide empty data to wmi-
other, mimicking the behavior of my device.

My preference is (2). Derek, what do you think?

I am developing a series to replace deprecated WMI API calls with calls
to the new ones, as well as making WMI/ACPI failures non-fatal. It should
word around the ACPI bug.

>=20
> Separately, on the same machine there is a second, independent
> firmware defect on the legacy ACPI thermal path:
>   \_TZ.FNCL references \_SB.PC00.LPCB.UPFS, which is undefined in
>   every ACPI table (verified across all 1 DSDT + 29 SSDTs). All 6
>   "Fan" cooling devices therefore fail on cur_state write.
> Full analysis of that one is in the Lenovo community forum thread;
> I can repost details here if useful.

For the independent firmware defect, you may want to file a bug on kernel
Bugzilla with detailed information and acpidump so that it can be
tracked. If you decide to file a bug there, please CC me then.

Thanks,
Rong

>=20
> Thanks,
> Charles
