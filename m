Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792FC3A6B9B
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 16:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776961819; cv=none; b=mr8QQCQYKra1f/bienavTi5G0mSPGee4Kjd6nePhXfOytAtuvsq691HddIdodxJlN7QNGHfI3jwflbX6q01JuSrSMJ2K5MkU7qcvnK9rkC2wtG3jtoRqzItiYfV9oRsE3uX1rsugHRxrmu6V0QHusjh1I+anmXfQRn4TKJDyZqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776961819; c=relaxed/simple;
	bh=Nr/r4EI4GbI/KyGoHO7nTS8M3U0kMF7fqjN1ZAinJeU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nm60Paf8CiibynxtySJcE+sVjMA4Kq6kIt3hv1utpi1ltIVOc8RXmj0O7wsJ1LAq1ih4AjFRD1/bWdhiCwiG6oNuvoyoDPyKo8eHifYm++FKs2VjR3c+VLQXKLMvq/inttBapO9apHOSkV1MBj/oNDnkDXa8piAiPs34R3sNdEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iALyChCg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iALyChCg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3726EC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 16:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776961819;
	bh=Nr/r4EI4GbI/KyGoHO7nTS8M3U0kMF7fqjN1ZAinJeU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iALyChCgJW+19nXmRXENeX2UCcmmwodOi4jRwqb2ux6bqXDe6CnKm3Q59ULCpYEMf
	 scfGpT33EGsN2ap9kJciSGNLJCM9jn+7FtDpPdxr9t/ATVlkcwiI5JrDh31dGSdaSe
	 EM4gu8tbcOB89Wv0lDnEGjpuKcxT4JJAM1+gVlqJoerGhjndzcIkZUS7vIrW5ud3Eq
	 rQ0T1DzXhk+LqKS0qw97HrWAnDzmXDqnTDdoS+a10l6Eaj0NT3D2XDUI99ISJmbcwb
	 lzhAOWvH893PB9MxkfTsNgbE5QEriUHHHlBxtf3bctnCEojFt7mNfhMq2xnvEY00Cu
	 BMTBetdTDV89Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 25736C433E1; Thu, 23 Apr 2026 16:30:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Thu, 23 Apr 2026 16:30:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-CByH6xGnT6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #23 from Daniel Gibson (metalcaedes@gmail.com) ---
Some more observations:

- `cat /proc/acpi/button/lid/LID/state` always returns the correct state, s=
o it
seems like the lid switch still works and can be queried after suspend, it =
just
doesn't seem to send events anymore
- When pressing capslock on an external keyboard, usually the internal
keyboards LED is adjusted accordingly and dmesg tells me that the expected
bytes are sent and received by i8042: ed -> i8042 (command for setting LEDs=
);
fa <- i8042 (ACK); 04 -> i8042 (parameter of the command, bits for set LEDs=
);
fa <- i8042 (ACK)
- Pressing a key on the internal keyboard still wakes the machine from susp=
end,
even if the the keyboard otherwise doesn't work. Even for a second suspend
where the keyboard was already broken when suspending.

Maybe pressing a key (or operating the lid switch) just doesn't send an
interrupt anymore after suspend, despite otherwise working?=20
This seems to be the case for the lid switch, no idea if the keys do anythi=
ng
internally, so for that part it's more of a theory.

Furthermore: I can make the "Failed to deactivate keyboard on isa0060/serio=
0"
message often go away by making __ps2_command() in drivers/input/serio/libp=
s2.c
use higher timeouts for 0x00f5 (ATKBD_CMD_RESET_DIS), like it already does =
for
PS2_CMD_RESET_BAT. But that doesn't change the fact that the keyboard doesn=
't
work after resume.
When the `ps2_do_sendbyte(ps2dev, command & 0xff, timeout, 2);` call in that
function fails, it returns -5 (-EIO); I think the problem is that no ACK (0=
xfa)
was received within the timeout.

So it seems like after resume the i8042 interrupt handler is only called for
direct replies to commands sent to the keyboard (I think I've only seen ACK=
s)
and even then it:
- sometimes is later than expected
- sometimes lacks data ("[  363.566845] i8042: [363145] Interrupt 1, without
any data")=20
- sometimes is missing entirely (no ACK at all after a command)=20


By the way, there are several reports of similar/related issues, some of th=
em
resolved, see also https://bugzilla.kernel.org/show_bug.cgi?id=3D221217#c2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
