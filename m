Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B654EECA
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Dec 2023 00:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwcEOTQe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39999C433CA
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Dec 2023 00:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701651122;
	bh=odsPHLdvErq+TuWWMUOQ+KFmHme6+qyMoDrv/vOwFCk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HwcEOTQeiKy/yP5H2wtmqXWPNTwHyVTJtNEEI9dRZuW3lc3aU/hSyG3tRdz2PsP0L
	 mskE+hatzHVL8yysBhd6orATPE8H2NTl/Mr98gfcSuh+FWjIvVtsl1E5DNLZ0Lei16
	 dDCjkPOIQlwUAJjEL1H9XnSZjXlB7gUaRxzOFUNM8d9cKmnbJ3ZA+fslWVlb6zyT/w
	 SXcwaOZw+SmZuRXWigjOAvt193es6/qiLaWzmD/XoqrUyXS7mNiM3wD4FPw94sQQHe
	 BHaoM8KO8070aRbP0Sbwl2uyfcFEnsltPXV0gRlpIcSJfAggAzlFsxnXxiRBTtVe9l
	 +e1Jp2UgvwfzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 267B9C53BC6; Mon,  4 Dec 2023 00:52:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 203191] The fan speed reports to 65535, despite the fan is
 stopped
Date: Mon, 04 Dec 2023 00:52:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: antony.gelberg@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203191-215701-W4kMYGJUvk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203191-215701@https.bugzilla.kernel.org/>
References: <bug-203191-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203191

--- Comment #18 from antony.gelberg@gmail.com ---
Apologies for the "spam". I noticed I have a `sensors` output before and af=
ter
the issue, and there are some other differences.

1. GPU went from reporting a temperature to N/A.
2. ucsi_source_psy_USBC000:002-isa-0000 went from reporting a voltage to ze=
ro.

Could this be related? Could it indicate a more widespread failure e.g.
motherboard fault than "just" the fan? Where would be a good place to get
further community insight before shipping it off for repair and waiting for=
 the
possible "there is no hardware fault"?


Before:

$ sensors                               [156/156]
thinkpad-isa-0000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Adapter: ISA adapter=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
fan1:        4815 RPM=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
CPU:          +51.0=C2=B0C=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
GPU:          +50.0=C2=B0C=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
temp3:        +33.0=C2=B0C=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
temp4:         +0.0=C2=B0C=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
temp5:        +42.0=C2=B0C=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
temp6:        +51.0=C2=B0C=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
temp7:        +51.0=C2=B0C=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
temp8:            N/A=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

coretemp-isa-0000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Adapter: ISA adapter=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Package id 0:  +54.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=B0=
C)=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Core 0:        +54.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=B0=
C)=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Core 1:        +52.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=B0=
C)=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Core 2:        +51.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=B0=
C)=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Core 3:        +48.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=B0=
C)=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

ucsi_source_psy_USBC000:001-isa-0000=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
Adapter: ISA adapter=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
in0:           0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
curr1:         0.00 A  (max =3D  +0.00 A)=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20

BAT0-acpi-0=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Adapter: ACPI interface=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
in0:          12.91 V=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

iwlwifi_1-virtual-0=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Adapter: Virtual device=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
temp1:        +58.0=C2=B0C=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

ucsi_source_psy_USBC000:002-isa-0000=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
Adapter: ISA adapter=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
in0:           5.00 V  (min =3D  +5.00 V, max =3D +20.00 V)=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
curr1:         3.00 A  (max =3D  +3.25 A)=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20

nvme-pci-0400=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Adapter: PCI adapter=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Composite:    +37.9=C2=B0C  (low  =3D  -0.1=C2=B0C, high =3D +79.8=C2=B0C)=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                       (crit =3D +82.8=C2=B0C)=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20

acpitz-acpi-0=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Adapter: ACPI interface=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
temp1:        +51.0=C2=B0C  (crit =3D +128.0=C2=B0C)


After:

$ sensors
thinkpad-isa-0000
Adapter: ISA adapter
fan1:        65535 RPM
CPU:          +47.0=C2=B0C=20=20
GPU:              N/A=20=20
temp3:        +34.0=C2=B0C=20=20
temp4:         +0.0=C2=B0C=20=20
temp5:        +42.0=C2=B0C=20=20
temp6:        +47.0=C2=B0C=20=20
temp7:        +47.0=C2=B0C=20=20
temp8:            N/A=20=20

coretemp-isa-0000
Adapter: ISA adapter
Package id 0:  +47.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=B0=
C)
Core 0:        +46.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=B0=
C)
Core 1:        +46.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=B0=
C)
Core 2:        +46.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=B0=
C)
Core 3:        +45.0=C2=B0C  (high =3D +100.0=C2=B0C, crit =3D +100.0=C2=B0=
C)

ucsi_source_psy_USBC000:001-isa-0000
Adapter: ISA adapter
in0:           0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
curr1:         0.00 A  (max =3D  +0.00 A)

BAT0-acpi-0
Adapter: ACPI interface
in0:          12.08 V=20=20

iwlwifi_1-virtual-0
Adapter: Virtual device
temp1:        +44.0=C2=B0C=20=20

ucsi_source_psy_USBC000:002-isa-0000
Adapter: ISA adapter
in0:           0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
curr1:         0.00 A  (max =3D  +0.00 A)

nvme-pci-0400
Adapter: PCI adapter
Composite:    +32.9=C2=B0C  (low  =3D  -0.1=C2=B0C, high =3D +79.8=C2=B0C)
                       (crit =3D +82.8=C2=B0C)

acpitz-acpi-0
Adapter: ACPI interface
temp1:        +47.0=C2=B0C  (crit =3D +128.0=C2=B0C)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
