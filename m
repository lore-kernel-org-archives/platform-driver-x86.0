Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DA52192FA
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 19:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780774134; cv=none; b=FLV9ISnbkOfChARlskoE9CU6jCo3om4xPykY/1DBQGhBB2V89arhPRoqSxAq2gsSqYu2I8qDdxhleFH0nsTqIHBztXMFe9Ib6+YP5shHeCar9cMbJhqzdZgNGVrcLNO1vYyIqx7DFtqcGc50ISwJQgmw9CuupN41aTekzXf0V2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780774134; c=relaxed/simple;
	bh=oyAPoepHl0yU5GomzmO2t7w+pifKz3OglIln4FNdk6Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FzFiDjgjIb0VFW6XvCD5RfxpUpLnlfwfksAr2GUjj6aPT0ZJZetalvrXF6BabbXXY+m7cUDGjmsWkiJSzrqw9IBh6q1RNY8cowMfanuM/n2AUz0RSVCdGAugYBIVoLd00tU1PJaRoqF4uGFustR2a/HOTd95YpZ28pO5xNiqR8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQpkGKyJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQpkGKyJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65DBAC2BCC4
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 19:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780774134;
	bh=oyAPoepHl0yU5GomzmO2t7w+pifKz3OglIln4FNdk6Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pQpkGKyJp23lBrFl3XBhHxjOKei8yy9HJ3MPVH9wtdN5P21KV2oP6BJw2TfIZJtYT
	 A45irh/hV+duLSBXWHu+vNc9QN/5fUsoD/x3UmuFvhm7IFmGUQYn9DQnAhW5IEE4vY
	 DIwbGMaKoWU2o9hNuNiGRoVMuqY1BX5b8eK/Mv+Jhn+klJyxkFq3tx4/zGd3H7oNDT
	 u+fNZ4tNsCf5ZFjL4R/fcI9/z5gTfoX8yYhgCCtAIk4SDfoP0aUXHte6r99X6ActZF
	 ydvx4D/2x69n+qWI+DRgMNT+fBZRUxLT8LXjtOww1c8VwJ0WQ+PsHGfaHiZiUjsyAn
	 bi0r1zVqCDS5g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 42026C41613; Sat,  6 Jun 2026 19:28:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Sat, 06 Jun 2026 19:28:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-NQK93iQLOx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #34 from Rong Zhang (i@rong.moe) ---
Hmm, let's try some radical approaches. There is still a chance that some
registers near 0x8A have something to do with the keyboard backlight
brightness.

1. Set physical keyboard brightness to Low
2. Backup 0x8A: sudo busybox devmem 0xFE00D48A 8
3. sudo busybox devmem 0xFE00D42A 8 0x05
4. sudo busybox devmem 0xFE00D48A 8 0x00
5. sudo busybox devmem 0xFE00D42A 8
6. sudo busybox devmem 0xFE00D42A 8 0x05
7. sudo busybox devmem 0xFE00D48A 8 0xFF
8. sudo busybox devmem 0xFE00D42A 8
9. Restore the backup of 0x8A: sudo busybox devmem 0xFE00D48A 8 <backup val=
ue>

REPEAT the same procedure, but replace 0x8A with 0x8B.
REPEAT with 0x8C.
REPEAT with 0x8D.

It could be dangerous as it massages a lot of bits. Be sure you have SSH ac=
cess
before trying this, as it could turn off the backlight of the screen.

If massaging any of the four registers switches the brightness level to Hig=
h,
stop experimenting and restore the backup of the register value.

If still no luck, you'd probably have to accept that it may not be possible=
 to
set the brightness to High using software. I don't have any other idea, sig=
h.
Optimistically speaking, you can still switch between Off and Low using
software and get OSD work for all three states. If you can take that, I thi=
nk I
can make a DSDT patch to achieve it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
