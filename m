Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D52482FA
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 17:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717347860; cv=none; b=bZHbN/TOyHfNqb9OMfnl/oBfNs76S6xJGgsJVB2Nv3+/m2xyRqbiyZtl8ynAE7YzM1qrDGJFik6rb0kgF7nZfJnJtgquu8kxVlqiqc+2bWj21C/b/nBodBpmtHw2uHPIJysa/MlsqFaPFLp3qJ94/B1YbJ9KmxjXv4rOByFft2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717347860; c=relaxed/simple;
	bh=wxF1pLhWL2ra69I7EkQ5Xpt8LLPLZjRFcG51pyxA6Wg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YzjqRIGfebZh3FDyiv03KEUbfyA6Xyn8fIhxUufSK38SbNV8dbYnvZOyV2caCIJL094BGaEmiof5zfiUxhMmraYjH4I4D8xu9pghbavgRsFOgD+yGp8SE/Yqj6fCn/ZBbjvwicdIci8Sc/IJ8NaDFMRTMC/1e0DiDxl2i6spAqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0o6lCLO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0o6lCLO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DB4AC2BBFC
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 17:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717347859;
	bh=wxF1pLhWL2ra69I7EkQ5Xpt8LLPLZjRFcG51pyxA6Wg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=M0o6lCLO7XaL+jGCjPEMNJwyCEwj3VQec8G370W3eA6DVfn/siZSBSIC+Km/Vay6l
	 CzIhbOjKy3BKWUbqpAaBipw7P/E+OzQLCX9f8hHehNT1CvXCN1UJAG1+2bucovnbLk
	 DKIC+wYi6ED+mdvCyBn34i1IxU8VDWAecbVFbn5MMAIPjQlIe67/0jDTKx3DKHc6f2
	 3Nd28vmbaXsTEw+YMJYUWXnHd0Jckwa7j4i6H/in7XCG8R8QI8SQCe4AXZA7yHC3he
	 RCSJqrUmYrCIFDfzL6o8TWoQjLT5mc5FmnmCSrg6g7l5AcJMBOwK2VbFe9hJvC78jS
	 qYa7jn6HCnyHA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 78E5EC53B73; Sun,  2 Jun 2024 17:04:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 02 Jun 2024 17:04:18 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-h2RQmaamg7@https.bugzilla.kernel.org/>
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

--- Comment #26 from Armin Wolf (W_Armin@gmx.de) ---
I just added the maintainer of the lg-laptop driver to the CC list. Maybe he
can help with reverse-engineering.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
