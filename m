Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B521DDC3F
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 00:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777078619; cv=none; b=E51j8fS0sGNXMYeeYWCtoiRClwgqi+ltSURHJzm3OIjMZ15E0Spblal5W4pngOPsX+cPA6Y5rbblMN7A1DNUmqIZTQDHJgO/YCWlSNdn+2Adi0dqx7nGqwYNhRJe+mZ7ME9xfqIZCRFUUMyDrbiASUWpGd9JGnbQlwHRIkzzNA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777078619; c=relaxed/simple;
	bh=4f+cmqzNb2mvzh/brb0fbWVWO6whbNgPQF/V+rA70/s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kggH5MTG4kRjs265kCDjmqp/JYFLbB1sNlppXySnfd/lLHNy//k/1fLvatREbaLsTG6qM0wyTr8ic0KkUQhHbAnPbh75st1bntRue42J7+CRMdEwhyjA4tu4SZ0fnXyXQNhPeyZWi750yLYHfYVlCWX6BFshDoMJffKcq196Ks0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wi16mXBJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wi16mXBJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6F63C2BCB2
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 00:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777078618;
	bh=4f+cmqzNb2mvzh/brb0fbWVWO6whbNgPQF/V+rA70/s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Wi16mXBJ1F84fBhicm0PyU/NwzbKeDS956PZL5S8wbJ9JjsGf9yZ4LC3M487x4Rm3
	 iA1IKjVHfq+IHHyM84N9GXO+n55NtVP428c44YWUZpbLQ9wtW8gYjfRFDkenOMtOTE
	 HE9uJyJjHA5ZqBNPKy6qwjSO/bclS4A55XQYgMjvlYEJjISeweiMeGd7AL+kgOxszN
	 DUqr8r2AFhhoffswuytwpHUXAOe4lrPklFf+jAcSyFdCef+glxQBgrN89k/6ovwJkl
	 Zc4u+fSD4x4j7/FmcJv5b8xy4WT59GZuNggQJEKXYc13s9QIaHOQHZbBi4YCh46hmQ
	 x6FzhsCDQzO4g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A2D21C3279F; Sat, 25 Apr 2026 00:56:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Sat, 25 Apr 2026 00:56:58 +0000
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
Message-ID: <bug-221383-215701-GhMAKHW9ZQ@https.bugzilla.kernel.org/>
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

--- Comment #35 from Daniel Gibson (metalcaedes@gmail.com) ---
Created attachment 309945
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309945&action=3Dedit
dmesg output with EC logging, fixed case

Here's the dmesg output for the broken case and the one where
amd_pmc_s2idle_check() sleeps for 2.5s, including some comments in them abo=
ut
what's different

(I removed most lines that were logged while booting to keep the size
manageable, and they should be the same in both cases anyway)

Note that they contain some nonstandard messages from amd_pmc functions whe=
re I
just log when they start and return.

While suspending there aren't any visible differences, apart from
amd_pmc_s2idle_check() taking longer, of course.

When resuming there are lots of EC events in the fixed case that just don't
happen at all in the broken case.
Particularly, right before the PM: resume of devices complete after ..."
message, the fixed case has

 [   53.362362] ACPI: EC: IRQ (1)
 [   53.362372] ACPI: EC: EC_SC(R) =3D 0x20 SCI_EVT=3D1 BURST=3D0 CMD=3D0 I=
BF=3D0 OBF=3D0
 [   53.362382] ACPI: EC: Polling enabled
 [   53.362385] ACPI: EC: Command(QR_EC) submitted/blocked

and so on, which is missing entirely in the broken case.
See the attached dmesg_sleep_2.5s_before_suspend.txt for details


I found it useful to compare these logs with the "meld" tool, where I have
added a custom text filter with regex pattern "^\[[^]]+\] " so the timestam=
ps
are ignored when comparing lines.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
