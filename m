Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B8B1DFE0B
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 Aug 2025 05:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755147885; cv=none; b=aKB/UG3y+uqM5VzCPonUm0l88senL/mp2l/BgN702Wr8+T+vdEOBs9PAlVrkJloRuZkIlgJ1o7imu8luh4F7xzoIFYvXv0S3JUeeYqSPYrrN8uURt7uvhxftHUfLi0N4g7B77xjvWqxOEvUOz4lBU/h7e7aexamzVp2w3Sk1An8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755147885; c=relaxed/simple;
	bh=tV6HYC8DOhwl7nPzMCnalp9c5MK7q9VJQzSQsSxaYv4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mmynUKMA6bFl0+0z4v6xp4vqHl7R2BSH/Y7hdGryILox28+yvAlyxGj+KQUsCGMsiISZxw8ImYeaDA5LKoI1sZe4I3HT4aqUqkqSF7GHcqTwhiWLCmTdhAqFsO8k7VX1fS70z/yc1nwOOQIFCK2sBnGxrRRFJmN1OsVrvTSssqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pIBxyari; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pIBxyari"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 755A7C4CEF5
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 Aug 2025 05:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755147884;
	bh=tV6HYC8DOhwl7nPzMCnalp9c5MK7q9VJQzSQsSxaYv4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pIBxyarinx6fyo7I9Fuo2RG1L8LR6w8vWoAs1vLFnCVKtVqco7ybZHhNNdCFbxqYf
	 PurWBIAchC6S0p5mPhsfgouZMKn+mQLtHVu5Qee183g78ZPv6rbGniLR7XoLUgCsN3
	 5ICgYVZAATrDChiVqKCT9HBv6ykno+cItvrUSIgudEKxuUdgMIURw7/VqHTXBI1fjo
	 alyvR8MhIUUqC11JPWBWSvIZdmexpkapa+BOChk7RETHW7ueHaAQKJsWRjhBBUGXvL
	 PF0fn8KInZIpdsMJY4OVOEC+HVTBJJWKCYNzwbkBd9S2K5wGpyStGSqu5HGGYU7CJJ
	 cPNoe0S1Wu0Kg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6DEB9C4160E; Thu, 14 Aug 2025 05:04:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Thu, 14 Aug 2025 05:04:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: shoes2ga@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-1kx6HlrUiq@https.bugzilla.kernel.org/>
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

--- Comment #349 from Marcus (shoes2ga@gmail.com) ---
(In reply to Denis Pauk from comment #346)
> Updated patch rebased over v6.14 kernel release, only build is tested.
>=20
> Additionally code has support for
> G15CE,
> Pro WS TRX50-SAGE WIFI,
> Pro WS WRX90E-SAGE SE.
>=20
> If you have such boards, please share result of testing.

Works as expected:

$ cat /sys/class/dmi/id/board_name
Pro WS WRX90E-SAGE SE

$ sudo dmesg | grep nct6775
[  176.914364] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290

$ sensors nct6798-*
nct6798-isa-0290
Adapter: ISA adapter
in0:                      832.00 mV (min =3D  +0.00 V, max =3D  +1.74 V)
in1:                      1000.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  =
ALARM
in2:                        3.38 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in3:                        3.28 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in4:                      1000.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  =
ALARM
in5:                      984.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)
in6:                      672.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in7:                        3.38 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in8:                        3.31 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in9:                        3.28 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in10:                       1.06 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in11:                       1.12 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in12:                       1.06 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in13:                     832.00 mV (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
in14:                       1.24 V  (min =3D  +0.00 V, max =3D  +0.00 V)  A=
LARM
fan1:                        0 RPM  (min =3D    0 RPM)
fan2:                        0 RPM  (min =3D    0 RPM)
fan3:                        0 RPM  (min =3D    0 RPM)
fan4:                        0 RPM  (min =3D    0 RPM)
fan5:                        0 RPM  (min =3D    0 RPM)
fan6:                        0 RPM  (min =3D    0 RPM)
fan7:                        0 RPM  (min =3D    0 RPM)
SYSTIN:                    +35.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)
                                    (crit =3D +125.0=C2=B0C)  sensor =3D th=
ermistor
CPUTIN:                    +28.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)
                                    (crit =3D +125.0=C2=B0C)  sensor =3D th=
ermistor
AUXTIN0:                   +38.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)
                                    (crit =3D +125.0=C2=B0C)  sensor =3D th=
ermistor
AUXTIN1:                   +23.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)
                                    (crit =3D +125.0=C2=B0C)  sensor =3D th=
ermistor
AUXTIN2:                   +20.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)
                                    (crit =3D +125.0=C2=B0C)  sensor =3D th=
ermistor
AUXTIN3:                   +13.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)
                                    (crit =3D +125.0=C2=B0C)  sensor =3D th=
ermistor
AUXTIN4:                   +27.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)
                                    (crit =3D +100.0=C2=B0C)
PECI Agent 0 Calibration:  +11.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +=
75.0=C2=B0C)
PCH_CHIP_CPU_MAX_TEMP:      +0.0=C2=B0C=20=20
PCH_CHIP_TEMP:              +0.0=C2=B0C=20=20
PCH_CPU_TEMP:               +0.0=C2=B0C=20=20
PCH_MCH_TEMP:               +0.0=C2=B0C=20=20
intrusion0:               OK
intrusion1:               ALARM
beep_enable:              disabled

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
