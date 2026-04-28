Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9543161AD
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777389685; cv=none; b=cFV9Vzu9iMvwWbJ9J1pHQpcx4zQlv+yi9ubyMfD4QdFgTkW2H3zU3SL5UPzgHJlAquA1QZM73AZGa76XZvxS1Aj06sSdB6ukU8I6Xzz9hEtyp2j+4f3sLdgmKMdXNffu/I28Adb71k3n6IWPa4n6FTQ1AbvVw/QmhUQtvslPgBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777389685; c=relaxed/simple;
	bh=8ibUZhoHKzq/amD4RRxGWTXKx7t/22nbYMU4zsgPU00=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YzMFLbjP1S/WAnXWEjeOodJUOrDfWQYLS9gV9tg5a7aTwbQ5zMZ54dRq8BXk9yMwk+qQ3CYIRfUkRKBMW90YSz8Vnuh/FNRz2DCWv54gnA8oGtUlvnkxciGRRFoq3CksdAgARIjcC9NPmG77NFS7WbKoJGueMvz1/0VZdkUuJIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6Nijqnz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6Nijqnz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96CCDC2BCB7
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777389684;
	bh=8ibUZhoHKzq/amD4RRxGWTXKx7t/22nbYMU4zsgPU00=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Y6NijqnzmjSVF4xXhR6rUvB1AC0VGDJ7XWAk154URzvlkBX7eC4Uj0EJgN94esvm3
	 /OqXzDpi2sY6qbPbrqLED8xJrEmrZVtn8ClIHrYqeJCga84dATfT4d/fPzLYHoaHWR
	 9yMFeqKkvgmhmlg8xmLwGGho7//eGpQmnm6UAtUZ9CKnCUHeTEHn0UUiEdO3IXUIOQ
	 7hyaIEIESZeTigFNc7ykItcwZrDdAdFPWlyHlSbj9PvLOa37EgeiFNLBvySe8LoG55
	 hDjiqyKVUn7K/g2KGnQqEZPvJwxnJ6m5I6V7pnVpbmmGsZpxygYXRpsTc5r+dMcx/q
	 jyFDeFF52tCgA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8DDF2C3279F; Tue, 28 Apr 2026 15:21:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Tue, 28 Apr 2026 15:21:24 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-c0SXoUZ3kg@https.bugzilla.kernel.org/>
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

--- Comment #58 from Daniel Gibson (metalcaedes@gmail.com) ---
> Yeah; It's hard to know if people just haven't tested those systems with
> Linux or if they don't have the bug

Yeah.. for the devices that are affected, like mine, I also found reports w=
here
people were happy and marked the issue as "resolved" in the forums when they
had a workaround that still left the Fn-keys broken (and I guess they never
realized the lid switch doesn't work), or even with "I disabled suspending
completely and always shut down now, as a workaround" - "great, solved, clo=
sing
topic" -_-

> you can make the call when you submit the patch.

Maybe I'll try to get the patch in matching all of 82X and 83K - I think the
annoyance of a broken keyboard after suspend is *much* bigger than delaying
sleep by 2.5s when it *maybe* wasn't really necessary.
I can still go back to matching the individual devices if the review reques=
ts
it.


Thank you very much for your advice, it's much appreciated!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
