Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792684263;
	b=IVcEuj5UJRhGHcN+2O0ZWje7n7DaudFen6SDk9+uX1CbpL58rIxSA6YuXvuqJCu6QZSU
	 UlVnKA4wjoOtm44yVzU6jLjF1H7Gj2GxuGKR3sIszV+QNK+ymZM5Maf1EkMn3ajkGIUUS
	 LhYKUFRkVMGeesBEXxx431ACc9pN7xvmhqFtalgc324NPCVhvtuyDrHNC4OuVYE9p0YlM
	 wcB9SS+h55TbhXUX+KZU1wYVqtti0q3unN0wn/D3RuZ6KVy0P2akVgE77HCqe9PRmot1Q
	 ZdYWlPNW7muA5tjgpeuz5FKNQAoOlvfutq8sNpcN/yz+N35L9mt3MFHqI2a2XeCcMzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684263;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=tVeZDjBEj3ylEnOukZWlOyEDogYCQIOvSpmSqHCnn/A=;
	b=tXw7gbmeHeAJOM3HpKrHlLjrlMtMiCb1KRKjpArx7jiP5DpRtklmFiYP0eASCmIHgY4h
	 ymM+oRPOPQN9IVeOZTzzWeC0I1NhZgPV6u+skdkuyaN769uavDvNitM5j7UXsr17Fyfp4
	 EpNkvf6nfX6cKcYNNC15V57QxVSBXe/pz3okXFxHOjFsmXfTi/2Lunr0mDFPsG9cUS6lp
	 avROO9cBI15Qou6EQCQCTyzQVZnt7R1xEO9b/GCC2r+aOULBuYXyMqcj2NoOeJz31BO71
	 T/awFETUfH+am/ZvBwz3NrRbCmCaACF+g4zCf07EkkT2K5AFYeS78LrIDKLcLVbsDBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=q2viX5TA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B855606A31E
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 15:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B855606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=q2viX5TA
ARC-Seal: i=1; a=rsa-sha256; t=1792684252; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VvlUtFPe2xb4w7UQ+PvL8S+cseQuj3X6qgq4SWvA87Oo/OZAL7pvQcYDd0nLOG6whbFzzWt7mvVsQ3aT20BDQsJMm1Sp9wRSCIFIA+fpFaI8H2OTz2rGJXkat4HrXofI9FtxfYEsC8yD5iWkp2+8Rqdc4nCIkM773AdWCbfUnJY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792684252; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tVeZDjBEj3ylEnOukZWlOyEDogYCQIOvSpmSqHCnn/A=; 
	b=cY0QJQKEZGyuiIoOIYg8ZKhYpcU+Ry6YZtO2cUEGtEsPP/rtvSoJQifDLy9jDjuYWzjyjO055rLrRcbUbWLhjNkACjKxLh7hF7pli5R5kHKs67cn9XZDEPlUvXpSfLullvdIdLnPq3tBkUzPiIvqOO53v+QVcJmtvFDGRD5iRFc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792684252;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=tVeZDjBEj3ylEnOukZWlOyEDogYCQIOvSpmSqHCnn/A=;
	b=q2viX5TAeUvelPqX3IAvoYJ2Kgk8zGiRMyhbQJLbqALMP7Do7T8aHjbEw8mQ+wwd
	t2Cyuatg/JINlzSRzVkoc9FjeQum5GKHjns19J6WoR3totjkU+0D+fZcDwXSv2RlCO/
	OPfWYfJti8yPHQGM20YgbZivkiwdfiSuODNTc6lnHAO+Ax9r53Z+ivh8es71uLvQO59
	fo/ORYCjgMIan9kw+UdArSBDfbPejy+YUU13LXz5eh5U737HlQ5SKyxDdmSSDRvWeTu
	38qSHetuhA9I/EI2uODBCi5P7XfW4Nc6S06iP6HP1vxpUjauCvC7R9k3GXHeWbWyxPf
	woCsToZMow==
Received: by smtp.zohomail.com with SMTPS id 1792684250475314.26401579042226;
	Thu, 22 Oct 2026 08:50:50 -0700 (PDT)
Message-ID: <98b1af05169012da3fdfa444d88f7e5e860dc2e0.camel@rong.moe>
Subject: Re: lenovo-wmi-other: no fan HWMON on Yoga Pro 9 16IAH10 (83L0) -
 CAPABILITY_DATA_01 GUID missing
From: Rong Zhang <i@rong.moe>
To: Katona =?ISO-8859-1?Q?G=E9za?= <katona.geza.1@gmail.com>, Mark Pearson
	 <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Sergio Melas <sergiomelas@gmail.com>,
 platform-driver-x86@vger.kernel.org, 	hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
In-Reply-To: <1d46e12b-ef21-417c-8bcb-b607ba3e32fa@gmail.com>
References: <1d46e12b-ef21-417c-8bcb-b607ba3e32fa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 23:45:42 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Katona,

On Thu, 2026-10-22 at 16:49 +0200, Katona G=C3=A9za wrote:
> Hi all,
>=20
> I would like to ask you kind support. On my Lenovo Yoga Pro 9 16IAH10
> no fan speed is available to Linux at all. I went through the ACPI tables
> and the in-kernel drivers, and the=C2=A0=C2=A0only interface that looks u=
sable is
> Lenovo Other Mode (lenovo-wmi-other), which never completes binding
> on this machine.
>=20
> Machine (from /sys/class/dmi/id):
>=20
>  =C2=A0 sys_vendor:=C2=A0 =C2=A0 =C2=A0 LENOVO
>  =C2=A0 product_name:=C2=A0 =C2=A0 83L0
>  =C2=A0 product_family:=C2=A0 Yoga Pro 9 16IAH10
>  =C2=A0 product_sku:=C2=A0 =C2=A0 =C2=A0LENOVO_MT_83L0_BU_idea_FM_Yoga Pr=
o 9 16IAH10
>  =C2=A0 board_name:=C2=A0 =C2=A0 =C2=A0 LNVNB161216
>  =C2=A0 bios_version:=C2=A0 =C2=A0 QVCN50WW (01/28/2026)
>  =C2=A0 CPU / dGPU:=C2=A0 =C2=A0 =C2=A0 Intel Core Ultra 7 255H (Arrow La=
ke-H) / RTX 5050
>  =C2=A0 Kernel:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7.2.11-200.fc44.x86_64 =
(Fedora 44)
>=20
> 1) Lenovo WMI GUIDs present (/sys/bus/wmi/devices):
>=20
>  =C2=A0 DC2A8805-3A8C-41BA-A6F7-092E0089CD3B=C2=A0 Other Mode=C2=A0 -> le=
novo_wmi_other
>  =C2=A0 362A3AFE-3D96-4665-8530-96DAD5BB300E=C2=A0 CAPABILITY_DATA_00 ->=
=20
> lenovo_wmi_capdata
>  =C2=A0 887B54E3-DDDC-4B2C-8B88-68A26A8835D0=C2=A0 Gamezone -> "platform_=
profile=20
> probe failed"
>=20
>  =C2=A0 absent:
>  =C2=A0 7A8F5407-CB67-4D6E-B547-39B3BE018154=C2=A0 CAPABILITY_DATA_01
>  =C2=A0 B642801B-3D21-45DE-90AE-6E86F164FB21=C2=A0 FAN_TEST_DATA

Could you test
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git/log/?h=3Dreview-ilpo-next
with dynamic debug printks enabled?

It contains a recent series to solve the absence of CAPABILITY_DATA_01.
To workaround the absence of FAN_TEST_DATA, please also set lenovo-wmi-
other's module parameters expose_all_fans and relax_fan_constraint to 1.

Please also dump CAPABILITY_DATA_00 with
/sys/kernel/debug/lenovo_wmi/*/capdata.

As Sergio suggested, an acpidump will also be helpful.=20

Thanks,
Rong

>=20
>  =C2=A0 lwmi_om_master_bind() returns -ENODEV when cd01_list is NULL, so =
the
>  =C2=A0 component master never binds. As a result there is no
>  =C2=A0 /sys/class/firmware-attributes/lenovo-wmi-other* and no fan hwmon=
.
>  =C2=A0 The fan code path itself (lwmi_om_fan_info_collect_cd00() and
>  =C2=A0 LWMI_ATTR_ID_FAN_RPM) only needs capdata00, and a missing capdata=
_fan
>  =C2=A0 is already handled (channels hidden, or exposed read-only with
>  =C2=A0 expose_all_fans=3D1).
>=20
> 2) Why the other fan drivers cannot work here (from acpidump + iasl):
>=20
>  =C2=A0 - yogafan: the machine falls into the generic "Yoga" quirk
>  =C2=A0 =C2=A0 (\_SB.PCI0.LPC0.EC0.FANS), but there is no FANS/FA1S/FA2S/=
FAN0
>  =C2=A0 =C2=A0 object anywhere in the DSDT or SSDTs. \_SB.PC00.LPCB.EC0 (=
LCFC0002)
>  =C2=A0 =C2=A0 is an empty stub. The real EC is \_SB.PC00.LPCB.H_EC (SSDT
>  =C2=A0 =C2=A0 "CB-01"), and its ECF2 region has no RPM field, only FLVL =
at 0x4A.
>  =C2=A0 - acpi_fan \_SB.VFAN (PNP0C0B): _FST returns a synthetic RPM tabl=
e
>  =C2=A0 =C2=A0 selected by \_SB.FANL, which is only written through a _DS=
M call
>  =C2=A0 =C2=A0 (FIDS 0x04040000), so it always reads 0 on Linux.
>  =C2=A0 - acpi_fan \_SB.IETM.TFN1 (INTC1063, DPTF): _FST calls
>  =C2=A0 =C2=A0 \_SB.PC00.LPCB.H_EC.DPTF.GFNS, which is only declared Exte=
rnal and
>  =C2=A0 =C2=A0 not defined in any table, so _FST fails (fan1_input -> -EN=
ODEV).
>  =C2=A0 - ITE8 (SIO hwmon with GFNL/GFNH =3D IT87 fan1 tach regs 0x0D/0x1=
8) is
>  =C2=A0 =C2=A0 disabled on this model (_STA 0, ITSI !=3D 1).
>=20
> Questions / request:
>=20
>  =C2=A0 a) Could CAPABILITY_DATA_01 be made optional in lwmi_om_master_bi=
nd(),
>  =C2=A0 =C2=A0 =C2=A0so that the fan HWMON (and the capdata00-only attrib=
utes) can bind
>  =C2=A0 =C2=A0 =C2=A0on machines that only implement capdata00?
>  =C2=A0 b) Mark: does the Yoga Pro 9 Gen 10 firmware report fan RPM throu=
gh
>  =C2=A0 =C2=A0 =C2=A0Other Mode GetFeatureValue (LWMI_ATTR_ID_FAN_RPM), a=
s Lenovo Vantage
>  =C2=A0 =C2=A0 =C2=A0would use on Windows?
>=20
> I can test patches right away, run the module with expose_all_fans=3D1 an=
d
> dyndbg, and send the full acpidump if needed.
>=20
> Thanks,
> G=C3=A9za Katona
