Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5893137A4A1
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 14:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772203319; cv=none; b=lbI1hcDLJ6JZIxhNPayG9siB6PeoCkrllDRhJHpwkxH1ugOTgxQNN0rlTQe/oJJkUslCO9Hr2bgIzTJ2bpMQau+onjq3EnzkgLzyoKFolnETg/8VV5V/NLbJXmKH9Z0IWhOIxX1cYeYenL2FxPuxo0gtej+uVFPAI8dbEclzUMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772203319; c=relaxed/simple;
	bh=44VU9gPkWP5KCH5ghYnVvq3AZwSZQFq+PBKrHTCKo14=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SvQuGhVK5uFFtWp8MHT3A8QZzJez10pPzU9E66jcWZaTfexOOPppq1Zo9Kceli9lmq1qzwIwmMNbhHOTYk2qzPf2ucvXT3ODLkbHl4SA3UxRKFIhdKMCKj6kKfh1oAZSPyRaSS+MsBQxkO/f27Zc+cVbpSir65POMPnJlJOaPlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ty7G/EVD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ty7G/EVD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A335C19423
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 14:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772203319;
	bh=44VU9gPkWP5KCH5ghYnVvq3AZwSZQFq+PBKrHTCKo14=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ty7G/EVDYS+DN07Ypxw6NSAoCGFr3I99H4ODQF2jIQTzGS2Ka/IdW8AJlbJwAtDJ6
	 FrGxdXugwqDcaCnxEBZ/FBt6O/EM6t7PDmbhtmM2V2e8sjY+wxSR1AIwLiZvBN5hHd
	 2XCCqZlPq+veoQYXNia1yxs4gPc+EugRT6ymDQsrw7AyFXuEm7JG50BxfVyPIoTILi
	 MXaqo026Oe9bb6EsWqGpquy0r1AIe3fG2JlpbOBvHXwrzLMatIo4P8nkNLyODFrNEx
	 zOtSrmAtd/U1fCkXr9D5+lUoqeJay9XEE3y0iGakiz0/fK5Dd/R0fRd2iKk4uHftiI
	 GjOl9Y/tYonpQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E969FC433E1; Fri, 27 Feb 2026 14:41:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221149] hp-wmi: Fan control fails and RPM always reads as zero
 on HP OMEN 16-wf1xxx (Board 8C76)
Date: Fri, 27 Feb 2026 14:41:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Jie7172585@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221149-215701-8GUJ6xSNtC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221149-215701@https.bugzilla.kernel.org/>
References: <bug-221149-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221149

--- Comment #6 from Enderlava (Jie7172585@gmail.com) ---
Please use the following details for the commit message:

Reported-by: WJ Enderlava <jie7172585@gmail.com>
Tested-by: WJ Enderlava <jie7172585@gmail.com>

Thank you again for your patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
