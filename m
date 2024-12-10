Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561D443ACB
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Dec 2024 04:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733804335; cv=none; b=VC8gtgpMPJtxzGSmy7bGC2+DG6qqTcu0ghLg7VP7K3tsjlMa4uvIwr6xI2xMWaOAImaRNgkbH5cy3xMHGwNhjaWP9m5cMbDFmLnwXy5Rz7c28SdQ+MhrepoRHRpoq2ynqyZvqXg0naS/BClO/+vq4wITC81NcE6Rkz2zeOUeF/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733804335; c=relaxed/simple;
	bh=KDFRUBBCTLCseFN/fxUys+gqk6MUUnJntPv22YV04/8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UARSyoKQqRkm2tMrZ6LzLHOMr+AL3IYwJ4en7a68d5/yA6KefEponzuXugAp63e+7TDuDC+Bj3CCC/jeFt8p/OiFIw3INKhx5LA7wEhXSkYc4mpKwSiJyfholBkh/HvuaqUmlHFNmaM2vLoSIj6/GJHHRvkdEnoc0+m0eORTj+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZFForlf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZFForlf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7D1EC4CED6
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Dec 2024 04:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733804334;
	bh=KDFRUBBCTLCseFN/fxUys+gqk6MUUnJntPv22YV04/8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JZFForlfmnfwTru6bL/vJpMQ1Pzv/yOL1utlCJNzVVcewn05jvlhyZIGZNVDWfThs
	 nUprXchKbjBV5v9UCSEyIr2Pn7VYNyp39dl3uji2pRZl6JAvQKQewCGOEhfoZjFq+b
	 R7+fdvW07yze2ZdxpNL/j/qIgYv2U1ZSGCL4jQKSX36PGCHgI2PZpCPXCiDw8wB4S4
	 /hUI9NGzCm25KWDLi89N0uHrJRnUXH3a5D7Ria/yt8S0kygu+8dRJGwNGoKYOQRnJf
	 9Wlfdh43dTu2UrKEp6m91yaeeenYy7eOMi52P8NOT8q2Vd1hOMg5qUbk/hCXu3WeIz
	 7P8BYXm3x5LDw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BECE5C41606; Tue, 10 Dec 2024 04:18:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Tue, 10 Dec 2024 04:18:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219517-215701-PsCHMiXEDC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #21 from Armin Wolf (W_Armin@gmx.de) ---
The fix is now in 6.13-rc2 and should appear in the stable kernels soon.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
