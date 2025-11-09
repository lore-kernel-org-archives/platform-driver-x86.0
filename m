Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A3920ED
	for <platform-driver-x86@vger.kernel.org>; Sun,  9 Nov 2025 14:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762696833; cv=none; b=JgCl7yGtF0vgZD7Gxad8EveE6k5RAz8l4lft57xNOoe9zuE7OOO+8cUpvf3UnveWkz/P/pQoyKJRprjagn59ChcuFKK6URjp8viT2wg3JC9ZbcIsqweJ8n1mAKGvLHAHJv/U5Um8A63GWruVjyHtw6ZOPs5RfRQeF9L/xsa09ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762696833; c=relaxed/simple;
	bh=LyZ+q8U9FI+W4ULTSIxexdqHKfqyL3Owps+d6u2HMTI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eAjL1v3RPoDYUxA6zvG2YrMolCaTQFJ1Irct5/lf9GMx2S7gpYklqtXYwcIOn87w2XnxUMvyqOL0hYUyAJhiD5Uwe9lFU69yfFju/RIHzpTKTfcbCzngK1mccRPQjDEDgbjyzRCoTpMeoekDs83M+ukGR2QCA9m/VOOkErsuwNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qOLb5SLT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qOLb5SLT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B55A0C19424
	for <platform-driver-x86@vger.kernel.org>; Sun,  9 Nov 2025 14:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762696833;
	bh=LyZ+q8U9FI+W4ULTSIxexdqHKfqyL3Owps+d6u2HMTI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qOLb5SLTcNWudpG3AtJI10cp1tNPn8jSLk3NK89Eop9QOaO9kkM06P12QoISrhIWD
	 JDdcmuP1GSisSZrFf1NRyGEpDgomen+fBnD14J7uLePzIy2rX6NkMab7QIFfjAwkhX
	 wiQliGQ0n2ndOeQbaK5C44my8RHlNWceHt0KkRXBD0BJ1gw3I5ePOGYIbT0fovLzD1
	 Utn2CuKFwR6Gve3DsT6UXo2LJ6CBOhIM9ZbCb3G7DKJkoai2b3h1oLJHhpiorFhXJM
	 DOlUAKXQRNHXdIhvkIl3S2nuKRgAm38tPdg5PYUpUosKZSuxfuK32f+N15DbeK4KNC
	 Vc5Uma6XXQy3w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AE2ABCAB786; Sun,  9 Nov 2025 14:00:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Sun, 09 Nov 2025 14:00:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: edip@medip.dev
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220639-215701-Bhiz4HqnqB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220639-215701@https.bugzilla.kernel.org/>
References: <bug-220639-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220639

Edip Hazuri (edip@medip.dev) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |edip@medip.dev

--- Comment #3 from Edip Hazuri (edip@medip.dev) ---
Hi!

I think the problem is because your device isn't marked for the proper ther=
mal
profile
based on your device release year, it probably have victus_s thermal profil=
e,
Can you append your DMI board id in hp-wmi
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/platform/x86/hp/hp-wmi.c#n97
and try it

if it doesn't work you can try the other profiles, probably one of them will
work.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
