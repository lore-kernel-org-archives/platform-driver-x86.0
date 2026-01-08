Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF7A330B27
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 20:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767905628; cv=none; b=ZLbh9r5nqT8ZqZdHWlQc4B7pFVR7802aJikVRMf8LAjvv3xep3JShoX5L6dfrXZf6v6BOxVeC2B5ruGG02+K/YOs+HxeMnYwxowoH/O2WNpaPZGzEXBzFOwFXXhcCuB+jJv4S1rzFAwuNHWtXAk68TYMubk18yWVXwW9sr/1G6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767905628; c=relaxed/simple;
	bh=X3BIhQTNdoAUxb7JFxIxtdITAdjcAGoQ7uvkyfW/xvw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DRgHB/2eHAr6NHX4GQP+AUEHQAp+OmvrrLf+Rkb1wfbV+V/ECDM4oDghOdq4rR/pIg8GvH4tDeFv3DrR6DASfUIqKRPf7zXMx+LmlPrbUEIX3DQem6uN52CI+hHqa7n+rv6GAnd3DoJaRIrWdu+anLLUik3376WiGm+owhWSeIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRPjldyM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRPjldyM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9E73C16AAE
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 20:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767905627;
	bh=X3BIhQTNdoAUxb7JFxIxtdITAdjcAGoQ7uvkyfW/xvw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fRPjldyMqXNzXH4U4BCyFJmHKrXUwLJEJ9aLW6/u1g7vloXMY8GHqp/00VlIVAo0Y
	 EDw0AzycVCBYqMwfrEzvwTUDlUln9cSP7TdVl4zjTdRZI0UVs/9bnSsZiDoy6DXwsI
	 m8dYsATOtJ/4ogazkgN3qh66WO91Ay0//7C5ssUQqX2o6xCYNHY5rNMLKhWqqldlte
	 SDIxZfLk0fGNUmZqPPJg4+L6v4lTUJ4YWuE1N+EHgllGQnZddi0cpHkNxPCRf7D7hp
	 fFs5UpZIQafHhtsB9ku/LyXze4tWkF9da4fG3JyAfsjOXh+vG3sWw8UBYzfL5PJmqc
	 5e+mRdR1sUt6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C5DE5C53BC5; Thu,  8 Jan 2026 20:53:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 08 Jan 2026 20:53:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-gzWnYbgSFu@https.bugzilla.kernel.org/>
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

--- Comment #149 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
> The code would be prepared to use only one of them, but I think a bug was
> added with a change that makes it use both. And maybe the laptop isn't
> prepared for this.
> Mario what do you think?

It was actually intended that both paths execute.  From a discussion with my
Windows colleagues this is the Windows behavior.

> If you ever revert to the old BIOS version, please send us an acpidump so=
 we
> can get closer to a solution.

I am still feeling this is an EC bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
