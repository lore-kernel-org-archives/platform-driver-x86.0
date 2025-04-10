Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C624503B
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Apr 2025 18:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744308336; cv=none; b=bY6wu46n9v+9DF9Qgr1XgthxgCVRixewfxS6hkyw9TguObU7lZyfHj/T6FOTb2w79VQ8T6WGKsvGQzGgSIbgnquiePPF29zS07z8pQh1wdc1lCMV4dvA/Wwwkb9c+AIpLzYvlNXDemzAc+KmuySB9DiHNY/Ky7IRs85sUHikZbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744308336; c=relaxed/simple;
	bh=VdumDuoQJfFD+jqgM6xf2UTpbmSBBigi0twti2UT3Q4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BDyDnya1GPOI0YXgqs1dbJrtGnVLcK/4BKC4gItWXL9urGuK6W56UYrKWFqmlnAc6kXtcrii04XprbNhnyJOFkkwm58cqKw9Jxggpk7NkquCzrX4N9I55J71DCM6RDfhNUhm9zRWJXj19uRWF2C5Pgd4hANg54yDf8yiBRay4Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbIj6cp7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbIj6cp7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6950EC4CEEB
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Apr 2025 18:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744308335;
	bh=VdumDuoQJfFD+jqgM6xf2UTpbmSBBigi0twti2UT3Q4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TbIj6cp7MVX8HzQtwqCAdo/iY+5b48JY/qklORhjZrQ7udTERZXPc7gR2J+zRXfQ3
	 1tL0nh0kwal1VgngITiRMX2egOtMPeLbomQJdSTe4Nu49DeSjONJ9DGyuXP8DhZpO4
	 m0oyE1SsbnmCG1jfhODgogSEQGRp7F5wrjD/ef+4WoZc5p6aO/fF9r5AY7zLHhkJ/F
	 8rSy+xRnuqZI7UAZP3IBy3j+m6xSrD3T6Zmh3t53y0RVzISBi9GQf+wjfY8qcCEbc+
	 H+MU2hRig9233WTfzxZbKj6/1RKJw2s+YaPxfYR3dV4iyi8NaZ14s90vTQ+W7XbfLr
	 JfNpEF8EbQheg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5A756C53BC9; Thu, 10 Apr 2025 18:05:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 10 Apr 2025 18:05:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-e2gKJUY68v@https.bugzilla.kernel.org/>
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

--- Comment #85 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
For other $REASONS I'm planning to increase that time generically.  So I'm
really happy to hear it helps with this issue too.

can you please try to change it to msleep(2500)?  Is everything still OK wi=
th
that?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
