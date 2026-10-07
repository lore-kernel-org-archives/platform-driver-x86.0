Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF3B49364D
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 11:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374001; cv=none; b=tJgcQWmiXbiQEr3WaNDxYCskTvi4Qu/yzgfIkmtR/e9MWVHnYKaZomcUOhKLJnqE/u3qKiWEwLX1R+OjI7VIuKS5qj7/zLmGBS8jtfoY+s6MB837mroaJJNTP7y++4N1AvOfHoGlTPqaB215coOhIa368j38I1ur/K88KyInnv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374001; c=relaxed/simple;
	bh=PbeMOKGhDJfijroDtyb/DlycCyf/M+z6p0GhEzsUhoo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EEOe8WdCkojJRSHnFxM4QWVDsJ7qjCJo+uPE5b7eXqKSDv2tFhwm8om6pxPcmXhjvTyQ0bUWtPeWcNqKKCjH0TYl+9cHjF9ih7XDsTY8kcVLf9RHeEkvXC2F+vMedLSYRNxy3dRCv+Fyeg3Nv8tZgoHE5Y31hm4Lr8eWrP5M8S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0eHWRB1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0eHWRB1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04EBFC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 11:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791374001;
	bh=PbeMOKGhDJfijroDtyb/DlycCyf/M+z6p0GhEzsUhoo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=m0eHWRB1BmHk7OiVrTebmZxiU1JkGMpP0TaXN9FJpxH57S8VIw0TEDKQWq+5evXKx
	 offzGE2BtoDpXTfDYMoa4ljcgLOQ5TjSE51FawXlNrtkqZoShNYn2gqN+gFC4Zf2H3
	 23sfOcRV5nG2UXMskOPw/jqcSln1Y5Mx1MR2q+VNGCOlEVZ3O+E22deKLabBkJA72f
	 Sd1zx4vTnK7/K8ZjNlum3PCSJg4ItymftJ3XZxchGK5vubmaHpWgPVZ7weLLdQ2rwp
	 Zl9qHbaAjg65Wzw55qNF/44yWuYmqHC6uDN56Jjte1c+1VpHGz8leiB5j+ND9qpfbR
	 dIoWqRiJoTGSQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E80CEC41612; Wed,  7 Oct 2026 11:53:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222102] [ASUS Vivobook F1054ZA] Keyboard backlight missing/not
 working on Fedora 44 KDE - PixArt ASUP1200:00 controller
Date: Wed, 07 Oct 2026 11:53:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roberto_comandatore_93@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222102-215701-fjQMmsUIKw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222102-215701@https.bugzilla.kernel.org/>
References: <bug-222102-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222102

--- Comment #2 from Roberto Comandatore (roberto_comandatore_93@protonmail.=
com) ---
(In reply to Roberto Comandatore from comment #1)
> Distribution: Fedora Linux 44 (KDE Plasma)
> Kernel version: 7.2.8-200.fc44.x86_64
>=20
> Description of Problem:
> The keyboard backlight on the ASUS Vivobook F1054ZA does not turn on. The
> sysfs interface `asus::kbd_backlight` is completely missing from
> `/sys/class/leds/`.
>=20
> The keyboard and touchpad are driven by a PixArt I2C-HID controller
> recognized as `ASUP1200:00` (HID ID 093A:200A). The kernel correctly
> registers the keyboard functions via i2c-hid, but does not expose any
> LampArray or LED brightness interfaces.
>=20
> Attempts made:
> - Upgraded laptop BIOS to the latest version.
> - Tested OpenRGB and VRGB (devices not found because hidraw/sysfs endpoin=
ts
> are missing).
> - Loaded i2c-dev and verified Intel SMBus i801 adapter is fully active.
> - Attempted to pass `acpi_osi=3D"Windows 2020"` and `i2c_hid.polling_mode=
=3D0`
> in GRUB parameters, but the HID interface for LEDs remains hidden.
>=20
> I am attaching the acpidump, fastfetch summary, dmesg logs, and dmidecode
> details in a compressed archive.
>=20
> Cross-reference: Tracking this issue on ASUS-Linux GitLab at
> https://gitlab.com=20

Errata corrige for Asus-Linux Gitlab link:
https://gitlab.com/asus-linux/linux-g14/-/work_items/18

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
