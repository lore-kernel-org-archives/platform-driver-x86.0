Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F96A3E274D
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 18:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338592; cv=none; b=kEQ5ZS/d6QYeT/vp+qqSaF2mQV+eIWpAlTzCWR3bWgYS/E2ceJP4fnyTl3tliC+bwxU/jX4GTKdwP0Js3fcwYMhwEDmnTmsRBCCT8Hm/VybuZlMa8IkEyIl12i5y3s+zapGyjlQCAwQxZDydbr7qAxA6X6aQZXz9vtuuGMWnP+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338592; c=relaxed/simple;
	bh=iUC22z3QQydjTAe06q0vvlZmBrF400B7P0nYO6djlcM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bb1TwR0pDIOZZUPNuzi8Q+uROO1OtElIHoBczOKpFtcI6DNH0aJOsFk23CAXF02PDidjTw7rR5or9zthXzw2ul0xcgPKOdhT3deXfWsOY+ZHmSrjpuzw5RmobBeRDwrBteWXSfRD82i1AUsf1wXLHYYx7Y1Yu6zYj84Usy1Eanc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwmMJ89h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwmMJ89h"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D561AC2BCB8
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 18:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780338591;
	bh=iUC22z3QQydjTAe06q0vvlZmBrF400B7P0nYO6djlcM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KwmMJ89h9gXfppms5MmuF89bA3K5KYwBiGf7fQp7M45gKDeREQUqWZw2UaO0K7npy
	 Zxf++UEkf0w6T0sEvMtNDXmU4sG6G4n9H1oW7kMdjoSa+YBn7Hyr/4WJ5u/jxbGdB2
	 Z2krrEcRofTQH8Uw9uLDUawt97TLlNwFI/FmgVOo3sLlI1pguqtcSXfa+Q3u5ay5Di
	 njBCb59X/mQr2SIX+8f7q7iaOzYOq8XFN+flN0Yx1/MXkiteYA5m8ZpXYY8NpgOqZQ
	 xDk2n5IvLb5ul1b7CvhdqmCTdYGZMlWC6LxZq9OP9hwAAVQG7tNFyjWmC+oToFuhOf
	 uUUTUQ3XGd2jw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B8BA6C3279F; Mon,  1 Jun 2026 18:29:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 01 Jun 2026 18:29:51 +0000
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
Message-ID: <bug-221569-215701-t9k1W0exg9@https.bugzilla.kernel.org/>
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

--- Comment #20 from Milan Oravec (moravec@ukf.sk) ---
I've tried with mt76 module blacklisted. Hard to compare, but FAN started to
spin with cpu temp 41 deg.C and no load, only system booted and terminal
opened.=20

root@migo-HP:/home/migo# sensors
hp-isa-0000
Adapter: ISA adapter
fan1:           0 RPM
fan2:           0 RPM
pwm1:             N/A

k10temp-pci-00c3
Adapter: PCI adapter
Tctl:         +38.6=C2=B0C=20=20

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
temp1:        +39.0=C2=B0C=20=20

ucsi_source_psy_USBC000:002-isa-0000
Adapter: ISA adapter
in0:           0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
curr1:         0.00 A  (max =3D  +0.00 A)

ucsi_source_psy_USBC000:001-isa-0000
Adapter: ISA adapter
in0:           5.00 V  (min =3D  +5.00 V, max =3D +15.00 V)
curr1:         3.00 A  (max =3D  +5.00 A)

amdgpu-pci-6300
Adapter: PCI adapter
vddgfx:        0.00 V=20=20
vddnb:         0.00 V=20=20
edge:         +37.0=C2=B0C=20=20
PPT:           2.05 W  (avg =3D   2.05 W)
sclk:         717 MHz=20

BAT0-acpi-0
Adapter: ACPI interface
in0:           8.27 V=20=20
power1:        0.00 W=20=20

acpi_fan-isa-0000
Adapter: ISA adapter
fan1:        2100 RPM

root@migo-HP:/home/migo# w
 20:18:27 up 12 min,  1 user,  load average: 0,06, 0,19, 0,14
USER     TTY       LOGIN@   IDLE   JCPU   PCPU  WHAT
migo     tty2      20:06   12:17   0.00s   ?=20=20=20
/usr/lib/gnome-session-init-worker gnome
root@migo-HP:/home/migo#

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
