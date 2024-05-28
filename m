Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADE47316E
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2024 07:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716881128; cv=none; b=TweEIPzAMMacGQf7ORIeqHCe/b4wk0FCqx0y0fMSHE6udXMKyrEOB1rYFnfZ5O+qe6ZOKe3ppaGhR8JsLGgVwpzUQg/75wcCdA0K3JxchvkAfCQpLD0d+6pU4kBZb/038CdU0vE4LdQ0+eNeTI3zG2ASnoDo0O9alg0qq7XcSmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716881128; c=relaxed/simple;
	bh=g/Fr7NqCJe88tjqfkccqtJtn9Ejcf3b+pvpqS65sn/Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zr9fTOeuY0wmrWRdNZUPpcBfuq8xeTZTH+AHSuWib+qsi+eq0heObGw31HGEMfsKaDGuPrcAX9dxjyKDynlkygdofc4bn0MuihKTbBaGjlF6MTtNz+ms3FQxOLGGCK/vGJo7BBryckzEMgQwAMf+4M6zmljizFUfy1zvCffi1fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIXyQBF8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIXyQBF8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90DDEC32781
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2024 07:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716881128;
	bh=g/Fr7NqCJe88tjqfkccqtJtn9Ejcf3b+pvpqS65sn/Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gIXyQBF86fF1XLkDLqMVjsmpCnhs80oEFjAwqTcN7zkZAxPx3+I1+9dCCw8/BGxEz
	 anVFjlgLO2PHyj6uLW4iI0Z+7+Le4EQvbXfVzubAiRXBvGCBl6NotyIi5LDWgg6S+s
	 iMpXaSDzVtraxBzCZk3qc2Q+chvOtL3/pDFLIM30NKFCR1FUQ8CkDvc8n/q0f75OwW
	 fZlaQS9dxyU2iXTVTNPUrGyc8s88tLlGm/ixnq9hdCdNE7eMPyqExzCk1xK1vPjZAq
	 xJ5HUD3hLIDL/HiBBHrsBvIljWTAkdWgLfHG94R8M9t8GwRlPwUwhOkXodfZpPa5vu
	 RkIl+1py8Xt0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7E26FC53B50; Tue, 28 May 2024 07:25:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 28 May 2024 07:25:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: agathe@boutmy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-zASHcpp1bZ@https.bugzilla.kernel.org/>
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

--- Comment #3 from Agathe Boutmy (agathe@boutmy.com) ---
Comment on attachment 306358
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306358
acpidump

here is the acpidump, i wanted to join it to the initial report but couldn't
figure out how to install it at first on Manjaro, I just realized it was pa=
rt
of acpica

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
