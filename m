Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FA01A2C04
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 May 2026 18:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777832734; cv=none; b=lqx01QZWw3BGvCQvfXVPCnwLLIIFes2pvjt4Td5Ft654LjkfAZ5xJecWuldtVT8BPB/7Bek4gbcEN30bsc8NKM/KY57P/ZZGt6h0ROb/wRPHMCdkxeqIc5lu/rlBS5pIUBNKO5an05qp8DCiGx2EuIcU2axpglGbv7ZkgcrZmus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777832734; c=relaxed/simple;
	bh=fuRnlXSo8D3QuWp0vcv89mhUcIdQ9YjnvIfg898Z1fw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bzq3UGGcx2uMRt/Jhs/DcVAmiLubqw1b2R8/P088FKr0IFW1Ex9SnRT2BVCRpwpjySMMh2YhI9j8OIzkHChVjZRiBmekS/n/a3v0pbW3RRuhNfSF73ozqtr0HXAPle3iszWIqZ3qcCjb/0n2rpkkQtBUN2msRWLn0n5E4MvPoHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tuZoe7+J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tuZoe7+J"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D74C9C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 May 2026 18:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777832733;
	bh=fuRnlXSo8D3QuWp0vcv89mhUcIdQ9YjnvIfg898Z1fw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tuZoe7+JMpFbXVusXTAY4BN013eBSQsxsxs8fUizah46EtTgRunhqFH3vh3DPXxBg
	 2Zv0TfU0421rJtRvXMsUR9woKmwGtTnycHM2TwXdL9mEghTs9frJncVOkq7LfccixT
	 44r93Lxqj0tx0szVc/emoDNeWjc2DOAD+QRkY9uCYO9xeXyKyecnsyGqxwEZt+j1qv
	 1Km5a0wwtukOQ5TkPudYJvpdzXZ42qhxTd6WvMZwqlIyIGQC8d24XmC7uhjttDm9Xk
	 ZBJy8j37z9NrR3RpHsnvYmpxJBxOSx9l2Ee3zZ3/Sh/q2mxOmR+sVewV42SxxKtpiq
	 OoECQPGijd+vA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CE80AC433E1; Sun,  3 May 2026 18:25:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221419] ideapad-laptop: brightness keys require continuous VPC
 polling to function on IdeaPad 3 15IIL05 (BIOS EMCN60WW)
Date: Sun, 03 May 2026 18:25:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ladha979@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221419-215701-CZnbL457U6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221419-215701@https.bugzilla.kernel.org/>
References: <bug-221419-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221419

--- Comment #3 from ladha979@gmail.com ---
Update: Issue was present on kernel 7.0.1-1-cachyos. After updating to
7.0.2-2-cachyos, brightness keys now generate proper
KEY_BRIGHTNESSDOWN/KEY_BRIGHTNESSUP events on the Video Bus input device
(confirmed via evtest). It is unclear whether this was fixed by a specific
change in 7.0.2 or if it is intermittent as previously experienced on Linux
Mint. Will update if it regresses.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
