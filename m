Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A3A28E594
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749036698; cv=none; b=qRzyK4Iqv1ayv6c+ygRTxxMfI5Zp1Rgjj2wTkypTcWVwfL8Ty4hNfthVcf8YFMi86LI8soPI/i/Wwd29COcYqU+W/MzFKXlcQkaVk28cpMpkHEilKXU2t0KNvjSa5D9zsM5nNlGWM7Bjr3Pa6zS9GTz1p3vjK4LUku3QGHtjJUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749036698; c=relaxed/simple;
	bh=dqWlkQRfFILpLcXmxUHnFgrrBB4Gqw0NumFX2hiyGdo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hnp7y/3GNagrsLGql9DVe12f1FZ0dPBFwEejYriHYjSM6ckiNIrTqRbM+vpTrOO7Y25ORIse9KD6V2VZWrm3v5+o7TVfvwrOsVTDhPEUeNXlpRizx1cUq4bbkMXHD5n9C01+tp5dcSiLQzUWAqsJRi5QzmbOOpyZlMzmYELAiUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KP4pooDj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KP4pooDj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F797C4CEE7
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 11:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749036698;
	bh=dqWlkQRfFILpLcXmxUHnFgrrBB4Gqw0NumFX2hiyGdo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KP4pooDj7fVlcZixsLEg4Na0trCj3LTxDltBRZAVxymFzGanDLuxsvV7ckwCpP7q/
	 Rq6oZuXG2MB1YU2Upyx05JUZY330el2/xqSaadqL8KUlmaUS57oiQOlEhNp5OG6MDe
	 S9KMZ4ycGP/ZdN0WeW/U6y/jW4VlqqUieuI5+P13CkN3ld/2kX6e3CqZuD/jMDGPRW
	 0NzNQvIK1s4/oUKMop/FQ+ZRSsJjSZ4efQmBIdoNrnqbFKI7MCnTKCboB/BjaZNcfR
	 Z/7epe/RG793dAUWnyznyD1o+lKcO3KzR90URfAXSTBzNnVd+54Ebka9U5p2WQyntP
	 h7Gcc3Zb2bBHA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 10A85C4160E; Wed,  4 Jun 2025 11:31:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Wed, 04 Jun 2025 11:31:37 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220116-215701-9PVqSIVTIG@https.bugzilla.kernel.org/>
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

--- Comment #9 from raoul (ein4rth@gmail.com) ---
Created attachment 308203
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308203&action=3Dedit
acpidump and report

Sorry for the delay, here's the acpidump and a new s2idle report (generated
after disconnecting all devices and disabling keyboard wakeup as suggested =
by
Mario)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
