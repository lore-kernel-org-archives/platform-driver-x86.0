Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA901F0991
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Feb 2026 14:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772287652; cv=none; b=IuA4IS7XPuGgASHMbzR4vgHvKLyv2QnmkZGBdc9CqxDPlJH6y+5lOj8Gf17z66HkH5gyzJpohqyoWxGfxZJuy3LsFP0IPe748tZPvD+oMVGHUblLA9aXe2CqCEy0tlzaO0kuUz+3bnA7KFX1JNDCj7GQSfCLIRm9zOxQCFnRmKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772287652; c=relaxed/simple;
	bh=NrbrnyXwTU6KncA6THfVdiuQ7U2WBTFpxBKHTUrjK5c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BHBbCE9QpjtSL4N2ATfm1OteIHEtIbv2zUhLkdnRxnvNpy/zwjvrblAb/vjxdywEyATlIiy50B2v/x7CpJ2VdM2ERHvkiNpv4myYvOhGlzPqPfI4+YGqdAqvV2n1RXebpg3+UFuweVlqPoCx7Ae9D7TZ4iFzqeZN9lIkxjLptWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUdhgmuJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUdhgmuJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E801CC19424
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Feb 2026 14:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772287651;
	bh=NrbrnyXwTU6KncA6THfVdiuQ7U2WBTFpxBKHTUrjK5c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SUdhgmuJ/UiwWU1Ru/c7w0OdFvLbgvWp+RAoj1dEyQJIfxnCWuiq9aCLlSn+/O0ZO
	 MgClrgwQvgN1Akpq7xP8PUO2VO8j1c/rf0vHfp9+wvZerf/llNLeHdZfICxq2OO2Ob
	 0B+Np/FSSIx9+5/Hvz4Y2AuCHgMR/c7k7+Jqm0EOQCOpEt8hDDS+WbXJ6f5/xGT2og
	 e9zK5dIV3rp481VEZJ2qpLTGZfDQIzJl0+HcpMgwMATHjEEE97bkD+ICwOSw6s7L81
	 YZX615dNJBpqEvmrKVRSRBS8qp28iGiAL8RXU3QDaOZOHlg8wBsIlZJMkYhTxCz2Cp
	 WEiJTWm3abFXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D63F9C4160E; Sat, 28 Feb 2026 14:07:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjExNTBdIFtCVUddIGhwLXdtaTogT01FTiAxNi1rMHh4?=
 =?UTF-8?B?eCAoYm9hcmQgOEE0RCkg4oCTIHZlcmlmaWNhdGlvbiBvZiBwbGF0Zm9ybV9w?=
 =?UTF-8?B?cm9maWxlIGFuZCBFQyByZWdpc3RlciBiZWhhdmlvcg==?=
Date: Sat, 28 Feb 2026 14:07:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: qwqgong@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221150-215701-e08cUxg4E5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221150-215701@https.bugzilla.kernel.org/>
References: <bug-221150-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D221150

--- Comment #5 from wudd_maya (qwqgong@gmail.com) ---
(In reply to Krishna Chomal from comment #4)
> =E4=BD=A0=E5=A5=BD=EF=BC=8C
>=20
> =E4=BD=A0=E7=9A=84=E4=B8=BB=E6=9D=BF8A4D=E7=9B=AE=E5=89=8D=E6=B2=A1=E6=9C=
=89=E5=87=BA=E7=8E=B0=E5=9C=A8hp-wmi=E9=A9=B1=E5=8A=A8=E7=9A=84=E4=BB=BB=E4=
=BD=95=E7=99=BD=E5=90=8D=E5=8D=95=E4=B8=AD=E3=80=82=E5=9B=A0=E6=AD=A4=EF=BC=
=8C=E5=AE=83=E9=BB=98=E8=AE=A4=E4=BD=BF=E7=94=A8=E4=BC=A0=E7=BB=9F=E7=9A=84=
Omen WMI=E6=8E=A5=E5=8F=A3=E6=9D=A5=E6=B3=A8=E5=86=8C=E5=B9=B3=E5=8F=B0=E9=
=85=8D=E7=BD=AE=E6=96=87=E4=BB=B6=E3=80=82
>=20
> =E4=BB=8E=E4=BD=A0=E5=9C=A8 Omen Gaming Hub =E7=9A=84=E6=97=A5=E5=BF=97=
=E5=92=8C EC =E8=BD=AC=E5=82=A8=E6=9D=A5=E7=9C=8B=EF=BC=8C=E5=BE=88=E6=98=
=8E=E6=98=BE=E4=BD=A0=E7=9A=84=E4=B8=BB=E6=9D=BF=E9=9C=80=E8=A6=81=E6=9B=B4=
=E6=96=B0=E7=9A=84 Victus S =E9=A3=8E=E6=A0=BC=E7=9A=84 WMI
> =E6=9F=A5=E8=AF=A2=E6=9D=A5=E5=88=87=E6=8D=A2=E5=B9=B3=E5=8F=B0=E9=85=8D=
=E7=BD=AE=E6=96=87=E4=BB=B6=EF=BC=88=E4=BB=A5=E5=8F=8A=E4=B8=8E=E7=B2=89=E4=
=B8=9D=E7=9B=B8=E5=85=B3=E7=9A=84=E6=B4=BB=E5=8A=A8=EF=BC=89=EF=BC=8C=E8=80=
=8C=E4=B8=8D=E6=98=AF=E4=BC=A0=E7=BB=9F=E6=9F=A5=E8=AF=A2=E3=80=82
>=20
> =E8=AF=B7=E6=82=A8=E5=BA=94=E7=94=A8=E4=BB=A5=E4=B8=8B=E8=A1=A5=E4=B8=81=
=E5=B9=B6=E6=B5=8B=E8=AF=95=E4=BB=A5=E4=B8=8B=E5=86=85=E5=AE=B9=EF=BC=9A
> 1. =E6=9F=A5=E7=9C=8Bdmesg=E6=98=AF=E5=90=A6=E6=88=90=E5=8A=9F=E6=B3=A8=
=E5=86=8C=E4=BF=A1=E6=81=AF=EF=BC=9A
>    =E2=80=9Chp_wmi=EF=BC=9A=E6=B3=A8=E5=86=8C=E4=B8=BA=E5=B9=B3=E5=8F=B0=
=E9=85=8D=E7=BD=AE=E6=96=87=E4=BB=B6=E7=AE=A1=E7=90=86=E5=91=98=E2=80=9D
>=20
> 2. =E7=A1=AE=E8=AE=A4=E9=A3=8E=E6=89=87=E8=BD=AC=E9=80=9F=E5=8F=AF=E9=80=
=9A=E8=BF=87sysfs=EF=BC=88/sys/devices/platform/hp-wmi/hwmon/*=EF=BC=89=E8=
=AF=BB=E5=8F=96=E5=92=8C=E6=8E=A7=E5=88=B6=E3=80=82
>=20
> 3. =E5=9C=A8=E6=9B=B4=E6=94=B9=E5=B9=B3=E5=8F=B0=E9=85=8D=E7=BD=AE=E6=96=
=87=E4=BB=B6=E6=97=B6=E9=AA=8C=E8=AF=81=E8=BF=99=E4=B8=80=E7=82=B9=EF=BC=8C=
=E5=AE=83=E7=A1=AE=E5=AE=9E=E4=BC=9A=E7=89=A9=E7=90=86=E4=B8=8A=E6=94=B9=E5=
=8F=98CPU/GPU=E7=9A=84=E8=80=97=E7=94=B5=E9=87=8F=E3=80=82
>=20
> diff --git a/drivers/platform/x86/hp/hp-wmi.c
> b/drivers/platform/x86/hp/hp-wmi.c
> =E7=B4=A2=E5=BC=95304D9AC63C8A..756b94ac4a35 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -120,6 +120,13 @@ static const struct thermal_profile_params
> omen_v1_thermal_params =3D {
>       .ec_tp_offset =3D HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET=EF=BC=8C
>  };
>=20=20
> +static const struct thermal_profile_params omen_hybrid_thermal_params =
=3D {
> + .=E6=80=A7=E8=83=BD =3D HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE=EF=BC=8C
> + .=E5=B9=B3=E8=A1=A1 =3D HP_OMEN_V1_THERMAL_PROFILE_DEFAULT=EF=BC=8C
> + .low_power =3D HP_OMEN_V1_THERMAL_PROFILE_DEFAULT=EF=BC=8C
> + .ec_tp_offset =3D HP_OMEN_EC_THERMAL_PROFILE_OFFSET=EF=BC=8C
> +};
> +
>  /*
>   * =E5=BD=93=E5=89=8D=E6=B4=BB=E8=B7=83=E7=94=B5=E8=B7=AF=E6=9D=BF=E6=95=
=A3=E7=83=AD=E6=9B=B2=E7=BA=BF=E7=9A=84=E9=80=9A=E7=94=A8=E6=8C=87=E9=92=88
>   * =E5=8F=82=E6=95=B0=E3=80=82
> @@ -173,6 +180,10 @@ =E9=9D=99=E6=80=81 const char * const victus_thermal=
_profile_boards[] =3D
> {
>=20=20
> /* Victus 16-r =E5=92=8C Victus 16-s =E7=AC=94=E8=AE=B0=E6=9C=AC=E7=9A=84=
 DMI =E6=9D=BF=E5=90=8D=E7=A7=B0 */
>  =E9=9D=99=E6=80=81 const struct dmi_system_id victus_s_thermal_profile_b=
oards[] __initconst
> =3D {
> +     {
> + .=E5=8C=B9=E9=85=8D =3D { DMI_MATCH=EF=BC=88DMI_BOARD_NAME=EF=BC=8C=E2=
=80=9C8A4D=E2=80=9D=EF=BC=89}=EF=BC=8C
> + .driver_data =3D =EF=BC=88=E7=A9=BA *=EF=BC=89&omen_hybrid_thermal_para=
ms=EF=BC=8C
> +     },
>       {
>               .matches =3D { DMI_MATCH=EF=BC=88DMI_BOARD_NAME=EF=BC=8C =
=E2=80=9C8BBE=E2=80=9D=EF=BC=89 }=EF=BC=8C
>               .driver_data =3D =EF=BC=88=E7=A9=BA *=EF=BC=89&victus_s_the=
rmal_params=EF=BC=8C

Hello Krishna,

I successfully applied the patch to the mainline RC kernel and thoroughly
tested it on my board (8A4D). The results are fantastic:
=E2=9D=AF echo 255 | sudo tee /sys/class/hwmon/hwmon6/pwm1
255

~
=E2=9D=AF sudo dmesg | grep hp_wmi
[    4.677350] hp_wmi: Registered as platform profile handler
[    6.492857]  processor_thermal_device_pci kvm processor_thermal_device
snd_hwdep snd_soc_core processor_thermal_wt_hint snd_hda_core r8169
platform_temperature_control snd_intel_dspcfg processor_thermal_soc_slider
snd_compress snd_intel_sdw_acpi realtek uvcvideo btusb processor_thermal_rf=
im
irqbypass mdio_devres intel_rapl_msr processor_thermal_rapl ghash_clmulni_i=
ntel
btrtl snd_pcm videobuf2_vmalloc intel_rapl_common iwlwifi aesni_intel libphy
processor_thermal_wt_req videobuf2_memops btintel rapl spi_nor hp_wmi
hid_multitouch snd_timer mei_me intel_cstate btbcm
processor_thermal_power_floor uvc intel_pmc_core sparse_keymap i2c_i801
intel_uncore wmi_bmof platform_profile mtd pcspkr intel_ish_ipc cfg80211
videobuf2_v4l2 mdio_bus processor_thermal_mbox i2c_smbus btmtk mei snd
pmt_telemetry i2c_hid_acpi intel_ishtp int340x_thermal_zone thunderbolt
igen6_edac soundcore videodev i2c_hid bluetooth pmt_discovery videobuf2_com=
mon
pmt_class pinctrl_tigerlake soc_button_array joydev acpi_pad mc intel_oc_wdt

~
=E2=9D=AF cat /sys/devices/platform/hp-wmi/hwmon/hwmon*/fan*_input
5800
5800

~
 Sysfs nodes are populated correctly (performance, balanced, low-power).
Switching to the "performance" profile works flawlessly and successfully
unlocks the hardware power limits=E2=80=94I can confirm the CPU reaches 115=
W under full
load!

The patch brings full and essential support for the Omen 8A4D board. Thank =
you
so much for your hard work!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
