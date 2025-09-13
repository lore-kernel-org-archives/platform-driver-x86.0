Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC25125A9
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Sep 2025 18:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757789303; cv=none; b=sCvdoQPhwn6Jv04hkVStXMqVooThn1RQAoN4N+dr7dBaKR59+jOn4wwIrW9N+jNvHs72eXsWN8SjczEzpjibg5FcG6uCPuhjHE5bhe/L92YWXFGxWVS2zarhNx9k5rwqifxGlWk6iH8iyVr2iICP24eR4PAquuM9v1dvgl7G+Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757789303; c=relaxed/simple;
	bh=0+UeIBcl4+zEHxvoDMK6l1CxCRIO755dTNyWJdkwMgo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nwewjErFNI2/sN1TQxyGqIwTzITMeX71H/tOE/EBUQSPuwQ99xWuAvoP1xBQx7Y4zhXZwG1n+thbQnCbHtNt//cxeQjZ8AzwbrSzMA5PwmPrIscCI1SU3bNsWhNaBHjiB4rpwcd5GEqt6oU8un6jApEYdlwc8sQnThTYGbRUO+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tC6h2dEw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tC6h2dEw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E83C6C4CEFC
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Sep 2025 18:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757789302;
	bh=0+UeIBcl4+zEHxvoDMK6l1CxCRIO755dTNyWJdkwMgo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tC6h2dEwe/eDz5aNSj+MO5JpYsAke6COZvK1L8kqpwF0NL1yG4vPiX5OTNRF58CrF
	 Rv3w89jC76YN4e0BKTL5bCn8VQ61IUhse3Vhh8PGxPpcxszoJMeIRbwOl+9taREDu+
	 iWpZL08gDVGixKyqfU2gWZy51T3q4NRCtfzHK+YtuuP4ft14+DCSsHdtFfjsw8K3ec
	 s9jHy2zBMv8UjqoykNuuvlf/R8lwGRLtdOrmi/LNMDjf0X0+K3K6+aK+mHXu27msie
	 G4Ce06op5WrDj3YeLJ/j9jd8t7VFuC6JSW3fjzrFDuqSj5iMNnCUAuHXTXiPwv8xlD
	 imKw/v0kEUwAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E14D4C41612; Sat, 13 Sep 2025 18:48:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sat, 13 Sep 2025 18:48:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: marciosr10@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-CAdruFGxMP@https.bugzilla.kernel.org/>
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

--- Comment #116 from M=C3=A1rcio (marciosr10@gmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #114)
> I suppose we could make a quirk for always forcing time before suspend
> entry.  I don't really want to do it generically because this isn't needed
> for most people.
>=20
> Can you give me your s2idle report that reproduced this?  I'll make you a
> quirk to for you and Petar to try and break.

https://paste.centos.org/view/c963f968

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
