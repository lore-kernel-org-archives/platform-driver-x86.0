Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538313C3C
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 03:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732072637; cv=none; b=jmcMJr3RjIrz0BOoP6UTLRnJ4TZ2IsW90Kdcx4/R7QKRowtQ6tKZbEytRS5ZCyUA84V8OHxTmHUybAPlKAUzRJ+cNYGBg4GXn/N27kWSVK6Is7lTzHiQdtxlI/jHksDgyQa+bw9gd1xiNBGawk0Uf+GYhXY+2cBVQgNQ/lUJQxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732072637; c=relaxed/simple;
	bh=86mqhSWAkv57+/QjfdSFTgiYWl52FM4RwmfVyXXuOzM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fBSnroV3Y+ztSysp18UvgTlES2ZyXkM6BkzBBntaR/QhhkGidpAOXlWQJYMhmAjHyMB5BJmAN4T59irmwOICvaBatu8is3qn6aUFzaMqWAfiAAAhgAUhFaJeZMDJBriQcdF5cXnXYrU5sfE1L14NUr6dsfJXcuHIEYJm/Tw8XRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1lvOM49; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g1lvOM49"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF611C4CECF
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 03:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732072636;
	bh=86mqhSWAkv57+/QjfdSFTgiYWl52FM4RwmfVyXXuOzM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=g1lvOM49q2NgdrD9TeKT/+GH9WgEMXKZ7iZiMsX3ACKNyLwmpeiHuEuDXDQxkYJMH
	 ximUb5TGZsVsq5KNrrQJ6FX58v9PELKabf98iT3BNxYz189Wt53bLjueeAUuj252Y6
	 jCPbtIXggTk4GMcaqHQZnHQwHLAB3FD3RoLE63S3nA5x72xrskHjD/h4zBtkv2bX0r
	 rcU3q5XjWC7n5aBlQ6wHI81fz/aBoOzKoK6LPdOuB33TohTZCLz3a4my4A0thm6lAo
	 4BYQl8bHRmOoZ5iP5Id2vNl7TCuU8mjppQEcCWx+mq3DM/93g25kpbVvEnjd3zTSx6
	 5rcs6S+UqjYNQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CA8D4C53BBF; Wed, 20 Nov 2024 03:17:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219515] intel_th_pci Driver Probe Failed with Error Code -107
Date: Wed, 20 Nov 2024 03:17:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219515-215701-6iWtHk0IkO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219515-215701@https.bugzilla.kernel.org/>
References: <bug-219515-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219515

--- Comment #2 from andy.liang@hpe.com ---
Created attachment 307250
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307250&action=3Dedit
RHEL9.5 dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
