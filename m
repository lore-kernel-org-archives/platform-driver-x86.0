Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF791917EB
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 18:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723488947; cv=none; b=uQ/bBJVk5lDxi06CKZxsRq+RHfHW30GH6tAgVLTOq0Wh5dudftf6v12e2Y53YTLjiW8+kjDIJocfvNp/5DtBaZY/UbZOsfdbNIs408dIcuummTKF4WbcC/Cc9KWKSxLhCVjjZbuq+Jt+J8UYa75uO8cHWKSM1R92L8WaPxmTClc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723488947; c=relaxed/simple;
	bh=nzpGQJxRGUXpvjRR/gq99A3GO/inXnl05aj3BEFSTG4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SqmqwceENOii5JoqdoUJWECz3+W1qE+yfLPM2D+OxP5UxW1Al7JMbtcfSsuYdCX+ugHTk2l6Vfb69sNJN2b5vXn+W5OZYdspeTPuB7Lt8jDHxWQEeZ96zMKwrVrambInN9deuAgbpoNLoepLbIqSIusKuL2YSLRva93M7nUTRUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j0cIZ+Xx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j0cIZ+Xx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 349D3C4AF0F
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 18:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723488947;
	bh=nzpGQJxRGUXpvjRR/gq99A3GO/inXnl05aj3BEFSTG4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=j0cIZ+XxI+olFz1v1a3FBdhK79KeQjDdlSOpOQuN5LV8CVEH3lpW/Aqz5r4qIobfk
	 cJjlPsm+1B4o0M1k9DCiVxB/u6FEKq5EvZC35ZY9Rsef1trcsKxrqmsZsS8k17xPP2
	 4QiWCJ9TXDrZRspb3azhpT8TezgAhwSYPSYvJrxVB2tXihXOIQBtJwPc2ukdbACQXj
	 PtdTy9GdiadAvkplcpNQ9/UhnIMsZ9528gnoxlQsLHMCEGbcl1KU8KxBB4gWygD3Am
	 qsyRmL5c7AG21gt8gUAS4/+01c78JSYUVTRO64GVwwfRwo2MazqDXepqX9+EjaItIK
	 sDQpmOxXch3Tg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2A7ECC53B7E; Mon, 12 Aug 2024 18:55:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 12 Aug 2024 18:55:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: prasun.gera@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218305-215701-7CFRUBBIl6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

Prasun (prasun.gera@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |prasun.gera@gmail.com

--- Comment #71 from Prasun (prasun.gera@gmail.com) ---
> > I suggest you guys raise with HP and point them at this issue.
>=20
> Easier said that done: they don't care about Linux via the official suppo=
rt
> channels.
> I'm sure there is someone who cares because they distribute updates via L=
VFS
> and they even sold Linux laptops like the HP Dev One but I have no idea h=
ow
> to reach whoever could be interested to fix this.


This also affects Rembrandt (845 G9), in case someone from HP makes it to t=
his
bug report.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
