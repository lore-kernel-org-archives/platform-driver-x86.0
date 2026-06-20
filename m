Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF23E15E97
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781947963; cv=none; b=PJzuhD6gRbNYla0VfSqRy4i96xYljGorJ/EBV3eUaXvLTznpQd2SG5H0VlU6oBJT0WovhqnGHniACOlUrZG8zAFQ8uPX0od6aDrsO9nfD5jtGCMUw3vYrkUPn59+B7PruFugq32QXVUzvvu/MsxZa/VqxjrNGwPcBcRQTYt5www=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781947963; c=relaxed/simple;
	bh=sb+6ie6JOVFD+CmfGXU1XgryI+Covha3mVSMwh/VGCU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dnr5Ul6FmtuZD3VwOt3YXXO6/gLDPel9T8QltJAYfVLR/3hI/WBfMiv2chudtQYO52YD7AU7eIw/4hDqVvCOefY5+AmjRofs+EmIxCwr3MFkWvN2HsCKQtDa3U3xxe1YtkWtd/rYQoXYeokKmBetuwvS3r4q5ViAIXiZJrKoJns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tT/LW+Pz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tT/LW+Pz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CBC7C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 09:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781947963;
	bh=sb+6ie6JOVFD+CmfGXU1XgryI+Covha3mVSMwh/VGCU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tT/LW+PzkzJ8hGgk2qITm8Ihlg3EeY+X4owTQpVIuF6Hdbzrrnm1VU04A+815W8QV
	 0oorBG+rV4nJadz78PjnycqQegLaQJV5SPM+pNHrIJPhV2/2wCY2trQKUC7RUFtdas
	 HyP5O2ekUrOUIpd3uei+f5SZpQ9iY/lHINAvEE1Vvx+LMXUP8fXmPLL3JJf3tr2W7T
	 RJG7keDg4ltM8DjVbV1pypN4ijaRCxst4OKRqSDnTlvpi2rHZmEojKJ/I2zc12eTro
	 9HC4npfqTy6n9HHv+CfVZ27J6oX5OOYsurNhOnIbMyr7GiEmToDEyj6sOPooxHACEY
	 FYA+EgdFenOLg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4E1E0C4160E; Sat, 20 Jun 2026 09:32:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 09:32:43 +0000
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
Message-ID: <bug-221569-215701-qJGCXkMdTI@https.bugzilla.kernel.org/>
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

--- Comment #31 from Milan Oravec (moravec@ukf.sk) ---
Thank you for clarification, AWESOME work and support!=20

Don't you have by hand patches for custom FAN curve or setting trigger
temperature for FAN to make this laptop more quiet? :))) CPU temp is 39 deg=
.C
and FAN still spinning at 2100RPM. All other temps under 40 deg.C too, only
WIFI module is reporting high temp, but this is garbage probably.

migo@migo-HP:~$ sudo sensors
[sudo] password for migo:=20
hp-isa-0000
Adapter: ISA adapter
fan1:           0 RPM
fan2:           0 RPM
pwm1:             N/A

k10temp-pci-00c3
Adapter: PCI adapter
Tctl:         +39.2=C2=B0C=20=20

mt7925_phy0-pci-6200
Adapter: PCI adapter
temp1:        +86.0=C2=B0C=20=20

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
temp1:        +38.0=C2=B0C=20=20

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
edge:         +37.0=C2=B0C=20=20
PPT:           2.10 W  (avg =3D   2.10 W)
sclk:         678 MHz=20

BAT0-acpi-0
Adapter: ACPI interface
in0:           8.27 V=20=20
power1:        0.00 W=20=20

acpi_fan-isa-0000
Adapter: ISA adapter
fan1:        2100 RPM

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
