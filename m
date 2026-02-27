Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC85E330334
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 12:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772197148; cv=none; b=MaZo8V0K6Sv/IGmMAfu4IB+3wt6PPp6NnvzUzvbpR+m5IfOOaXGqFqHL+lbMZVtJ1+IWfmp0KqgCSj7ACNJYedW6X2o1WLwmYfOorlNvH72TYhSPhdPHmJcnTH0KDkesfJo4s3yYiK6i1KLTEWXc+dbIH1l9co3gRWZEOVfJ3fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772197148; c=relaxed/simple;
	bh=+mSvZCLKJSiLonx2Vp25fJf9pvWFev49SDQ4hLw8eFQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=COYxMRya9UKKPJstap/fVDGy5fYBWytWBXmFiE4Wi53yIW7VNsioiubl27XEPoBne2YYaaguSvc2juIeO+/Y1odClmO2Jp6LJIu/4DVCDC4fPTdbyFNverQVRgLAmWcH6P4SaKNiod9nEE2TBE4mzRyhCLHrdN3T6eS2LEevA1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WkVP3dk3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WkVP3dk3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52F3AC2BC87
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 12:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772197148;
	bh=+mSvZCLKJSiLonx2Vp25fJf9pvWFev49SDQ4hLw8eFQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WkVP3dk3mT7UebX/QcSBjgHMhsx5WRN0pAcpkcmXh/ACA+g4BFVLn6/ckaJEUHV7p
	 8fpsJf2YXUBFHIQjFT1jN1GBUCBA/Mr1uHSuDLH6GO9/q2/FltdfDaqBHO8l8xCwZ/
	 DIVih2VsPipMKTqmPfZeDE4dOaCj+DbGoWBF2gFNTly76g7pfz5O7H6iht2fXF77yx
	 Y6D1Jn+0Ehek6eFLRokg3ZWil3ZEh2w3Zm+GrULX4ytEGmF/k2qqo9Q/wePTXskkl6
	 AT0y964iHT8F3+oc6jZNQUoukEaXDtFJ51AHdtZGbGSfwpMu0r9LJi6qPaHSEguc4X
	 Woj2XszVxGGFA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3633AC4160E; Fri, 27 Feb 2026 12:59:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221149] hp-wmi: Fan control fails and RPM always reads as zero
 on HP OMEN 16-wf1xxx (Board 8C76)
Date: Fri, 27 Feb 2026 12:59:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221149-215701-xRsUNHEXpO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221149-215701@https.bugzilla.kernel.org/>
References: <bug-221149-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221149

--- Comment #3 from Krishna Chomal (krishna.chomal108@gmail.com) ---
(In reply to Enderlava from comment #2)
> Hi Krishna,
>=20
> I successfully applied your patch to the 7.0-rc1 source and recompiled the
> kernel. Here are the test results for Board 8C76:
>=20
> 1. Registration: success
> `dmesg` shows `hp_wmi: Registered as platform profile handler`. The previ=
ous
> ACPI/WMI errors (error 0x6) are completely gone.
>=20
> 2. Fan Control (Write): success
> Writing 0 to `pwm1_enable` successfully ramps the fans to maximum speed, =
and
> writing 2 returns them to auto mode. The physical fan control works
> perfectly.
>=20
> 3. Thermal Profile / Power Limits: success
> Switching to the performance profile successfully raises the PL1 limit to
> 130W, unlocking the CPU:
> Profile: low-power    ->  PL1: 55 W  |  PL2: 130 W
> Profile: balanced     ->  PL1: 55 W  |  PL2: 130 W
> Profile: performance  ->  PL1: 130 W |  PL2: 130 W
>=20

Great! I see that you tested AUTO and MAX fan modes, however with recent
improvements you can now use MANUAL mode as well by writing 1 to pwm1_enable
and using pwm1 file for the fan speed (0 being off and 255 being 100%), ple=
ase
let me know if that works as well.

> 4. Fan RPM Reading (Read): fails
> Although the fans physically spin up and the control works, reading the
> hwmon nodes (`cat fan1_input`) constantly returns 0 RPM.

This is really strange, could you also try the below patch, read from
fan1_input (when you feel that the fans are spinning and the RPM should not=
 be
0) and paste the dmesg logs.

# dmesg | grep hp_wmi

Thanks


diff --git a/drivers/platform/x86/hp/hp-wmi.c
b/drivers/platform/x86/hp/hp-wmi.c
index 304d9ac63c8a..e58c5f0dfe8e 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -185,6 +185,10 @@ static const struct dmi_system_id
victus_s_thermal_profile_boards[] __initconst
                .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BD5") },
                .driver_data =3D (void *)&victus_s_thermal_params,
        },
+       {
+               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C76") },
+               .driver_data =3D (void *)&omen_v1_thermal_params,
+       },
        {
                .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C78") },
                .driver_data =3D (void *)&omen_v1_thermal_params,
@@ -621,9 +625,12 @@ static int hp_wmi_get_fan_speed_victus_s(int fan)
        ret =3D hp_wmi_perform_query(HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY,
                                   HPWMI_GM, &fan_data, sizeof(u8),
                                   sizeof(fan_data));
-       if (ret !=3D 0)
+       if (ret !=3D 0) {
+               pr_info("[read] fan query failed with ret: %#x\n", ret);
                return -EINVAL;
+       }

+       pr_info("[read] fan_data: %*ph\n", (int)sizeof(fan_data), fan_data);
        return fan_data[fan] * 100;
 }

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
