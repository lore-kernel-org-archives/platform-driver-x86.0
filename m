Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8757A46C4AA
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 10:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792231638; cv=none; b=W93e75oP/zwgtpP1i1AU3tF76+rtjY9WGPm6iDjqHJupvWxy8vE/KlzCNlVViaWHNEKYGi4vhYExxMTY/O13vG/u/DQWuKI7hPRc49h74Y2X9yvIbSqpDQJEB5QMbUPUW4ronTwVuGfa5JG2P4K3/EAvuQUAHCO88lv6CR4LOLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792231638; c=relaxed/simple;
	bh=PUdzcVK0JjYnor4KMwvFTuYS4aKwTqPioE211mf8Ceo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OHZFXB03SpFET0MBDhFQMkd7OhCvRTSh2nrMZoWV4bL2iKM+ZiPDq9AcvSFGsWC5u8ghfTJm1WL2y27lhfKaooZY58GaxhkwGbqc4/y9H3L7CUayQ6xe+qqpxCjQ6G2BBCSDMHBVcFYz8Q40TW2bhAZd9lxjQdHrFdjQcs1nOYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q3cuAVp5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q3cuAVp5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05490C2BCFA
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 10:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792231638;
	bh=PUdzcVK0JjYnor4KMwvFTuYS4aKwTqPioE211mf8Ceo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=q3cuAVp5FTZMUGShLlCsNKSCuhhd1Z/UWv10FZKACDTNMlOkphZID1B1gGvqVFn7n
	 7U8hBfy0+Hv0Wk7NZ7XeloIuBnQo1LtfnJ7dravDLzhNTCbtgmdKeRBZW5QQj+IyqF
	 xdtn5DnJuJjegM+WcwgS/+pME3WH3G/5pfTK76w+I9g9PIb7oWyU6ptI31iJ8C4t1p
	 yLuYh7gz/2ZZ5E+H4G98o8YhXivhvuQ79ngAV9d/N4YJI61KjPiP/lQ7unvaRN1Hlx
	 cyZVHsTXPx1yg3h3vhq8tBYxHsFgTq6oIzTpfLHlnYbf25Rr+pliothatxN3xRK83X
	 8Esf2XCpStIrw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D1A48C4160E; Sat, 17 Oct 2026 10:07:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222138] hp-wmi: HPWMI_GM queries fail with AE_AML_OPERAND_TYPE
 on OmniBook 5 16-ag1xxx (8DF4); firmware WHCM never calls GMCF
Date: Sat, 17 Oct 2026 10:07:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lorenzocollevecchio17@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222138-215701-ZVUxoukn0w@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222138-215701@https.bugzilla.kernel.org/>
References: <bug-222138-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222138

--- Comment #4 from lorenzocollevecchio17@gmail.com ---
(In reply to Krishna Chomal from comment #2)
> Created attachment 311148 [details]
> Proposed patch for disabling fan support in hwmon
>=20
> Hi Lorenzo,
>=20
> Could you test the proposed patch and check if the WHCM errors appear only
> once during driver init and not regularly.
>=20
> Also, all hwmon attributes have been disabled, this includes:
> - pwm1_enable
> - pwm1
> - pwm2
> - fan1_input
> - fan2_input
>=20
> Thanks

Hi Krishna,

Tested your patch on the HP OmniBook 5 16-ag1xxx (board 8DF4, BIOS F.12).

Base: stable v7.2.10 (drivers/platform/x86/hp/hp-wmi.c), built out of tree
against 7.2.10-1-cachyos. Your diff does not apply to v7.2.10: hunks 2 and 4
fail, and the helpers hp_wmi_fan_control_supported(),
hp_wmi_fan_table_supported() and hp_wmi_get_active_fan_speed() do not exist=
 in
this tree. I ported the same logic by hand:
  - added int fan_count to struct hp_wmi_hwmon_priv
  - in hp_wmi_hwmon_is_visible(): return 0 for hwmon_pwm and hwmon_fan when
priv->fan_count <=3D 0
  - in hp_wmi_setup_fan_settings(): priv->fan_count =3D
hp_wmi_get_fan_count_userdefine_trigger() right after priv->mode =3D
PWM_MODE_AUTO
  - in hp_wmi_hwmon_init(): the dev_info() and early return after the
IS_ERR(hwmon) check

Result after insmod of the patched module (stock hp_wmi unloaded first):

[ 1125.137950] hp_wmi: loading out-of-tree module taints kernel.
[ 1125.759817] input: HP WMI hotkeys as /devices/virtual/input/input27
[ 1126.171893] ACPI Error: Aborting method \_SB.WMID.WHCM due to previous e=
rror
(AE_AML_OPERAND_TYPE) (20260408/psparse-545)
[ 1126.172052] hp-wmi hp-wmi: No usable fans reported by WMI, disabling fan
support
[ 1126.582653] hp_wmi: Registered as platform profile handler

  - WHCM is logged once during init (the stock driver logged three, followe=
d by
"Failed to apply initial fan settings: -22"). The -22 message is gone.
  - /sys/devices/platform/hp-wmi/hwmon/*/ contains only: device name power
subsystem uevent. No pwm1_enable, pwm1, pwm2, fan1_input or fan2_input.
  - Not regular: dmesg | grep -c WHCM was 4 (3 from boot + 1 from loading t=
he
module) before and after calling sensors twice, and it stayed at 4.
  - The platform profile still registers (quiet balanced performance).

acpi_fan is unaffected by the patch: fan1_input is still present and readab=
le
(it showed 0 RPM during a stress test at 80 =C2=B0C).  Tested-by: Lorenzo
Collevecchio lorenzocollevecchio17@gmail.com

Thanks,
Lorenzo

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
