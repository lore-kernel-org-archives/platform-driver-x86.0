Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E491CB9E9
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 13:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732197536; cv=none; b=YihG7RrioIoFoXj+72So17h6g9PTv55PZNOzx7FxWyJwipYSshZmOcy6AGUxQGh3rrlHswNMTIvdU3g01P4RXmGK4ggI9iQsowMmUUFt+tXWu0HF0/+/BD3MU/6D+DVs22n9kUmmsxCTsGG2pqdF5tC170YxE5Ltmxyd4Bierqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732197536; c=relaxed/simple;
	bh=sJHQ8vCBD+ll3y8aOLLGiF2mF+Ku1i5BpLmsXSk5TCg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CA7TTPzkoeQSuiQ/ofNWCA4yi8ImFXLUlfqyxdTLPJGAic/eqS5BbQSrZedsV7QyI3WxeVhYxRzLGo02b8/+1xEhQGcpLtsaYFRy0edK+w+/PK/NcZBHoiipM8fpVb3kCWU2Pe3o06XTFTXI1C0X+JyJxeYUhAn0Dpks5PPJ5X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvdUv05W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvdUv05W"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5605C4CECD
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 13:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732197535;
	bh=sJHQ8vCBD+ll3y8aOLLGiF2mF+Ku1i5BpLmsXSk5TCg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MvdUv05WJMCw7knlwQJaB2E+/tVWuoZTRUkug1GxmSiYletCGZzMlvXvoIhZZqMDy
	 RKnmjLohC9FKOZK0+n945vHjguqVrf4yD0I/CxVOrOF6faYFfe+AuX86fKqG1ikOvy
	 DU0Mc1DcO0bbAyTNICV7THxKZybcG0G/cznPgK41SSQfpkoiZlUKmB1sUz0qXEsEdh
	 cz5kCqEHqS+ENwmt20GxJ7Ksp9f3kTXJ6MqYmlokJ6X+r3rnlAc66WCvZTPgcjQrID
	 gmluEietvYNVUQ6nuVbt7uxC6lMxwdLGH7SMPUBv2INhGwA6aNUnn/YNKCiZfpQOF0
	 4Im9rYSocoi7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AAC15C53BBF; Thu, 21 Nov 2024 13:58:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Thu, 21 Nov 2024 13:58:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: auslands-kv@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219517-215701-U3MDdtsrNw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #12 from Michael (auslands-kv@gmx.de) ---
I am running the latest official BIOS version from ASUS (307 from 2024/04/0=
3).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
