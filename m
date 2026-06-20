Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909BD298CB2
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781949016; cv=none; b=fvS1AHPGF4ftSkAlxPlct/h2d1lIlrpchYg2+uyAh2d3Gz6BYzGvPBCGUSNPmRHSf0VFqPlLPFKvlOJOkPM8Q0AQoe0qeJdX183hU+s/yAHKRLbEk92ZJFyziSqlFpdUdrCgK4S39tSD+O58tPvEY78q0JQ/frWnxeiLLj2SIBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781949016; c=relaxed/simple;
	bh=aK0PURjuFvVrb8Y5JBsxniQp3Q1VaP2/PJQRWy9wzxo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=imtZh9BLMoiEbAKsRNX/34r3EmUEwsNZVKTpMg98idkX+BW+Hd+3iZm0diSOxeD0TV/UOUCLj3LoGmN1FjYLzROoCV9ZZrwJEGqWDnnrBwg9MQAnwdPXWkXdPtay/qKT7SPkT0d35vTDSHg4O4XC5ZNHZMYk3qt1dpGk5y9y6gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t0PN1KrN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t0PN1KrN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27CD8C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 09:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781949016;
	bh=aK0PURjuFvVrb8Y5JBsxniQp3Q1VaP2/PJQRWy9wzxo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=t0PN1KrNocwBdYdbJehlpPTTYMBDvdNjq4DXcQ7tCzWvvnx0Fm60KAbWwDOFtlEg+
	 ypsYf6gETFJzwKSS0IHSEvDLMTglvrUWrBrIgr74zbSGdNR89KntCeJkD6hikHHst7
	 hWQzCE01ZY7//Zp7PjrkiCywmd996vyYck+UDrHXC26see0cLBTg93Zl6WRevSWmjW
	 WKD9l1QEfy5Gf0zphhvynkuxA4x670G7NTrvztNfQMlqtF6Sl3/b7Rq1NqTtip6HCJ
	 wCD0SUrQnsxSUZ8iHRYnq4RzIZOBqnO0xHPxarZxGzC68K534KQWE6SweO+LMiOL56
	 CiYW4iRAhmXlQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0BE38C4160E; Sat, 20 Jun 2026 09:50:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 09:50:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: scardracs@disroot.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-bMWFP5jO6D@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #34 from Marco Scardovi (scardracs@disroot.org) ---
The output shows that you have a single ACPI thermal zone (acpitz) running =
at
38=C2=B0C (38000).

The reason the fan is still spinning at 2100 RPM is that the BIOS has
configured a very low active cooling thresholds (trip points). For example,=
 the
threshold to turn on the fan at its lowest speed might be set to 30=C2=B0C =
or 35=C2=B0C.
Since 38=C2=B0C is above that threshold, the fan stays on.

To confirm this, you can check your ACPI trip point temperatures by running:

> cat /sys/class/thermal/thermal_zone0/trip_point_*_temp
> cat /sys/class/thermal/thermal_zone0/trip_point_*_type

Since you now have 'power-saver', 'balanced', and 'performance' profiles
working, try switching to the power saver profile:

> powerprofilesctl set power-saver

Under the power-saver profile, the BIOS/EC should increase the temperature
thresholds (e.g. from 35=C2=B0C to 45=C2=B0C or 50=C2=B0C), which should al=
low the fan to turn
off completely when the system is idling at 38=C2=B0C.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
