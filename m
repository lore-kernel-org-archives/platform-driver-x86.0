Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F2E370D72
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 22:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778884255; cv=none; b=fNbjUS73njApTG30JLffsDetq4jEMtTDYBsZFLA5eTKN8jRfG57+Wbb2FtRydToXWbbPES38WDvOaUAsgCfDqtOq3QEXlrGgSxC/C+/8/UaVfca72J0oJza0bOMGtAAw3KY5zPwoPirddWBJu5v3n0jh7SApvPxhZqk7A7HRdd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778884255; c=relaxed/simple;
	bh=/N4D89C9cpcYdhZ8y8EtizgYRql2HmqotqL9B0utWxQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ym5OVyLEzYfmn0T691Yxa1KLbsFvMW5qlta+HviLoFYQdL41Sn+shB60j+b/V9L2XcCT7OI9JE54+gB0B8XHYYV4Gx0SD7occKF12Dy//3EEFjcfkUjtpB4xYrD1qo0CfuZE/4prkiEzUrMQ4GJ9pKj/UjkEpFXFC6QvmTtJNhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sUiDqP2F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sUiDqP2F"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EAD9C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 22:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778884255;
	bh=/N4D89C9cpcYdhZ8y8EtizgYRql2HmqotqL9B0utWxQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sUiDqP2FM+LZNZ86Pk4wtiNLYnrehTEq0ri92uRkPx8KsShCP7E/zqSmq3CaFKoj1
	 ybvxMtQQ1/FkPrayt8L0un+wcSpV1Bb8gbqXfsRkR9yaI0+lgXs39887FUEl7HCjnn
	 7pduNUqsRewoxXfvK6R1KMPoqr/1dsIysPB/G4kFIkAoRgUioF400FdE1GHiGOuThr
	 Is/c6ouHhsVb5SPCBb6xhkNsu2LoKT+iOxYMAIxHfUmsYkwagoEXoS5uKs1Du59axK
	 mlrx3yc/v/EAE+HM4lAziQqjYJTicLI6oPynUblVPWU7nIqQ4eg9qo1CEThpaJ5cLq
	 O/lplDvx9xTmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 55E3BC4160E; Fri, 15 May 2026 22:30:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Fri, 15 May 2026 22:30:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: rickk1166@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-0wLD0rBy4y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #79 from Rick (rickk1166@gmail.com) ---
(In reply to Rick from comment #78)

> The system appears to freeze solid for about 1 to 2 seconds (hard to tell
> the exact timing - but the pause feels like it is always the same duratio=
n).
> Nothing on screen changes.

Let me clarify this - After further testing: the mouse cursor continues to =
move
on screen during a pause event.

For testing I was in a text editor scrolling a long document up and down (u=
sing
mouse wheel) while moving the mouse in a circle.  When the pause happens the
document stops scrolling and the performance monitor stops updating.

During the freeze the mouse cursor stayed fully responsive to my movements =
and
did not seem laggy or out of the ordinary.

For reference I am running Linux Mint 22.3 - Cinnamon 64-bit - Cinnamon 6.6=
.7

I was also typing this comment with the ideapad_laptop kernel module enabled
and I think the pause also allows keyboard input to buffer and not be ignor=
ed.
(I was typing when a pause happened and I could have sworn that a key didn't
register on screen so I hit it again and when the pause ended I ended up wi=
th
two of the characters).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
