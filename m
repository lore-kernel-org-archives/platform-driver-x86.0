Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3996770FE
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 19:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764359257; cv=none; b=KTAppInfTfjJzZ6XtcX3bXay0KwMW8iot4ly4JT6BfNnlFvVmAOEokdG85Um0uAQFuQ/XOaVaqQk8M4KHR6N+XR2QwuyKEeyCIXCJg/GpHRHGHhTqM1vEZfVZi8NKJAPV+/u+I4ktT8ov7pB2Wnae8hqG07M70dlsH11L2cox+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764359257; c=relaxed/simple;
	bh=zuz4DoTZ6X6TUGqJFGMwg+iFw6r/A9Ll07CznlY+lV8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c0IZ44aPDAt6x41J5g11ljYz67SNvRPols7uR598bgGHfDarZaqfPxNi++RqLTvstartuf4LB33DUp7+c3illfWPDYe8sah0OnohELajF8DLHRMIT+B38gM/sJE2j2nNt/KxyFaLW1OTrAz6R4YdiI3fLzo/aI0dlcZbd6iO6FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NuP7yA6s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NuP7yA6s"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C2AAC4CEF1
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 19:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764359256;
	bh=zuz4DoTZ6X6TUGqJFGMwg+iFw6r/A9Ll07CznlY+lV8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NuP7yA6sApM1+jtI5JrvzY7wOi7iMkzQrIo+mxsxgYa0/zpJRZiZNR2YPy1F6WfEg
	 nODYhEGdADgc3lUYpn8vYKu0NGjJ6rJmfbCYEYP6WrP6FtKDj0yRa0JNLrvY1x/tal
	 KunvDrx7gkzp03Bj4h7TwkhaSaRGd38dvx+udYvAWXqEIBgq90TbaP5ued64sI6eBL
	 L9GDKZslLBxtyJIrRT16P5sEJwGuArgkfJvWWkp+00L2PAFbfqAf7hRwBb3HUo4sTW
	 M1BE3bLwMjf+G12NzVnFi7VXr7uEEcNIJmzBl7XBDIfMo93pdOMnLJThzSx0Be6q78
	 JvVWUhw07ueUQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 79F39C3279F; Fri, 28 Nov 2025 19:47:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Fri, 28 Nov 2025 19:47:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: masterwishx@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219904-215701-WMuNS50d4E@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219904-215701@https.bugzilla.kernel.org/>
References: <bug-219904-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219904

--- Comment #16 from masterwishx@gmail.com ---
Updated, still not working. Waiting the new one with a fix :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
