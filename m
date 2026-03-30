Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFC0341650
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 15:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774884349; cv=none; b=oTMniFHhnfBpGnuDscOcYGUs2CdqcBR/toltGc2sI0+zEEOdec9TQ1YPNrw5YkpOB3n1HKCEWrR+qblKVDXQ3cI8REtKxvVELsRJK9YRO/zYLLyVygqAc+/NWhtkIZdzbU6bt4Tki8EFxyUcjt/FTHgCsHmYPZNL7w7hKhi3oo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774884349; c=relaxed/simple;
	bh=Ydh+a+mZEyFXgTw5woKyGtFEfhtmow5dTtf8fnH0A30=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=la9kiRfMARFE90nRmswNx6ByMACKOhwSWBZPbeyAcRWdadj0m6o6f9EDCFreHwgT0wcZCTcJ/a6C1N/CLowhX/kuF49yUbkh97bkzKqDHpA++o5Z1XHUZJNUMyNAkEYNCtvc+xCCeMIvILUXYEWvzII93bvgWpLJIl9U7cl+2H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USkIxPqq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USkIxPqq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21670C4CEF7
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 15:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774884349;
	bh=Ydh+a+mZEyFXgTw5woKyGtFEfhtmow5dTtf8fnH0A30=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=USkIxPqqMzp+qF6pCJUIBB57Ngzr3qTFcthX2s6dN560DEwW2ILUOxO/V3H05pKtH
	 DEf/ddcLO5hyznr9mLOUG2JEeDX1RevQ7tHthbRoaqWarJb9oq9RSx4x/lFOsrIR2v
	 BCN8lMLO6HNkEi87U8XK6EwYGsoKoFgMO/0w1RRI8ocNRe50gKgyh/2HLk4XjT149D
	 lW+Mnipr5Jj8+1NcYtlUZL9wcwN2v3wn06gnkTl4BJpPVpKRckr719EG1bnEZEUSNt
	 w4ogY5T1o+k3qae8WzQR9eauA7sxvZrrAgLqGByqRkkDWRTRSFPpT9XMvhAocSSGr8
	 9GN2meFm1BGyQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 17A4DC4160E; Mon, 30 Mar 2026 15:25:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjExNTBdIFtCVUddIGhwLXdtaTogT01FTiAxNi1rMHh4?=
 =?UTF-8?B?eCAoYm9hcmQgOEE0RCkg4oCTIHZlcmlmaWNhdGlvbiBvZiBwbGF0Zm9ybV9w?=
 =?UTF-8?B?cm9maWxlIGFuZCBFQyByZWdpc3RlciBiZWhhdmlvcg==?=
Date: Mon, 30 Mar 2026 15:25:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221150-215701-W9mTFexxx9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221150-215701@https.bugzilla.kernel.org/>
References: <bug-221150-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221150

--- Comment #9 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Hi Qinfeng Wu,

The patch for this board has been merged into the mainline kernel. You can =
find
the commit here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D435da773966c80e1b2b6aea75460ef0e893fd9e9

It should show up in the next release (likely 7.0 or a 6.x stable backport).
Since the patch is upstream, feel free to close this report as "Resolved
Fixed".

Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
