Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607623B635B
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 14:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137047; cv=none; b=MCKf9pWJ/m9rdcS8l2vUjT59ntkHeZKwjAliFQm7LCt6OLe0lRAZFqgjBhzxK6PEYjTJYjlvAyTuhY88pyjptZUQ8pmFxUWLzSzzfAZZEbG5dvSbphK3GSLrGWGhJftEhuVN5RdIlrmIqjQt4Lw7yhcf4K+fbRmjOB08+spXvt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137047; c=relaxed/simple;
	bh=l4XoqOh5amWKWuXYIOpVadY8macXfX0ExRSwKMDEqMo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y/2XNRUUSiulcMZW0e8Ag7gMESSNr9fzAWKzY3zNv3EnxRhCeI9HRh2K2ETWx+zDr/Kd4uVdUj6avy2aDb4ekpJ7kQs316IX2bMULfcQmD1OZN2VjlbxOhsOQsrUeFrpIa+ejGOkVGvlqZ+bYA4mPl1VUHGwOLPrTc4TKXLs4IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=btxwcgi+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="btxwcgi+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE7C2C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 14:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782137046;
	bh=l4XoqOh5amWKWuXYIOpVadY8macXfX0ExRSwKMDEqMo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=btxwcgi+0Qkn82IaaLmoidSSpev+9AJ1eU6psEbjhbxk792karLGSifyxdr7Z1PoI
	 fA9E9jgHywk2ZMPp7I3AYpZHbEBaABbRZ7aS1cYIKN6P2GA7c+3hTgcQ0ujC6AVSrb
	 gvpVTd0836smiIEJYFC2hLPXTw9Do4rwhsGlfpiv2VAWwtN7MnOSXN8Wn50dNvuVdP
	 WpFHpjotOCtjlo6mTBQRNhJtfmWuDdBgXwDibWVUs143OOmHWGdqARu5Y23+tE1yJf
	 CpurWQ9Riih/Akz66m7Du6ml1hj35hLPnTFwYLm6S9t5HViMkhZz/aRhV98DgQVoV8
	 Ec3Yx5BSo4QKQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C48D7C4160E; Mon, 22 Jun 2026 14:04:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 22 Jun 2026 14:04:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: scardracs@disroot.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-CIl76zrMGw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #48 from Marco Scardovi (scardracs@disroot.org) ---
(In reply to Milan Oravec from comment #47)

> Will you push upstream those two patches I've tested? Thank you!

The patches are on lore for the respective maintainers to pick them up. As =
soon
as they merge them into linux-next they will naturally go into linux stable.
As you have already posted on both of them that you have tested them and pr=
ove
them valid it should be faster than normal but it's not up to me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
