Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E492C233928
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 19:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781205468; cv=none; b=nLaVp89mtRWd2IqccgE3rw9hyPFm1FSYnr50b9Y2W5piQFcbiLeoH8nDYQ3n+UG6JiFXqL85o5pDnY+CEw3qhJx3+dma8ChMUETQluBuAqjNL/cu7gSs9UvoyDfvJ5ZuAN3drbvqmM14EK5zk9qtMLVMgMdvRpZGy2CtFplRLn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781205468; c=relaxed/simple;
	bh=CmAqZmfOl7mNod+ngaVa6x33w0jWEqnBCNkYU3P842c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JnZQHrUoo0r13Pth4SQgLJdmWuv81JNKk6LX2maR/T6tTkDRposUncVzGAJVRJFnxMAOj0Q+hEwFyc+CWXN7m+jmLMp9wR0fs0dQ8p6cw782/5l+Zmag/VCkERej7Cyu7ttuioNZt6ZHWvwAdQtVqdQzUsPaLiD3P0FslGDINuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7rhvMHN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7rhvMHN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84935C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 19:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781205467;
	bh=CmAqZmfOl7mNod+ngaVa6x33w0jWEqnBCNkYU3P842c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=B7rhvMHNbm+UJlMkuLKDUaF2CWL9Pkpme9fY8z8CPR4uQqpCttlaPmwf2NUSgUZI+
	 vZ13bbgdGbA2oppOBav5x6hdyLjBkXEwIZLoeV5RfHYNNG6Z/B+drwnZWrGnmBwmQ7
	 EnkPjNm23PKZF0ZeGfRcHGB6+K4ECkTGpXUSmSeLn3bZfYTJbDmNeQeVa1elT+pvO7
	 JEXSUA+JC1AJ2Ll/c+Z8eJaJUc9RPyDCl10ozZmhW20BTKH9ZJOUzDiOHx06U2jUjg
	 nfkMB5Fp0WOUHojyxQ4dZChwxt5pwS5wI4njqPQAau3wfa/S2GTDrlOxYU7xX2h8D2
	 bvIaHtqSgB2MQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 70002C3279F; Thu, 11 Jun 2026 19:17:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 11 Jun 2026 19:17:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-OplMo6WI8R@https.bugzilla.kernel.org/>
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

--- Comment #92 from Armin Wolf (W_Armin@gmx.de) ---
I see. I will soon upload another prototype driver with some changes inside=
 the
LED handling code. I would be happy if you could then test this module.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
