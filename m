Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792683628;
	b=i9/95ctJzIKwLiD+6vTpM+rCX8I09b+4EYvk1ytwmdNLlxZKReezGeTevW4WQAwW86Zi
	 BEsEXyekyVdZEg7N9MYv9Oce1eEK3OItgphRN41BDY5Kzinq1C6nQsUXdx11lQ9GeBK9k
	 SLaApCJ9hCsVYXZMgbSnmPsr440o6kpGy94Rrswh8jJFSZzD00JgTza2Ktn3BKLyi0h1s
	 0optKvLr33h8+EV1UosuQJ4oEP3yO2+l+5+LlIErtrbnP8tXVC2HgaXjCxdxmqXSRt4Ox
	 syEGEs8eGlgv9YP2f5i/esSUdhFVhri7SLM+YhGrXzPcp8iym7qo+Jbs50J4Yb8u4jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HtVmAHr1JbHFjxi4X7h05vEfbt7XFmWhn+bQZDOydaM=;
	b=f4DtyGCH/3dHALVEtVRyr06BEeOBi23b98fjODENcfA4NJrpYembZvFgQphLiAEAYjx9
	 MNc6LcZvjSoloXjelIKkhTp9RISmOog2/jbfbqLu9U8ymvHKF990C0hAH98EQXuV0WoDg
	 qHn6kSLXve5av+M03hy/+MlMlSTqTKnOkp3kfsNZSQ3/GOlCLLyO0iOZlomSCMO7ifmDY
	 EKtf4Us0TIali+ZGLWtZtprBpkwK4CnihpWpAQLUlK1RONRs74jmZbkMDMuuUgO9s4FNJ
	 e3G3rbKnVxMh8GDVsGSS/6tKf0DTWtx91eLM0Qml3xgi96BCWAf9VilJlaBHiHZFLHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dPYYES9x;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D455E606A319
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 15:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D455E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dPYYES9x
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab41538192so1436373a91.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 08:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792683627; x=1793288427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HtVmAHr1JbHFjxi4X7h05vEfbt7XFmWhn+bQZDOydaM=;
        b=dPYYES9xdxWmFrVN4lb/ctoYn2hiWNYdx4b63TkcgNFN0BGcUuIQVKy07qyjkfWvYU
         CJm1JwO2vmCyLtXJO1YJR1E0601lyUkNdKr38bSacKT/ATvSCQorYAukyVNVKqilHjsZ
         efO/ifTEKBNu0qrVOSVhsV3jc/0jS+LrFGXXHtIJFjga0EnVC5vNyAq9Rl/GQMXnIpuZ
         /xd+3PARcSgLcGLxcToD70LxP8pbLR/aFBNRs0D2xp5yQ5mFbkcssOuUk3YhDUHqERP5
         DteL47HhnS9nPm+shUJUzDE3rKedSD2eWvs1697flzf5Apc08mCWqx/Ei+hxnc5vne5b
         ftnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792683627; x=1793288427;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HtVmAHr1JbHFjxi4X7h05vEfbt7XFmWhn+bQZDOydaM=;
        b=oa2FjTJClLGRUMyVTyXsLZjJ/aytPj2HYTkrKKxBIEXLbF+Oub3RsXH8JtmWG4K8Sm
         usyt15LhPV2kwR0HyIj2kBvl8/0X/x4u09/SshgiRNRbHkVojQiRwIMFWHU/VQoro39e
         yOT4EI/G23QK2Yk1WN66Nj9NP94q5URCeQ+cHUPGNSR6ol5rob5dNCTqyWkOYVy/zx+9
         D8eiyiomU1gLkdWntsDun5Z5YBpoixDZNpGOxsIGNWVas+Z/9UWpbbOgQqk1w7m4fHwP
         fA2NrUY+LPo1WVPtbtIbgprrooy/m+eBTLifw6gsNNVgAdAiMhrxgvfxllyd+3pdIm9Y
         QHcA==
X-Forwarded-Encrypted: i=1; AKwUvBwSS0Zbf+UgRp8PdDzgb86fLNqLcyU/VOiOuUCT6X0soELUmr0JR7PPltc8BH3nncfGP8rAjPPoPKN/khFRmMPnkP5R@vger.kernel.org
X-Gm-Message-State: AFq9FYKzoyeAbO3YAyF+fQFiZ+nfgwzj8lIm2lj1SWl7JirhErG2eHxh
	hc4N3PM86exctjJBDLj+wtNqIXLhidJrl5pwmIphmLOHG8rhSwQddT2M
X-Gm-Gg: AYBFou1FVSSJS0d8Y1aNOIziSzEotvyLhzS23ra2uTGC67V+5mJUIT31f+y6HAOOLPp
	1pVk8uIUlw4D1q8fqT347YhhzpzAVWwcLWyqBfkJe1cOHI9o4ei08opz8CbFlMYagsxOHJJ6MNK
	8bh8wvvP2bBbIzx2t95M9A2OVJf3ygaa82Um4cfKwgsGIw1L0Ex6DT2C+g1QzGDnMDvsTYXDPVV
	YN87hkUtDkdRGKojHJJdqiRuDYbZExA9M8fXpREYeTLsy3AErTzweXfRHsLhP33v5Uy0P0x4tlS
	TfRfKZtULGhgDsQRsdxCimhQ8Q4K0LJz3vn+96uj0AaF9oXx32JINZ1z5vc2mzJscY1cv+UG5PE
	XSYvfGu1nNI0IOFGUrxfGIqpbPfdNl8M0XeSHdpEFTU0PlBRSDjQGU3HeFxjtnXeDHzwNSdB4LV
	rzqn6YlJ6Z8TGCtxJqzKZuhOxDHqDaQripLEQ98ILZLS8nLlVEz1AO3Vk0z3y7UW2aCnCzw/4WU
	822OqX6bFXpAY3ImJr0v872Q5AoNsVopm6JxNpr+zPxogplBHJB8l0kaiBmDcn0tsrSt3egGdib
	dxKjDGoPx5j0aemL04uWaY6n
X-Received: by 2002:a17:90b:35c7:b0:3ab:e588:c29b with SMTP id 98e67ed59e1d1-3ad86dcac60mr5199356a91.5.1792683627136;
        Thu, 22 Oct 2026 08:40:27 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2607:fb91:1ec1:2666:ac39:c2d2:80cf:78f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48ed719sm4853445a91.5.2026.10.22.08.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 08:40:26 -0700 (PDT)
Date: Thu, 22 Oct 2026 08:40:19 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?ISO-8859-1?Q?Katona_G=E9za?= <katona.geza.1@gmail.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
CC: ong Zhang <i@rong.moe>, Sergio Melas <sergiomelas@gmail.com>,
 platform-driver-x86@vger.kernel.org, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Subject: =?US-ASCII?Q?Re=3A_lenovo-wmi-other=3A_no_fan_HWMON_on_Yoga_Pro_9?=
 =?US-ASCII?Q?_16IAH10_=2883L0=29_-_CAPABILITY=5FDATA=5F01_GUID_missing?=
User-Agent: Thunderbird for Android
In-Reply-To: <1d46e12b-ef21-417c-8bcb-b607ba3e32fa@gmail.com>
References: <1d46e12b-ef21-417c-8bcb-b607ba3e32fa@gmail.com>
Message-ID: <B1F08DF7-9FF1-46EF-8C79-E348C8406F03@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 22, 2026 7:49:19 AM PDT, "Katona G=C3=A9za" <katona=2Egeza=2E1@g=
mail=2Ecom> wrote:
>Hi all,
>
>I would like to ask you kind support=2E On my Lenovo Yoga Pro 9 16IAH10
>no fan speed is available to Linux at all=2E I went through the ACPI tabl=
es
>and the in-kernel drivers, and the=C2=A0=C2=A0only interface that looks u=
sable is
>Lenovo Other Mode (lenovo-wmi-other), which never completes binding
>on this machine=2E

Hi G=C3=A9za,

There is a series that was just pulled into the for-next branch that is su=
pposed to fix this specific issue=2E It is planned to land in 7=2E4 but if =
you're interested in applying it now you can find it here:

<https://lore=2Ekernel=2Eorg/platform-driver-x86/20261019-lwmi-wmi-new-api=
-v5-0-71557d28d058@rong=2Emoe/>

Thanks,
Derek

>Machine (from /sys/class/dmi/id):
>
>=C2=A0 sys_vendor:=C2=A0 =C2=A0 =C2=A0 LENOVO
>=C2=A0 product_name:=C2=A0 =C2=A0 83L0
>=C2=A0 product_family:=C2=A0 Yoga Pro 9 16IAH10
>=C2=A0 product_sku:=C2=A0 =C2=A0 =C2=A0LENOVO_MT_83L0_BU_idea_FM_Yoga Pro=
 9 16IAH10
>=C2=A0 board_name:=C2=A0 =C2=A0 =C2=A0 LNVNB161216
>=C2=A0 bios_version:=C2=A0 =C2=A0 QVCN50WW (01/28/2026)
>=C2=A0 CPU / dGPU:=C2=A0 =C2=A0 =C2=A0 Intel Core Ultra 7 255H (Arrow Lak=
e-H) / RTX 5050
>=C2=A0 Kernel:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7=2E2=2E11-200=2Efc44=2E=
x86_64 (Fedora 44)
>
>1) Lenovo WMI GUIDs present (/sys/bus/wmi/devices):
>
>=C2=A0 DC2A8805-3A8C-41BA-A6F7-092E0089CD3B=C2=A0 Other Mode=C2=A0 -> len=
ovo_wmi_other
>=C2=A0 362A3AFE-3D96-4665-8530-96DAD5BB300E=C2=A0 CAPABILITY_DATA_00 -> l=
enovo_wmi_capdata
>=C2=A0 887B54E3-DDDC-4B2C-8B88-68A26A8835D0=C2=A0 Gamezone -> "platform_p=
rofile probe failed"
>
>=C2=A0 absent:
>=C2=A0 7A8F5407-CB67-4D6E-B547-39B3BE018154=C2=A0 CAPABILITY_DATA_01
>=C2=A0 B642801B-3D21-45DE-90AE-6E86F164FB21=C2=A0 FAN_TEST_DATA
>
>=C2=A0 lwmi_om_master_bind() returns -ENODEV when cd01_list is NULL, so t=
he
>=C2=A0 component master never binds=2E As a result there is no
>=C2=A0 /sys/class/firmware-attributes/lenovo-wmi-other* and no fan hwmon=
=2E
>=C2=A0 The fan code path itself (lwmi_om_fan_info_collect_cd00() and
>=C2=A0 LWMI_ATTR_ID_FAN_RPM) only needs capdata00, and a missing capdata_=
fan
>=C2=A0 is already handled (channels hidden, or exposed read-only with
>=C2=A0 expose_all_fans=3D1)=2E
>
>2) Why the other fan drivers cannot work here (from acpidump + iasl):
>
>=C2=A0 - yogafan: the machine falls into the generic "Yoga" quirk
>=C2=A0 =C2=A0 (\_SB=2EPCI0=2ELPC0=2EEC0=2EFANS), but there is no FANS/FA1=
S/FA2S/FAN0
>=C2=A0 =C2=A0 object anywhere in the DSDT or SSDTs=2E \_SB=2EPC00=2ELPCB=
=2EEC0 (LCFC0002)
>=C2=A0 =C2=A0 is an empty stub=2E The real EC is \_SB=2EPC00=2ELPCB=2EH_E=
C (SSDT
>=C2=A0 =C2=A0 "CB-01"), and its ECF2 region has no RPM field, only FLVL a=
t 0x4A=2E
>=C2=A0 - acpi_fan \_SB=2EVFAN (PNP0C0B): _FST returns a synthetic RPM tab=
le
>=C2=A0 =C2=A0 selected by \_SB=2EFANL, which is only written through a _D=
SM call
>=C2=A0 =C2=A0 (FIDS 0x04040000), so it always reads 0 on Linux=2E
>=C2=A0 - acpi_fan \_SB=2EIETM=2ETFN1 (INTC1063, DPTF): _FST calls
>=C2=A0 =C2=A0 \_SB=2EPC00=2ELPCB=2EH_EC=2EDPTF=2EGFNS, which is only decl=
ared External and
>=C2=A0 =C2=A0 not defined in any table, so _FST fails (fan1_input -> -ENO=
DEV)=2E
>=C2=A0 - ITE8 (SIO hwmon with GFNL/GFNH =3D IT87 fan1 tach regs 0x0D/0x18=
) is
>=C2=A0 =C2=A0 disabled on this model (_STA 0, ITSI !=3D 1)=2E
>
>Questions / request:
>
>=C2=A0 a) Could CAPABILITY_DATA_01 be made optional in lwmi_om_master_bin=
d(),
>=C2=A0 =C2=A0 =C2=A0so that the fan HWMON (and the capdata00-only attribu=
tes) can bind
>=C2=A0 =C2=A0 =C2=A0on machines that only implement capdata00?
>=C2=A0 b) Mark: does the Yoga Pro 9 Gen 10 firmware report fan RPM throug=
h
>=C2=A0 =C2=A0 =C2=A0Other Mode GetFeatureValue (LWMI_ATTR_ID_FAN_RPM), as=
 Lenovo Vantage
>=C2=A0 =C2=A0 =C2=A0would use on Windows?
>
>I can test patches right away, run the module with expose_all_fans=3D1 an=
d
>dyndbg, and send the full acpidump if needed=2E
>
>Thanks,
>G=C3=A9za Katona

