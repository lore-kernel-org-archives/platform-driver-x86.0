Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39F82472B1
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Sep 2025 10:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757414318; cv=none; b=Q+ZVl0bviQg8V+W+F1HlYZDiD+sGxNDX+uiuoTvjrMpcq8wO/X3PPtyF8C5bRz9ES0x2gFKv8n8EtFpVzF8Id0Yo4KxwYnGLnBlEQDBSNdj4GbcuwRJIGWbpiY4snHo1/l8cV9qKsSsr2TweL61DroArVpMv1huul7wucuFrVpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757414318; c=relaxed/simple;
	bh=sPzjMldIetHoqlSnzw+1o8k0tmx7IsNIpoL3zHPMjHU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VgWXVRsB++NSAuH/OUwigp7er27J29jOHOkTZJ/wsWwJIo5x9dzVdlzAd7Hl5/3lYQPElqW7TnfVbfIZVQ4v1CEC8U/ITYII67a49cF6pBecsVocYoiHBwjV9jnwyZ6isdwyKky0oabYG/3HFVyk6dEWNkS73DvZnLCmuXzCwxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8UEE64H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8UEE64H"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AE11C4CEFA
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Sep 2025 10:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757414318;
	bh=sPzjMldIetHoqlSnzw+1o8k0tmx7IsNIpoL3zHPMjHU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=R8UEE64HPRSZpSRK/E3Zt1qov9vfNLzw8AzUxI9XrrSOnm0c1zVSjSNQp4CIu1EVw
	 tmSP2H1BPeXxyfYJrKK4/p2ZoF5fHlEAd1Rx5klWkE8uOIkJtSL5EsfZQFK7ga+VUm
	 ycmOl60qN8XxGcZk030I6JcKVMLCnhiBVcGLu9raD7GHSpWI5uIHMs8ZmrJIXiTERR
	 ARRdIJ397djtx1JJSnKp3vITmmjkwYSykq5TLJWxjjdO2rqtn1/LAGk85FHZvQHWGx
	 4K7j8HhZUAPDaykNuDbakqOVE/UyJBMVo0pbTyDMtt+8g7XXn/3TGs7dHsHTHCejuv
	 V4tNdsmsxtfxA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 21229C53BC7; Tue,  9 Sep 2025 10:38:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Tue, 09 Sep 2025 10:38:37 +0000
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
Message-ID: <bug-218305-215701-hLleT4enNo@https.bugzilla.kernel.org/>
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

--- Comment #103 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
#102:

Yes; that matches the workaround that people have indicated in the past for=
 EC
on this issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
