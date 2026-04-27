Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA093DBD4D
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 17:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312496; cv=none; b=gzNQIokvZzJoFHpOOk6zliV1GLHGrE5ZJJUJ/xOa8Rejw+fC0DkmLiFWSk4DVBsI3BzGkrGottzciTgvQaxSxXGxBGbwsX9B2AKsFDX+KUepcecWrHB30ND1BgnbqLUw6B6pJpG1A/Hwg7O82Dhkjj2ohj7JbkY7k5l6c+lmV+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312496; c=relaxed/simple;
	bh=jyNlauCKj4z+CpQoPoNine2CwuoUPB6Y+3PHafCTOuU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YBb+mF7SvoviJPJDAN6FT4RykhQwiY32hUwztXOpn/N6jZQlzZ9yr3KFRMfJ2v6x2DE6OLHzdYrWlNxIKJ5uIld/tT3ruSwfokyrH4bt5zcurWmer45Qdcq4t+i6RfCgudFU2VGjb82CUvH6HFeyIq7YqMtMXOvseI6op9v+wnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cTflaK0n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cTflaK0n"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5F47C2BCB7
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 17:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777312495;
	bh=jyNlauCKj4z+CpQoPoNine2CwuoUPB6Y+3PHafCTOuU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cTflaK0nYAkgccH4bQCdneeA8clBtu5R92XqEtuBeu33jvAVs4xMiImIb9iGN2dcA
	 euqYI7sFlfarUcvzmMEv+trCp5lnErkeH+dTMp94ikymX9jW1jfZTwklbA4g4KFdEk
	 1TDX7zbE7JDcWg4dNTEudrRBSzvAJTpMXTz1sI9oNQCceuDlMmBOvWmuPZuRwIbc2/
	 ptUym7nqI3npP4aUNOKmCxGhYb1Bxq8GFiP9QfSoO9fhI1AyIT29bfAlzBNOtCY1z8
	 IaOawpVpqeO5gYLlUPqdVRgHXxVg+JF7pgPagtJNBhP8+uQV7a9PkitfKceWTmI9Em
	 7PvQWsjoWoD6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CE4E7C41613; Mon, 27 Apr 2026 17:54:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 27 Apr 2026 17:54:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218305-215701-2AOxuIenii@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |fuposremoval@proton.me

--- Comment #150 from Artem S. Tashkinov (aros@gmx.com) ---
*** Bug 221403 has been marked as a duplicate of this bug. ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
