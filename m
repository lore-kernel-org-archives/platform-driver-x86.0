Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBDC48F032
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 11:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373908; cv=none; b=IEy4NvWZTT/tPHvOLDcL+mO2LtrfsIVgdHKmTcdysKcmXSn+W+GzY3hyD6HnCgwsyg9QmaLjTpxsKOWexnn/Aa9ATv9xX4YVpZbR6GCnboXvDJslcnhyIIksTCT7A6IBSCodWAWDS+aCqxI/JdxC0yHYsuhCHRsg7p5YXmUVJKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373908; c=relaxed/simple;
	bh=SlZPyRp6jqwat1UyMq2+HxQV0dKr6rC1FYDoydUX6Fk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TPnbEU3PNYoF/RsuO9bNa6K+Kff/aHd4cQhq+C00hY1Ym5/2mfN0CdG+wYJUUioms80tnSshqsDg/26434a4uatONaDR5I/E5I6Cnslpl73x86I3T/z86HQrSqavHom/4sDbS1nAOqw6YLrpHcII/+ygqYjyhhiFNbNGw7mSfgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9NQVyOg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9NQVyOg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53840C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 11:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791373908;
	bh=SlZPyRp6jqwat1UyMq2+HxQV0dKr6rC1FYDoydUX6Fk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=B9NQVyOgJ+H5aV8C3UhLauCaIun1pF8aMZgO4Y3dabrF7Bm8kvdQCK2Hj0OF+dL8y
	 9J6hFhH/y7auSISLuCBW8mIQ2kbxNGYwzSCGs9qS/7RVECwJi5l4zuu2Hn62Qowgws
	 4ECePKVcTCJsNAnu+cpthozpqmBn5m6apcPgM2VRtJBzFN0Y1jhrCnMK40QlOyOSBd
	 1oAWAtjJEdx66k+LRz0diNFqEznzGcsGbx7mpfDq+kAuia8Qn560+VyYB1WSkB3zxP
	 7nprwHW5T342n4km16EDdW8lJd20PJEyDJVyAD56As28GxX2qv3sNXEaE9fjnvoUXo
	 h1nlOvVVVv+kw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3EB21C4160E; Wed,  7 Oct 2026 11:51:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222102] [ASUS Vivobook F1054ZA] Keyboard backlight missing/not
 working on Fedora 44 KDE - PixArt ASUP1200:00 controller
Date: Wed, 07 Oct 2026 11:51:48 +0000
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
Message-ID: <bug-222102-215701-1sed4R2Per@https.bugzilla.kernel.org/>
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

--- Comment #1 from Roberto Comandatore (roberto_comandatore_93@protonmail.=
com) ---
Distribution: Fedora Linux 44 (KDE Plasma)
Kernel version: 7.2.8-200.fc44.x86_64

Description of Problem:
The keyboard backlight on the ASUS Vivobook F1054ZA does not turn on. The s=
ysfs
interface `asus::kbd_backlight` is completely missing from `/sys/class/leds=
/`.

The keyboard and touchpad are driven by a PixArt I2C-HID controller recogni=
zed
as `ASUP1200:00` (HID ID 093A:200A). The kernel correctly registers the
keyboard functions via i2c-hid, but does not expose any LampArray or LED
brightness interfaces.

Attempts made:
- Upgraded laptop BIOS to the latest version.
- Tested OpenRGB and VRGB (devices not found because hidraw/sysfs endpoints=
 are
missing).
- Loaded i2c-dev and verified Intel SMBus i801 adapter is fully active.
- Attempted to pass `acpi_osi=3D"Windows 2020"` and `i2c_hid.polling_mode=
=3D0` in
GRUB parameters, but the HID interface for LEDs remains hidden.

I am attaching the acpidump, fastfetch summary, dmesg logs, and dmidecode
details in a compressed archive.

Cross-reference: Tracking this issue on ASUS-Linux GitLab at https://gitlab=
.com

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
