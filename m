Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90F833291B
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 21:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770759011; cv=none; b=c8tEe7/JVLAY79tj6LrhES1fVfcTb5VSfhoMYZ8c/CuBSXzgOLVKEVvVGzv1HI5p4ZKtx40thQnqOV+au3ajsreZeFMH4mlvpdbppZTxnTEXJ+kb5N5HvHdvlBiIi6AEWRDxS7BkMFMrROfGKDeio6CI1PLuBLJovVeLVDWhvCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770759011; c=relaxed/simple;
	bh=hLX//+4utpdjr7RwKzwwRfKhdkmCpn6V5ZNqgNQFmrM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ewRMiFFg9hTkhsPKv7hPJudmimt8+lRrkz30pa+r1tFgvRDFcECHG0q7uMTEvYdgRtOXCKOV7LVwhsPCtH9Ied6KcsM7VQ5xq6+0TZD117ZQPXEywYv8J2blEdmniPmfor+yy4AgAJjjaZt0JbIPM9baDo/QE35QqCHYVNCHKSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lApqYgkH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lApqYgkH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA36CC16AAE
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 21:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770759010;
	bh=hLX//+4utpdjr7RwKzwwRfKhdkmCpn6V5ZNqgNQFmrM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lApqYgkHm1f+3eWHRHbDC2D8cpbZr/75rAuRgeauOIhMDUHsKnO1Rs/J2KAnHKiZh
	 Ntuh+t85lTeUjuXy0uw5EPcW5rCDtU0CQYxx8Q75sNp6rtt0fftFLQIQGniVdaoCo0
	 rqmRA7rMxPSAuRu9kxNxb66kh84P4QNNLzBWqCk+LI1Xt+awq2hn5pBSDchbezT4Ec
	 OxgEgPMxueQSGscZDq29pCSqpW440T3/dISJsqt8T2barTV+0tyGCsr1zBcsiOy68m
	 XC0ZfDwPuFhYshefBg/4BqxJeOfl2via3+/tl/FOKQv8oL4jWCzyUVr/RUgGfGjrjb
	 gAwqd0pg10veA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BCA06C433E1; Tue, 10 Feb 2026 21:30:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 21:30:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-qNl5ph7XEb@https.bugzilla.kernel.org/>
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

--- Comment #16 from Armin Wolf (W_Armin@gmx.de) ---
Also, do receive a notification when pluggin in your charger? If yes, how l=
ong
does it take for said notification to arrive?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
