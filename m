Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F139A2C234F
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Aug 2025 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755860997; cv=none; b=mol6wUkIn6nO0LhZxKZoST9ufV8duMAaeVy/beENK1AoxOibJQKhgBOVk796lrKOLLjadlD/uxKYIuYTHbST83dtZ5tkml+fIlSJi3mb654k5JVY288C2h762y8AbJN2ZWuYOMye46WBKELzqTxfUWoMsG5XYMYjzFpPbvFs5aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755860997; c=relaxed/simple;
	bh=1/I4qcxDwNqHcjTkhLOv/ofMyGGFwfis9U5t24kO43c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c3Tald70xzA8BzE/34uv+AdVz42xmgCDHfImbKG+f7mpYxRkM19d35j9NBOrQ9EB8QvRuERBytsDCc0ronNHkX0vzGd+r0+uc7j7Pe4FWLvzoVAi2rwRZAVPJixJ91TjXqTLqZ54J9Qutr7M2EHtdOvtbRAbUYDZZXzDHKjL9Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndvbqPCX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndvbqPCX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A01BC113D0
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Aug 2025 11:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755860996;
	bh=1/I4qcxDwNqHcjTkhLOv/ofMyGGFwfis9U5t24kO43c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ndvbqPCXrESDUEPQ92VD+d/eBi8bjy9S8GHyuVAjMdlMXdxYXg7uBIzU0k1smFmpb
	 gha0wh8+A7hhWTf8/AyrfdLdIGNUR62z39/pUf4+nji4nRtrM+V9xhufSQwvGQqzIg
	 uNIIBsPGQB7pkGHnXrShOoQReduA64jf7ZJHG3Sm8vJxkpi7jfXoa6sSsLwRYqe5Eh
	 xqahg3qGxHbPHmS80FoIMHSXYW7pAuReuow/lNdP/xXIR0GJzvgKcGO8IreICwWHHL
	 TqI5d7UF0nq7Xkk+b/+tKcIFeoo/YrBhmG+qfHMvQMgSJbi2vRaxnZt6r8ewCmZBmn
	 z+Wzu2+MjxNRQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 731C3C41612; Fri, 22 Aug 2025 11:09:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220473] Linux 6.16 doesn't let me to shutdown the system and
 sometimes to boot it (lib/list_debug.c:35)
Date: Fri, 22 Aug 2025 11:09:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bp@alien8.de
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc assigned_to
Message-ID: <bug-220473-215701-IfCooCkgf2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220473-215701@https.bugzilla.kernel.org/>
References: <bug-220473-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220473

Borislav Petkov (bp@alien8.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bp@alien8.de
           Assignee|platform_x86_64@kernel-bugs |drivers_platform_x86@kernel
                   |.osdl.org                   |-bugs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
