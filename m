Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC9519AD5C
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 02:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776911676; cv=none; b=E2lJl8bn1TEMyZ0uQXmbTFKWfseiSnigCJLifz2GaIzmzDYjwsZTVel1SDA6iVzg5h8arFzyv8+C4NY6t6ITChPxrpSLH2J5kPT4HBAyyxUo9pze+SqiJG/prXmX+Rn0Y+d8HQJngbCBpP49wese+lYwC7Rutmv2Ur2i4SBxRjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776911676; c=relaxed/simple;
	bh=6aZ4OP2V6vIId5iNt2l+Ej6DMuoeG9zIgig71hRiFqI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IPUeWb5hDv0Y3i7padmuresMyVEPQb8eWZY7qy2IqZm3JX9Xhv4/bk7zgsRb8FT+6g0b6jx2rV3Rrk1q7pGM/yYNNg2ZUV3moXOOywwzjHl+Vfl+nxVRv7T2AA7eHMaqnbb1ultKmKgRExKOQzn3sRJRvOiHeij2qdzqvbqcdqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YweIrpg0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YweIrpg0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEF27C19425
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 02:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776911676;
	bh=6aZ4OP2V6vIId5iNt2l+Ej6DMuoeG9zIgig71hRiFqI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YweIrpg0jawEJxekYmDTBy/Je97gj9JIis3Z4laYYW7mjoJcFuqHhAlYFSv094+V5
	 7FRd+EIou2rM1uqRutSaApqyORj0/Xw4Rgt2BjCk+frOuBDRjCHwKN8EEoaQbSIRlq
	 x9OO8KLo7BYZGi3HAkESdorcZ9MD3D66uyPf9f5mKgP5y9iwZdjfpJBBTbdV3f27Lt
	 LCwEe/db+HleEkPtYTdGNjpraCBlGu/Bq5jDL0/bdTvwVd3yLPjwzEw7vkdoLmCw9F
	 NtTmWoetKDgid7jJ9PNOk0v+4qaOGkKI4hd7icbplVZUoy11f/M8dSnEuPdrtpWuzt
	 68KgZtERi49kQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D8D86C3279F; Thu, 23 Apr 2026 02:34:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Thu, 23 Apr 2026 02:34:35 +0000
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
Message-ID: <bug-221383-215701-v8VaUk2nP4@https.bugzilla.kernel.org/>
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

--- Comment #12 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Unloading amd pmc will prevent hardware sleep; so that's no surprise to me.=
 It
also would mean EC never sees the sleep signal and thus would likely never =
go
to a low power state either.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
