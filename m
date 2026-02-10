Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6024738A299
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770746168; cv=none; b=Aw2SOPFeFRFnMXB8S3NEK/IFyZ9QeAUlwgwqPmbHs8KV9tl8VH0PI4C39J7uBCTgh9bV+vcjyZ2nxiru4WOr1sG4SccnKY8vpEcIz95ZpqrKGL89NVM8O0nhCK7hXmQRvGKA6X0FUXlhm+tsZQEec5Qv+F0p58rzbPv3znELdYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770746168; c=relaxed/simple;
	bh=R6KePsAuzfFopHMm/jjknVbz/stnbusHqGy2JqPib30=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YiGvALUcr3byBKHXA0uE3MhfPzZFjGlhuUeTiJpggaFgs5K90b3L3lc2e1+YMJRSk7DTUqhyELLYLZke0QC2mi5Ctq/clNJ8EzE7FT7x/Q8/1MruThEpizS+MVe0D2F721jQEQ9X4wbCJdIbWcEKTWHwKLBr2t+ia6mWRrCkdV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RsUMWJkN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RsUMWJkN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13FA6C19424
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770746168;
	bh=R6KePsAuzfFopHMm/jjknVbz/stnbusHqGy2JqPib30=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RsUMWJkNPk3QKF/kPsE+EiI9j9eBPkPMGGm9nQSkSQvQwVXF8r0tbcr3+YJZgZSNL
	 2fL/v6837F/8TPaaKOmfgIqjgzrByFVHCnwBgFLmKBKtpBmZrJY8Uzur8k1K3LLpEq
	 Ddda2JLbQ2alDqp7CFE1IJp7TMCraa0bena//Inl5Az/qSiRN66qzCOE5m0gcqXGGH
	 /LPss0so9rre1wHqHIZqm7ayKwCp44S0DzKO9QSPZZ3WPTvfzEk+iEVyMw32ss0YWN
	 ATdbzvHV5W1SRs4oM6F6JOliiehw5fhRoPQ9kXGCdVs/fSMPzqKjLMp+b6wHGdQTMS
	 Z4ERfcxmSE06Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F38C3C3279F; Tue, 10 Feb 2026 17:56:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 17:56:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221065-215701-k16TlArAdq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

Avraham Hollander (anhollander516@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |anhollander516@gmail.com

--- Comment #3 from Avraham Hollander (anhollander516@gmail.com) ---
I'm also seeing this on an IdeaPad 5 2-in-1 14AHP9 (83DR),  after upgrading=
 to
Linux 6.19.

I'll attached dmesg and acpidump, but this is not a vanilla kernel, so take=
 it
with a grain of salt. This kernel doesn't have debugfs, so I can't provide
that.

/sys/class/power_supply/BAT0/charge_types is [Fast] Standard Long_Life.

/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode is 0.

I'm using the BIOS default charging configuration and haven't set up any we=
ird
ACPI stuff, afaik.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
