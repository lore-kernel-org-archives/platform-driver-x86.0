Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3142C36606C
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 15:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773933890; cv=none; b=fNoyyvLdH5Ku3PjT/iNWlB+sK1Dz2ZmqCscytU6szu4H+KM/UIIcG25RD7uYdRl2Xusnl4+AeFdf0vyM2Jb55GjOl9AN420FkA4UaHBBPPlB861c3Vh7y5f3uoh7zcP22mGzGcf+COW4zvpjVfcAnuId64hBfmhMJ9ub5XkFI2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773933890; c=relaxed/simple;
	bh=R8X+0s3QU1sQWzyykWqTtxckkCUs2ZA0hROb7g7h+4A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n2gw5GeypcaBoPXCDsTGvGI21tImSuI/eA5/bv9ViAVC00L1PlwZQQ+Uo24bYigN1Vbec8zWIjcWJRs7JL41jn/mHbqAsFhl1B+tdg6COHZEjt7wAF6JUMw/z9kDXWQn9MT6xWEuHIxLU5X+pullmm0674iT1DHbLY9MKP2I1Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lN50q3FR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lN50q3FR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7628C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 15:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773933889;
	bh=R8X+0s3QU1sQWzyykWqTtxckkCUs2ZA0hROb7g7h+4A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lN50q3FRm+aky3cHFgNLmUzFVv+LOYwKT9jia/9v1uASTGajtG6DHN1L8QgWgG0+C
	 zqx4WxxOIgOZbzXjvd5oQf7YwjI8f8VxiA1EbOyHBDRUntXHeuuTgrGLq/SittXCR2
	 ei7Q6EOgZRISyRj7LCbf90SiaqCFkMVjslxfuRQbah+Sv+ZjnYX0c7BofU5uS1b9od
	 QY2Yoy10R0HqygIRC8zk3nHlutlrG6bMhL78eScZDZ6tjYUfHm1qKCJCD8b2rUflHL
	 Gk2LSW5T7FDkW6beArDjbnBci9OEDZhbMmuiIpbyGFFFPCMzj0VHZ+ZddTF74S4/8g
	 IoT+4/pM2nbSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BBA9FC53BC5; Thu, 19 Mar 2026 15:24:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220473] Linux 6.16 doesn't let me to shutdown the system and
 sometimes to boot it (lib/list_debug.c:35)
Date: Thu, 19 Mar 2026 15:24:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220473-215701-iXSqvM8wCZ@https.bugzilla.kernel.org/>
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

--- Comment #13 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Artem from comment #12)
> Linux fedora 6.16.9-200.fc42.x86_64
>=20
> LOG:
> oct 07 11:42:05 fedora kernel:  slab sock_inode_cache start ffff88ae0cb25=
480
> pointer offset 8 size 768
> oct 07 11:42:05 fedora kernel: list_del corruption. prev->next should be
> ffffcf5a090abb18, but was 0000000000000000. (prev=3Dffff88ae0cb25488)
> oct 07 11:42:05 fedora kernel: ------------[ cut here ]------------
> oct 07 11:42:05 fedora kernel: kernel BUG at lib/list_debug.c:62!

Have you tested v6.17+ as pointed out by Mario?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
