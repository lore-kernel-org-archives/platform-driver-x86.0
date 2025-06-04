Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37A619F480
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 11:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749036765; cv=none; b=V6iusyIPDaq5Y9ePUB2suHRjOrJOY9dewa0OKMFPIckO5VajhZO75oMEum0zrQZEFDW1yiLDsho9N7Xrm4VMBJpUlCqcGUKUv+TN5CbnU0rwCHing1vmdssr5iYbUBZHQqVHdyt4k5H/UnxBEcRlee9kn3fm1ZJ2OrQMjWifYwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749036765; c=relaxed/simple;
	bh=zBMNLQFupoQkVB2iW5l3KksKJXRvRAxZv6sbb8GDl7Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TG/56NcXSLjOncjcOxAVI/5cXSqS+2nY4O8ik5sAShetzRGt7rmL4sptcIhi7cU8QDpZU59diBYEezg8xMcLQlutFSAXJgLJfZNeVJ1238tdLbN77cFaPgjF0sWoXJVQQ99HgtC+CRTCOffkNxn08EzY/rXD6UHmF6Uhatts6o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pkBV0mbh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pkBV0mbh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F3FDC4CEE7
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 11:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749036765;
	bh=zBMNLQFupoQkVB2iW5l3KksKJXRvRAxZv6sbb8GDl7Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pkBV0mbh7h2nEu4yYS9aMSjz2LYzoWessPAFnCeROUIz64UJEZPqRfeCPSz+iw7np
	 ZWcgmMSPSIHS77Dsdq0O+Cic4kuz2sVlrldKibbCLNXbKQJaqD/ZzoNnb5949PxuAT
	 2IZBn2L/tEmAeU129mSc6/xZ65+XK0zeTxbefnsaAt91XUIpSR/hO4D0HoSUZ6KATz
	 RWLzRu/xMBubOnzQNdgyCDzDJR51s38/OWtyoJBmX/YerB+UAUb49V7PprTcomWorj
	 VHeYYznEhasqhn50+BQyHhzMOThpm7EZH+pdXcAHqBf0JiwrzwKBfB1F7jl8+iHmCC
	 S4zEEVsdFzGmw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 26FE3C41612; Wed,  4 Jun 2025 11:32:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Wed, 04 Jun 2025 11:32:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ein4rth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: mario.limonciello@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220116-215701-KwAhi2z4xk@https.bugzilla.kernel.org/>
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

--- Comment #10 from raoul (ein4rth@gmail.com) ---
BTW out of curiosity I've tried a script to dynamically unload/load i8042 on
suspend (https://github.com/mistine/i8042-keyboard-fix-linux), but the prob=
lem
remains.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
