Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114B34DA14
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Jun 2024 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717678008; cv=none; b=EsBYGm5YoBbZwkPSuSDRaf3aIvbKild0XrKPaluK4VKphaplc/q04MHOiC8cAtZMtt9IchUGmtBR1GsGquPpvjZG25cwvMDqarh0vZP3pPz19IBQ3CLW+SpOF6hHMZonnzAbY918kp/QHIXjK9liDJ19WNCsSK8spBMb1tjC4zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717678008; c=relaxed/simple;
	bh=bvpwGudpnD0PuShRvAYgMlLyEk3GlxNZtAlr0pLdn/c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AHEFOLhBYr3W3kiTKnobY/QK+TCC3Ba/EW0cvDnaGpge9E2itKsHVe0+3gmAIIs8zlCvCIDv7/tF91qdIVqtl5x5WJUzVB8ou5CCgrMz0SbJK8ZCpufyYCAFkAFsOhLdqhlUSGnNCw0qMcljf6q/J3wC3+4xGLciffdW4+L37h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQZcdBl5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQZcdBl5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E668C2BD10
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Jun 2024 12:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717678007;
	bh=bvpwGudpnD0PuShRvAYgMlLyEk3GlxNZtAlr0pLdn/c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dQZcdBl5MziGEaUpMvoyXfCXJsi3SpPYuWLh0o5MbS0WXxZFk4JaIj8J7OeO3TzEx
	 kEUklLqMLJVJQScVvPRz8sHKt3Dy/IC1rkmwC1BzInyckEGGkPLljWFEoadK34bKmp
	 kGkORCnf0MoAkhH9ZvSnY23sUVNpuCg+FxlJb5tUmSDo/0Yvz5KmLVbQsfGiieFXi2
	 1tyr3hJCN8dLvgUg3ZCLp0fwYKrkbI4NUPPLQrpXU61vN++sVTNlWW/zjJ8rgjMQzk
	 v1oEqrq7vIlimfXpLNLkaZZeY1Rmpv86nD/C/9DuIqEpLTQtbXjcuEoRRAYxC5O/+c
	 XoBntawrDeuWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 67EAAC53B73; Thu,  6 Jun 2024 12:46:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 06 Jun 2024 12:46:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: matan@svgalib.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-keeQAxfVlQ@https.bugzilla.kernel.org/>
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

--- Comment #46 from Matan Ziv-Av (matan@svgalib.org) ---
I will look at the code later, but regarding the reader mode:

In models after 2017 (I am not sure about the exact years) reader mode only
controls the reader mode led. The firmware does not change the color
temperature, as it does in 2017 and older models.

I guess that whatever changes pressing FN-F9 happen in windows are done by
installed LG software.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
