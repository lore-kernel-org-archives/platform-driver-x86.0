Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB37344D8C
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 19:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782156813; cv=none; b=V7fTzROh3R+OHVCHM5/FKslFUk/6cQv50hQQ/BPa+ACtzogGKS6BzurJvV6E6zA9AiJFAUuQZfMKHjjE6APZFh5yRhiGW7dxYdQg63c71G9j1ScPZRQ5SjqB59+4a+z3L2oEdfSKaJwbYZqwAdREQaRmN5x9kijgoxi44nKEWLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782156813; c=relaxed/simple;
	bh=3oMg0kkxStjBrcN7L0ZvMi01g2acENt7JCk1YqZbnZY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MR/Qd3ZZ1XeVpFnum6SeFtzrcZhzxtLN+mBaAr11m5yd31yC6OG7LDOidEGut+QGL9Ro85SsJyNaNk8iz1/Ytve8ug/TA3EHAJ39Dw5HKVop+WzoUhZclq7UjlBjTOV1OubARlt98XnpBbFioJ+RlAOMUwpI8TEfxxFxmoWbNQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCQjXBXx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCQjXBXx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDA3FC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 19:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782156812;
	bh=3oMg0kkxStjBrcN7L0ZvMi01g2acENt7JCk1YqZbnZY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CCQjXBXxyTGo8EGwX+oBkRI6wh5rr7Z+aead6QZtMvrJt9X5gE8wq1psM46Dd3Bdh
	 1HZ91rBi+gPWTcJEwm00cG3xP05AQLNb2//NxVbA8JZ5dtG9Sxsdcjr7NEvcc5yBH+
	 2K+apiOdk0yb0CsPtZnWtvzGZvenWc+ihh2t5CjlwCb2/GgoB0nJ2YNfYXpmJU8tzt
	 ugytBZInaMrioZDGQwAU2cSx+ttAEiQJH6qvuG64ydzodDSHx37cP3/cdMiyMDIgMP
	 ORf2KgGXdQP7+Bil8eYK+3/FSIuXVYXEaJ5VCPh16K45lU8x1r3y+SqIXpvqyXK91+
	 GWHjiFXT9cZNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AA0B4C41612; Mon, 22 Jun 2026 19:33:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Mon, 22 Jun 2026 19:33:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-8ynIlel431@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #108 from Armin Wolf (W_Armin@gmx.de) ---
Nice, i will send the patches upstream then.

Regarding the duplicated touchpad toggle event: i think you can use a udev =
rule
to disable the touchpad event from the keyboard.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
