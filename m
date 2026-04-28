Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603603909B3
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 02:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777343119; cv=none; b=VaQYiPQ1EtWi2HX2L242R6byU+isAHaf9G3Y7Jy8s+SNFQMRbJH46P2Hd4w5PhqxGqVZDnnd2P9cJuR0LPYkS98qIEgw3pNPaBe/GxfKrP4Cn2S3mux/8IXXaAGCzLVBjE+X5iAgryTBpD2s/jSYrmjqP46EiyaMHkXfVfMW28E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777343119; c=relaxed/simple;
	bh=kKYNzCwuU/awi8N5KfJuKWhyaAauRVu3jjLfOaXwkNg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fjP4MbtJLIGEl8wbpaVCYx2b+p/Q3jp5xJsW1FxUT9tnFc5kVD6W705tccpOY8o+jBKpt/HalIokzv7qA4h5X3ZONMcGjwfNubRhIjWy+1T4V5pyvJLMBbM4c+mXaXEcZd2sUMy5ilHP4RazBKmhkC62WYPATL39Ni535L4FCa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkZix+gz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkZix+gz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0341FC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 02:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777343119;
	bh=kKYNzCwuU/awi8N5KfJuKWhyaAauRVu3jjLfOaXwkNg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YkZix+gzzX3o35IUyvOmEQ8o1KqbxspYxAIZYEm+L3x7KPWzXtZHDRVExOjDnm7eE
	 2Xzz0yqAEblsX3OVXBz5ppb1Adqu5CX26OGdYFlTD3InbruFG7meMBOQRZhHGqB2mA
	 tMIP6yfzR8T1SU9wT88kdiNdRFUx0aO0Lzr6FNeemRSlBA0EyLo6YthqtD2FTDLdVo
	 x+OSDTMxEUOa3DR0JJnXy3Rge//Dx3Zbx+Wak90fx2eplqIqrRwbGqY4hrBfHisN4T
	 ZYap7gaeyI4wcBd6k/8H+sgZfXVH1yr4QTy+eoyZ19/REfP5P2nlmPjhu7jL+rCpag
	 Chzi0qHzx4NjQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E2E46C4160E; Tue, 28 Apr 2026 02:25:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Tue, 28 Apr 2026 02:25:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-qe4rgxHUSa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #52 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Right - I don't disagree on the utility, but it's a relatively high bar to =
add
a new module parameter especially when it's driver specific.

I would say at a minimum you should make the parameter a secondary patch in
your series if you keep it so it doesn't block the rest of the work on the
quirk.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
