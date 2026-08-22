Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6843395ACC
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 09:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787390735; cv=none; b=OJz9aP5bpkOaodKoA6gxHBHRxKjxP3wswExrtRLKjYVdB1iMK7JzCU+4pzvq9kqeTk5zgRrXVTg4BGlgDhEBy/wN4owxUKAxACuHgF3yCQvRbL+1E1g7uG4vhMJOjfr1T8aLHkkTK+IMD1T3KPUQFOufldWAAuBIKLQO+x8MwrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787390735; c=relaxed/simple;
	bh=RMwqsgAeCn2yswxRE4Y2SQSjpl9tVvWXA+ICP923g7I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S2AFZ/uInVxHWCzNbBUHtYJ1o/16TTX3G6jV3+Cz27qxzOWLVSm860hhtjVBoOx1UycytiektpQTGF1ll5TFUXk3shmE3QG/l7x7eFIns21W2kZu3HAn3L7sjJrWu5aphUjGh4kAKOaTYHY1lfwmKhBF3GEgOkRmaSoCtIDgB2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pPWNrrWw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pPWNrrWw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5B89C2BCB3
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 09:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787390734;
	bh=RMwqsgAeCn2yswxRE4Y2SQSjpl9tVvWXA+ICP923g7I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pPWNrrWwkI4ahxbXWHPZjlVK+LpYuoFbbxfPnWHS/tf7WB1gWZ5uC5cM8O0EnNOb7
	 TjM8b5hQHwp/ClKQbX9P25+5nS5FicRFquYdu3OScFGveQWu/NXBweRLOFjhCRFtaE
	 d4Y0GU/Eam3oOnvZW/b8qjS7FoKEJecqGYoCAEzp9HmBDq58pesCQAPTLqPdI4lo7B
	 wFbr8CnrgD6EIosZSohn2AHPNn+VDPqWzL7YKu+KIDfgxAcUKqQKHZJdyxnQ8ifDdF
	 uCZlOxaklYMxzgS5xUAMzuioTJEaVcfEQ1xCLlzZN7FfG0evjE2NqdFMyw8q9Mbb6x
	 2qXrsqplUEbUQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AFCC1C433E1; Sat, 22 Aug 2026 09:25:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221905] [REGRESSION] apple-properties: device path parse error
 -19 at 0x14 on iMac14,3
Date: Sat, 22 Aug 2026 09:25:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-221905-215701-fRpNnx66uW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221905-215701@https.bugzilla.kernel.org/>
References: <bug-221905-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221905

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
