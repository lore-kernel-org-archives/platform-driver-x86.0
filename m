Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558A842CB00
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212717; cv=none; b=bb3AIuK5bn+fXjtHnaucmS4bjoCDj/QqkMPheDrO1wk2au8pZM12f0WN+WMB1ycztlkcUN+5M2ViGPimCGOw/HnZyhwyxqTTZQXscBLxuGx4UziMvZLAl2V179L9pX8tMAnpnIY8N3D+vA6k5paEXo5ZcVpBiSIBx04Q1G4W9uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212717; c=relaxed/simple;
	bh=C/gHJSc+SbmjT8CBNDN4Pinl7Ai0YjQ2X6omIXffpDA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XrEojCZiTui0I/6GQ+VGDhDeAKVH37rhRDMhb3o2mV8k2vl7RR/0KQdgtdL7fFhrJ/2eq8FUKbszWmNUwwK9Xx5eKflBxZ1erztrVA4DPhNtky8Lk4C2k4mMjV3o8B2fQUUdrFwUURV0tapoyuack0dP1yQVRHE5Y6v3wuFVEuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxLdhSCj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxLdhSCj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7994C19425
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 14:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784212716;
	bh=C/gHJSc+SbmjT8CBNDN4Pinl7Ai0YjQ2X6omIXffpDA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oxLdhSCjXlk/jap8pvIGwi8TvjNcP4oWGIE/SkS2aXMtT7BPfU4obU9EXei5/JSEu
	 s74IvykmBG+lfEJai8IqCYPC070EyFC9ey/nttrsfnHy+DiFJvPythrXSO00XyNZG2
	 xUrgCmYMMT+RGeaNcSLiaafu3qaRgbFO6A+HC7fFgcOCbThdwYXf62uU/sp6RxpW+g
	 rfl4a8mujxfMoihkrsIHOGEQXrjKf/XeuUlBqPlzvwvteAp0Uc8itNzbkx++WKSz6j
	 HlxMHbnC8fkIL3PcziSwd1uOSWD1Jv51EhzaG1s5aQYfortK48WbBfpk2ZdAAZrG0W
	 5U6ZdfUZ5Zcjw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9207FC433E1; Thu, 16 Jul 2026 14:38:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221755] amd_pmc: ThinkPad T14 Gen 2 AMD machine type 20XL
 missing from s2idle quirk list - intermittent ~10s resume from s2idle
Date: Thu, 16 Jul 2026 14:38:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hansg@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221755-215701-WEHasnwG0b@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221755-215701@https.bugzilla.kernel.org/>
References: <bug-221755-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221755

Hans de Goede (hansg@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hansg@kernel.org

--- Comment #2 from Hans de Goede (hansg@kernel.org) ---
Thank you for your patch.

The patch looks good to me, can you please submit this to the mailinglist u=
sing
"git send-email" to send it to platform-driver-x86@vger.kernel.org ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
