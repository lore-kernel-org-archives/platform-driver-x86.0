Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D686E446AE
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 14:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717339046; cv=none; b=fjvxN6hS2FSe0gmdIDeu/LzNgR3AYqV6imm99wVGLgqCF8NQod7C4HS5WiAlXBIAYBjuKa5pf+U4aK5dRidJTboRvlrOXepGNIBkdluzeLcljQwAB9nUEJzl5fLVh3i5KyT+DNkrLBxQ5RuEZ5dzip1j5A90ETXSg307od00mXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717339046; c=relaxed/simple;
	bh=ALsaWVEG6BvxCY0TM2bc/qFZ1gYoOpQ7sIIP1abi81U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dvOLYnfFpTvmVKMeCVwp1moinEzFqcMlx7EDd3rsD1kEABsJ3VvV8nr15N2fTGy2zESvQLTKaBbC3zmF5IGTMKcLJt52cJqZcX/2kLSXHc9xLpjAKbFJsDdR0f95vY+YI+wDw9BE4IYmLSEn9Mtg95e0zl05Touzaj4ammlg95A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qe3fjheV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qe3fjheV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76905C4AF07
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 14:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717339046;
	bh=ALsaWVEG6BvxCY0TM2bc/qFZ1gYoOpQ7sIIP1abi81U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qe3fjheVwozX5XPhmxnoCE9yw+Oy0NJ71lB9ooynJxONRWzGaOIP0iEoBEYUXekz5
	 N45jEf5C4ReRIKXqyXJuPunXzJJA7/284pE/tZ6Naue/uRqGqw2Jf3mXWndcxSxZ/x
	 c0/CW3DeG3nC4U8mx8z17u/yvL2wLj+tD4Pg+K09E/8/YHmhcy6tAnZ1obVQS/ERGW
	 gVvLfdIFscj7AIp2as3vhMIzPt9lHsrJyIumRlW1hGXBHA+qcUHyZgczw4pTAj3bq5
	 Dqqfba4MVSLhCE9/4Fgoa/sSHP0haZuPCYgq/o75puOS26Eq/5E2Mwaw1D4jPHtA3o
	 g5AWCrdWuo/oA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5FC9DC433E5; Sun,  2 Jun 2024 14:37:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 02 Jun 2024 14:37:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218901-215701-9sDsIRg1p5@https.bugzilla.kernel.org/>
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

--- Comment #14 from Armin Wolf (W_Armin@gmx.de) ---
Created attachment 306402
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306402&action=3Dedit
Prototype kernel module v2

I made a mistake when calling the ACPI methods, can you try again?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
