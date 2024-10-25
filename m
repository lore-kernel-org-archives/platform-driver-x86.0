Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F47192587
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Oct 2024 10:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729851446; cv=none; b=UoHSt7GyZ1ELGVHXat2SW0uk6sJV+QJSXRPCJ/0AVbfaxMGFBqfoDLffi3CISMHS0fMgkSREyTuafd3IYFiwVnxUPUWwFV9nwbkT87MOByQaPDaspiH3m5ainjtnVPDCyPDE31yhTnoxkTAmzUrJYExJ1lpZ3mVdunGAvOWHRsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729851446; c=relaxed/simple;
	bh=q5ZmzWlJwOVgtLoBEP8wo/jxEaPv3DWNMy24ftYtufo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hT0GKJFK/B0kePjQCyNipinmfB8X3nJKjRX8hXsd+2vKOtU5cEK3pW9rESI8Dl5W5/w82r3S71Ab1uXfD4uV4ej2ikeaRmKhhDUFTL7yXuRKed6YAGgp8bzzBGrdmCMvSMjmdKKs2W6V6UP1OFKA/y5l/zT78zKjW08pAVlO+yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vC+8aoY1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vC+8aoY1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 475ABC4CEE9
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Oct 2024 10:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729851446;
	bh=q5ZmzWlJwOVgtLoBEP8wo/jxEaPv3DWNMy24ftYtufo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vC+8aoY1NU1ZDLYGZvZWvvFmCb2rLZ8LpNvuPwOnwH3ciRghU41ml7vVyKcRmFUpZ
	 K8A0WUv3r3+J3vDr94evPhYvEDXIfipaNVSO0IoB4bCknm6q0UB4fLMC8XzOkBCEje
	 Cevp0wx8AOS2MRM8LQUvYT43fJAv4tlza4YqUrUzzMZuO6QEm4RwRd1lpSWQRFi/eS
	 t0oMykvLtgryOsFSrOfq7zxiaqhrstrOp+e8h21Q1MkWsIiEq8gTwasDnhAQmGYI8H
	 CeMhEH/lZ1LdmuDDMiyJ9MNUC6yZ8d6W8NOqHRqG6sA3aGP+mrhE2Jmab1y3Lqu7dv
	 S8oGj0WeQDQCg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 40BACC53BC4; Fri, 25 Oct 2024 10:17:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Fri, 25 Oct 2024 10:17:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aaron@planetab.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-UJLoLlyXkO@https.bugzilla.kernel.org/>
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

--- Comment #342 from Aaron (aaron@planetab.com) ---
(In reply to Aaron from comment #341)
> Created attachment 307070 [details]
> ASUS Maximus VIII GENE DSDT.DAT
>=20
> Hi,
>=20
> Please add. My board is:
>=20
> # grep -e ''  -n /sys/class/dmi/id/board_{name,vendor}
> /sys/class/dmi/id/board_name:1:MAXIMUS VIII GENE
> /sys/class/dmi/id/board_vendor:1:ASUSTeK COMPUTER INC.
>=20
> # dmidecode -t baseboard
> # dmidecode 3.3
> Getting SMBIOS data from sysfs.
> SMBIOS 3.0.0 present.
>=20
> Handle 0x0002, DMI type 2, 15 bytes
> Base Board Information
>         Manufacturer: ASUSTeK COMPUTER INC.
>         Product Name: MAXIMUS VIII GENE
>         Version: Rev 1.xx
>=20
> # dmesg | grep nct6775
> [    5.001289] nct6775: Found NCT6793D or compatible chip at 0x2e:0x290
>
>
>
>5.001289] nct6775: Found NCT6793D or compatible chip at 0x2e:0x290
>[    5.001384] ACPI Warning: SystemIO range
>0x0000000000000295->0x0000000000000296 conflicts with OpRegion
>0x0000000000000290->0x0000000000000299 (\_GPE.HWM) (20220331/utaddress-204)
>[    5.001389] ACPI: OSL: Resource conflict; ACPI support missing >from
>driver?
>
>
>=20
>=20
> Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
