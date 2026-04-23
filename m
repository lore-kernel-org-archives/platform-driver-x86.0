Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC388277C88
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 04:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776917940; cv=none; b=qpN9oldtPGeo6R9QbsUk7Fsr596aHg+62hPti/7OcWu8u31Kvww02JvT0k6iaYn0h98cnA3o8Xm+R1GRatHvjbZt9fKkKqDsRhISXpuNhRMhK8P193Jnonb43LeLjA8MU0K2NwgEc4o48S+XFS2BgTAQWGgabvZQuQZI1345J8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776917940; c=relaxed/simple;
	bh=TEoaIzw+MZ1f3wdwR/PFqfmuhoG35XV0hNklLQexN9g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S/clMuvWB6nMcW47aEik1bfy4BJ6ilvZ2I4m33jT+r/MrVb8LfxWbgNM5DDk86l40eVJzYIxZYx4mm7yzb2vzgfU7Qz/hL9Am2hv5HeMFR0eWQaixZpcGUYsT3J4mBFYVnLGYQF5mkgEzU4PGw12DzVHG1UDkGulK2KVXUN3myo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7j4zhWg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7j4zhWg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53162C2BCB2
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 04:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776917940;
	bh=TEoaIzw+MZ1f3wdwR/PFqfmuhoG35XV0hNklLQexN9g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=F7j4zhWguj5w0TUc3nu9ggoTjICAP5TTGSSVIplL1BshSdtkK+qGxoC/+COpSFfII
	 Dva/nSGSt84WqswNcYmmYQ+/Xgi0m7DYUIHbKumYBcb4Y+JHCcmz5qW+kI5g1gx2n6
	 yKpbCe6OLz/+OFJljxsdfy8noMnxOjirElEp/UoLLyteeG69+CYLHOp1QKYlkyu5od
	 zX8bAsQvGyAusTTGjzbPZkMEw/vHUB07lxv6S5CUho60AmyYOTbGv1ibVyX5rYZ+Yc
	 6o6YjoZw86tzwb8sWavF4kxJ6SCKTrIHlLT+P1TfoJFJ4bSwS5XvWbxZ7uktWPV0TP
	 7BtDiuR1MwJJw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4E7A0C4160E; Thu, 23 Apr 2026 04:19:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Thu, 23 Apr 2026 04:19:00 +0000
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
Message-ID: <bug-221383-215701-gkw9rsYpH7@https.bugzilla.kernel.org/>
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

--- Comment #18 from Daniel Gibson (metalcaedes@gmail.com) ---
Created attachment 309933
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309933&action=3Dedit
Daniels ACPI tables, unpatched

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
