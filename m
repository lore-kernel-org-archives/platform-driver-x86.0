Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ECE1A288
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 Aug 2025 04:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755147463; cv=none; b=JYFKpKEBmSs4yySmZ9pbImY17LZOAkPraLZibQUevVmxTLAnYSg+GcEG3vvboMIXbDoW/e4JmEbv2i7f/MpKR18Q6JcJvFcZKJ9JQr0hhWp0oGsfW/Q18oIm2+mVGmkRLkj28RdaP8UgAoQSMdwnQy/l7W2tQDi6jrpVh036zdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755147463; c=relaxed/simple;
	bh=nBXMWmF95X+52cgRYRUn0ZhTT0RcQKGplpGBFRxwhPA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XcD0NIGokZ00BhlupYYG27fMGg/322RFH1YsLBHwj1BLQCHbbgIcwBHDuERlKtcZBt7PmxSpWs0cSk1bkUBhj6lbZ8yPkTOFGZsuYmKuIu5RW1HLy4tzQ0P0Q9PGLaEpd4icezbKo2k12NiJWYBwtGSG02UofyfiHXmcQ8SAs7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=umhDTLW6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="umhDTLW6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8F69C4CEEF
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 Aug 2025 04:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755147462;
	bh=nBXMWmF95X+52cgRYRUn0ZhTT0RcQKGplpGBFRxwhPA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=umhDTLW6Z7sv6eHHuimJElEAtVAND0RnJLyeTkaaO3H0oQkwYO7ApNvG8Oo7hFKSr
	 zwXgETVyhDzAo7w4ckkpYDIMHau0sSzlf44e5njdTtO/69+P78c6ZEUoVgP5uj0t5t
	 d0nr5rrgU0bXKekcOnhXFljACNH0RWeBl+SFoJtK6ymP4zwfQeNN/O8MnIT6SKRLqQ
	 pw+6Xqpo0CQGE4Ql2xnf3Pqmtj14VttrD7b6Dsyu6nVAQVBDyOINkqqf93X09TZUEP
	 NRvl7OxVZsjy5XJ3TOnKUL8dVPx96vC1eyP1vQK55V1fVDx72IeGg/E1uzucjXQHiu
	 LikY1cwQUHlYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D2A74C41612; Thu, 14 Aug 2025 04:57:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Thu, 14 Aug 2025 04:57:40 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-4rDsRleV3W@https.bugzilla.kernel.org/>
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

Marcus (shoes2ga@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |shoes2ga@gmail.com

--- Comment #348 from Marcus (shoes2ga@gmail.com) ---
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
