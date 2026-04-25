Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC39A2110E
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 00:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777077944; cv=none; b=Kz7ZxSEhAbMv1eOBBNQqheXx44GkoQW5pgzOvx9tjtxao67WUee+4mJtieuO56ifrOaHSqoN5Mb3ifWmNA8PO/z2lfKMCAPg2ijQFgnckGyLyFzPm68SWUlM+DYXPZMKehNakSB1h4p76T7bO7tzfGYUwcFD9tfFL1qg5Nj3I7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777077944; c=relaxed/simple;
	bh=0s/STHl/D9NyjzoceJCw/8ktaURWBlmHFpMTayR6wUA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KvTIc08uEVTnw4+XEoo7Wiahletrf/QGqTxhpr19xKHIcpf7NiKqd3mbbQAEJXzGZfs61yKAB8gEoUSygSgx/GaEJNDlzP2XP6X6S9x01TUVlx0+A5CKI3lK8cLewA0c22sY7UVCDbPzuzqTghL+9YhRszhwqBW3g/0SzUUCRHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6/4peXi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6/4peXi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6BA4DC19425
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 00:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777077944;
	bh=0s/STHl/D9NyjzoceJCw/8ktaURWBlmHFpMTayR6wUA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=f6/4peXiuyp9ewigxLbsSWXb1MB7kCuVKm/QgmqIe3rQ6XGFTWCXc9i9/gKx0eBjm
	 kADo/ejNVoNXzfYKWAO74hnzUlNEHxn0ImmYzxNz8sel2Dqk3tdJVKW99hGa1Mis+S
	 E5+cSoCgG03xxXa1Rc7t/25hMnz47e3rjLuH1q5WW6p3FsTiKPio+MyV1l3q5MWd+L
	 zmQXdQQrln4kUM9BFkdk7+0Y+U1SrkkzV7ZihJqKPttHeB35ZH0Il4HrFpZFBZTE6V
	 qCBjxXDmk0ih7zIxCO0Jw5jrdF+DmhjYT48EaIuqWaTzZlkDOr6nPY7u0EMKgY48Qq
	 ftzU88bGiskng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5D709C3279F; Sat, 25 Apr 2026 00:45:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Sat, 25 Apr 2026 00:45:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221383-215701-lbagJypcJd@https.bugzilla.kernel.org/>
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

--- Comment #34 from Daniel Gibson (metalcaedes@gmail.com) ---
Created attachment 309944
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309944&action=3Dedit
dmesg output with EC logging, broken case

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
