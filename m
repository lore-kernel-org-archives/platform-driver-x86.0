Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0287485
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 03:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734836455; cv=none; b=PHfBjkUcqFrxBOi5/0/GBtHNcgnLGfwk4CSzX8db1gFBgawUlX8SrWKLKurHyxUg87y7JlRvbTBn9DhtrMolJFSIny7uXgP2PyI7i5tWKKOgHj4+E66MPPACFvKO7zPvzEXBN2GYidDQ46SBOgFHtE+R6B2Eobi1VsBjd5WyE00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734836455; c=relaxed/simple;
	bh=z9HoJWRU3w/SYKttPgPPv87N295cYi8EZ/SaqriJ+xk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BtC8TFN2cxDEfLEx1ZPixnkeStGBfgE/T8hi1/S+j4p8Ne1SsaFjxUAPL137jNqEm06RBXA4h0SO9pup2C59Ud06yH79oVyYtgJHaxGCTAGI/Tv4LxE/EdWeRcsgiE7OS44HK/QfsY6Mqnzu9zkoCf+iLLANbphUjaQvEmCspuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MoxQWas8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MoxQWas8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D899C4CEDE
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 03:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734836455;
	bh=z9HoJWRU3w/SYKttPgPPv87N295cYi8EZ/SaqriJ+xk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MoxQWas8NmaIuwZev9hANDVLl+eCgL+NhD3bI16wnsMymm9SaB6peG1ZZ4mI5bL7h
	 hiBApJLwFAj2Ge8zqsa0uCShEbuyH37mPMiQYhFSQb/cjd8u/7gyBbbf3XN8weXtXT
	 3OJcFJvqYF80gUljj08Ti2ln4uNUEYE4UgkwzED6rb2lR7ZwmhcEUNxPLoLUhIXTo7
	 60jOaiVBUS4vb1JBUtRak8diedqJO3jSEWmubSQuGDnLJlnVp37mElN+rkzB2/HkHl
	 7No9N9KuUjDNzsYhXtG5sJShLF/vP5kuEq/C/GrYj17PW5OrJ9WwLUc2b+SeqWlN+y
	 gfbORlomRu0qg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 08518C3279E; Sun, 22 Dec 2024 03:00:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sun, 22 Dec 2024 03:00:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jameshogge@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-pSqxJYsK6r@https.bugzilla.kernel.org/>
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

--- Comment #77 from James Hogge (jameshogge@gmail.com) ---
Should add that I'm running Ubuntu 24.04. Kernel version 6.8.0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
