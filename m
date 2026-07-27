Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640843911AB
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785166936; cv=none; b=RJa4lvkIVFqfDLJ8XK0znRxcqf7AiacNiGg7bmoaE3Zd9DBpKSM7NJtysLr4fcEiptAGCoxYAiIxFfDqPYSa7Vt8vF/9p9M6GDp+y1EwT6GmQt4oQqUTxhp5fIwu59lbgzSAlmCXNWumQAipTPJ3DTsvFOE2ey6y7j8GFijLNv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785166936; c=relaxed/simple;
	bh=3q/vWqTIdtDfYuu0h2kbIQCpIyTaifUh1jVB1OVWN3s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jw5wMoJEJXFpZ6bC6Zj0VQfgEOtvs4e3ABc8mXc79k+UiPFwlih8t+SRu6/wbW6S/A1hlllydvKwA0sUom4ySls55lQCJlBRlXUrbqtjaK1A37LxIBu1ESvOPzaNvmSuobXHQnW1KWEh0Wq8h4vyjxLuoAZowT5NLfMmy7yVjD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AelUS1zu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AelUS1zu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1FC3C19425
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 15:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785166935;
	bh=3q/vWqTIdtDfYuu0h2kbIQCpIyTaifUh1jVB1OVWN3s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AelUS1zu+Sf2XJVDz0RSSUHd7s8CzwLl1QIkT8Oap8TAE3TDZ3ZU6l+r2MISWBjpg
	 CqPAVWKCCqBWIfq8N4KxsXDcvr0dpPIC+owutnOuVP2NudIr0X9vBk0QgEJuPELgDj
	 /dllSZOYbgFIXB9aF93WyloV0avCIVTPe2uq9AnxbdJ+x9vAO2FuDR2fV0J4d8pC6g
	 wVLoLBVnh+YVyWbY9OKmRibF7oAfmwmc3VmfVP4NAv6b9x9qdrfHRLLd2u1y1tSMu8
	 UIXDt1DeqwFIx8IQcI+rx/cQ07SJpsutbgORWhSdeIETYAbs57KdGp8sHk/3oD6uus
	 Fi8pD/AaCUwfQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C360EC3279F; Mon, 27 Jul 2026 15:42:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221800] HP ProBook 445 G9: keyboard backlight hotkey no longer
 works after upgrade to Linux 7.1.4
Date: Mon, 27 Jul 2026 15:42:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bread708kms@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_regression
Message-ID: <bug-221800-215701-EwkSUCcYry@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221800-215701@https.bugzilla.kernel.org/>
References: <bug-221800-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221800

bread708kms@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Regression|No                          |Yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
