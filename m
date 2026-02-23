Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05BC2BEC43
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 10:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771843551; cv=none; b=upmsmYr9GjWxmyOoAoflt2BwssF8JOXK36XXSZpMyErQjFMPIw+I2aL3cLi9g4o/geoUj4H/NbjZ0/ZGNoGvoinOO5IkdMRHb3/grcqfGVbZPrAG6O7aWxmcllJABUMJoT0k+U6fbCQWWnapbb0h2HAxKY53GSulDUARxYLI7x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771843551; c=relaxed/simple;
	bh=nYgKFjMYc6lEWM+PIh8bKqWaHPSjUTTjxTzRsC7uo3Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rwRid64xlUCdPkiuSmSnYx0vUnSYK/V3anDLipRDe3E+H4qqSijk4Dmt3/eov2jYat3HVy1XADjL2jR6gp1Uppyq0ptTUoJTCXO56+Ins+lT6zR4j685QjZPBDO5J6tE+AIPc3976LxKPG+74UQSUcOWCJ0jDoD2RP9VUlwYCzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tN+4+LNV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tN+4+LNV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2E85C2BC86
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 10:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771843551;
	bh=nYgKFjMYc6lEWM+PIh8bKqWaHPSjUTTjxTzRsC7uo3Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tN+4+LNVYQEYWJvlACjSnWWRpJ6XmaJ/QeHXyNem8D+lIpCT3+g5mdYTXMiw9QE3o
	 67psLHsqM+YGI1tJNXlW8078SAzO/sECSnq183JEpCxpossCaSPX8UqBOirNB4GFoT
	 Qz2oEgNe+TT/pTnQEOExWnvXGVTJInAYB4QrkIu5TnTnNF4I1neWe/zLWDcpmJJnMB
	 RCMuO124roXIjczxSH9GrIObDzpgheyqj/Jv2MSuiBzZ3idfx2w3YdLoJqLFNIsGmI
	 FGglcgDZ+1c2CmiBNS1Yjo2j8MCezplpB6smlogHk9bP+aLzeteBPbjPB7E8/tSYSW
	 r5f0g27tmmKYg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 91BF6C433E1; Mon, 23 Feb 2026 10:45:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220722] Non existent battery reporting for a laptop with
 touchscreen MSI
Date: Mon, 23 Feb 2026 10:45:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hansg@kernel.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220722-215701-rHFNRz1INf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220722-215701@https.bugzilla.kernel.org/>
References: <bug-220722-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220722

--- Comment #11 from Hans de Goede (hansg@kernel.org) ---
(In reply to ggrundik from comment #10)
> As I stated in https://bugzilla.kernel.org/show_bug.cgi?id=3D221118, its =
not
> the fake battery, its the pen battery. All you need is just use the pen,
> touch the screen by it, and this battery level will update according to t=
he
> pen battery.
>=20
> So now you removed that feature, and pen battery is no longer showing.

The problem is that without pen nearby the HID battery reports 0 charge ins=
tead
of not-present. This results in GNOME showing an low battery warning every =
time
the user logs into a session which is very annoying.

So until we've some better fix we need to choose between many users getting=
 the
annoying low battery warning all the time; or the few users who actually us=
e a
pen with these touchscreens (which is quite rare) not having battery info.

Having the chose at all between this is not ideal, but until we've a better=
 fix
just hiding the broken battery reporting is the best we can do.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
