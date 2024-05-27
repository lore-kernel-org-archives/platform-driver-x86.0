Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA4417E8FC
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 20:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716840357; cv=none; b=uIM8Ith9WwDF709iCXy6rlaUmMi72y9/T08w/eJNrDlNmrqPZap8Dk0FprroMR2j+NSCWHth7Qw7QQqTuCEcwr+WMm3i58BzC3yoEHxz09hbtidX5w+lNnXqjRGQeDCTEh5L3GqrM4tYwdrQtg/6nIIdSmURo2Bf1Kb6XyEFgfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716840357; c=relaxed/simple;
	bh=aiDYkEWSDR3XVfIx+AmDe76pcpbaFUFGYVjKy1GZ3SA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NDXSrSxCH8CBk6QbgLu54wgu5y+qp6gUufi5/dNFACtz7LyxtUugEpy4n3/QWVveuu362VGbNB1oqwVOIgJ8NIhnSL7yF4iWAZubPu8+dmWoQJTvqUJXIsxLnNeifj4ep5vbEKCcbNRg/fnvDmRcevxUEcnBr1XP0TLSBNIZPls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1ISlcju; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1ISlcju"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B33F8C32781
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 20:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716840356;
	bh=aiDYkEWSDR3XVfIx+AmDe76pcpbaFUFGYVjKy1GZ3SA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P1ISlcjuEt8ePH6O0TZNVp1rhdYhPuGia+djGeGh1p37jXisBwPZWMVtOdWl3X6Ka
	 WUZ/41GHIHWCIynDiD3MKS7zKtrjc/HkGHYn2m9dAKX6YeH+G+UOm0W59njxZ/0+kv
	 wPpz6xp+/AsC35V2dJLOWAL5ywM0hNysqTmbhHOXwfBPUy5jMgNW2cBjhWPvPV2r1t
	 wLpXjZkFs9tydEW9+Yy9tN9PoHS0OYlU6/8JxCYEQooeWdZ3eQkqEFCqPqA3oTRrnR
	 XlQmDd9XPTmaZKvBfONCAzIDsNpLqyjMP9UA15SDIJh5Ik1jGObEFL5Xk/87VOueXd
	 wUgcqRjGJsCWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9E278C53B73; Mon, 27 May 2024 20:05:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Mon, 27 May 2024 20:05:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218901-215701-sFRlyvfd7S@https.bugzilla.kernel.org/>
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

Armin Wolf (W_Armin@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |W_Armin@gmx.de

--- Comment #1 from Armin Wolf (W_Armin@gmx.de) ---
Can you share the output of "acpidump"?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
