Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6A338424A
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 23:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773531713; cv=none; b=naiLt8bsNQlgA+sGDUhxk+3AG2w2BtNhNP1bThVoh6X0hjq3BAaRcVm+ml5aqjMMCABmyae3oIDc2DyjZRT4qNbV77S7C0wVGRCqqEhYfSKzDA8T2eDtjk8HgQ8Syomi502y0GDE1ZkNdw4rCtKcJTra6d8Qn78F2NTd5rZklok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773531713; c=relaxed/simple;
	bh=U1ypbPlsguuBhrQot+0VoeZ6sksU8rVf9etubggyC5s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tV/5bULHRSWnmT674AgGkEkmfbNWcfK2jK31gT7HW96zo4uUyv0ZtlmbfjqY/WPqr3ygSHkRUyy3zevvFrtRVw2Dh3m1vGNH32q6cwi8BBQK9eB/IB/iOjVYVpQLYez5p1Jm9pKkUxArsr7CBTl58XfpvmzdSwacmkZX0w4LQv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u4BRdhnw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u4BRdhnw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63DDAC116C6
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 23:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773531713;
	bh=U1ypbPlsguuBhrQot+0VoeZ6sksU8rVf9etubggyC5s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=u4BRdhnwOFW5NrKvzMo07rdOx6XY7f01tZwII3k5/4MLpS4VJ+Mjd78SuzHQWAJfm
	 RiXOtWLGVtuLJFdLIbudliT8d3CP8TfbG+Nv0LPhlQqZ3Oyi3g9utbAqhakMm/pvNa
	 oj5DSIL78ryQzw5WLg47kEnuvc3XXDS6El+O0iU7ROPyhn97ZEva1A3uXZHzpZtk3g
	 G6Id47GhykEDwOxtI02ilFxf4WQRs8Y0CrEW/4wlPt9xfOA0GK6p6ltFtwnoc1VNdo
	 6qz/rVhQGzLXolZ2C8TZ2/73M3jOMNNvdzaKx87gHDHY4vIcGwX4mj6awW8y2Qy/lF
	 flM2pec4eCzPQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5C084C53BC9; Sat, 14 Mar 2026 23:41:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Sat, 14 Mar 2026 23:41:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ptscheepers@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-eJB4iT4FZG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #353 from Theunis Scheepers (ptscheepers@gmail.com) ---
(In reply to Denis Pauk from comment #352)
> (In reply to Theunis Scheepers from comment #351)
> > Requesting addition of ROG STRIX X870E-E GAMING WIFI to the
> > nct6775-platform.c ASUS WMI board allowlist for stable fan PWM control
> under
> > Linux.
> > --------------
> > A full data tarball (DSDT binary + decompiled, sensors-detect, dmesg, P=
WM
> > override test, hwmon drivers list) is attached to:
> > https://github.com/zeule/asus-ec-sensors/issues/100
>=20
> The dmesg log attached to github issue does not have mention about resour=
ce
> conflict or applying some custom parameters/patches.=20
>=20
> Have you applied some patches or custom parameters for the kenel? Could y=
ou
> please provide dmesg messages before and after applying patch or custom
> parameter?
>=20
> Use comment #350 as example of patch.

Hi Denis,
Testing results for ROG STRIX X870E-E GAMING WIFI.
System Info:

Board: ROG STRIX X870E-E GAMING WIFI (DMI vendor: ASUSTeK COMPUTER INC.)
Kernel: 6.19.8-1-cachyos (CachyOS, Arch-based)
Chip: NCT6796D-S/NCT6799D-R

Key Finding:
This board needs to go in asus_msi_boards[], NOT asus_wmi_boards[]. The ACPI
WMI device has UID AsusMbSwInterface (not ASUSWMI), so asus_wmi_boards[] do=
es
not match.
BEFORE patch (ISA path):

dmesg: Found NCT6796D-S/NCT6799D-R or compatible chip at 0x2e:0x290
No WMI mention in dmesg
PWM writes via ISA held intermittently but firmware can override

AFTER patch (WMI path via asus_msi_boards[]):

dmesg: Using Asus WMBD method of AsusMbSwInterface to access 0xc1 chip
WMI read confirmed: ret=3D0 tmp=3D0xc1
PWM writes persist for 22+ seconds
Fan RPM responds correctly: 1468 =E2=86=92 1153 RPM when setting PWM to 200
Firmware does NOT override manual control

The patch (one line added to asus_msi_boards[] in nct6775-platform.c):
       "ROG STRIX X670E-I GAMING WIFI",
+      "ROG STRIX X870E-E GAMING WIFI",
       "ROG STRIX X870E-H GAMING WIFI7",
Full before/after dmesg logs and PWM test results attached if needed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
