Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D5B1494DB
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 13:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727961100; cv=none; b=Xg6/V/N4+6bVWSb14H9SxXELofNEI29sHwHEO3Xsb3vz+YcoA2AeO9f5pThnZHdDUpOdPzAwXfl55abGiAhJEhjqMAa8e3MixPNaHCecrawhb3jqxBe6NSG1/QTWgwSRlpmLExrV7tq4Y4aYY10XcCKExbNwPFcefT+LZbsq24A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727961100; c=relaxed/simple;
	bh=fKoIBvgtCnI3gICEo4zIu5Fjh5K0lKTmhwiYx/DNvGk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bGIIthYAoeKaHcqLow3XT8p+nYp0VH2nSsj5NSlSSlgYybFxXu1idGgRRcApD0yt+aiXYW+Lu2Qen8uFckdyJZmcZk8v/llvHQWJRLIIbJTgBLSf5SbeYC7mYtOWt9Qg/j1YpU9VW8pble5wDCplYDTBFqIvec0fH1EIqNQ+wAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TINAOSYZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TINAOSYZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5770DC4CEC5
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 13:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727961100;
	bh=fKoIBvgtCnI3gICEo4zIu5Fjh5K0lKTmhwiYx/DNvGk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TINAOSYZ4s2ZlJQJ+3wkkWTceHdy2bxEHOCUMxa3v5hbvHe5p378A4MxxQcWhFrHZ
	 1TOLWRTvWifiVLWbD0aVnLZUa/zH91bL8IBDPBjoUA4rPkBtH3bVfMLLKQ1kjw9CFd
	 puW1QfO7A/Sz2u2F0m0db9OVwHT1SpTo9xiFJQEXoOgpih2M3dRsTQG18LBESq0hZT
	 xEUZagUpa/VMafsEYjJGvedHFjRF/vXdXjzGZCKLW03tpgji+Jtr9rYzJZronVH70V
	 SNHOTxyJrNq6wG/EJqpo1ZJLe5peePwl+XPw80qx14O7ekQmL2OEWElVraZpBFy00s
	 mWdNKviV2H0hQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 39F63C53BC1; Thu,  3 Oct 2024 13:11:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219346] [BISECTED] Disable ACPI PM Timer breaks suspend on all
 Amber Lake machines
Date: Thu, 03 Oct 2024 13:11:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219346-215701-CVLRiJrmLl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219346-215701@https.bugzilla.kernel.org/>
References: <bug-219346-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219346

--- Comment #5 from Todd Brandt (todd.e.brandt@intel.com) ---
And yea if just disabling this fix completely for kabylake and amberlake is
what it takes that's fine. These are older systems. Perhaps in the future we
can figure out what the issue is and re-enable it for these two platforms.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
