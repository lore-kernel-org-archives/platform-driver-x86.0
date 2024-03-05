Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126863FE37
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Mar 2024 19:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709665392; cv=none; b=cJXi/ckL61ZO5zu694iMYb+85u0S/rNSmIXXeRtv6Yy+VMo4MXuewcdMlMeVwsBjCaRVfUEQAbMUEJmxgqGw8V4C1eod2/ZOFH7n+NXHc5clfmwAYbZ0ZNBdOF9ScwrCTeRbubTW/C7ndwyFaQAak/VCfvPnasi6GWSIs/4qnVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709665392; c=relaxed/simple;
	bh=Kv5r6KunEafTKcq2D8TbtGnORAJGwsenirjiX9hIWmc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WOD+B/FNnbQIU5bsth+egAKJpiGJcRwVjZSdTCftJ2NTSZAeRPEnNgC7jWxMoqnZDwCvrHSBJcL+uMw+kFME6CAYMpOCL/sqjO3bp3NwD9tbBxQfH16PURRvR1CCbS7RsG4RMmPuRDJBxNZIMajvBYa1/tvgdaG7LZBwaDqPg4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzKS2txp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzKS2txp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A867C43390
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Mar 2024 19:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709665391;
	bh=Kv5r6KunEafTKcq2D8TbtGnORAJGwsenirjiX9hIWmc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BzKS2txpx3fOHncFE+BasdaIvKaP3XclVqNlsitrbTulkIVDfNc8d7qBdODa9ztDZ
	 g6MliqMazlZjhw0peq3b0AVCJ5KcRIAiZ1Ne2YQDq1mmcA+h5b6o142FWVMALCMMOY
	 y4DPJXyyyrbld0LQO2v16BhMXfav3FtLSyWiRQ3EU/RQdzlD1py3PCDzbtI4OivLi4
	 LNTG4xS1XFF5xdh3R8aT7q3TwIk6vlW5sfOTlN/InItJ3STH60LjfYKejeTCcTa/TO
	 bVZEcAAua4khNE1RSGKorMasxFl/JYvOBEr7tJRrUTYgqTx3wC9q8BTrbG3no0aYcV
	 11QHhU9nJqFhw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6B87FC4332E; Tue,  5 Mar 2024 19:03:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Tue, 05 Mar 2024 19:03:11 +0000
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
Message-ID: <bug-218305-215701-Txgr0jMvpF@https.bugzilla.kernel.org/>
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

--- Comment #27 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
So I think there are actually two issues in this bug.=20=20
* The first one was the one that Artem reported which looks like a problem =
with
the EC communicating some limits to the APU.  This is Artem's issue.
* The second one is that there was a bug in amd-pstate that could cause CPPC
requests to have the wrong values.  This is (nearly) everyone else's issue =
in
this bug.

The second issue is fixed by
https://github.com/torvalds/linux/commit/22fb4f041999f5f16ecbda15a2859b4ef4=
cbf47e

For the first issue, Artem can you update to 6.8-rc7, make sure you've added
the TEE firmware for the amd-pmf driver from linux-firmware and see if you =
can
still reproduce it?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
