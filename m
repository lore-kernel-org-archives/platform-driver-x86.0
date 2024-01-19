Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE8054BC5
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Jan 2024 15:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705677901; cv=none; b=RI072OcOSk2KdEpMcNEhAjMu0EIOgYa+1Kwi5GCBIPB9nbWGi/SR3c6VQP/OMqxcxCxXYSEf25t6QXbgIMbnQpywIe5GmrURrojfGwallaFU0gQUmyBB/ppHlKotJygo0Jbyx/B8DvFaNmP1YntfnXHwAyACuSUsSkY4n/Jjuz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705677901; c=relaxed/simple;
	bh=R9OJJ6TM4llsTCtlzuxYeZVWbAI7sU5/Txwic86IAWM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YDP1Be32XFShQWJyvgTYxFDQi9L0uF484v+tF/nboe23+yWytE7kvdz8D77AFZ4w4L8GCVpwF7E+MJH2fyCZl67o8zde00KdwxALFUjKZKRZnLfWPVrv8ur22OvQHzweZWf/teDWFMvBbizlYFuQJFfd58U1+CeWsEM3xILdIy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=il3mUIY0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="il3mUIY0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C9BFC433F1
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Jan 2024 15:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705677901;
	bh=R9OJJ6TM4llsTCtlzuxYeZVWbAI7sU5/Txwic86IAWM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=il3mUIY0adGx1UAfOVzvFo7L/rHWxa3gKUr4IjX707M+Kev9zxbo/O7X3GT2d41QO
	 Ngr8PTm2CaiN7lxhPL2v4bPrscTKIa8lWoXf/I+ACFluQ/qCl9I8IOcw5YXGbuHARG
	 XmZrvT0HnLOPQVx/Tv5xT9X3U3LY4RGhFF+hO7lhhrVEFGb3emoqdLdNzBNTV1qh2q
	 hU5mlr9CTlZUwO0+yoonKr1ZZAygG1gS7pHN0pBeDgnvB9FE38FxZcTmK8S5IXnXlZ
	 SaDi3XKoir51BEAGv1+ybJVJ9CpW+l3iN68O9gtEJ1bvCUQEhDJCvOgwrUGd4VhEJT
	 eW7VBpIHh4wBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C9DC0C4332E; Fri, 19 Jan 2024 15:25:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Fri, 19 Jan 2024 15:25:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-esxsaKgooE@https.bugzilla.kernel.org/>
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

--- Comment #19 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Can you please dump teh values from all of these MSR's from userspace while=
 in
a reproduced state?

#define MSR_AMD_CPPC_CAP1               0xc00102b0
#define MSR_AMD_CPPC_ENABLE             0xc00102b1
#define MSR_AMD_CPPC_CAP2               0xc00102b2
#define MSR_AMD_CPPC_REQ                0xc00102b3
#define MSR_AMD_CPPC_STATUS             0xc00102b4

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
