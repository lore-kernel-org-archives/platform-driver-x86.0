Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0508B3BD228
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jun 2026 16:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589768; cv=none; b=CXWjN9386QIkvAw2U9v826ZR4kDHbJ+tPnlmY/caAY9h4GN0DSleycYr5MFG3MtLeMI6XXlJQrnCbFTd4atJOlzZh8DTwEjBPL26d2vtCOzoIfIduktOXhEk5cu1vuresyIZuitadAyXWlSA7Q4/LBYcn9meW07R0aB8ai3Y4oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589768; c=relaxed/simple;
	bh=LPevVO2zh/0nr3goFgVab53oBY1U+Pype38+m3Krid4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SE4ylwMaSaNwQVgfXuNxG+rrA3kSGm7/eFoPZyWKTwDij9U/zVlEWTufnjh1i9H62vf2C0tGd0wrfQpCDqgjcItwqiypNlHyQXuW8EyAvxdYNDjgAcp1mPPhqAOdYgummncFqjLW3Rz/ymR7vg8KfZ9YL7P7xToCO9DYtkeSNuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h8YAwIXZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h8YAwIXZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 989FDC2BCB8
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jun 2026 16:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780589767;
	bh=LPevVO2zh/0nr3goFgVab53oBY1U+Pype38+m3Krid4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=h8YAwIXZs4tb3OaL9yoRsd24BndP7fAqYiwrqippa6YZHp6VsabSG3pyqE5PYfqLe
	 euYVLpkVujtA9fFu/NNetdmqWPcY/V09Aq9hgg7GqwqW/2h3UTvUddSw3MM53VrV9q
	 VdFdiJdKrKoMOnAHsxsG0zsYY2xbUQWax5vAQtpIoDzH0Dcp1o0RhIGxRDRJFpyTMH
	 X15u/l3gCXhx8i6JGgCNWSxzP+iep8snHTKc62CVOe3bmLkVP5fRyu0hsnJrXOan5F
	 7V0veaBR3SJd3tJIB5bym7UlW8KYe1on3ZZq8O3dH+wdUWANYyMETsqQqm24qNv15t
	 EKoNeZE+XXlFQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 86770C41613; Thu,  4 Jun 2026 16:16:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 04 Jun 2026 16:16:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-3x1Hr974pw@https.bugzilla.kernel.org/>
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

--- Comment #77 from Armin Wolf (W_Armin@gmx.de) ---
Can you check if another input device emits this touchpad event?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
