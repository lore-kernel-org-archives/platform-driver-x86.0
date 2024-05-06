Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D954EB45
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 May 2024 15:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008613; cv=none; b=Di8zZgNHqZskSOkyhboEi3R3/gsaKXhbmLpVxDGPV+tzhyIwWL5KXvtS942BcjtFedPl1tHiBdNBHDX+ADhXaNnQ2o7NhletFs7PPiwBq1UD0jEMyJ3sHa8kzzrAzznGrywrlm9FAmFjUDbW0x7sfED7RCMtiv8u+W+8jMsYjgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008613; c=relaxed/simple;
	bh=n3tGXfXq9WNppC0r2wL6n4mIH+g4rgAzMCWNSdropr0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F4gGwhkyFr6moGW2dOt8Fg27Ma3wfzpnelEuoSD//pHmip04bKLGhz1IO97tx3ui3ztAGa4J7vR646HZg5AtUShzqjQLV6KNw3GSYiiJFbYaLzJRqotSHFMRw9VGnld1Sg3cfPALrfCL7QCS6ETzXzJimhFJ+Ezkggz+4rN4wCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iH71E1wg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iH71E1wg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD241C4AF67
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 May 2024 15:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715008612;
	bh=n3tGXfXq9WNppC0r2wL6n4mIH+g4rgAzMCWNSdropr0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iH71E1wgvGntgG1JMHEZ0oBAuLfjWbM1y3UvX+KX9rc+K9rM6fxj3pKr8LCFwLyYB
	 yNIWEVrQU3Kkc7X2XI8gpaWtAOgbJLZCHYZx53PPoc39q+mE6eWNxc8Nz2kvwD+936
	 niSu36aOZ4DSUT8YTqQwL6VnheCENPvugtPb5yC6ujmWTO6hR/sOxMqiR7V2AOwOa+
	 J24Wn5fG6aCya0U7D110bB1R+nOdY5U/4LtgYkjaMBLyNETyGCIPfkAX5axxjTz4/A
	 Z0jk0iSCugk2yePSvTshRPH9sxxGlBKy9blVT3Iiq1bZnT4RpCHzyRZi0+zAWrnODZ
	 nE/kkVJFY4bYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A1DA3C53B6D; Mon,  6 May 2024 15:16:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 06 May 2024 15:16:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: vanoverloopdaan@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-THWUy2niH8@https.bugzilla.kernel.org/>
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

--- Comment #58 from Daan Vanoverloop (vanoverloopdaan@gmail.com) ---
> I did post a patch to this bug that could try to adjust the timing that is
> waiting for testing though in case it's a race condition.  It will force
> 10-20ms more time spent in the Linux kernel when the power adapter is
> unplugged over suspend.=20=20
>
> Also if it doesn't help, please modify it to make it 100-200ms.  This sho=
uld
> rule out a race condition.


I will apply this patch later today or tomorrow and report back on whether I
can still reproduce this issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
