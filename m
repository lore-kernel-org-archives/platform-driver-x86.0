Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2585B29BDB1
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760696504; cv=none; b=fz9iEECtlrdIBhFhkBHlXj7/GpGKgCSIo0OCNo9oBuMNajfPLcwKO3hmNqsMMabx/hZDgmmnszJ04jvqNP9FGrkAq+BqSPuXCiVMooCswnjZURdKdBZkUTY9GFlylbKOEBQr+mFNiXY2cFQ4385JBdP/HQ6o4O7zbI7K6az50l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760696504; c=relaxed/simple;
	bh=VXpfdSW6DdmR+9JnalJlPPwBJVNC8Zc6RDqkb4L7Pus=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OdAU1dKXHo4p4ykr0mAccT3WdSHztPADiQk2jDZKKEs72X0ic4OoV+GSHaPP7waSSh5vSqrcNE3SPK+jnkS5FpnssyYLg8b97m4Iy8/Nn1+C1+yNv8K4BKk3V89wkVouklWLIZwvTBIpskDStoKYi7d5nqKrjMDW0tl4Qd3RbFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ciLnihqw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ciLnihqw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2C6BC4CEF9
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 10:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760696503;
	bh=VXpfdSW6DdmR+9JnalJlPPwBJVNC8Zc6RDqkb4L7Pus=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ciLnihqwuFXD9vFUxZu5ehXdUmT4mAOCiZ2dQ1aPx4NK9AtQSlLNSUSzW2pscYoj5
	 8uB53wtowXyGosk2NaHG2LiaJWrkQbSvkckAPrlugdLtarPWWZ5/swoi18J3ZF0WFy
	 z/QkS7+bIk0hW5m7XpdbNd4mfWibmvTMoEDm4ctv8+D0EtqaGMklMyh8lk1IVhJGgw
	 CxqewTEo1kk8JSI5pgsNHAL7MKcG01tA165xn2ViRkiFvXRStz7Ys1acOcp3Kdkvx/
	 mjttMUsyw7b4wPT8cPRJv5otihyZxPF8m7T9zEdVcGa7fwa0gqV7D4xvQrd7rCThPo
	 aB4PcEE8aeBfQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8CFF4C41612; Fri, 17 Oct 2025 10:21:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220421] intel_pmc_core INT33A1:00: pmc_core: couldn't get DMU
 telem endpoint -6
Date: Fri, 17 Oct 2025 10:21:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: juswin.hsueh@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220421-215701-VWVqw29pU9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220421-215701@https.bugzilla.kernel.org/>
References: <bug-220421-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220421

juswin.hsueh@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |juswin.hsueh@intel.com

--- Comment #6 from juswin.hsueh@intel.com ---
Update from Xi:

The following patches have been submitted and accepted by the maintainers:


1) platform/x86:intel/pmc: Update Arrow Lake telemetry GUID=20
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git/commit/?h=3Dreview-ilpo-next&id=3D644ab3bc98ee386f178d5209ae8170b3fac59=
1aa


2) platform/x86:intel/pmc: Add support for multiple DMU GUIDs=20
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git/commit/?h=3Dreview-ilpo-next&id=3D3b603955f2423cf668ebd5ba670019a5b4960=
cc5


3) platform/x86:intel/pmc: Add DMU GUID to Arrow Lake U/H=20
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git/commit/?h=3Dreview-ilpo-next&id=3Da32f7d76e3cd7c4170db44d109661d657cfa5=
e21

patch 1 is needed to fix the dmu error in Arrow Lake S platforms. Patch 2 a=
nd 3
are needed for Arrow Lake U/H platforms.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
