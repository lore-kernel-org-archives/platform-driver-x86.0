Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F5E1A724C
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 04:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780718400; cv=none; b=lL4GfK4HPgglR8/8lW7XwsBIun0C7QRQ2B9oYKKht0x4LtLzvT/81VHXNP28JWSxqRVY5wtn5GMOrUuuRTkjL5BUXEP17Zt7hRBnZyV6BIZQRWJpgI97yTY5UTMJ95P32qnocABVvt+RkukzOx3gfWMU4Qbe4IkRPOftc7Cz48Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780718400; c=relaxed/simple;
	bh=KgHi2M/gsYZwJCuhf8eY/qkofzDMEal9ugCI7RcTzl8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WWiaE5VR+0MOt4mUTV9f/SV8qqKpRd91ujMf3Gl1lGzD8pUL/prx/mKisvfasIsF+QYtZjoW0kK2WeyrxGxVD1uONbp1Y1z7XMFpOiozUUyLKd9PO3GRSSI314gVjPs7QpN93NzCK7LC3rTVh+j4h3vk9H+Vf0+wqMrI2AO22D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJs3aj+d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJs3aj+d"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FE14C2BCC4
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 04:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780718400;
	bh=KgHi2M/gsYZwJCuhf8eY/qkofzDMEal9ugCI7RcTzl8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oJs3aj+dTPcqz/3FK4BQYSiRFxmFPJyYRax2lXKKjytccXYTtC3zD2HSxCLRTeDgG
	 tR8d7nVi4lTTrLKlfLrYY9GfpCRZi9BpzNO2YnbJdCMZ2yKGc6nEgk/2ll+dJm2ZfR
	 Wnim6RbZ+aBh+kLeDzIsAp7kRMFrOzATUpQxNhAy9MULs7bXeVPmjGSPjznrefuMCf
	 DaED5Y7fRc+kl9xzZeT9kaDiPoqCiu1Iucaed83WvTON//LdC6kz4Y/94xc/sNScA2
	 /w20+VPwi6uUTQ8WwpCpzcZK4BxL7hglqzjw/WJKEw4bNHkqd4V6JLIoKH/JNkjiDI
	 z+kfkPq3C040A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3F002C41613; Sat,  6 Jun 2026 04:00:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sat, 06 Jun 2026 04:00:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tacodog311@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-Uu8v3HbBXg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #82 from tacodog311@gmail.com ---
Fn+F4 still double taps the touchpad toggle.  Both input3 and input9 are st=
ill
sending signals when it is pressed.

Fn+F6 does register as KET_F16 now, but the LED on the keyboard does not
change.
I don't know if the keyboard LED driver even works on Linux.  I've never be=
en
able to modify the brightness with any of these commands either.
https://wiki.archlinux.org/title/Keyboard_backlight

Fn+esc registers as KEY_FN_ESC but it does not trigger the lock.

evtests are below for event3 and event9.

/dev/input/event3:      AT Translated Set 2 keyboard

Fn+F4
Event: time 1780716639.429911, type 4 (EV_MSC), code 4 (MSC_SCAN), value 1d
Event: time 1780716639.429911, type 1 (EV_KEY), code 29 (KEY_LEFTCTRL), val=
ue 1
Event: time 1780716639.429911, -------------- SYN_REPORT ------------
Event: time 1780716639.434958, type 4 (EV_MSC), code 4 (MSC_SCAN), value db
Event: time 1780716639.434958, type 1 (EV_KEY), code 125 (KEY_LEFTMETA), va=
lue
1
Event: time 1780716639.434958, -------------- SYN_REPORT ------------
Event: time 1780716639.436972, type 4 (EV_MSC), code 4 (MSC_SCAN), value 76
Event: time 1780716639.436972, type 1 (EV_KEY), code 194 (KEY_F24), value 1
Event: time 1780716639.436972, -------------- SYN_REPORT ------------
Event: time 1780716639.442046, type 4 (EV_MSC), code 4 (MSC_SCAN), value 76
Event: time 1780716639.442046, type 1 (EV_KEY), code 194 (KEY_F24), value 0
Event: time 1780716639.442046, -------------- SYN_REPORT ------------
Event: time 1780716639.450140, type 4 (EV_MSC), code 4 (MSC_SCAN), value db
Event: time 1780716639.450140, type 1 (EV_KEY), code 125 (KEY_LEFTMETA), va=
lue
0
Event: time 1780716639.450140, -------------- SYN_REPORT ------------
Event: time 1780716639.455183, type 4 (EV_MSC), code 4 (MSC_SCAN), value 1d
Event: time 1780716639.455183, type 1 (EV_KEY), code 29 (KEY_LEFTCTRL), val=
ue 0
Event: time 1780716639.455183, -------------- SYN_REPORT ------------

/dev/input/event9:      LG WMI hotkeys

Fn+F4
Event: time 1780716864.009289, type 4 (EV_MSC), code 4 (MSC_SCAN), value 74
Event: time 1780716864.009289, type 1 (EV_KEY), code 191 (KEY_F21), value 1
Event: time 1780716864.009289, -------------- SYN_REPORT ------------
Event: time 1780716864.009310, type 1 (EV_KEY), code 191 (KEY_F21), value 0
Event: time 1780716864.009310, -------------- SYN_REPORT ------------

Fn+F6
Event: time 1780716968.636981, type 4 (EV_MSC), code 4 (MSC_SCAN), value
10000000
Event: time 1780716968.636981, type 1 (EV_KEY), code 186 (KEY_F16), value 1
Event: time 1780716968.636981, -------------- SYN_REPORT ------------
Event: time 1780716968.637009, type 1 (EV_KEY), code 186 (KEY_F16), value 0
Event: time 1780716968.637009, -------------- SYN_REPORT ------------

Fn+esc
Event: time 1780716940.258373, type 4 (EV_MSC), code 4 (MSC_SCAN), value
40030001
Event: time 1780716940.258373, type 1 (EV_KEY), code 465 (KEY_FN_ESC), valu=
e 1
Event: time 1780716940.258373, -------------- SYN_REPORT ------------
Event: time 1780716940.258384, type 1 (EV_KEY), code 465 (KEY_FN_ESC), valu=
e 0
Event: time 1780716940.258384, -------------- SYN_REPORT ------------

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
