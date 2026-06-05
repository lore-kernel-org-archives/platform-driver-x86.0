Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E767A416D04
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 17:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780680797; cv=none; b=Ph9UrNHbOVutwT/qJbzkG8MH9x8m00gblQchVkzpiui7ip2z89LBcjZSlGqsQCKwso4xCpImou0xpt4i8npyYbc8cW7nam37DxeaybMdcyYdKSbz150bibMREU+5c5RiO3BtIp0CBa0kNsKX1NCGk2IUkGjmCY4lbqGBs8MwFa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780680797; c=relaxed/simple;
	bh=qO7Gn1bixQWzi8KwZMKEOoViOuIUGJzkTf/6czEAs88=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ljb7wU68mPOUMDUljV7iyxyBURT3IrHAWZ1vmAhuVNOYsJsu8FbvJoHncDsKT/tIg5sMvUWxYytBYv2KB0pyP3X+t2qejNgY4FSnNZ8H6t8lsnuynI86q/wv2a/65ajnCOGP/JgXLfBUvTx73Egs+5P+mTJ4lFai+QxTaYE7SZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LCLzrRSU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LCLzrRSU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82E97C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 17:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780680796;
	bh=qO7Gn1bixQWzi8KwZMKEOoViOuIUGJzkTf/6czEAs88=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LCLzrRSUW46b3UEab9aiIeAUR7pUk5zt2GakTm4H1oL6ph1+eJY+nVYHkohqasB+x
	 deByG94U7wAFo7ZJN+2xMcEazN9TPdDLvqAf5f9/x551W614dpXOFlmIwKvGzBBXUz
	 OPbpoDsxCTwPIl+DCyE2mNhB9HzFQEemY3TX641G9izf/IdqCzSKwtFQFCNYQsB35X
	 cM03kPfG4+VQmDDzHyXFlEOZoLR3bhOWzdw2Y1QxyeeoN9Qvi9sebnIYR2+EOh6Qm5
	 QXq8uTbDwr+B12sSaI5n5xSTz9poQJlW+8MMAWD86o+XM/ExGcxHJzSill28rNwiHN
	 IYb4ZzY3LMmHA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 62B58C3279F; Fri,  5 Jun 2026 17:33:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 17:33:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-zleIret1me@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #16 from George (george.stafilidis@proton.me) ---
Also, regarding your question: when I manually wrote values to /dev/mem, I
remember the software state cycling correctly through 0 (Off), 1 (Low), and=
 2
(High). However, the keyboard's physical backlight did not change.

I'm going to start over from scratch and repeat the process more carefully,
this time taking notes as I go instead of experimenting late at night and
relying on memory.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
