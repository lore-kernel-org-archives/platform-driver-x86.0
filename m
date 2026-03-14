Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8111C38AC7A
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 23:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773531847; cv=none; b=k3K7oo/6anYmGFiM0opzyfOCCM0mZDqkm5+QazHUjRv3yUpCWd6oJQ9JjI/3KGE3B1W4mZFvqlCBAjqIIx14sv6uRSf4U17wlXaGtr+tTDMZebvwmDJ7kWoOPLCYem2skF5NRYfKdxQbrnBQXDmhxdqw2WQEbDEGS1gy9XrfU/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773531847; c=relaxed/simple;
	bh=IPZaLNNnzmuLN1lDLJBPNM2bZxyy3WSU631FVSmRyC8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ka8mmKECtI6vSHu4OY75uqI1aZ5mBs3ocwTE7zpWzJuTjNOxryKBlbAILY8Fa1ulijeBEDjHuBeIQ7Bx9YOp6AluVaWVGH7Y3TAhDKQyGA2ps1xwq79txcqUdwxTIQFksWkOjEorUHkxSbhUJHQnzKsTfZoIY7Zv/9WXLToKD9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tx8NMNwQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tx8NMNwQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F5A4C19424
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 23:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773531847;
	bh=IPZaLNNnzmuLN1lDLJBPNM2bZxyy3WSU631FVSmRyC8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tx8NMNwQ9BU1dRW/K1pYFP1vOQmIiM3CwrARA/1jv4v8DtDNLZ+QDeFoL+pcOXA/o
	 hXznfessNZAkgukiEr4vBnwdC8eKS4I4otAJskpQHGaq+lXKhyUgAxLMXuo+vEFMks
	 9pFpcQGt/4hZh3HCDMFgU4fWWOqJ2TY2J0udzQSeBlS2RCLMPP2YXT2B8qKduWKhpH
	 vamxXB0yW4SkwI7fa8ja7k9IuMih6LRmos6PAQS0mHlZvgO8/G29iC1JqLo/NprWU+
	 OlLiqZw5J1lkszWI/Nc3z3MWEUELJYGv9eG6F62Dkoo8BSTabNLQNpKoxhAdLqWTSm
	 uG0fO3MxkcoJg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1B416C4160E; Sat, 14 Mar 2026 23:44:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Sat, 14 Mar 2026 23:44:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ptscheepers@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204807-215701-CqUq1X6Zfk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #354 from Theunis Scheepers (ptscheepers@gmail.com) ---
Created attachment 309659
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309659&action=3Dedit
Before/after dmesg, PWM tests, and patch for X870E-E

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
