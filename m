Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F791DD0C7
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 15:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749827100; cv=none; b=DWx8gpPwLwsLE1v6PNj+ZMNYSLoHBdihXk5KYU2h4teOB+kE7zL46VRsrltOT+MiWA8H4mPIbCA3GyzKIntCfGc1FExl+GKH7K9MmHsB1EjoNf9ZEC6wZVMkh0ID4C8BE4cO2nGYDbCmr+pQMAzBc00DxPX84HnKqrzYChNZgWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749827100; c=relaxed/simple;
	bh=8IX3jUSziLgN2Ygj9zYOXLlwI+SdpHY8crIx7TJ1ynI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GlRFDB8OGd/9SRu3JCBFLak+BwKXCDGqFe59z0hjLWZ5REV2231y3Gt39OblmUbeejoKqcOpTy6E9sitSep+VtcMYCFecfMQG5Z0twd1kxlaw3ow8ESoxiattv45uRQSrLbv4Ye2/22724tkVm7MvR0CcMH7/pd7cSTzFutYVQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GLa7Ej7G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GLa7Ej7G"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BB96C4CEED
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 15:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749827100;
	bh=8IX3jUSziLgN2Ygj9zYOXLlwI+SdpHY8crIx7TJ1ynI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GLa7Ej7GH56+bLyswZKe4D+ODcInyXYWkDG8LquvryO0K7PkXEPQOQw/AllWP/gd6
	 zWQAzhrKYVFrKnhz6RDdEV4xDUbDqsTCy2j4ZY64yBpUUPFVTMA/c9yFseV5TXHi8C
	 7u/jr312+sVrbExLwNYSflFr1IZIJLvSRyREjWrypmfxd2BgYJWatJv6fh0fqWH33c
	 yHWtxrRp6DYri8GCifxgjBEfWGBZ5Zx7cALHA4x0NSKCu4ZI75DnOYFbKXIm0GOKd2
	 AKWmNbK/SsoB/HfAPlncOz/50DY7xU8RR+4EXIpGcck7eR6lqDpIQqTvxX+PGCLExR
	 40GcBQLc7luxA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6068BC4160E; Fri, 13 Jun 2025 15:05:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Fri, 13 Jun 2025 15:05:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220224-215701-80Do2tI38D@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

--- Comment #21 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> And yes, downstream is patching that module.
> https://github.com/CachyOS/linux-cachyos/issues/483#issuecomment-29706690=
01

OK - work with them to see if the downstream patches are causing the proble=
m.=20
If so we can close this bug here.  If it's happening in an "unpatched" dist=
ro
kernel let's get dynamic debug output from that as well.

> Do you think updating the BIOS is advisable at this point?=20
(The update is from November 2024, but as usual there is zero documentation
about it.)

Generally speaking; BIOS updates on AMD are a good idea.  Security
vulnerabilities get fixed, performance improvements etc.  But if it's it yo=
ur
only machine, totally your call.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
