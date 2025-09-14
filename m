Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C1E1F583D
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Sep 2025 02:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757815460; cv=none; b=fdcDiDCanuMzp/z1z6lXQFXfyj7xGnLgs33iHMhzg06+QODkYud9FVYYBT13PkdJJ0dAPB+pol901u0q5VUPIVNXNmOUEJavXO1sXvBKoWuDtpp944OtA0XeYV4SQtyExwyoHSDGLBPmIPE6uZ9Quzl6ehiDCVO0D/rL3tdWjjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757815460; c=relaxed/simple;
	bh=ta2qU6rbxPEM8AqSQnhpUFhI47rqmfIRD+3RgctlPmk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uQgspiXm7kaj/0PIJtBeiEicUgIiT5SAYYX9H47XtHsNYtSeCCJJVrSHtOrI1yXO5xO58vb2Wk1BrB/0WNsHFIY9Ia1z39Y6hkM+y5qdzonwvo1vdJbKMfaTB9LwdlMb8z1u85troj214WM7H4FsbA9emoFbQGV6ouHsLhl5We0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ohn+vLcW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ohn+vLcW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CCF7C4CEFA
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Sep 2025 02:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757815460;
	bh=ta2qU6rbxPEM8AqSQnhpUFhI47rqmfIRD+3RgctlPmk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ohn+vLcWKNsaHwFaqtVwd8Gr4QauuvEXJt17+UCZ+0tUvONDeOio2pM+OiccTLph8
	 KBjCLqZFsZCPH/snzJ1y0TZNUVyWnEmP7yXVqF9oLWtX1l7QhTPoQVpK+5p2NUZojj
	 FYdf97JR4WJTwfq5coHx/IY/E5YLoLJNfOK3rdwtxFqDmgaHyJWj8rsF4HpBoHie2v
	 oiS1pTL/qfMpoBOENzCZtu61oAfuRGbNi0LL6226EdhQ7bZVNQf+Ac/W+V3J8g5VMZ
	 e0GnJ/G5iaRhUwMw6aP+he96jedXuAI7kGrOu9RGYysncI5ZTLQx1ltWwrCZOJ90dZ
	 ENaB2Aic9mZqA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 45A4FC41614; Sun, 14 Sep 2025 02:04:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sun, 14 Sep 2025 02:04:19 +0000
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
X-Bugzilla-Changed-Fields: attachments.description
Message-ID: <bug-218305-215701-LPMy3zW7JB@https.bugzilla.kernel.org/>
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

M=C3=A1rcio (marciosr10@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #308672|s2idle_report HP Zbook      |s2idle_report HP Zbook
        description|Firefly 14 inch G10 A       |Firefly 14 inch G10
                   |Mobile Workstation PC       |
                   |(version: SBKPF,SBKPFV2)    |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
