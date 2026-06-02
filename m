Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1383E3165
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jun 2026 13:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780408147; cv=none; b=dZP8SRaWc0V9YtM2PJ5Edm3san9Ollz5h/ad8HK9KbUabhbhLwxqHAtP0ifzrnM8T3Xc4Dgc63HHafiG69Y4SI2vkxKRUgo+iZAZlbqImBA+GE9U5GjdbCoAA0Ru8yPJTQ96I/vrCKuwT5JDBErqMH2h371GucTKaSHUQyrlNT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780408147; c=relaxed/simple;
	bh=qnsLzgW85d7zDtqfykqNubfGlcIRNfnFRqD+U8/aQVM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a5W4+YLrbJRpyWkeACtnojIRwB4HR8+SsXJ7P4XNIX9ZH82CNBiVHuot4jIruDHo0jKHwqUPrhvKzQOd1KRXSl7OkhQ0jjfwa7fyfMhzb/rTrWlw431J2WssezgchAUJPLYEnTJliMxWMicseklCytVwhH+2Ca+D2OCVXhMiQtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0O7A/Ak; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0O7A/Ak"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAAB5C2BCC4
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jun 2026 13:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780408146;
	bh=qnsLzgW85d7zDtqfykqNubfGlcIRNfnFRqD+U8/aQVM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=A0O7A/Ak+Q1L/R6urlZgcn/zj4K0RDRP+23vlJGXWrYJw0dIRcCa4bRGggp9WJD4r
	 pTfb8qn95YTnqSY56MWUKOrJVTeoxyGvfmF7UPeVkpT5tXVC95LmlLrPsqPCAgf6PA
	 H7kxVuuBCTU7bR1TFIDB0y2TT10WnbS+qZ4r+IHfmnkctN6kbvbSxVxQrMnDyhkgG0
	 Sz+yOWj0ZVfB4nJkzJ/3fZBvqsdDFNZPzpaV8RUSbZ2HRxH/FJzC7O78BuBzVZRLOw
	 C4NgiHZ8yG56fDtdxzdlp7HdTqw8NwTVCrB1OGIktYWCz5QEITMfcZMwTV8ABz4fKn
	 Hs5/4sdBsbv9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B9791C4160E; Tue,  2 Jun 2026 13:49:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 02 Jun 2026 13:49:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 4966508hayk@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218901-215701-X12JHvxe9W@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

4966508hayk@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |4966508hayk@gmail.com

--- Comment #64 from 4966508hayk@gmail.com ---
I have the same laptop as tacodog311 and almost the same problems with Fn k=
eys,
except for me, Fn + F10,F11,F12 don't release after pressing down. The rele=
ase
can be triggered by pressing some other working Fn key (like Fn+F2), and af=
ter
that the Fn + F10,F11,F12 don't respond.

I added the driver and notice no change in hotkey behaviour (both working a=
nd
not working), except Fn+F4 (touchpad on/off), which happens twice.

As a side note, I believe the dmesg output lines

[  ...] LG Gram Laptop Support LGEX0820:00: Received event 130 (805371904)

and=20

[  ...] LG Gram Laptop Support LGEX0820:00: Received event 130 (805371905)

in tacodog311's response represent the action of pressing/releasing the Fn =
key
respectively.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
