Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E40176238
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 21:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779053620; cv=none; b=PKjJZ0gdwOp2F2C7qQ8ZqNyEldy+eyNJH+cUJtoAqKAR9jjJAPWQLffW2dQYjq1X1faa1ZGHjnTKOQkLm1eYcHAktNYfqxMOIeRJLA+CbB/dO3fxrZVsvYAPxUW3qV3LXLX6RUj5fpE2p834TM4bk5WRyuQp8wVwXaOIkp/UuGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779053620; c=relaxed/simple;
	bh=W6fMEOmamhVTadoDcvBfuKi9fh7f4kaVFKnJQ+S0U3Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N6HtMlK1bZG9/zyv3o7yXxsEndJyhRL8VU2fgMbLgZqv5KkyYxEBL0BaNSLGT5GmPjNdAETc6sUIF2cu6HHQcwAbL9qR7s6GezesmnsHj59Gym4t0IcQecXHiewYJ28dL/X1aqJH5I8kpMqgPzcrhbMy2U/vtBMy4KDDp9Gxaps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alpOJPPb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alpOJPPb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54B60C2BCFC
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 21:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779053620;
	bh=W6fMEOmamhVTadoDcvBfuKi9fh7f4kaVFKnJQ+S0U3Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=alpOJPPbwpXTmoxBQx7ToGbPF/3RF680YmZ/UIsMZ17obamC3n27STD7abe0iGlZX
	 0uop+Vw058XQ6UYB4q0Uw3Tix+ql8kI3LGcAFvQR8uHHVzWP1nXe+xdW4HyW7lIzlC
	 5SG+rhPmyhgtQqXjjSc400ot48CC2LKmfBewtArGO5HBcOSJmB9tnC8pb/FIvTu6Me
	 mjAWoY75/Mw8AnOIvQxYSyfpouymjFIom2iMIQio/lduecggac4h6zjhokmlpKPtvL
	 6pcXoRH0aVlNzZtx30vQ8JQhBHqCFp99PBBiyduwlP9o+ZpDxpktHx6n5UZnQy5mK2
	 6r8npCc/bsQbQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4B406C53BBF; Sun, 17 May 2026 21:33:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Sun, 17 May 2026 21:33:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: rickk1166@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221065-215701-N1g4cvuEiw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #88 from Rick (rickk1166@gmail.com) ---
Created attachment 310147
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310147&action=3Dedit
dmesg output spamming dumps 2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
