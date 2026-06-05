Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325BE3DE43D
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 01:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780623615; cv=none; b=DVzXm8lCdjYD60ecl+5zZr6N/8GKbkyKrrRJud7CDuUxqaQInAn0Dylc94wlf+H26SibumEcdEs4hCI/it0gORulKh5KnBWiHVnQAtTVzE94qkHq3scu4Q+cwzmxzl0bjKHf4ceETeBj3OhrxLgmFxM6SYrahzq59iOsO/URaNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780623615; c=relaxed/simple;
	bh=gJc2xW/j5b9vF882xxKUZM4u8TpEPqGtZfa6fy+5ZA4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oQBxBy6/2hdc4WO3uhtUJ9u8vdDaq6AKWFyhxumHgnmAtERRvvWV2R3mr3/Df99uDcINxRKy8s1eNz/LGNFveJyf1jM3cKjmd4tI7RYrdc0SRm6hlbpv5GzI7vXTLBTBwudU+LxrGOIC8iK5Qg3dxer6avFMQT8xrDu0PktrfLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuX8MYWW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuX8MYWW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A97FC2BCB8
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 01:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780623614;
	bh=gJc2xW/j5b9vF882xxKUZM4u8TpEPqGtZfa6fy+5ZA4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kuX8MYWWlJj5fu+hz4O0YNTSZsIbaJFWCulTcrUod8u+MI29zeP0aT+ykQscc9a38
	 GfUaq5uj06dUro/pSpCeVeaKGXZjmJzZNNXjsKZVzv6gvdX0VqomofbQxapbdhFC0/
	 WhjnSZgoSE8JbXiHdMrt6/SKcBZHcr2ToHtgJzihJ2X2Vn9h5TwhiOUXqA2aj6WM/e
	 qvcoHk1g5z8igsQ1Y/9/AutYld6lXuUwZVGSYyyOOsIoV5crJICRa83v77TxD2c3Ct
	 jKCIapeW90wmx5heFCQpTzFcWj8E+iJUKTmN1LpB2Wo4r9I3q1qx2UVLGJqHXCziww
	 UywaWOoXDn+7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 20495C41613; Fri,  5 Jun 2026 01:40:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 01:40:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-bmJ12mHvOB@https.bugzilla.kernel.org/>
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

--- Comment #10 from Rong Zhang (i@rong.moe) ---
IIUC, if you can only get Off and Low using my DSDT patch, you are probably
using an old kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
