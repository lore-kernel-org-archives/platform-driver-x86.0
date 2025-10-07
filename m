Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4E8253F13
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Oct 2025 09:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759829294; cv=none; b=PtGF2mbooFH0MEmq3yl8ji2JXM3fj6V2Kneqw8Mqlf4bMBsWC0A+dVYej6k2pIdfBawk04wiMgFSzj1dZgKkBr4HHIwTfdcp6Q9PLabJqoX/MfUrdxsDNjJlN7XLwW+tf5FiZ1mUp0qdegfq4nnXD1NejjEGBnyGEhhBOoWTmrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759829294; c=relaxed/simple;
	bh=ZNo6Vx2LuBz/uTs33D1f8KKNbPH4ePOEyUDxXoGjFro=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mwbp6vmSE7DaCgp7uf4wq0hQKxaCRL8/9eecgWaqucY93tJgL7eVzuqnah55ogKab+RlHLMKgufviEppVc71ry7vsy2XUJY2Q6QeFOp01LR72klFgbNtf8L7DeYl/GW9QxYKuYF9XEQne+Ea99qcPMjmHEc6E1PaZwnvKevxnns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qgpbe3Bb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qgpbe3Bb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83412C116B1
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Oct 2025 09:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759829293;
	bh=ZNo6Vx2LuBz/uTs33D1f8KKNbPH4ePOEyUDxXoGjFro=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qgpbe3BbIemug3T5FpbZxPCov1i5sT1VHbaw/3Oezy3/xbdLnb4j0AobVcaDlr0y7
	 PMePfQquUjbsoVxsFv/qDrUv+/+JNZhizrxhWXUuairfSjJxQ/eB5NZ6liLa8XbuOY
	 gQmD6JD3+QnDsQoN48xY+w+C1W9yTAOLeFAXjtY+0XnbRY8Bpb8l6S1pFFq6E+AbRH
	 EaOxC+l3NOOrKXX/mmahyhHYdyXrN+lsQWHKostAyiZUYJG6lnVrcOH9Y70RANlPTC
	 bY5I3PjTNLft/SGYkHRv4zt0edsnBY/TrZGCA3wyqYAMyWwHOtlL2JaaYpO10hz8MS
	 R1GQRWUhoNXbQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6B8BAC41612; Tue,  7 Oct 2025 09:28:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220473] Linux 6.16 doesn't let me to shutdown the system and
 sometimes to boot it (lib/list_debug.c:35)
Date: Tue, 07 Oct 2025 09:28:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: reanimation-lp@yandex.ru
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220473-215701-naOZaDlv0e@https.bugzilla.kernel.org/>
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

Artem (reanimation-lp@yandex.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |reanimation-lp@yandex.ru

--- Comment #12 from Artem (reanimation-lp@yandex.ru) ---
Linux fedora 6.16.9-200.fc42.x86_64

LOG:
oct 07 11:42:05 fedora kernel:  slab sock_inode_cache start ffff88ae0cb25480
pointer offset 8 size 768
oct 07 11:42:05 fedora kernel: list_del corruption. prev->next should be
ffffcf5a090abb18, but was 0000000000000000. (prev=3Dffff88ae0cb25488)
oct 07 11:42:05 fedora kernel: ------------[ cut here ]------------
oct 07 11:42:05 fedora kernel: kernel BUG at lib/list_debug.c:62!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
