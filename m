Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2F241232
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Apr 2024 07:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712905725; cv=none; b=F6xqrj7ZrK93lo15plvRq+5dQVuDDlHFTJc59ChV1yCpsJda6236+ND3cnarX/GrF8Rt3mXY3ZfbYIL9b6/2zYRNdOS/Daa0tc3VBmn/gFlnMLRu2yZrWm8e/Eo2QQfOUF0UKmMWxbxaPRx2kdZxcswwj/0XNrAhaGO2rCExvbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712905725; c=relaxed/simple;
	bh=1DCRlUOw9g0+tJLxETqM45GZtZJz3tYzzCEY8VdnTM8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UIYxwfdE0J5iyy/dINvd2BsvicOBfFL/qRK0mBw652UWxlR23ysiC8TJeB2vFN1fDPxv7QE7GMjR+FNUxPxxdF4cMea0Cv3XgzDucozlhygAA5YV5VS5KDLUEWYA9sAGLD9IvJw36NXkjznZ1xt7Q28KDiqDZfN0Ol32oRnUjeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtCbvuKu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtCbvuKu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56C3AC113CC
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Apr 2024 07:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712905725;
	bh=1DCRlUOw9g0+tJLxETqM45GZtZJz3tYzzCEY8VdnTM8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EtCbvuKumaP1a/9XmWcpdSwL1sMu+nm2pQpKHOjfVGPZw4MRva8MziwJAP1okvGis
	 rmlExqlDO42TDDBamX12lpL9JGwuZwJ+oCb8BTBm4c4w0wS/3I5CyoP6wGuh2e7qwr
	 bAh9Q+YA2gzrlB0lIJmDhkPSnQ0DPklWMBxi9jKvDzIV6sinj5zIjV4lcYNFmOfbgd
	 L1+WqgqvbfnlP0l5qja5DG2zxxgiWsxMR8+MbH6mCxIgktg2xo+e1Bj29yuGSN9rzT
	 ivh+qgf6VsXtkwEzyxNsETHnBgp9oucUSvGQVePkFTRDE6XOKv48F0Q+wb1tewLrID
	 0XQu+UvVhgOWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3C4B6C433DE; Fri, 12 Apr 2024 07:08:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Fri, 12 Apr 2024 07:08:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: al0uette@outlook.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218685-215701-rKQhetALFy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

al0uette@outlook.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
