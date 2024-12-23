Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA6119342E
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 11:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734952069; cv=none; b=qQAOY/TevCp9VtT/JCR43hN7w96FcRbGeNQXW6V7ZoXFbnFTJ8ViBgtGIVkE77WRp81znXYY5eE2bICyRQvytDQAF6nzd9Z4Z4wDN6HMy46tbiGYOD8l2Ax0BqtGB7zK5fdqoEY4DaU2spTCZE+/9/cWGVcuXuKVwkHQDu5oML0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734952069; c=relaxed/simple;
	bh=EjyNoaPHXg0p+u+dPGlUpc0O7xlFWrxKZcZLEIWk7OA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WpIt782LHeioPjRJ7qInabXwYIYXZoPOuigWpn86HN8e+IhxJXwSstiGoyje2aaHeutIHywhx/SXtibivUbFg/fHvz6cHs061UZjDN58Ab0TqV1BdfMw8JMeC9OCFkZ3wnt1itMsqJnLiGP9MUJKlybWQhbOAhdHVwy1K0ipBaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQVT9R/j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQVT9R/j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C926AC4CED3
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 11:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734952068;
	bh=EjyNoaPHXg0p+u+dPGlUpc0O7xlFWrxKZcZLEIWk7OA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AQVT9R/jHCAUcfJnwfzMa7hebG3ZEN/EQTgs7f3+zR5Y43XCr+QnjmhNsvGZkVUz8
	 p4if+/YiFlq2V8lEoNGJGSU9SeYzVoB/0gEaRzqfumxs/sZ3uZvIVIhFFj5OxJ87jU
	 MvoJLljmCQ2K3no7wDhwQSmOK/j10XhKWxMWBf9wN31xi00MAoXo/qAhJa0dz8LBwj
	 ERd9I/+xgOjf/gV0w+WghDw1+fucyvHfXIW7xjk4LCoYRcLDhVw5KYP8nBQuiiDp8j
	 RVrPPw0dEOcYaMI1lNso515EN7k8FSl+G5DCW2w38Ticn5qPqOZUr0E43y+sAgfJcZ
	 G5eSSUsKjM26w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BDF13C41612; Mon, 23 Dec 2024 11:07:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 23 Dec 2024 11:07:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-ohepqGi8pF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #61 from jarkko@kernel.org ---
(In reply to andy.liang from comment #59)
> The binary dump and kernel log for v2 and v3 patches are uploaded. Thank =
you.

Awesome I'll check them later on thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
