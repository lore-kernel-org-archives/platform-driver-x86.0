Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD877158DCF
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 17:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780767808; cv=none; b=IOJKCE0+Tr5v+1oIRqD7UXuUiR3yIvoZG8f/31PYwieYZBZHPaxVIJ3FmO8RjM4nG3ISFN8KWJNS7RoHs1qxahBROEbYDNzCaH5HkPyM5w8P9m4V3FXIYz+2zpejlc/XLLeDAyNUA6pO/FS3NzlEDi53HG76CNp/6PxiH/ODvHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780767808; c=relaxed/simple;
	bh=qnb/iKE0dXuxWPKi7vDLB64qYA7fyBqR44gVBifOaL4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G6DYW7kbdFsWb9Nu93rAY7q4yVHvvKb3W900KQ5sfvMfCdRytLxD6euIXW+EoonWY1eL+EkVeIvwyl2TGlRRARigEk3UasbLmaqv6H7sjHSRo4fcCO0dHRRK8hWgMJMMMpqjqP/VYhhJ1sBvxYaTMkqYhcnP1GQ5OCE4JCO/uNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4J7vQoq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4J7vQoq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51201C2BCC6
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 17:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780767808;
	bh=qnb/iKE0dXuxWPKi7vDLB64qYA7fyBqR44gVBifOaL4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=L4J7vQoqiUsB4Kedhb82+NN7h2417Ne2s3PTA9w9mRHOkjAOOWBQWXyf65HPPZWDL
	 0/7fS1vencD00Jmy1Tsdot6vC8C5e+w2oN5IKYE3V208hk5sNfsUrPTR1BjnJ93YKU
	 EdF378H31MSIcJbaFx9YttUdnRxXZH2ToCjCDd5OjtRcLHDAS+9PEMDo6yo0aVnL28
	 WmTlqXorwwD1Wnoqw5d3YoMcb4FZgDHRIxMAw8yUXEbdBG79vyVqUhbw1EIQVfxTbY
	 91+VAs1i2BudrizZw7ucnHoPoWSoutabI4NNMBZqs+GVSoq5+0uM/lAvyRJrn2UYt+
	 Z87PhObFSKwLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2CFEEC41613; Sat,  6 Jun 2026 17:43:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Sat, 06 Jun 2026 17:43:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-r3TIewTHJn@https.bugzilla.kernel.org/>
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

--- Comment #29 from Rong Zhang (i@rong.moe) ---
> 3. Same as 2, but KBLO=3D1

Sorry, I should be:

  4. Same as 3, but KBLO=3D1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
