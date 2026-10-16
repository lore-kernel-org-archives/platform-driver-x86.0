Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178D5346E51
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 07:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792136276; cv=none; b=pjrqQefstQdW71ocPV/3UVmaPP8FI9Hz6iNFdju4SlU8CVdWXSMYeSJ2urk3m4vZRAibddfMkOnfHD1vucr3BjphZY/hIg7/s3+6Bwj8afjMlAMf748efMLna0YNDoskROoWw4CVl/eXHwAACtCsEAwXrbdfZm/sPp0ecFM6g18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792136276; c=relaxed/simple;
	bh=XUURVs/qx88pIHsB+ZI+6sCZB1sCDVLH8QTqR4Xo82s=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AgXGdaBeSOAxev+7IA36veukGzr7MLz3DIu91cwZtPetW3BgZyuf6/AGQHf2VYAhQBrAIcmwIZD2zFRUAE5QIV4ejFPyzsFeXySfEb6RxwPu+mfXN1ahEz2N2nsMd8QcxZJrGJwBM39UhR7mHaAWKxGgqPGLjqcQvkRiVP0juNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GU9wffMw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GU9wffMw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8862BC2BCF4
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 07:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792136275;
	bh=XUURVs/qx88pIHsB+ZI+6sCZB1sCDVLH8QTqR4Xo82s=;
	h=From:To:Subject:Date:From;
	b=GU9wffMwUhDq4Uqrnx1bFRfLBRULGW+DSt16bfxdKQRSLo+1sW+wHOHAl2cja4Son
	 SzgGkkn5ilCxBILsCMUX8Q36+9rhxIV3WjHUGkOZph3WbzwQO8UiM1vOykYfXbCbWe
	 J1N2uketyKA7MDHcy/to2UFG/CGDLm/fGYfnhxXjechm39Csg6HIiDp7NPuR4xr1oS
	 EaqzJ8T4kt+gfmicXNdv8w6UCvfUB74moTJx3911lpsyXGcMmpkVSvq+C5FxIuhFm5
	 rZA9fYLDv7kwzEDSmKvRKBXO6FaPA4kuZTK6ipzSXQ5shQSzoxYIs5guQZFdrbv+fU
	 +LMX5I70M01mA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 632A6C3279F; Fri, 16 Oct 2026 07:37:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222138] New: hp-wmi: HPWMI_GM queries fail with
 AE_AML_OPERAND_TYPE on OmniBook 5 16-ag1xxx (8DF4); firmware WHCM never calls
 GMCF
Date: Fri, 16 Oct 2026 07:37:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-222138-215701@https.bugzilla.kernel.org/>
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

            Bug ID: 222138
           Summary: hp-wmi: HPWMI_GM queries fail with AE_AML_OPERAND_TYPE
                    on OmniBook 5 16-ag1xxx (8DF4); firmware WHCM never
                    calls GMCF
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: lorenzocollevecchio17@gmail.com
        Regression: No

Created attachment 311136
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311136&action=3Dedit
acpidump

Hardware: HP OmniBook 5 Laptop 16-ag1xxx (16-AG1002SL)
Board: HP 8DF4
BIOS: F.12, 04/10/2026
Kernels tested: 7.2.9-2-cachyos, 7.2.10-1-cachyos; also seen on
Linux Mint 22.3 (6.14.0-37-generic)

Symptoms (every boot):
 - \_SB.WMID.WHCM aborts with AE_AML_OPERAND_TYPE (three times at boot)
 - hp-wmi: "Failed to apply initial fan settings: -22"
 - \_SB.WMID.WQBC / WQBE abort with AE_AML_OPERAND_VALUE (these go
   away with modprobe.blacklist=3Dhp_bioscfg)
 - hp hwmon device exposes only pwm1_enable; no pwm1, no fan inputs
 - acpi_fan works (fan1_input)
 - ACPI thermal: Invalid critical threshold (-274000), no valid trip points

Analysis (Krishna Chomal, on the platform-driver-x86 list): in WHCM,
the case for command 0x00020008 (HPWMI_GM) only does "RTCD =3D RTCC" and
never calls the dispatcher GMCF. Local2 is therefore never assigned,
and the later DerefOf (Local2 [Zero]) fails on an Integer, producing
AE_AML_OPERAND_TYPE. HPWMI_READ/WRITE commands still work.
This is a firmware bug and cannot be fixed in the driver; a driver
change to hide pwm1_enable/fan inputs when the fan count query fails
has been proposed.

Related: bug 222107 (board 8D9C), bug 221385.
acpidump and dmesg attached.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
