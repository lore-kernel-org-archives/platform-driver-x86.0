Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042CF14A4DF
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 22:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723501168; cv=none; b=h4mUhWzk3DQFnzJ8qyd1s9FwaW5AnPk1q01dOR/QnkIXJdS1L5WLgTvKfd7uLsjOpJC0l9PFdnqzIk6qo0Fo1Pox8r1Kf2airb0xa7COUt/Xcb9Ol/f3szi2WmOfAhUw+C5jgjNCbgabFknJpQQ7Le0xMsk5XCfrMnzIZHie560=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723501168; c=relaxed/simple;
	bh=fS3MsZRJA9LnhYdlHPlz1/Q4wpDeIyE+I8orEN25HAg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EGIMk6hZ+Ki8DU1d9qm8JAx+gSj9KoUL+m5Pklu5WDL4sliLZCFuL1llwfPc8PUvW8ZFsLb7Czvddy8+pYYJD+D5lDVll3KFfL+p2rD4xLzImEemTxslxrZDMv/96DqEX4+ZmymjrXMr0N+LmiFysVCZxfLszCktClOnHwcozbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=awRtvlZR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awRtvlZR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DAB8C4AF13
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 22:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723501167;
	bh=fS3MsZRJA9LnhYdlHPlz1/Q4wpDeIyE+I8orEN25HAg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=awRtvlZRcI/8XBJT3fcDkz2XN3XQhuy95TizWE7lqgQhsWg+iTbn2FZVJjMJNfchq
	 FoyRIim11H4iOoyR0Igvwy8gd9D7usZJPX2mFNAUF3iXA9Aj1735FEuTlNAlNq78jf
	 tBos8QjciPjx08jAmqHR0tw/aDzH8i/65dhB79pIzZIcImc0BK4k94mGq0WEiCAwHa
	 qHuXRx8InItRh8HLtIrH4iOiDIWO0TLa15ZsMlALKWy8r6AtPqXtszz+AK04sDfztT
	 BQJqhgPNhVSGe6n1QJz+V5z7FXXLVkBq/S13+DcX+vJUMzKznuqtAcLYQWC3FlO5My
	 q1//FjohzrypA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 65F1BC53B73; Mon, 12 Aug 2024 22:19:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 12 Aug 2024 22:19:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218305-215701-QCkVCUKry0@https.bugzilla.kernel.org/>
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
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #72 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Prasun from comment #71)
> This also affects Rembrandt (845 G9), in case someone from HP makes it to
> this bug report.

Sadly it looks like HP generally doesn't care about Linux and Linux support=
 or
compatibility for the G line of laptops has never been mentioned either.

I'm marking it as INVALID because Maria has basically said it's a bug in th=
e EC
(code).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
