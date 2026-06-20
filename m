Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A856CA6F
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781949349; cv=none; b=dHUfl9l8sWgVylw0/uXy+IHLZYTZwXgaSL4V3/+pnq/uaU3e4DuFkQDv0/sU8VJ8Pk2cxHg8YiFPtDgGgNqdgCJ8wsl7ymD9qR4DlaxNUJDjyrCPa0Pd3eHrpzpfh7oOYt8r95b27YvhUfvCecJ3UBxNqYTOGIaUwvoFofJ7xSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781949349; c=relaxed/simple;
	bh=XTLp0H9CHuJ6e1/RUT4z2tNFPezXZbt/S3Zmj54cwc8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MaAN9cjZbdhhTTR5I76L18Smh3rirp0MS/yvQu99GyRxs3zSJEbkhqdedXRzv5vNFVc2IdbU93hwpVWMKhWq+RoXVlj6jw6AbzI5uSWKKM67XTVdLOScv6LFTeYLVo5yyk0xub+GhOkpUgS6GqXYy8ZMshUYmIrqfY9XaSYbFgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3Pq+wQF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3Pq+wQF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BF24C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 09:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781949349;
	bh=XTLp0H9CHuJ6e1/RUT4z2tNFPezXZbt/S3Zmj54cwc8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=V3Pq+wQFQ7bYCDwMOLO+OqMHp9R7V0ykjpQKT37BScdnHVzepzpdxSGC7kXx8G5uO
	 t6nFT9ulpTrs6Q3Xf/Zt52afC/uK7C5lkWprrd6gI7XAUZSlO48cL3kqUbFEkCHoQN
	 dLbNjw7BFo8vimCkRKRWtyEg2FICY4HxhIxwAkQSzMOc/fValE+1jvYKLISzyriI0I
	 TEEpHbvmgXPluSQKb3cmTIVxXUVA3V19MXmV8TW3IVHOfEXiaX/Sr4aQPWFXea7cKT
	 DYOwjsJQN3PKSzOhIgWicVglceJq6siauamLm85G4yKKdl27QuN1R7Yd1MO41wXuyf
	 00sox9hazIx+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0C020C41612; Sat, 20 Jun 2026 09:55:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 09:55:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-Y9W5wkGFWe@https.bugzilla.kernel.org/>
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

--- Comment #35 from Milan Oravec (moravec@ukf.sk) ---
Thank you, here is output with Balanced profile:

migo@migo-HP:~$ cat /sys/class/thermal/thermal_zone0/trip_point_*_temp
125000
108000
105000
migo@migo-HP:~$ cat /sys/class/thermal/thermal_zone0/trip_point_*_type
critical
hot
passive
migo@migo-HP:~$=20

and here when Powersave is enabled:

migo@migo-HP:~$ powerprofilesctl set power-saver
migo@migo-HP:~$ cat /sys/class/thermal/thermal_zone0/trip_point_*_temp
125000
108000
105000
migo@migo-HP:~$ cat /sys/class/thermal/thermal_zone0/trip_point_*_type
critical
hot
passive

migo@migo-HP:~$ powerprofilesctl=20
  performance:
    CpuDriver:  amd_pstate
    PlatformDriver:     platform_profile
    Degraded:   no

  balanced:
    CpuDriver:  amd_pstate
    PlatformDriver:     platform_profile

* power-saver:
    CpuDriver:  amd_pstate
    PlatformDriver:     platform_profile

no change in temp. trip points and FAN still 2100RPM with 37 deg.C CPU temp.

migo@migo-HP:~$ sudo sensors
[sudo] password for migo:=20
hp-isa-0000
Adapter: ISA adapter
fan1:           0 RPM
fan2:           0 RPM
pwm1:             N/A

k10temp-pci-00c3
Adapter: PCI adapter
Tctl:         +37.9=C2=B0C=20=20

mt7925_phy0-pci-6200
Adapter: PCI adapter
temp1:        +79.0=C2=B0C=20=20

nvme-pci-6000
Adapter: PCI adapter
Composite:    +37.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +81.8=C2=B0C)
                       (crit =3D +84.8=C2=B0C)
Sensor 1:     +37.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)
Sensor 2:     +37.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)

acpitz-acpi-0
Adapter: ACPI interface
temp1:        +37.0=C2=B0C=20=20

ucsi_source_psy_USBC000:001-isa-0000
Adapter: ISA adapter
in0:           5.00 V  (min =3D  +5.00 V, max =3D +15.00 V)
curr1:         3.00 A  (max =3D  +5.00 A)

ucsi_source_psy_USBC000:002-isa-0000
Adapter: ISA adapter
in0:           0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
curr1:         0.00 A  (max =3D  +0.00 A)

amdgpu-pci-6300
Adapter: PCI adapter
vddgfx:        0.00 V=20=20
vddnb:         0.00 V=20=20
edge:         +36.0=C2=B0C=20=20
PPT:           4.00 W  (avg =3D   4.00 W)
sclk:         812 MHz=20

BAT0-acpi-0
Adapter: ACPI interface
in0:           8.27 V=20=20
power1:        0.00 W=20=20

acpi_fan-isa-0000
Adapter: ISA adapter
fan1:        2100 RPM

migo@migo-HP:~$

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
