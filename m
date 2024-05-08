Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12342837E
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 May 2024 22:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715207888; cv=none; b=Aq/Q8Bj+vYVJNp1niLuW0FykcrKQNEqPBrChC9Ca233yOFFr1TEQ3DzE/0IQZGdt1/p6OgyVq3jVJu9xaGimnoD/ZmZatGKwZ+tOH6NkNSKpzTUTbSnBpR4+etYCdOBDWhIA+viqwOyMnpDr0zUaRXmrl1FQhntClMc4iuxchCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715207888; c=relaxed/simple;
	bh=rqI1jo+yBHO4VWxYO4esJcHYOblhMTJ1KkV3f077VSk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dk8czHq5yuehHuFaqdVlaa/pztnEKNz+genAJY7De64+mYoEBMv8i4l7mHXnqCJEVIXoP7iKQcYNRRnKghSrWaQL7oMC8MNNHWCO12rPMO28OQ6mFStGwdXfBDI4+rfiDx0QIIF/jc/abs3yAKku8BOCYqDMn1ILGkCrsrQvP2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZpLPrFV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZpLPrFV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D787C2BD11
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 May 2024 22:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715207887;
	bh=rqI1jo+yBHO4VWxYO4esJcHYOblhMTJ1KkV3f077VSk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BZpLPrFVs9cFJ34PESr8/u+64GEkXbuiuEXyLbQynf+/E1icblxZJIgD8pUOR3bsL
	 F5T0AExldixCm4euy5x3tIgqx13XjzMgvKXom4AhSw7tPuVXGxs4wN5pawBnB7fcei
	 yaEAsW063Yg9/jH8R90yliuRfVmW1rEuU4lN+wnx7Il7Gay81TMcoQANLOFpbrwUCE
	 ozXBy7Z6S7avQNErpFM9p/sc1lem26gaciR9Uon9ce9ovtXUURx43jpKBP3Bx8Z82z
	 fmfjDBHtvoT5px/1hx89CPT0VdKOGLbO7mcaMI4zkx6NBboQgLrvY19QchCpvn+lYa
	 4ZseE48kMwLEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5FD37C53B6A; Wed,  8 May 2024 22:38:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 08 May 2024 22:38:07 +0000
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
Message-ID: <bug-218305-215701-Io7gwujBYO@https.bugzilla.kernel.org/>
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

--- Comment #65 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Especially paired with the fact that different adapters don't trigger it I
stand by this being an EC issue as the EC controls the throttling behavior.

I suggest you guys raise with HP and point them at this issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
