Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6B42B9BA
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781948311; cv=none; b=UBfZBU9eq/n2uiFTt84HLeK4aTulN4EfLpCmLmtaMs97TxfNdg/fFy/5h/NEIwzhBUujmm2bvRoY0+i4ogy2gahZjhNo70AQRbhLjGBvv3Vt+1MtLlc/h6Ub7K0UkZxaEQf+TZfvp9N/OYRcNmAOt6I63ALuuAYbM+irFO0hPHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781948311; c=relaxed/simple;
	bh=XAzAFXzl9Jjj8JBRCqRwSwSzlJM4aiu3zBerVW/FIzc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WDxzNfZtdJTHhzP652eTsSMiVP1NTpex8EV1o93mXTcnMrTtnKwemRM+qNO2figNMbhRVwTRTmWpNApuUeokrMDjTwDeqrAivESYXEXIppfkPznE8MYyscDtxahU7kycuOvrMK6HhCl/ueHYqD/BnrBRegpxQaRIN7gIqDZNuds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOD/0r6B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOD/0r6B"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 336B7C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 09:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781948311;
	bh=XAzAFXzl9Jjj8JBRCqRwSwSzlJM4aiu3zBerVW/FIzc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lOD/0r6BzO6a7Zb6EH+tbE+7eofx+mP7yaUQwODzz1FZdXqj+XHThowv0Di2SwD+p
	 LMsu9TyD/hu2bA5g6AMRDYlzNXProPeiOJQljMfoT/8C6VBX6NzXTO7tyvkM0orE5Y
	 Fra5uDfUGj9J3VqrpTPqE5IvSpsBY7KFLxhsjz+khjmROzg/yAkzIRU0PJzKCfzcm3
	 5v97ZBm3WaEjpfp5Xtx+lrlVCFeoDJc/pINMiSiLmWt0tr5iZqN+GHiNN8+WCqaxyO
	 fioPUDNrONLBQ3YG8a72GUwdB50Ffc9CKdJkV6h0bx1xZnVH2yHdnExFD2nvLODZeP
	 +jWAYgs09CEHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 16FE1C41612; Sat, 20 Jun 2026 09:38:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 09:38:30 +0000
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
Message-ID: <bug-221569-215701-ay07rZaK2L@https.bugzilla.kernel.org/>
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

--- Comment #32 from Marco Scardovi (scardracs@disroot.org) ---
Regarding the custom FAN curve or trigger temperatures:

On your laptop, the fan speed is controlled by the ACPI thermal subsystem
directly (acpi_fan-isa-0000 is reporting the 2100 RPM), while hp-wmi
(hp-isa-0000) reports 0 RPM because manual fan control interface is not exp=
osed
by HP firmware on generic non-gaming (non-Omen/Victus) models.

Looking at your sensors output, the MediaTek WiFi card (mt7925) is reportin=
g a
temperature of +86.0=C2=B0C. Modern thin-and-light laptop firmware (Embedded
Controller) often monitors multiple sensors (CPU, NVMe, WiFi, and skin
sensors). If the WiFi card or NVMe SSD is hot, the BIOS/EC will keep the fan
spinning at a low RPM (like 2100 RPM) to cool the chassis, even if the CPU =
is
idling at 39=C2=B0C.

You can inspect which ACPI thermal zone is triggering the active cooling by
running:

> tail /sys/class/thermal/thermal_zone*/type
> tail /sys/class/thermal/thermal_zone*/temp

Since the platform profile driver is now working correctly, you should try
switching it to quiet or low-power (if available on your model) using
powerprofilesctl set quiet. This is the official way to tell the EC/BIOS to=
 use
a quieter fan curve and adjust the trip point thresholds.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
