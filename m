Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E73E3C38
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 Nov 2024 04:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731559684; cv=none; b=By8850/AuXchojZNWtTEpFddzZu8FVdugHBm3yEwHx/2rafsGnaEnTpg/VZE/85uhQE5IcarMBIch/Y9BsJ0WMz7PzDGd4ZA54LAb99fW4+MmazbYGiuIEN3M0UIONjhuim7RsCSP9F+CRjBX4YZjtodznwysrjV6TV16jn1zV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731559684; c=relaxed/simple;
	bh=7yNhl6KovZ0nGCo5Fyj9gQJHx1gK5ka1peEdg7eJ+Kc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ulw8fQawYKzr68rYSs2CfdlLa6BIRhMCTCZYh9WGKchTcq9i5PE7PAPOXaYbXpW1KqktdVSvX237r6sQHSBHG3nWEclQSIVK6QAybp3CoyDcDTioPsc+fwW6W4kDG0C6JW7YoksI7DP9+ZZjZzNnna+1uis0PHWwZkrslpfmfuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DoI6dKle; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DoI6dKle"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87DBEC4CED0
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 Nov 2024 04:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731559683;
	bh=7yNhl6KovZ0nGCo5Fyj9gQJHx1gK5ka1peEdg7eJ+Kc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DoI6dKleA8MK9Iq1MaoIJH2oTilObtDDUlqSHs0qQW4IYXWzoPHEyOkt6q5WJ7+8I
	 /h4nGLI1HShEucg4FZ6aeZ8kI6JevP+Z/dYDlhQKG5EQxXalGdSNxyBwN21KDEq5vF
	 d99u9IKdX6/GUK12hp7vQ3UlhOtbP/fT1VCpoQOmSJyQRz9K7HZixWvgIg8I+t2bYW
	 CiRbtS7hhTbLuj7+EpZa/hTIKlXvcWLyOnTe8sU7yFO3H1xMaM3iDN9mu05ZUxZRG2
	 BiR43sQ2FQtreUX9XAa5xVtrtN+AkmHhw0IEqyprzkf29rAAhSh7YtIa29X/Bfdl5l
	 W6QPHvtp0xHSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 79C49CAB781; Thu, 14 Nov 2024 04:48:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Thu, 14 Nov 2024 04:48:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-pJOajR5ZIF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #9 from andy.liang@hpe.com ---
(In reply to jarkko from comment #6)
> I'll enumerate the questions because there were many in the previous
> comment. Ignore the questions in that, and answer these instead (just to
> help you out):
>=20
> 1. I assume you got the binary bios measurements after applying your fix.=
 Is
> this true?
Yes, the binary is from the fixed machine.

Here is the output without patch
[root@localhost Documents]# dmesg | grep tpm
[    9.911537] tpm_tis STM0925:00: 2.0 TPM (device-id 0x3, rev-id 0)
[    9.944535]  ? tpm_read_log_acpi+0x93/0x1e0
[    9.944578]  tpm_read_log_acpi+0x93/0x1e0
[    9.944586]  tpm_bios_log_setup+0x48/0x1e0
[    9.944593]  tpm_chip_register+0x38/0x210
[    9.944603]  tpm_tis_core_init.cold+0x2a7/0x45d
[    9.944613]  tpm_tis_plat_probe+0xd8/0x100
[   20.044163] intel_uncore_frequency_tpmi intel_vsec.tpmi-uncore.2: Uncore:
Ignore: Unsupported minor version:2
[   20.044241] intel_uncore_frequency_tpmi intel_vsec.tpmi-uncore.2: Uncore:
Ignore: Unsupported minor version:2
[   20.044279] intel_uncore_frequency_tpmi intel_vsec.tpmi-uncore.2: Uncore:
Ignore: Unsupported minor version:2
[root@localhost Documents]# tsseventextend -if ./binary_bios_measurements -=
sim
-v
Unable to open input file './binary_bios_measurements'
[root@localhost Documents]#=20

> 2. I assume you parsed the measurements with tpm2_eventlog. Can you attach
> the unparsed binary instead?
The binary is from the command "tsseventextend -if ./^Cnary_bios_measuremen=
ts
-sim -v"
Please check the attached file.

> 3. I assume dmesg was generated without workaround. Is this true or not? I
> have not opened it yet (because lack of time).

Yes, the dmesg is from the machine with the bug.=20

> I think these three questions should be enough for now. Don't waste your
> time on previous questions, I can deduce answers from these...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
