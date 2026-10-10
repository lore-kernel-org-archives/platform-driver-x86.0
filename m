Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679D63546FA
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 21:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791666576; cv=none; b=kz1UwS+LEteq7hanDLdY82lguFt3zDJ8Ip5nWxrT6iZtLdQ3aWnN33sfE+FaIBMH9fGd0xw0NENY5qeUGA2O0ID8ZkjOBJN4LGUtN0OiN3Z3VxLaSg/5zxC2AGilborxugyxc9xCIYNrb/xLtI1EQU7rdy9du8qmeRTm8WUQLu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791666576; c=relaxed/simple;
	bh=j7KlZtfe5jtIbU4/8GQ7ubOFDSOCZbZrYJqTINu6g94=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jgHDcWjnfW/PmT4HMSBU8ooTfVNFUjqH6LFN1tF+4lBvxEXoGyKJYsOciG14q6RC2DrGT3zmz6e3r+nNI017elkwgYaGdSgxIm4qgseWK0BEvpwVfeeG7TaJDQ/iNozVUdAjQFrRRCyYF24/+G5oewlzB8FL8yjTlFoEGR8GZ7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SELOiUgM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SELOiUgM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10921C2BCB9
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 21:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791666576;
	bh=j7KlZtfe5jtIbU4/8GQ7ubOFDSOCZbZrYJqTINu6g94=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SELOiUgMeq8yIQGM4p5gzJplMeYAYYpkmMhzm7GU/mwrtHhFhWXeQtVetG81+MG07
	 NfBf21jfXlGqo2aWzNJvpeVzKUNNp2GWbioAtoZqvz3F1CbliducgBEQp7Db9e7M5w
	 mOfCacGLcQ7mRlz0oAXuFRbZwDwyg/SPsgH138YpM2GDWcB6D9K1+L66vTbLTjeWKz
	 O5T2L4lrC6xxKIcfD64L6cvbERA6pFYh9FCR0A8i5rTauku5YmdgTvvc7WQbT8kFlF
	 p59b+YFzkVxfnXpaJlj8XWq/lkLyKRGdafDrWgor++S30umMrSpCAWy0BPVO5BOQCH
	 nVArzNg1WM/Fg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D4C83C3279F; Sat, 10 Oct 2026 21:09:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221752] asus-wmi: no camera LED classdev registered on Zenbook
 S 14 UX5406SA (micmute LED works)
Date: Sat, 10 Oct 2026 21:09:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: git@turtledev.nz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221752-215701-z45DwGMijP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221752-215701@https.bugzilla.kernel.org/>
References: <bug-221752-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221752

git@turtledev.nz changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |git@turtledev.nz

--- Comment #1 from git@turtledev.nz ---
Same laptop here, UX5406SA with BIOS .309 (11/18/2025), Fedora 44 on
7.2.9-200.fc44, secure boot on. Same issue, no asus::camera LED.

I dumped the DSDT to see what's going on. I think it also explains why the
set side didn't work for Jos=C3=A9 in "[PATCH v2] platform/x86: asus-wmi: f=
ix
camera key led on Zenbook S14".

0x00060079 (CAMERA_LED) just returns 0 for both DSTS and DEVS on this
machine, so asus-wmi never registers the LED. Everything is on 0x00060078
(CAMERA_LED_NEG).

The DSTS handler for 0x00060078 reads EC register 0x50 and writes the
result straight to the LED GPIO before returning:

    Local1 =3D ^^PC00.LPCB.EC0.ST8E (0x50, Zero)
    If (((Local1 & One) =3D=3D One))       { Local0 =3D One }
    ElseIf (((Local1 & 0x02) =3D=3D 0x02)) { Local0 =3D Zero }
    If ((FSIS =3D=3D Zero)) { Local0 |=3D 0x00080000 }
    Local0 |=3D 0x00050000
    Local2 =3D (Local0 & One)
    SGOV (0x00180885, Local2)
    Return (Local0)

So a plain read is what updates the LED. Reading it after the camera key
event, like v2 does, is enough. It's probably worth a comment in the code
since the side effect isn't obvious.

DEVS on 0x00060078 (2 =3D LED on, 3 =3D LED off) is guarded by a one-shot f=
lag:

    If ((FSIS =3D=3D One)) { Return (Zero) }
    FSIS =3D One

FSIS only gets cleared in EC0W when Arg0 =3D=3D 4 (resume from S4). So afte=
r the
first call each boot, every set returns 0 and does nothing. Bit 0x80000 in
the DSTS result shows whether that first call is still available. I'd treat
the LED as read-only on this model.

Other things I noticed:

- The firmware handles the privacy itself. While the camera is "off",
  /dev/video0 still opens and streams, but every frame is a grey placeholder
  with a crossed-out camera icon. There's no USB disconnect. The key LED
  stays dark the whole time, since nothing does the DSTS read.
- On S0ix entry the PEPD _DSM turns the GPIO off, and on exit it only turns
  it back on if EC 0x50 bit1 is set. That might be related to the stuck LED
  in the original report.
- GPIO 0x00180885 is GPP_H_5 (INTC105D:02 pin 31). Micmute is GPP_H_4 right
  next to it. The pad is config-locked but TX isn't, so as a workaround
  "gpioset -c <chip> -t0 31=3D0" turns the LED on and 31=3D1 turns it off.

I couldn't call WMI directly because of lockdown, so this is all from readi=
ng
the DSDT. I can attach the acpidump, and I'm happy to test a v3.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
