Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8973915B0EE
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712760862; cv=none; b=jE8FYa4tbXMxwbkgL0mbFguLA+kU+M/KV05ypZVI1am8cMAa8EV4axrA9E2hx86DoNJ7Zd148ETGvI5lAJxGUSOrIxPgo03UykJontfqNlYrSA2RFYt7UHbVhNuFALeePFSXwB9u/4NfLeeT8EX2vKRZrGBagSBz/UyruEz7kag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712760862; c=relaxed/simple;
	bh=XTzAulhuQK+DAiRSIYEe8yTqKRDi/8ZSbsVHH6M5gm4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ad4af17/xUrVFPvSKIWHIwMiJDkM9NLFRBeNQhobfk2Ojw74kBfRSZMJfMges+4oQP80ip7la/m2glnO4tp0CkmkvvS/9jtjyT+z01jkSq/5t3ZSfdUOJu/0rX8VJRJuO1UHaYkONNzCcSAzdWdyhr8M9J5QOfF5uXAEhsnaCjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IT7wfB42; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IT7wfB42"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2290DC433C7
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 14:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712760862;
	bh=XTzAulhuQK+DAiRSIYEe8yTqKRDi/8ZSbsVHH6M5gm4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IT7wfB42Uz0ID2g1UMAGaerbj+0ji2hJgNZvQdX9pKPREP9qWKfEQtebeZd2xMZVl
	 hMrzPtMF5NL8S3Cn5R0bKsNunqBmQrvP+nysqisCR/F8GlqkPwUuzY33whPqHxXLhr
	 fa5TWgBtA/hONIC9XSdlbYe46CjxTkEidBbAB266CR9b5jw6tqGr+cu4E0umdVEw5d
	 79xvtgC/hAj//hGvZ5DlRFGQBIxk0Ne6sjg82S/+xr1E/lhfk+s7M6IOmf4tbwvClI
	 +7BrBXEDGCBvY9gapDQTgfJ0OGrkqTG3vjc7905Sqr9ec4PbiODTO/lJ9XsE+ijz2g
	 aQPTzd8zYQJfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0E7A4C4332E; Wed, 10 Apr 2024 14:54:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 14:54:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: al0uette@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-jFDonwCGr5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #37 from al0uette@outlook.com ---
Got it. I'm compiling kernel now

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
