Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD4D303CAE
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jun 2026 11:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780831282; cv=none; b=DQK93ws+4n2JOOQggsHq+V7PaUu2PSXvh+xQVZpoKTOjoNybzIUrFuDcCfKC1NK/8tX+3/FYpyXgu0M3XnhBrLs8+bJP9AxTubgyRjGBFjmF+/ZZJMlixTr1k5aA5ezkO72tA2W2KvqZGs87+NlhPUFYZ3rG1uTdVmaKxsJwI30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780831282; c=relaxed/simple;
	bh=Yi0ZDlVaWKn8xrRk6N8x2D1bULYJqqkXKTLMJ1Sma0E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GEEyhWPCdHjoGiuNOEt8d0fNh2CIqsGtzr9TOjUncv5xJxh0dXh8YnU88nhKTguj1kjOV/C7Dt3cvP6b7dY7kHEFxzDAuZmN6Kb0lFMHBoNT/nD7UHQ/eQBqU4gI/W0EEH14ABMobJ7ujpcSdbBLRkEImqc3HO3EATTorvoxYp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bX8IUizN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bX8IUizN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5C1BC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jun 2026 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780831281;
	bh=Yi0ZDlVaWKn8xrRk6N8x2D1bULYJqqkXKTLMJ1Sma0E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bX8IUizN34ZAlecfFPaw5NuUE9eo8D/l8cbuGvINqbKbz6bHzWMq+8u2zIilKDqLp
	 82ss9hHdWcczNkoZYgmQXTj5QWbThwZBO+gNdBQAFLnegQnH4/DH1B72uEwRXyc59S
	 vqtnzE4f6P7rIKj3i6bSZ8+iy4Dzu2AQSpS8GBGDH6anAmxKWGJJOBSvPLRG2UWhbM
	 LENNdXLn948YLfUfPuqGqcs0VREx8i1NaHXueT5LBPk3TgEaGgVF2Z3+MjwapSSjo5
	 jZYi0CVi8Go9TP7aM3pcWwsvyEzVXpkDFkp8vjqDjmF5J1qi8XqfPI/TgE5fXYy8iw
	 bKr7BAythbfPQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8A201C3279F; Sun,  7 Jun 2026 11:21:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Sun, 07 Jun 2026 11:21:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-221583-215701-7YPL31XDGs@https.bugzilla.kernel.org/>
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

George (george.stafilidis@proton.me) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
