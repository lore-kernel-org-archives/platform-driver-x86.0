Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF4512D1F1
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 16:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786897229; cv=none; b=iy6Un07lZGmUzhsqORtd5IXKGRqiiENB9uKm4fN9Bko1OQJOY3SMaDXypm8y8DeuZo5L2LwNA3eJCWRZBQhCE5XsIJf1gt33R1aGzzaX0U1de6KRquZ022WhY5UzXBGxOrkVvzKBEdJyfqmHss5R1H+fOhG/F6Y3LOk3Abp/IVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786897229; c=relaxed/simple;
	bh=48CxFUxF4IlETm8bh5EsXnvC2bGbBeJ+S6L9Dd/0yNY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H1JZgCpJRW0ld65VdgvwHe6A9Bg/uuYbPCen/wmgUk3pd6ArHi7uyoNlYtIV5FyZLPqEeOwXJ1Y7OsbCl4G5cHKXncvia2T8QP3xTBl7ZcDsxSlLANcRBxxDh+Nd1bMuwHPCLMoMP7f8PXMyC/yecAxMmXM3UNhWEnxrXvrJ+30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZh5N5bQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZh5N5bQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D753AC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 16:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786897228;
	bh=48CxFUxF4IlETm8bh5EsXnvC2bGbBeJ+S6L9Dd/0yNY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KZh5N5bQz4It9FjTMcundyQJ+k1lthoS5/4+3FjJeYMsIz0dcOAKLFkkYiMQRr/uw
	 O26gciNjFREGECbAq3EVdR+LsM4vZ9uX3/rvU4dnCCHpCPu/Bd5MhLZS1WWjt146tj
	 TD/r60YaIKD3MNArdPbOLZoKLIarWUzx7i917r+a+NBmViRaW9hUbQwdfz4ToVpBfB
	 0+bHGbBU2jL7BXne0T6IOeTcYKRf3vntEwuRMSNn4ClZal9HuFe4wsULr0BUJfzDdU
	 p8ae5nDtlSADKtLXdBhAFs7BVXEh9quZ80CHg3xSHetfuhwrHlqcAHBs/In1G7rTLA
	 eNroBVLC1S2Eg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C40FFC433E1; Sun, 16 Aug 2026 16:20:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221893] amd_pmc - Last suspend didn't reach deepest state on HP
 ProBook 445 14 G11 (AMD Ryzen 7 7735U)
Date: Sun, 16 Aug 2026 16:20:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221893-215701-Adj27mou9h@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221893-215701@https.bugzilla.kernel.org/>
References: <bug-221893-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221893

--- Comment #3 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> Because the SoC never enters PC10/S0i3

What?  AMD doesn't have a concept of PC10.

> the GPU power domain is not fully powered down.

Other way around.  If either the display or graphics IP are in the wrong st=
ate,
you can't enter s0i3.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
