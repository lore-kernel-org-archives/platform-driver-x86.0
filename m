Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FA43A759D
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 09:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307921; cv=none; b=gsBec085m0jpBf4AjV2U8wbvjmhvyttt79GKt8Ph0zTnkd5Bmns5JIFq1z8TSFgiQQc/KXvCkm3lXIjEENQ5yAB7g7sNrkt2JY9EMD2KNAKrQasU+pkwaQN7n5aKbeHQ0aDmT39BoJtHY+OFemC97HUzAOt8V/GM6DMHxWMcA4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307921; c=relaxed/simple;
	bh=HKYluMHX8nHfPKYxap1snAVyRgOOoKeNfNW2UHhO+dc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MMnFrr+GkOBIf9k9QejGUdR1uN8gvYqU8YfRrVvld2ipLAHCo2bXmaIZcFqm6X8+N9zRk7OcG0/RevXvr9FEc/1n7vRda8qsVlp/yzoxdC7yrV93PxqDof5gw5fVFwA+rsKvxanRhLR6ZhveNoRpDJLhjg9xiFLdad+SCdusWeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RqnUfhiU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqnUfhiU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05D6DC2BCB8
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 09:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780307921;
	bh=HKYluMHX8nHfPKYxap1snAVyRgOOoKeNfNW2UHhO+dc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RqnUfhiUG2fPH5D6e36KOITsc5BoYeux7BCN8IaLy2vjA9aNefQWJb7IUk3A/XICb
	 VYcsiCL+YQWfCFsvYLi59ztWgyI/sv7H7LHG/Ej3SaZHXewGma3JoYekfB8S7GdSGG
	 OHX1aUZxdb263Yj+cob+AYLU8Gkg9Bp6LV5UERSV3IKasS9M6QCkZc3u1V9M0LOqfi
	 nRUL63G1ZMn7DRz1Aw5nN5YsCB9HEBfTZazIQPYHQxNc+o7RK5d/FMYyfTlOZcnW5b
	 yg1jkU9Pnux5DeHVtBz0U/8qUINrn8qclBFPprDgoZcAB70e+dZXO7FqurmV6d/MI8
	 irzSgHwdjWWOw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E9538C3279F; Mon,  1 Jun 2026 09:58:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 01 Jun 2026 09:58:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-rTI0NLqj1V@https.bugzilla.kernel.org/>
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

--- Comment #17 from Milan Oravec (moravec@ukf.sk) ---
Unfortunately wifi module temp is not reported in 7.0 tree, other temps. se=
ems
to be in line with 7.1 measurements. But FAN is not starting so often like =
is
doing in 7.1 tree. Will try to blacklist wifi driver after the work, but it
will not be real test, because my work (load) is based on online work an I'=
ll
be offline than.=20

 11:51:00 up 24 min,  1 user,  load average: 0,51, 0,47, 0,34
USER     TTY       LOGIN@   IDLE   JCPU   PCPU  WHAT
migo     tty2      11:27   24:03   0.01s  0.01s
/usr/lib/gnome-session-init-worker gnome
migo@migo-HP:~$ sudo sensors
[sudo] password for migo:=20
hp-isa-0000
Adapter: ISA adapter
fan1:           0 RPM
fan2:           0 RPM
pwm1:             N/A

k10temp-pci-00c3
Adapter: PCI adapter
Tctl:         +41.0=C2=B0C=20=20

mt7925_phy0-pci-6200
Adapter: PCI adapter
temp1:            N/A=20=20

nvme-pci-6000
Adapter: PCI adapter
Composite:    +37.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +81.8=C2=B0C)
                       (crit =3D +84.8=C2=B0C)
Sensor 1:     +37.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)
Sensor 2:     +38.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)

acpitz-acpi-0
Adapter: ACPI interface
temp1:        +40.0=C2=B0C=20=20

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
edge:         +39.0=C2=B0C=20=20
PPT:           3.06 W  (avg =3D   3.06 W)
sclk:         784 MHz=20

BAT0-acpi-0
Adapter: ACPI interface
in0:           8.27 V=20=20
power1:        0.00 W=20=20

acpi_fan-isa-0000
Adapter: ISA adapter
fan1:           0 RPM

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
