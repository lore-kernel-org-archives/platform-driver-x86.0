Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F414673445
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2024 16:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716913040; cv=none; b=eJCKg2YykUDRFJWtBX/iVKX+QOPyf7oJ0ZeOlmyLkgRRgIhe+aRM/d0KrhfY4BFE9Rpf77GcsHErRZHAqQXH5gOg4+pGfmRcXbybdFjtJnGIRTbgAfW6lbfTgblf48oiSZLK14A+wP91kBSFYWx4VS9c1CWzdRCjH0H7mTkUTCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716913040; c=relaxed/simple;
	bh=Y5+BjY+TmQBqjR72KfOrM20oUoBSNUDIP8m4mxA3ZVY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k6B2Dy+g0EMCdoD9IfS4Lunkfun15aMiCepDAc+2IhIn0O81A3eXWQDsv1n4nG8xIJgP/L/3EoeNsTQinExCet445IR1KpdH8aDjkvLbr5+x8ymdrwThs4DiUZ+HA7zOuabIMqOj3CSILtD3Co4C1vWjOnR9JTpFgs2WpBnWnQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=to7J1iTB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="to7J1iTB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCA39C32782
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2024 16:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716913039;
	bh=Y5+BjY+TmQBqjR72KfOrM20oUoBSNUDIP8m4mxA3ZVY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=to7J1iTBcSJWSgnvl7IW4+YA6zNJgIGkqKYhjIw3o4mFuKWvA3D0bcsGaxRFJIZQ4
	 auedw1QoJ0HYslciEhKC8RblCZgoU0LZI9EWQqHaegoVAFUBjkC3Jjszvxl2q5vWGu
	 a4erxTMF2FMw1/p/q3r9RQRBK8rN0jRTv8kBX3TjWomyO6FaIOdQsvokPNLs1CTuOh
	 Ann+4nMPZO+DQM9qIg4WTloiyk3gvecC6uFTTbLB3nkUVzcAOPVq08pzBkCC8F/g6B
	 tDXyGjMpzlglDQI4rD4sqhEoYAIKpIaVJeq/BtCTnvCSt+DXYUj3vdSJOnR3ClyREE
	 lV/bv5EIucl9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BA72AC53B50; Tue, 28 May 2024 16:17:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 28 May 2024 16:17:19 +0000
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
Message-ID: <bug-218901-215701-zSzLPd6e0q@https.bugzilla.kernel.org/>
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

--- Comment #5 from Agathe Boutmy (agathe@boutmy.com) ---
(In reply to Armin Wolf from comment #4)
> It seems that the LGEX0820 device used by this driver is not mapped at
> \XINI, but rather at \_SB.XINI. This should normally cause no problems, b=
ut
> it seems that the driver is not using the ACPI driver model.
>=20
> Can you compile and load kernel modules on this device?

Yes, it's basically a new installation, if something breaks I can reinstall=
 it
completely with no issue so I can test whatever is needed on it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
