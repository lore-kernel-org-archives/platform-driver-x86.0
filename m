Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEA99479
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 04:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712724562; cv=none; b=nouA+s8yxmMKuwoKvkx/AGgc2yJ6twgciny3k3A8TMzXdwuGzPO66O3wA75ooF/634PT60XI0+LHC32W+NMF8e0zmqwJE+GhYBkYhrfFpn5cllWvuvikapHFtJbnYvkYDcDW3eZGsPD7pMZn5jolhwQJgWV/27HDpiZq5zMl2zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712724562; c=relaxed/simple;
	bh=xEEH8lWEKENKPuIJkNEX9G/C/kFNuaFozhPURfDiyeo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KMZIAcF9jfpyxDYf8mITGm/OAhhA1VrYeG15Gbqs0P39m+Od/MLOVkIDMGM9a5V2sd5rIbr4PEVDjfU9t9eL/22NQCNPbUZZiBQwGnyEwHceIUOe3D8Rh445LSnX53EhwBLik4LTomspNbDfLNVpc2bxhuy5p+I8UHrStowBbW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Chk9tu/k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Chk9tu/k"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70625C43390
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 04:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712724561;
	bh=xEEH8lWEKENKPuIJkNEX9G/C/kFNuaFozhPURfDiyeo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Chk9tu/kM6B0DBDUPn74hbBCdqd57J5yD85Q/a6zlX3Hxpke3uejL6wXucnT1cevb
	 AajoCusDlMYbpH1rxHVnholvaVj7ALkqw2MOZTRjuD431/H+l/BF4UghxMn9aZagfp
	 4iCWfJiJKdpBHB00WFXBJH3UIVz1WQDFhtNTlFBYrQSdwTReVTre5iGAWtag3suCLn
	 N8CEGTB+kie1nynNUl24IIO28Ac3DWVEMCdoyklVRbSu7P8DagOCDLKo7XBPqS8nhE
	 YmstPu3+AmNWnp2R4Lkis1CIjvZzDuCKJZtJCpy+L5/2DVHuuwjGH+ltUrPjA31Lq4
	 wQAJjvQ+4CfTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 59868C4332E; Wed, 10 Apr 2024 04:49:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 04:49:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-Y00DcBTTzf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #13 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
OK, from that log and your acpidump it looks to me that it supports these P=
MF
functions:

APMF_FUNC_GET_SYS_PARAMS
APMF_FUNC_SBIOS_REQUESTS
APMF_FUNC_OS_POWER_SLIDER_UPDATE


The one that is specifically causing the conflict the ASUS driver is
APMF_FUNC_OS_POWER_SLIDER_UPDATE.  This is what causes the ACPI power profi=
le
to get registered:

[   71.242252] amd-pmf AMDI0102:00: SPS enabled and Platform Profiles
registered

When the profile is moved it calls APMF() with an arg of 8, which calls PMF=
8():

                    Case (0x08)
                    {
                        PMF8 (Arg1)
                    }

PMF8 outputs some debug using M460 but eventually calls APX8():

            Method (PMF8, 1, Serialized)
            {
                M460 ("FEA-ASL-\\_SB.PMF.APMF Function 8 call PMF8\n", Zero,
Zero, Zero, Zero, Zero, Zero)
                CreateByteField (Arg0, 0x02, M490)
                M460 ("  Slider Event Notification: 0x%x\n", M490, Zero, Ze=
ro,
Zero, Zero, Zero)
                If (CondRefOf (\_SB.APX8))
                {
                    M460 ("  Call OEM ACPI APX8\n", Zero, Zero, Zero, Zero,
Zero, Zero)
                    \_SB.APX8 (M490)
                }
            }

This updates a "PMTP" field:

        Method (APX8, 1, Serialized)
        {
            PMTP =3D (0xD6080000 | Arg0)
        }

That PTMP field is part of an Operation Region used for Port I/O:

        OperationRegion (TP80, SystemIO, 0x80, 0x04)
        Field (TP80, DWordAcc, NoLock, Preserve)
        {
            PMTP,   32
        }

To me this looks like the system should probably be responding to power sli=
der
events from the amd-pmf driver.  Do you find that various CPU coefficients
don't get updated even when you've changed the power profile when amd-pmf is
bound?

If they do get updated, then I think the bug should be in asus-wmi.c that it
shouldn't be loading a platform profile because amd-pmf is taking this role=
.=20
Perhaps the DSTS method has an unknown bit to indicate this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
