Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D286625A2AE
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Oct 2025 08:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761033670; cv=none; b=rbl/VeBaI4lps2MYk/+4fNyN8JuSxC0OSIBl+XtqR73zJMoo346ZUXRqorvBPpfEnpgiDOTd7EVL0uikwCmJ9DwcZHynvtzcMLssYiqLQ3E4pcik39pTt4rpwbQJbk6XDpxvN+Fa3yuslePmZYHUzMQR8MNSYa1Px7qrKmotKsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761033670; c=relaxed/simple;
	bh=SqSNvib7VsUQlUGRYoNXMbx0lC1Lm4aw5d9UHesMUXI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lIbFi0ywIM/bK2Z/uuIJYUq0JUKplWtsqpb/B17u5VR/CdJP6W0TLFVReBJ6CRDsflk6cK0kTdjUWsPir3JDb2yLDc9E+hGBMp2bH5QOYMCwoM7xqLfSVyoLuylv3p26hOqFN0yc6zFM4iAfz4yQIwG2WAodpM2FlTOymLP2hnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EC0bSEU5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EC0bSEU5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46A9FC4CEF5
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Oct 2025 08:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761033669;
	bh=SqSNvib7VsUQlUGRYoNXMbx0lC1Lm4aw5d9UHesMUXI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EC0bSEU5goiqWBzht6s85tqa59gz/8JlRfSQM+XpxekdR4VwNKvSvL6inMilWbCdM
	 X+LxEuFYomJ+N+VkmJ8j0i0lIwvKJ4PEJ31OYdEDKCLu0t/pPMvisD14cefh1tVTP8
	 2oJzZC+Rp3H09ZRO/Awa3x+Hl94xYDQUmCeD0DpXEvmVpcWXiWjY03ulRdopOFmB0W
	 tjph9gCbUEjyf9Sq16/vK6P/GSZ0gyR8OK3MkyVBcBpaXRil5JeW9lBxwb3NCzFq5n
	 l4DgeNY9P4OY+zYZbihIX3y60s2flnhY2bf3O5b8St0vYkE4X7j9JQVHcekf3y2QEQ
	 MAmChyqi7Ae6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 33AEBC4160E; Tue, 21 Oct 2025 08:01:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220646] Regression: kernel 6.16.8 fails to boot on Intel Raptor
 Lake Z790 (ahci/xhci error -12)
Date: Tue, 21 Oct 2025 08:01:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: vedran@miletic.net
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220646-215701-doOLhjbsxp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220646-215701@https.bugzilla.kernel.org/>
References: <bug-220646-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220646

Vedran Mileti=C4=87 (vedran@miletic.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |vedran@miletic.net

--- Comment #2 from Vedran Mileti=C4=87 (vedran@miletic.net) ---
(In reply to Jean-Nicolas from comment #0)
> Hardware:
> - MSI MAG Z790 TOMAHAWK WIFI (MS-7D91), Intel i9-14900KF
> - Chipset: Intel Raptor Lake (Z790)
> - Storage: Samsung SSD 860 EVO (SATA), Corsair MP600 NVMe
> - GPU: NVIDIA RTX 4070 Ti
>=20
> Issue:
> - Booting 6.16.8+kali-amd64 fails with:
>     ahci: failed to start port (errno=3D-12)
>     xhci_hcd 0000:00:14.0: init failed, error -12
> - System drops into initramfs, USB keyboard not functional at that point.
> - GRUB works (disk visible to firmware).
> - Booting older kernel 6.12.38+kali-amd64 works fine on same hardware.
>=20
> Additional:
> - Also see:
>     platform INT3515:01: deferred probe pending: Error creating i2c-clien=
t,
> idx 0
> - This message appears on both kernels, but is not fatal on 6.12.
>=20
> Steps to reproduce:
> 1. Boot system with kernel 6.16.8.
> 2. Observe ahci/xhci errors and initramfs hang.
> 3. Reboot and select 6.12.38 =E2=86=92 boots normally.
>=20
> Conclusion:
> Regression between 6.12 and 6.16 affecting Intel Raptor Lake SATA AHCI and
> USB XHCI controllers.

Is your BIOS set to Intel RST or AHCI mode?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
