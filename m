Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304521A238C
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 01:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771292269; cv=none; b=Z21OxVI1fBJ9R3VklDXGYEizFFpBkc5ejJ+rZXSwTPkta1fsdCx2PE4wXuXoBaIDg7GgOLJfo+tvpWpllgrL1r8EnBF7Sr0JFEXc7rDa+ro99gGeSYJvpkQuYjyspxG6vyYDEzzGH4VhH2rfgGfeCvmp8PAUhg7dGfZPqt3P6I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771292269; c=relaxed/simple;
	bh=jTosIqW/wZrBFwqX21pU4+rXTsDDz6DkzD+sw3FqCK4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SmB7FaOGIXCjuaGPQQp0Val3KBNHbBANBhxCLDkzI+j57feR09aky8KT3PFg4PmcCiqWnPsUzH0b8OnuELKf7lA3NykhVI9sVDXC9tpVbQGqav38YcXisxWCmf7MkedPD8Q1oam5yIFhf21Qy32oBFnWpBepzOFEa6dJxskBM84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQVEgddC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQVEgddC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2D8BC116C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 01:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771292268;
	bh=jTosIqW/wZrBFwqX21pU4+rXTsDDz6DkzD+sw3FqCK4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mQVEgddC29NtfsXwa1Yj04uaxpBByWuYSs8xal50n8q2mM0A9e/e7ecCQ9Jr/SUaf
	 RkQk5pF4Q+NshGRtv/SGT6r3bSh8JtMAl43gevGmSwV233SVg7cqLsAJ+nsfsh3dtX
	 pOhkThm/O2YjNSMVf5zI9cQq80Iwju39wmUpYVrcAU0QTBmh17slkeipH53xmFWF0Z
	 y9CnlnkSlDJ2njfBlKGp77Amdi5W4vfMYfZblZf25zAHYlqZMcOPrLt/sqFlfeiY3y
	 7jH3iXP2isv7Gr0DN6JXnKRABtk3NwtDSc40kok+H5y4AyaiYksEzqI9DMsUc1P/ps
	 gCqr9IXGahCcg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A3F13C3279F; Tue, 17 Feb 2026 01:37:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 17 Feb 2026 01:37:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: bcuseudshjvtquiocv@nespj.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221065-215701-RbcQl80JC0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

bcuseudshjvtquiocv@nespj.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bcuseudshjvtquiocv@nespj.co
                   |                            |m

--- Comment #35 from bcuseudshjvtquiocv@nespj.com ---
If this is a system firmware issue, we can probably close this ticket. Idea=
pad
laptops are not supported under linux (they don't even let you update the
firmware with fwupd even though the infrastructure works just fine, you hav=
e to
use windows) and it's extremely unlikely that someone from Lenovo will be
interested in fixing this if it works on windows.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
