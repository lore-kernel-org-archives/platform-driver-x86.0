Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC085E08B
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 17:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709745423; cv=none; b=An9Y04ACmEWgDIUtfqRF9teUhqxzsCjqmDBv7TlNwIawOkCZCEY7gSeSOOc7gWejFmrnBnSFI3datZO1jmx5vURFJtHmY1qu2PA1kHxqBrrkxOWyNw6M2y2I3Ys+0SAqfpeJZO+N2iL3mFimqs9t4/hg8nUllBi+3dnE5SoX/I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709745423; c=relaxed/simple;
	bh=PCDD3OuacFXeHrhwoA9TfaKOQokzMwXeZscQR1Okfh4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aPAD4qSF4I+Ru3RGQNJT17/GeGMv8foDWU9Zw2ulKz7GhSxPa0+nz0fb9IRE+JYug2fa8kVt5qkErMsAadvR72nfj89iHf+Jx2ARVKhAZEeFng26YddAj3CfST4/1SZgjjtBnRWA1ig7PvZ6yR1//sVHGh28QZpeoJ+5IXIDchs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cS8kYZX2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cS8kYZX2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A7CFC433F1
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 17:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709745423;
	bh=PCDD3OuacFXeHrhwoA9TfaKOQokzMwXeZscQR1Okfh4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cS8kYZX2t7cIxynvixzD9e+0uuQA2eSIibllxK6KegF3B0iT9kbNkGY7cOCvHxm9Q
	 X/BZ9VVrcxBCecZmu4AcImi4L9DCh/85uIsRtaV2KylxCv6epWJ9GsjstN9BxgM8CC
	 Ik5/BAVbfDi9uAIfe7V+os60dTis3IqPNlW49C71gZLKQanXWjSH9+YnCYKh16jomj
	 22INbF7h//HH9gG8UWxGFV39p3+/jmXObIcGsZpjlNIxu4W7ka2nFaO4fO2l/aha8O
	 GTvjX3bMpO9LGPqvPlai09oCe1vpJh4rcaCw2Dg9u0RjFEMv1bq6sHQxuS86UNFJvB
	 ZMi2Ew1Z/zeLg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F41E4C4332E; Wed,  6 Mar 2024 17:17:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 06 Mar 2024 17:17:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-218305-215701-khvhme7Xes@https.bugzilla.kernel.org/>
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
            Summary|Ryzen 7 7840HS gets stuck   |Ryzen 7 7840HS gets stuck
                   |at 544MHz frequency after a |at 544MHz frequency after
                   |random number of            |resuming after unplugging
                   |suspend/resume cycles       |the power cord during sleep

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
