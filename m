Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FDA1E98EF
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 02:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776913044; cv=none; b=lnp7Cc6guO0aKCq7zwta+8OSAyOAOZUyZfG21Y22Ny1eY9KxjiejTgw+xPxKkPDU8G6n+ptHqL4exyIiUrqNlEXAjHc2bcqv6y6YniPGUp7c7eKkK+9gWXG3ZcKp96RSECjSubafWI5w5hU7aUT3MF1FTxOY44DTZzHoyFGbHS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776913044; c=relaxed/simple;
	bh=utYDzyD47BP9/+ipqRlIR8D2NDeIUJv4MEUx7KdlR+4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e2vdAjMeGxZaVWF3K3/vQSgvAPmDQIhutJX0bQ15/jvsFfWmccDQOVEDcbNjCq/RKKSTcxU/HhovY9pcovVokpQb115pOg+/+sPVNmWCIHF1cTid3keUfWpLOg10DDeBgyABtiTY9g2IArdkWgqgioXn2Pzc9k2UkKuWS2QtyHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fj86oyFt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fj86oyFt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2A46C2BCB2
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 02:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776913043;
	bh=utYDzyD47BP9/+ipqRlIR8D2NDeIUJv4MEUx7KdlR+4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fj86oyFtzcB0AxoJc02bnZ6zT+4noGaHYikyrOWxxE4Lr3U8m/QHDoLAI15bKgaE7
	 OvGgI1bDR5xlwQhDVxqqHMaNF16hY3MVevJveHj0Rufhjuo6BcBeCv3lGCkrFFeGhZ
	 +WmU+JoTPevMU4IdavNDM7IdGitQZId8g7LV8rGiQqgUJ7DqRF9x9/BCMG3P6DyVI+
	 gHEuaLMfeA2VwM+IT7CDHDbuc2GX213saRUhywLqCsRWNjIxIenmPqvCz8fkt2/HND
	 5SVlYrXHcotiw6zc+mT2yEFvJN01KGkPtY12XjiMy11HUGqOHC5glIpQ0EPeTH35iw
	 5nNwTXxsnOYYg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 99A63C433E1; Thu, 23 Apr 2026 02:57:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Thu, 23 Apr 2026 02:57:23 +0000
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
Message-ID: <bug-221383-215701-zb3s3SeXzt@https.bugzilla.kernel.org/>
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

--- Comment #14 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Well not necessarily does it rule it out. Maybe Windows does a different
sequence at suspend resume to 8042 and that's the root of the problem.

Given the similar symptoms I don't see a problem linking these together for
now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
