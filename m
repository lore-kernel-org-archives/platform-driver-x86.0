Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3071FF7B0
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Dec 2024 08:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734339199; cv=none; b=dbY08dAktYsOffv9ebBWV3JBaa9mhBK9pFzK69ydIF7vJz8yidY6HvfutMp0vjDd0lNUx8h/gUJR4sFQMAUqgnQzaisKFSuDNkVpQF9p1CT+xCxJr9n5hxabaTUm2s3aJlNGfxK+8wNeWoyhNiPGBqdf/U8iu3dON3Zcq/uC00A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734339199; c=relaxed/simple;
	bh=+Qvcv5iXwh+Senu4tlhWGLSJlxQnnd0+JOkbG4nmVAc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jowgRDHOJgi2QPjXXyOoLtCzM8ZZ4tdRgsxqKwfTK4lojG1t7uTWq7GKUewu8/qVvY5afcc0et8x6qT+k4YVP4tM5COJ0YxlTJc8QbpThZWIcUo/fk84Ex0a8eDI2JrpK3/sI5aAYaVFUljejNvD7P9dOwJBM5z7ENBooHremOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMn6qRrA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMn6qRrA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82DB4C4CED3
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Dec 2024 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734339199;
	bh=+Qvcv5iXwh+Senu4tlhWGLSJlxQnnd0+JOkbG4nmVAc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cMn6qRrA66pJ3IeEGg6L3SudHIClSvwXba+nIuOSbSgNQmmc8vOXBzqqhBYonNjS5
	 vhcku6aYvm/EJevTZLps5J4FeLjiJH+LD9k9Ot5zwRBM9MYbEyS0qxOsk/ntE1ptdw
	 we07W94lYMwdavmWqBo9FOEThK4nv6Sw/QSv+rSxWZT9QoxZgTRlaUZxVY6Dauczwx
	 OHmT7o1rlhU9VSGficEWknL1l4ikh0eDn/0q5WlqtErpcY6mhqGKknnFuZYo/8DZc2
	 4zIo3Wbc4qFn9+aRXbAojQGpTYdHhTNUZe8Z8+OA8D1vmdiF8tO1BkgzhFP0hJ2HLT
	 vCbTvO3y8Ti8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7A3A8C41612; Mon, 16 Dec 2024 08:53:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Mon, 16 Dec 2024 08:53:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vinayshastry@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219517-215701-pA1IopYVDO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #23 from Vinay Shastry (vinayshastry@gmail.com) ---
Not the reporter, but the asus_wmi bug was affecting me in a different way -
keyboard backlight control, touchpad toggle keys had stopped working on my =
asus
laptop.

It works again on 6.12.5 and 6.13-rc2.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
