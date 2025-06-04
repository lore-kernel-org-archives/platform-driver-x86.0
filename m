Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE24171A1
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 18:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749061017; cv=none; b=A7xiQE7nnaPeLYwTDZCSU8SR3azdWC2C5kXLbflw93lbnf2vHNq6ROiqDt1i79VXzZoLFfCT4lTT2hp9I3nWxFT085/z2LEwXFks3WMx+Jm15Z/rYKJgx6pw3kR9VUWju/bnm9oPuOUac801MENszq9mE2kUVHl06OY6KPcmgkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749061017; c=relaxed/simple;
	bh=yfJGdwZe8msBu0/U/CWlkLYlGj7EUKo4oui2FE+c7w8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KqulXMkrqkDuB0uxiVqFN1sepCa98KBn0J3zD3srup/ll9q++/UXQYsTP/JGtXqNq5469qX7rhjbDzTRiH2RcF6+pkWzAoSQkiPDSf3H43VMdKiklxiGdnO7W8DZm6d35/vZk1BKl9DU3syj8zUek4AThq8amJHoqImT/WGEFpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOIZkFLi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOIZkFLi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07563C4CEE4
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 18:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749061017;
	bh=yfJGdwZe8msBu0/U/CWlkLYlGj7EUKo4oui2FE+c7w8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NOIZkFLit7cXcPyEY2b+4OmH7im2D9KWy/IazARND+QYjViKkEYokz3PKGUbk7wnM
	 dpPZCQba4Fa+kBY6l0OlIpeameu1GIafrngN9+iXwK87Fj2h9VPOAM1pCUlttnTiGo
	 2Cob7bAs4p+2r4T70m24fzJJx15i9aVFpwhDD8fIQvsKFlB/v3mWaDyVsKNO3y+gnZ
	 oetsIfMjqVyZycG0NOlKHUD6hTUEH7d002mZxQ12U0fzzDcd2xhIYvsDrmRfTo9QdN
	 zMHLBFuJGP9ehzsHehQ/mVXIrhse8gxxHBQLY74U+jGnYavW1VvrvcfpJZnfVVkA0x
	 YGTFgoLmsXoWA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 00514C4160E; Wed,  4 Jun 2025 18:16:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Wed, 04 Jun 2025 18:16:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: mario.limonciello@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220116-215701-UT3WZURkfs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

--- Comment #15 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Can you try my suggestions from #11?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
