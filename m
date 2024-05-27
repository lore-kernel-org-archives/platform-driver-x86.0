Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA7217E8FB
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 17:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716830450; cv=none; b=j3UfR6YEeONYpE3oWxxrFAK31BnGWtaQfHsKtEdqt7ryfBTUgu3Jf0UThvrNuRdMZuR4r6buuCqu2O2ha52ejb+573AeNkVj4Wibe1Af3qMLqyfmWvwC1OyZ8viO9UeV0/AKp6R8cE5EdmG26auDNvFg1rIoS6PWZJTfpErZ2BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716830450; c=relaxed/simple;
	bh=lUaBGR/VySa5l6d/4KLgrY1J4eSGszP0adLLzwp+260=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O3zWnZlX4j9uqGNFApJ+kwF2DZ70D2x0c95dqs3GoNwzx5wg12W9VTWjsF/S75XwUdwdWXaiKeGSZU73Z44JFeHMx2tO4IuxUoCPrkJaUTapQ0N8Od8Cb9li7OzI6CUwUMX5+suN+9BCrxtHwsAVWg2VYg/iZCMjJBqqEXH2vOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QpszR3OJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpszR3OJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25F72C32781
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 17:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716830450;
	bh=lUaBGR/VySa5l6d/4KLgrY1J4eSGszP0adLLzwp+260=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QpszR3OJXZlffb03q0qx+93lG8vLWvJaOlVwuqb7Rc+Wqk7pijPhzZ5Vdu0PnCyOn
	 51SeVSKWIz3RulHIOE3ob4ihF9EmYx7BzRFvVaaJxZwwYX3R8IUSENk00/TCCH0Fh9
	 A826iuDKL5edkd5paZO743raEAYFM9RBkur3ODCNSzeUQckj3PnVxetR9aG2E1I0U4
	 j2m3PeHUGU5xkHDDqiqxsEUF6U86fAOHbO/GLPA/geEn3T1hg/vbk3kimdPAO6k+eq
	 PcpAM0VHpAQA6+xa6N75hSG4csD68nfxWOZZ9u/8HozAFFf46R5j8tyj8txJrbwP8I
	 wszkqItln94BQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 10703C53B7F; Mon, 27 May 2024 17:20:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] DYTC frequency scaling deterioration and event spam
Date: Mon, 27 May 2024 17:20:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lmulling@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218696-215701-s8BXVNAABU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218696-215701@https.bugzilla.kernel.org/>
References: <bug-218696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218696

--- Comment #11 from Lucas M=C3=BClling (lmulling@proton.me) ---
Hi,

No worries, I might have (un)lucky hardware.

The EC version is 0.1.25, BIOS is 0.1.30.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
