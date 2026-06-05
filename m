Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F275A2264CA
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 18:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683454; cv=none; b=CgxRHaScwypn9qZ6jWd7tvBUn9c3rEyOr7KGAf/Nnn9MuVxtb3gO81JxWPdwfx0R/AO+z06vLq9+vxd1lzH06rhveM0Ujrl5gbLGmERt7vw63Xhn5/BmvMYDkLV6rk23i5t5O9VVQXLvCUuZW3EB8qk5+lrVNlwb0HwNRDMH0C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683454; c=relaxed/simple;
	bh=IPDV3wuPAGARAVQgftRbGe+Mlmc9UjC3Tapd7lUPHw0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pqWHM4JJZ4rAJeOj0biW/N3ajb1Lxs5HzhXHqyEWVgXty2+8YclkxBiwGrleL/4bvZIR2Aoye8z1FEOlCtOccU9gpnnmjyXgCZgK/kyj3T9YvuinzAkS9nYRHu7HWnNZKcwfFC1hiCSgc/cN2bJzsjCC9KLGmP/0WDnXSSUx9Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8EhN8th; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8EhN8th"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5B0CC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 18:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780683453;
	bh=IPDV3wuPAGARAVQgftRbGe+Mlmc9UjC3Tapd7lUPHw0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=L8EhN8thXgV9SSn5eqyLQ0R8OIyZp+aUmS5yBZ0L/tNLj+yGPW49KIkUBVJCiBhQW
	 c9CaXGUUHkdSPzXMlpFLLoKDWrQiu1dV+ysT3dysZzHzufVYu3nyugJisKTTYLsh1u
	 tkcQEqfdGTGnk5rZw5dObLprY0Uv2ondeI/5MVJZPVvwsAjFeBSe3b3xKLXmEZSNJr
	 6z0Y70miLCNwQ5IBMuh3vawQxdS91AlyMRLCH6qydgU9301Kd4hn2L8OwR6g1D2mj0
	 o0gHzdJOyXO2Xzj+2jlMg7UiJZmpQJw7PinPwmb1+44QUny+8MIcYB2c0sqXatWRU2
	 heC7JFHetuB7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AA443C3279F; Fri,  5 Jun 2026 18:17:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 18:17:33 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221583-215701-nei1y9jAd5@https.bugzilla.kernel.org/>
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

--- Comment #19 from George (george.stafilidis@proton.me) ---
Created attachment 310273
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310273&action=3Dedit
dump_low

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
