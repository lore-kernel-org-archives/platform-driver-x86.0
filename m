Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1B639769D
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 19:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776973511; cv=none; b=N6eqe+kMzSx7g5eCJpG4XvT+kiB8EmoXQ3pEF/6uFdvZQniKI/CQdJQUa5yjyKOIQBYHlXA7j+lc8GN3xBS83TAXgkilK7c43NidT4lwc/2uPXCJE/ELZ81szdoGfha0TsToc3gncUJFRMGJSZbyufpK0jIakiR2gl/hxjhxsxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776973511; c=relaxed/simple;
	bh=4Vupw1r+PYmiggnGwiysPF99yLDXZX9XBDdgkMmoX2c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rRRtCGsabLabSYKKMs4Gy1/aRsfIcWy152HoPmclOnj45ILIS/XEdR8Z8fS/ESrnFSVWum+w9T1CVmHNRedleElHXTOt6DYeNHVEawJcjR3Ygplgp+6qTV9CVhwHWJlifAFGc4Nrjkuqh83hAQHJxOyglj9UlhNrWTqUx52Evu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Occ+kvl+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Occ+kvl+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3BC4C2BCB2
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 19:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776973510;
	bh=4Vupw1r+PYmiggnGwiysPF99yLDXZX9XBDdgkMmoX2c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Occ+kvl+5QHZ7ruZE7mAIArHJh4KIGomwQfUoStgMZ00sErGoocPl9boRy8MZSHj/
	 H9mGt3x59NtyuLXaurhp3rl4wan7fwuwVTm4lRVVDFn4VN/TNw2pHWMM+FxuXumH+5
	 QBaQ2EcQq5aBUhG5gg2P1Zm30SU/ckztJWhdC1bzx4B8fBGNV1Rer/JoL9AxAwmbcH
	 5C64Vj39UEBfpdZSWOadQOmpw9ddapctfLsltuR2wSHi3+5sPqCblTdyj1S6r9zzOJ
	 AJar0ZUYcVVYGoDiSvGJx1JQ7os3qFnzpZ/Ne/8Tfov3MY9UQMV0tBQHsCAn3wYb6w
	 CVaXAI4y0ojqg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D06EAC4160E; Thu, 23 Apr 2026 19:45:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Thu, 23 Apr 2026 19:45:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-w4t4KoPZRu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #25 from Daniel Gibson (metalcaedes@gmail.com) ---
Thanks, but I can get the same effect with the `i8042.nopnp` kernel command=
line
option (`GRUB_CMDLINE_LINUX=3D"i8042.nopnp"` in /etc/default/grub, then run
`update-grub`) :)

Apart from the Fn key issue I find the lid switch issue quite annoying - I'd
really like the system to suspend when the lid is closed.

Does your lid switch also stop working after the first suspend+resume?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
