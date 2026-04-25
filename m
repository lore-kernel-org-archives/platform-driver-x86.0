Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F112147E6
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 16:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777134737; cv=none; b=DXy0YClCYrjHdDGwtbwx2NUZ42+FWVh0EQZUtBjYT5hVkNCQGDOpdUxd8r/LH3T2HaF6MaIHQyhyAIvK5eR4cqxyJLVC3qk8sV8P0t6+AQXe0JeUBqvcEggLwztcjGxTeRrQYzybVZ4BpIWUQEEDEilGUCnz17AmpTnuJQke9eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777134737; c=relaxed/simple;
	bh=rAWioi+2UfoJO85dNZkPOuLXemZDkFnW5WOfe1YOLOw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VWgPoVMdKVdBY8Lu6m9wz7muogyMyyrNUMPWBfJ+n4BcDNZ/8QSWCkkmYHaAy7pWDWeyrZvmpJ8fGZ31qB1GolO8t9J8Yn63MAsn6Wf+Ewhd7Wyq5Qrl8AF4S6oM8tGzvUZD19hQbNrb4v3/+z7Pv5dAEIviMNWhXl3a8Ru4cfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ylf1oywg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ylf1oywg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB6BCC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 16:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777134736;
	bh=rAWioi+2UfoJO85dNZkPOuLXemZDkFnW5WOfe1YOLOw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ylf1oywgyf9ZSSdNOVjscoBjsLR/vgNiuy491oKoCQbVRRu1hSNmE3wjFN5qAvyup
	 j9O4XaFkHdMfCqkTRx/uSbiKdPqoaLaYEWEnEdU8gYmY3T6Gi4vuiLqTv56Tsdb/PU
	 CtovbodIFwvK/sbcyXQX258ETuOZ/LivRe60bmHz0mKg84cefyGo1x6uSiaktpEcaI
	 lPpZ8Yl3faXRt6sXbGRfnFQ5NNBF++K5Ei4lgJqSDXd/aK6NopCYP5gJTOTqjgchZr
	 oki90udOy5MxJePJMz9wErnm8nr8WIU2kBYmGxpfbhaLP/QTabXC3GbuwQObV3Dbg9
	 zIxpGJjYG9X0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C12F6C433E1; Sat, 25 Apr 2026 16:32:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Sat, 25 Apr 2026 16:32:16 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221383-215701-rnHc8GB4n4@https.bugzilla.kernel.org/>
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

--- Comment #39 from Daniel Gibson (metalcaedes@gmail.com) ---
Created attachment 309955
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309955&action=3Dedit
dmesg with the draining EC patch

I tried the LLM's patch, it doesn't work - the keyboard doesn't work after
suspend, see also the attached dmesg, which is incomplete because apparently
this is also executed during boot and already spams so many messages into d=
mesg
that its running over.

One thing that's interesting is that the "X stale EC events cleared" messag=
e is
never shown. I added some more prints and apparently after resume in
acpi_ec_clear() acpi_ec_submit_query(ec) is called exactly once - and never
returns.

  [   45.771402] ACPI: EC: acpi_ec_clear()
  [   45.771402] ACPI: EC: acpi_ec_clear(): submitting query 0
  [   45.771404] ACPI: EC: 2: Increase command
  [   45.771406] ACPI: EC: Command(QR_EC) started

"submitting query 0" is printed at the beginning of the "for (i =3D 0; i <
ACPI_EC_CLEAR_MAX; i++) {" loop

There is no "acpi_ec_clear(): submitting query 1" message for the next loop
iteration, and there is no "X stale EC events cleared" message that would
indicate that this first call has returned.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
