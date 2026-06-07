Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034302AF00
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jun 2026 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780831788; cv=none; b=IVXT9CEC/swkR6QGMQo012sGooddXrnEja96bSpnZLpWmvGer+lvHaof8QoqnCG5XzEotGkTIVl1KMjRPwBPr7o5a9l4OT4eML2D+pq+P8ewR6GHGD65SycJ9vzd+LDoIKhvPswDGQ+Clj9+M/Hhrb2gjn9ayMq6CMkg/fVeNxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780831788; c=relaxed/simple;
	bh=k2xg++QPkWnxBki9cSVdkIf0WJR/vG1E7L5bos1LvQA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=makFl37VUgSpduvJv4wX2yURXAWIoH8IN/PaMOT1VwUe0lbOH8HLySE7jUw9T+hscnajE7lZSUMyBnO/BmWS2W+Cf2FVHtGVLlxIifFfl0QfhWCAScAF06US2teI9UNEQfBUSHbiHZlxHQ1sumzEli+4Ciqd32xLyi3RgM0vtog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nx9LlPIp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nx9LlPIp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EF88C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jun 2026 11:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780831787;
	bh=k2xg++QPkWnxBki9cSVdkIf0WJR/vG1E7L5bos1LvQA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Nx9LlPIp3BC+N/Tsvxw5G0IZXt2wHLrU7cG46Vh1cKFv+27Vay540IaXGmVI+Q7WT
	 6FdRw2OlOzcP8Q+NhXyBWw6e2u6E7dy9hrl1tm6MZUFFKMkTqclHc3MBqry9ifeA6e
	 rWoEsflkYpl/KbHo48QL3qzr9AwLDrwb+xxRzZZGlxuM8ZYE9kA8W6V5Qv/JYhViJP
	 GtYfToZVdJt155QWTkAFnVnNme+cju6tpg3Kh5mTQVIHPQfIPp6sjIf6vGExvQ7uRo
	 V+KCmieR+1pO49Uc3CUf15EVnUbYcNR5okyPlHEag40hdZ1/jjPYyvHJ+4wUtZjEV4
	 Gor6utzGijJDw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6ECC8C3279F; Sun,  7 Jun 2026 11:29:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Sun, 07 Jun 2026 11:29:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-2UaQSRxZ0A@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #43 from George (george.stafilidis@proton.me) ---
Thank you so much for all your help and for writing the patch! I really
appreciate your patience.=20
I'll keep Mark Pearson in mind, but I understand Lenovo probably won't care
since it's an IdeaPad.=20
I'm marking this bug as resolved now. Thanks again for everything!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
