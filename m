Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D639B1FBE9E
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 05:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750223708; cv=none; b=j72xVFJvyrJsnrhZnOWDl5qo1nukOAWNYezCtfLXeKL42gUlU9CqSTN9Zt6iUGxex6J0T8umhnoCe8gDpFn7y2LBF5OksFqMvBibeGAHrjQgkvBE6pdFVpFPqip6VmxdMaNX/t3qKEJEBMAirnspdXP7hZ3FKeAOkVQrxf8sGJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750223708; c=relaxed/simple;
	bh=+dJ7p6ifyeXmPVmfoitWxjOqyrJUWc2Gl0LI168NWZw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RiNU1Y/g/YpcXQbQLtx7Sukz8eRsb2/k6Mgn2bvon9LXe+5srwqpcXA/7WeL1joPfFr8mktoU1xj7VDViAVo+giIDdzt9YEpwA2bCFSO51Oe7HX6mAaw73uL+uP6lxWT+HxYQZN+6GhaRWDs8ciwakX1/DXISlUWImzzx/sW9Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJfwNRM5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJfwNRM5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6603CC4CEF2
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 05:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750223708;
	bh=+dJ7p6ifyeXmPVmfoitWxjOqyrJUWc2Gl0LI168NWZw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GJfwNRM5a1kTLQNxvWn3GFR3gEIwwNKk+9X7GvzDBGbNMFYDt/huNkoNIAP9LqPaW
	 RuuXJXEpa7OxNZ+PrJJIJbhY/eJ7lNBGwybkyb7wCDwZ4PAUQ6OT+ajJnQi2a4RvlD
	 X3zMdlVEkHgP/BOByJStFPr5LMw+kYXU3J2PFsf0lnVpJIuBaas0xOYHp7X3l522sV
	 4HQ8Wd7ZgChKZOsBxdxXfoPXafnl16LU2fDf2mbACyuMBHnmmhGGO5EOZVqW7tZCIy
	 rGGtXzJTN/DLJvWZ9L8dY1DEz07plCwlPu593zE/nQr1rTGjAbGX1nTM9Qz+4MimKR
	 cYh1lcvdCnv4g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5A798C41613; Wed, 18 Jun 2025 05:15:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Wed, 18 Jun 2025 05:15:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Input Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ein4rth@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_input-devices@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220116-215701-mnMDuiVhfv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

--- Comment #31 from raoul (ein4rth@gmail.com) ---
Thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
