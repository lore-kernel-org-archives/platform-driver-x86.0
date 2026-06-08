Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB38B38F233
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 13:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926271; cv=none; b=sZvFYpLjHhQxV+aohGI/y/OE3fO0BLaxwAi/gLzE6C/Ut2QzWPF+iLJfoGP+IBM8t+PeGdSNMoOaGO0+lUhITwKKnTpcSyDvrfuC6dyhXj5vgY+2xCZ39odVx4Te5EohFSMw/2TJ7W1dQL52cmguu6GhxDzT5fcK0MLyPFzPZYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926271; c=relaxed/simple;
	bh=nmCftWfNG2csmW1sxfhrKCFRrC6vYPafhgMPWmvv+dw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QsVjrVBxe7SCH3FAnjpG54tVjn5ygWgGi6ha4n/qBGWJZ3yKdQlV6/EKhoB+heTp7Lw3WWppY+tyrVFsGcF7BjGMG9u1mzfdV/T7IY2MFF5YnQCQ+GqB4dfnrkYxpri9QVDD8T9qm7hPIX8ryeqFVLn9uBc6I54Btdb2MBYFwIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGgWSeWq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGgWSeWq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 631F4C4AF0D
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 13:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780926271;
	bh=nmCftWfNG2csmW1sxfhrKCFRrC6vYPafhgMPWmvv+dw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UGgWSeWq76O565TDI7PQIm1mD9mTRh7G2oUwrYKzQ2uR0qZ5VXQkD9HEP+ILfPrvC
	 hudpjKcBIriP98qDMvVnAvzBkzdjMDGBehHEsgtIv5PeDBj+g/cJLs8jYuaqS6WKLb
	 B6y1vhpO++PPNlRK6FSGGMr0KagdMVy7csSlo5K57OwsdYSlCCxCCtciAGgPCPz3pD
	 uL4xpYFO9SMoq1qBd2RuNMKrw8u4fOTOzhoYfYR57L0KX8j/1QF71fD6/CaxoMhEED
	 7lmd0Jc0/gyJUikz1hHqJYFvkTkKnamdPPiS0qD+8qist2WStoxumSfDlLb5kmv7CW
	 p5vypUBOaD4SA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 43A41C41614; Mon,  8 Jun 2026 13:44:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221523] [BUG] hp-wmi: OMEN 16-ap0xxx (8E35) - fan control not
 available (no PWM)
Date: Mon, 08 Jun 2026 13:44:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221523-215701-S3KcyJgL9x@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221523-215701@https.bugzilla.kernel.org/>
References: <bug-221523-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221523

--- Comment #14 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Hey Ahmet, I have sent the patch to the mailing list, you can track it here:
https://lore.kernel.org/platform-driver-x86/20260608134255.36280-1-krishna.=
chomal108@gmail.com

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
