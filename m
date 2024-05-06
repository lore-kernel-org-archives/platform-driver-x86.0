Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2458C13DB98
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 May 2024 14:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715005236; cv=none; b=cZhU9zA8CKi50l8NgCIkLTp3PKeMfpvYofqnAT8UxbP1R42xDizOBBWsbEUQS/MjOvFXdRD2UPuFpHbJ//8DCQqs5ChEHwQxpIHhjNBT6lIWZF3VZdh4n/8DuIY8mIOLLg78YmWQD1hIhoKX+nIkUwNu9l6oD7kQz+6sQv37cxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715005236; c=relaxed/simple;
	bh=dJmiX5IOG45Nt0pMX33Pt7UahshTblKfGl6ZKThvgLw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DedrK879Wab0+hit4vb/A/BJ0Mo2NQAl9HtDym5R1AHFJwC7G+b7mYJ4ik6yKAloyHD0yRIueow7Z4UJxQsrr06VIBNtZS23ldnrqXPU0hZl6BTVIE8ug0bC1BjHtTWNpHvF2EhhZbBGsrJaU3Tkp/cnZfeUBISNnMQsTSwlPOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMX+8fqT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMX+8fqT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4D1DC4AF67
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 May 2024 14:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715005235;
	bh=dJmiX5IOG45Nt0pMX33Pt7UahshTblKfGl6ZKThvgLw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VMX+8fqTLm5oBCA4PmpKkY5no4AEQIRNxE5qhVxss/GP1MD1k/UCkJRq9YFnzDXqt
	 GMnAiMUDsjPl9wZkmPIHaEeCpGx/99VlM6zfwlk/S1LF7J5GwuyKKSNzZIT57SEuqF
	 1mqA1RBa/fapNLBl6aFOEA6hoK/+JDkrrjAihptrGq7CWJI3kmBOwhrush4SJ/eE0y
	 JISukdoenOHkEBS6AjVomWQ4TrpsVBL42xSrjSpN7n2nktMDBizQDtxmRzb0DAPQvI
	 VIA5YFsy+bIf2eHxqFNA4pvmb4ElF6lGyq15ILrJwaIrakkYWKltbqtKw+fhmdVdHa
	 sZwyoToDrut5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9C20CC0422D; Mon,  6 May 2024 14:20:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 06 May 2024 14:20:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: vanoverloopdaan@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218305-215701-K4b7s6AW2f@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

Daan Vanoverloop (vanoverloopdaan@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |vanoverloopdaan@gmail.com

--- Comment #54 from Daan Vanoverloop (vanoverloopdaan@gmail.com) ---
I can reproduce the issue on my HP Elitebook 845 G10 with an AMD Ryzen 7 Pro
7840U running Linux 6.8.6 with the following steps:

1. Ensure that the power adapter is not plugged in
2. Suspend the machine
3. Wait for 10 seconds
4. Plug in the power adapter
5. Wait for 10 seconds
6. Wake the machine
7. The CPU frequency is now stuck at 544 MHz

When I unplug the power adapter now, the frequency will immediately start
scaling up again. Replugging the power adapter again while the device is aw=
ake
is also okay.

I was unable to reproduce the issue by starting with a power adapter plugge=
d in
and unplugging it before waking up. This did not seem to cause any issues.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
