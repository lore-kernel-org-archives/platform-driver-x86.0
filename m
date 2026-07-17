Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D9E3BBFD5
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jul 2026 06:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784270929; cv=none; b=ApIpu2g0ButtC5dnFbilVcglP1AslOYpvbNWaQAh9CPP8FXjiWRHZ03Ui73p+i+k/5sq2x9HFF8Yk4PCYh43k8eyTz2Kh604y0CLL01hZ8bTql+7y2YkxR2XhRq+m7z1UnNB9ZsrWyCwtprTXU5BFl6cOGdG1Cce1bHRVTlzeVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784270929; c=relaxed/simple;
	bh=mC83BgCB8gJNj2qAY4F57QN3P8hPc9I8PosthI4hnHs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iphzAtnou5TG2iesDWVZ05WxFBopkeMBkPiycUF2P1sFhUFuw/FT7pDIu5/toRoh9B8NWV6XCdjlRkbY1pgEcMcfweRFGTNttLBGpwgmTi7Yq6obNQKQnsz4T9zEDgJK6+/O9LJYahGsIMLklx3dcm5VkoHf4qagfi7mNNJYBvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sKEHWsHb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sKEHWsHb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2E10C2BCC9
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jul 2026 06:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784270927;
	bh=mC83BgCB8gJNj2qAY4F57QN3P8hPc9I8PosthI4hnHs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sKEHWsHbEvzYrhrLhLNaz2AZYpizqcCjDE1ocSLwNmKuXP7XUCgdd7Avd5XINNgCb
	 AcUwUmvogWAhf6HgqRcvByEtkQdNIuomY09hfZuHKueZB8G2OcBrWgE/YE5zbUdnCo
	 2/dO4oDnCVV0sw93+5gCQgC4t3TUUeJVO9DKTNOA8M1h34R05lesgamgE3i0Axi6OB
	 hqbkk76cuHwFAZ1hURnGpzcHOn5TERiQ7qtMTYB9OjaYywZ7eH+WC7Lc7GJ8GeZ9h8
	 X7sFaV8bwX79C8Efynt+AA3Sf56bbv6DNkehS1qMUlg+H65IE//M24iPV77n/jT3P0
	 KzP81TJsKukSQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C2FBCC3279F; Fri, 17 Jul 2026 06:48:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221759] amd_pmc: failed probe leaks LPS0 handler registration;
 subsequent probe hits list_add BUG in acpi_register_lps0_dev
Date: Fri, 17 Jul 2026 06:48:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: francisdb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221759-215701-OIbRxpJmHi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221759-215701@https.bugzilla.kernel.org/>
References: <bug-221759-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221759

--- Comment #2 from Francis DB (francisdb@gmail.com) ---
Tested the series on the reporting machine (Framework Desktop, FRANMFCP06, =
BIOS
03.05), applied on top of vanilla 7.1.3 (plus the unrelated amdgpu device-l=
ink
patch from bug 221073). All three patches work as intended here:

1. The reload BUG is fixed. With enable_stb=3D1, repeated `modprobe -r amd_=
pmc &&
modprobe amd_pmc enable_stb=3D1` cycles now complete cleanly; on the unpatc=
hed
kernel the second load was a guaranteed list_add BUG.

2. Probe now survives the STB failure: "amd_pmc AMDI000B:00: STB initializa=
tion
failed (-12), continuing without STB support", and /sys/kernel/debug/amd_pm=
c/
stays available.

3. s2idle is fully functional afterwards: an rtcwake s2idle cycle right aft=
er a
failed STB init reached full hardware residency (S0ix residency 59.08 s of =
a 60
s sleep per s0ix_stats), confirming the msg_port restore; previously the fa=
iled
init would have left msg_port on MSG_PORT_S2D.

One residual issue in amd_stb_s2d_init(), now visible thanks to the error
propagation fix: on this platform S2D_TELEMETRY_SIZE now succeeds, but a la=
ter
S2D command is refused ("SMU cmd failed. err: 0xff") and the
S2D_PHYS_ADDR_LOW/HIGH results are never checked, so stb_phys_addr ends up 0
and devm_ioremap(0, 16 MB) trips the ioremap-on-RAM WARN before failing with
-ENOMEM:

  amd_pmc AMDI000B:00: SMU cmd failed. err: 0xff
  ------------[ cut here ]------------
  ioremap on RAM at 0x0000000000000000 - 0x0000000000ffffff
  WARNING: arch/x86/mm/ioremap.c:216 at __ioremap_caller+0xfc/0x3b0, CPU#13:
modprobe/4592
  Call Trace:
   devm_ioremap+0x5a/0xb0
   amd_stb_s2d_init+0x239/0x280 [amd_pmc]
   amd_pmc_probe+0x2d1/0x370 [amd_pmc]
  ...
  amd_pmc AMDI000B:00: STB initialization failed (-12), continuing without =
STB
support

The end result is still correct (STB unavailable, driver fine), but checking
the return codes of the two phys-addr commands (or rejecting a zero address)
would turn this into a clean bail-out instead of a WARN backtrace that tain=
ts
the kernel.

Thanks for the quick turnaround. For the series as posted:

Tested-by: Francis De Brabandere <francisdb@gmail.com>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
