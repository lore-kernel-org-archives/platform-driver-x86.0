Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49417352C34
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 18:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777143568; cv=none; b=JiWJc6XRfEDwrOer8Gqb2FvFuvpzQWat0cSv4jmORMZvgmqQZfY1/J3AbDbFpu7Nnn/4ndIJIjVTa/EFqDLMtMCnvULFkkcDp5JNTTp8LTixkCkqi+wAZ8h/5yXEPSsZkuExcLdP2VblZQrwMQYC9LjkwTqI8MHbrohmPNMxdvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777143568; c=relaxed/simple;
	bh=4DGPWB4e+s4cSKXrKdOVeCKeMfDwG2vpFob3r8nr6JE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a9UFhOyUbwKa54T6s3H+5D5OLBOmcOotYucbXFurt7u1pQk4KfNktDnbxv5ph2YsUWoYpMk8JQwwRnOT3kNEEMZ03IFHsEYmRgkcUdqSofcKI8MWLURTkn6Yyok7iMqvoK34sODSBynXgNDTPAyFYeOwgmw1rGvyxM4N8D74JdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZGfRUk8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZGfRUk8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7664C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 18:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777143567;
	bh=4DGPWB4e+s4cSKXrKdOVeCKeMfDwG2vpFob3r8nr6JE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rZGfRUk8I5DAadymb7GFEQLaRG28v9VYBz+ZRY3ix9sINOZUbgzr/Ik9JbYKE/+SZ
	 5vBujqNAEFcuOQgZXWtsGbqBEkdmxeFYiuyS2/16WB22TT7tRWcE24MEc4p0PztvQ8
	 kQFzx5m8dm4es3sOXpI4hrQUUFyvvpu+sBkc1AG2MU6WA19LHHB5CKaXhdQx73ZzG2
	 9EwwmP13CsHH4hU8S1ozDfru5kGQNh4sybHRCvOxk6drZWbgnV7B0ED90T5hYXRFww
	 vAUE6d6xxSuLpcTxCk4wkUztbvrUUSTWBM9Z6Bl0FbK3XJSKMDzHywyrvhxMOHvoP2
	 ZY90efU3Pbkog==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C83CAC4160E; Sat, 25 Apr 2026 18:59:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Sat, 25 Apr 2026 18:59:27 +0000
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
Message-ID: <bug-221383-215701-0bIAaUmKsl@https.bugzilla.kernel.org/>
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

--- Comment #41 from Daniel Gibson (metalcaedes@gmail.com) ---
Yeah, I'll do that. Would be good to have feedback from people with slightly
different versions of the IdeaPad Slim 3 that have similar issues, to see if
the fix works for them as well, and maybe even try to find a way to match a=
ll
of those.

(In the end, if there's an AMD-based IdeaPad Slim 3 that doesn't need the
quirk, delaying suspend for 2.5s doesn't hurt anyone)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
