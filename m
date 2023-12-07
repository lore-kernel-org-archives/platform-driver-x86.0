Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857AA46A7
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Dec 2023 03:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMqmgxx6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00FB7C433C8
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Dec 2023 03:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701920194;
	bh=05p4AG+sRj6W8Wtkwk5CEvy3E9PNHr/xN4PzJa5VUBk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XMqmgxx6ZNxMQCXoFmyAnt3q6jpH5y/wR+6cXHGSZgHW1lrMW/YYFaF/bUk+VC+PK
	 pJCmdLuVllij/r1ZaFoq+wrdeHqGzHVQU7nAooMoAZYnre6sRnyoTZ+qUY4fYaU8cE
	 R5nLzkFRwVtB2x0ijdLJJg1PDsbkIoEUvEh2MKkYIecIw57wYguPaNNoiVYCZSTxNR
	 HAbBkfVE09cScTaNpgXsaUMZr96M0eJ03z+c091zurBU10LSkq5zG84ewmWUhQknTY
	 I8N+DW7R4HED1p6Um4KyehTuC5drhVRivZrv1/MeOIKJIqW2XJv9ko55eJEo3OLbHJ
	 b4QjG/3mHH2sg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D3981C4332E; Thu,  7 Dec 2023 03:36:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218143] platform/x86/intel/pmc: regression found in commit
 804951203aa541ad6720c9726c173d18aeb3ab6b
Date: Thu, 07 Dec 2023 03:36:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: david.e.box@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218143-215701-pD22sffewU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218143-215701@https.bugzilla.kernel.org/>
References: <bug-218143-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218143

--- Comment #5 from David Box (david.e.box@linux.intel.com) ---
(In reply to The Linux kernel's regression tracker (Thorsten Leemhuis) from
comment #4)
> (In reply to James from comment #3)
> > Dear David,
> >=20
> > Just to update that I've been running your "Remove GBE LTR ignore" patc=
h on
> > my Intel NUC 8i3BEH for a whole week and all has been stable.
>=20
> This looks stalled. Or did a fix for this make progress somewhere and I j=
ust
> missed that?

Fix will be posted shortly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
