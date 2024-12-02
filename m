Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA9A13AA35
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Dec 2024 13:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733147031; cv=none; b=HPM1mRwu68qc9rIwRHGvNHCRtJ3l7PYQ3O8uLY1uggacPsQugu0NSTVoCAP9muJgiBX177TyDfRk86dpnnk/doahEw5cEc3+hBJms8CeaUhPV8Fx2HxdyU5NMSy6TlJYMsQeJn0UEC60rkre0CUg0Bfr5oLtDXAwyCRZhKHHdro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733147031; c=relaxed/simple;
	bh=ulfExLYYb7KKhKNHngcic+ppAns5jXJCwI8fiOzMYT0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=clLTyldLXn0YSWE15xtt1jsDF4ntKpn00A/LfWmP6Jy4b/XyhSyYIDFLg32A3LWSyZOpdrXRDIJu2f6Tg44v5bpiN9fpwsNZiHc/st1j1jAbrFXd/89FO5PDTm1pIJrFUyhpb2pNgnfYuD0ayxGyuLdrWMOAnX10Pdr5KuzuLfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=umQzoy5C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="umQzoy5C"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBA56C4CED1
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Dec 2024 13:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733147031;
	bh=ulfExLYYb7KKhKNHngcic+ppAns5jXJCwI8fiOzMYT0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=umQzoy5COfc7LIKYSceKPcLI+n5GZALtN2LBwkKfMr92mIqbyXN5uWrDI++6wZMZN
	 2tltIDp1Fio3JPqzjtlBRybb6ILLi8fVw6IgXccuQUhdsyIWp7IRqSuhp1eNKLFq5o
	 t6XpVkx7A8yIkX6Opo43EgOaXYdvLCefRQWvewxvaJzLhKmm9cWCp4UO49e4XdsfRl
	 SBC39KoVHBHrdDkly+9IeQT6+QmfDUL58whQGFhPUninK12eKaLdU0CjsB1X8G8epq
	 kCRoij4Nu+RPc+AabQZKy0wLVfUlPDUm9ekvfZxLckDd3gwJOFRaDlzwajFByo5HgW
	 exoo2UCAC27EQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D780DC53BC5; Mon,  2 Dec 2024 13:43:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219515] intel_th_pci Driver Probe Failed with Error Code -107
Date: Mon, 02 Dec 2024 13:43:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: ash@inbox.spbu.ru
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to
Message-ID: <bug-219515-215701-3w0BAjIeRw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219515-215701@https.bugzilla.kernel.org/>
References: <bug-219515-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219515

Takashi Iwai (tiwai@suse.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|drivers_platform_x86@kernel |ash@inbox.spbu.ru
                   |-bugs.osdl.org              |

--- Comment #6 from Takashi Iwai (tiwai@suse.de) ---
Alexander, could you check it?  It's about intel-th stuff.
It might be a BIOS problem or somewhere in PCI core, but it needs to be
verified.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
