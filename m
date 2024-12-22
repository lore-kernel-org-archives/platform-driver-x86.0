Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBDA1B0F16
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 20:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898515; cv=none; b=Dyer3D+92jQn87gDUvsFV5PqSB0jR6ijtEY7W0d3Zut+0C/aUzqk+daCJfFhjuhRuL9BKcRcXPMWVhtARAFzJcNBrq0tEftwjjUdb6VsTyaOaB+pdEfXVfGnMX7pP5MqQ+xyDnMP5k1bAnROFWfyQvbQocambhE89MYe5dLX1fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898515; c=relaxed/simple;
	bh=eiNtaiEEAFxHCE9PAakAKKmQDEbMzsKo9QGOksTnRPc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KUD6qgu/io3aB0g5mEvNkTgNfg2F2hAybIw5h1iHsGgeOm7cVafFXf6xe17o9Hq31f8ce4/UeQzySSTOu0JqYQRFYAA10ze/OvcN21zZUbeg7ALnQgb9z+TrHWXG6cpFEiAn2HwhG+kBsKM6xLjcC+zZ2wq1QPDkD/74ziwuR0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWp00BOt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWp00BOt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31934C4CEDE
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 20:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734898515;
	bh=eiNtaiEEAFxHCE9PAakAKKmQDEbMzsKo9QGOksTnRPc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SWp00BOtZAehpKB4FCqUY1loi2gLkExplYdh2n5eWkH5Z89BKx5JnA3DUVhmvHYz+
	 Wpe/phD/Hunq4OaJ3UMyXQ2/zzFwOOy9HODRypnB5OmL6rGd4vKXgE5WCxga12js39
	 uAcY+NJQHyAtNj+nQcsGRwl9R2DLFBe+l/V4Kcuhi6VzST9Zf7TplSCIKaTnSU1hHF
	 8Z1KQxpZZV/9ckgHI/h5a1Klx6X7VFKnfguaACtV8re774BcOoaBmSAA7wsnWTtVpy
	 KOvR4CZIr+pNFQr+2uKbYYwhhO0Mbb5Qz61Lo47r1U1bIz/JfyjAFYjMbaDLL95w8R
	 1tGcaXL/7EFww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 275ADC41616; Sun, 22 Dec 2024 20:15:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sun, 22 Dec 2024 20:15:14 +0000
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
Message-ID: <bug-218305-215701-jF7zsnmWBJ@https.bugzilla.kernel.org/>
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

--- Comment #81 from James Hogge (jameshogge@gmail.com) ---
Frustrating... I've tried raising this with Lenovo too. I've had relatively
useful customer support experiences with the in the past. If it turns out t=
o be
something they fix on their end, I'll say.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
