Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E567436AE3
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Dec 2023 12:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVH1Bp0g"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D8C0C433C8
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Dec 2023 12:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701864025;
	bh=sOlNZe67Ha0vOk/TEEIvciQln0ickncWaKTzLBwR47k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bVH1Bp0g3WE2jAI9LfhD80iE1IeeaHoXYsxwDOOqkI5+kbGE9kdEFhSZKRCCwC/zk
	 N8JV30zU/qBIEpeGCGOMqEjTrU69mbk7ObJEYnsUyA7XEeXAV29LiwLkKNRsqYW4Iq
	 uOso0hdSG7iRC3ZTqXYtMbow3rGfpm5/Z1EOjsVtqWqkoDzAeGTda1HXM88pWuaFD4
	 B5xGHHcLjVLQA9gR3JO+UXE8iJ8EcztOcbm6UdeKkMjuIQCoy5zmfBUeZ2KLF9QcGZ
	 ujVKXYvl6uqaZyumBOnfgQE79ttfu538vCNJD0L5gs5IOZ+hXqNdyaoZ5D41UzT/UI
	 nsBb3LEblHGYg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 314CAC4332E; Wed,  6 Dec 2023 12:00:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218143] platform/x86/intel/pmc: regression found in commit
 804951203aa541ad6720c9726c173d18aeb3ab6b
Date: Wed, 06 Dec 2023 12:00:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218143-215701-d8aHGe044A@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218143-215701@https.bugzilla.kernel.org/>
References: <bug-218143-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218143

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #4 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
(In reply to James from comment #3)
> Dear David,
>=20
> Just to update that I've been running your "Remove GBE LTR ignore" patch =
on
> my Intel NUC 8i3BEH for a whole week and all has been stable.

This looks stalled. Or did a fix for this make progress somewhere and I just
missed that?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
