Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E82150997
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Apr 2026 20:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776715332; cv=none; b=jNyle8w8wvD04p6AaVBw5iB6+xCvP0QfzJtuQ/cr2zJhdcXgNXmYjkuyMmkcKEcJBa1urChIx9CzSxZ7NYYYMvLzhf/iBGGWNUGofUP9HsqSFL7ym/EU7y9z5osxblZz+T2OcWXDAbZW7saulBicbWheBTuu04ee6zup9rJrTvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776715332; c=relaxed/simple;
	bh=BgrJC+wve0KluIaYEUmwKoxlij7b6+rXurVFEbZPCu4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bL5Dv3bM9QdqJvzmylMN0ROFLx78jRCyxWYc2Dn5qlc4nNDrwGjRfLy4scaWZAq4HF/R7mwdXGEu0BN/nqbpxtjVeEWl2PjeIM+dhBirXJy9Craml7sFZ4xm4LmrZtq+MwRyqio5B9TB2VmNrsMgn6NN4ZdSMBGdF/zOAMzBgAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MlSVk4dk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MlSVk4dk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1A3AC19425
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Apr 2026 20:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776715331;
	bh=BgrJC+wve0KluIaYEUmwKoxlij7b6+rXurVFEbZPCu4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MlSVk4dkMSW9OuHlxia59v/K4snyDm9+wQF7UAXX7ONk9aIVE4/lKFrV3dSwJv7TP
	 F1NERJeVes1SYnQmOMb4JzDQoQQh9yzNEVkPhhhEHjDumNE1WOXSCmjsVnCDrY/g2W
	 dqMsuAcpDMnJpHmkt2fehvf/A033csi2Hbjp+LS6dm4ijqacwF7KvxredNRiljeCdh
	 /4WQ4gxbR+EfrFcAx4It+UkeBleRm57+UZLxl32H+aEn9oyt/Mcn3Rrp7WRiUGjxhi
	 zZloZOCiku4im0y1zyaa6eOs7cbMahlXzDiFEEga64E9COZUdbArKS/Mh6aL94oRnE
	 S9dZRZmzDt9+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B9E3AC3279F; Mon, 20 Apr 2026 20:02:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Mon, 20 Apr 2026 20:02:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sindrehenriksen93@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221383-215701-UYmA7SZYBR@https.bugzilla.kernel.org/>
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

--- Comment #7 from sindrehenriksen93@gmail.com ---
Created attachment 309919
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309919&action=3Dedit
evtest on event2, all 7 modules blacklisted, pre-suspend (working)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
