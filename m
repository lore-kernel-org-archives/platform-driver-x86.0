Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EE1176238
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 21:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779053598; cv=none; b=VBsyry0Q82mQqkSF+U2qgSd4UWDKi4lFR4KUqlyHZPi74w4wK8cjrxQ3CIsOc7xDlvXKFeo29NhNqzQFVj36P22U3uL/l7o9s03J+E6/HqwkX6FglEgPfXN95/FTtd7W3l+JwBFc9TpXECm8y+TBaq8CroZUwOpeCQrOa5oFNYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779053598; c=relaxed/simple;
	bh=NyVDmA70dI2dx67J7uC2SBeRVT6kZv6wLftQln7I2YU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KT+NaVFgYFALceHuCrIOEOMFE3bAvDHgynptlw2+ExZrKB6D0+VNvfEAALx3Fzfhh2ZY4+jC89ShM0kzGu4JZf2eCtxLr1ye8L+ktk3j/uK4L54d3BsPI7aGqNk2fENlBgNvAsbRgBoODiqpOPEVDVGTUQRZ9Q53dUUaXHNxtko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcPdpaU0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcPdpaU0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73216C2BCC6
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 21:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779053598;
	bh=NyVDmA70dI2dx67J7uC2SBeRVT6kZv6wLftQln7I2YU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WcPdpaU0OPRYbl8GF9LiZ3o5Nr8vNtKKubrRZJajn/3do1PR5yFdos2f8Za8TDOU9
	 QFDyjWCp1IBvZo+0eerlWIVJuATJstM7pGQSDD3mDaisIZ7yuonsr5O/b37z7eGnE7
	 0uSCegcFVHegHkdrVE7+G85OKJKYZA/GMjri7FHMlX7RFw5BnXXrWcXkOYIv7y33+g
	 nlL3vn2SZSLzRg3blI2UB13r8/Y1hCSdLpYXav0ZQ+Hem1mWNrjW0BhQO1pfNmHpF7
	 D1gjeqH8YftRSvT8gU0B0Gf/wgSdcJf97gUyICIqJBKx4fefPqcfR1KiAYNzlODwmy
	 K9K67M4tl6eEQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6B160C53BC5; Sun, 17 May 2026 21:33:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Sun, 17 May 2026 21:33:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: rickk1166@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221065-215701-BK4WuWs4Rp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #87 from Rick (rickk1166@gmail.com) ---
Created attachment 310146
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310146&action=3Dedit
dmesg output spamming dumps 1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
