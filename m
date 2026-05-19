Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE21328B71
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 08:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178559; cv=none; b=TL2p3t6eumL/VxkenKnZ2LfJ23Pkv62YhENUJHcHvglUFWsu8Sj9cL0Fdmu2qq8vP3bQAzBnOZ8V1qDEiGLI2vQPiqGyONs7iZ5DmFlPuxWNfYtvWYTdzwQTgEj0vTQ0oGxsqLdZw4Ql4fYiWj6LBTp407Jek8LBPEZzajmY01Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178559; c=relaxed/simple;
	bh=IChIhrEeWiwqkDP19XeK4ql3snFRlvCh6DuXwNmSH7w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YZNjfWZwn6eIjcKuESFuD0/kzkOtJNivqvTYtspic/cZCqhacp3PPR+Gkq5U9yPXzZbOIcMnabAFzQiTcgwJLPv7twOAtFsnhYmxWplUmdL6WR3aKHjuqIWG0+qLyOCK1QyNjkhDIZJLR0oa1a/UHEhLL8BmL4ATgcyM/bgU0y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMGy7pCx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMGy7pCx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3C20C2BCC6
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 08:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779178558;
	bh=IChIhrEeWiwqkDP19XeK4ql3snFRlvCh6DuXwNmSH7w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XMGy7pCx/2pQu2LRD1TJbfNQRx7WhjDmFOEj/V6Jmfwnq0qhQ3DftIMkA7i9j6p4x
	 DsKcGF6XOa8tXNT6ozSgS1LDvUzLi74lMoisP2xq1RsgSBfx2doxbOU8qysGOnbJHN
	 CFP9OT+Mp9yfgVV4bFmsvsGhY6lO6Vq3XmrDAwOHSwt092gtT7S0xv2thoLGDcL1b0
	 COBNyzrp0TiTN7LxrnUIV7wY5yIWiR0fDUwmK9GANAcLUadb4TzYfz830aeesOp6Z5
	 IMhR6L8oH1lo9BzIhr8xNuEDFR1v7UeYooaaPkOtWjmKGvGcZGQFa3sXG4VlcbnNWp
	 zNd9UCgZSpS9g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B29B2C41613; Tue, 19 May 2026 08:15:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221546] Fujitsu u727 notebook lid close does nothing kernel 7.x
 - normal triggered suspend/sleep working
Date: Tue, 19 May 2026 08:15:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221546-215701-b3DHPggncr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221546-215701@https.bugzilla.kernel.org/>
References: <bug-221546-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221546

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
Please bisect https://docs.kernel.org/admin-guide/bug-bisect.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
