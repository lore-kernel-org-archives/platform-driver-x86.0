Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D3441B36D
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jun 2026 08:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781599021; cv=none; b=R2PPmnctpQ9HxSuL/zX1WjLHn4XL5pS8ZtWbzg+JYUdWwbWZctjg1iOwfcCxNYoQ/AVyIbOQ5HaF+1gUG+jMljcDf7xErdtJsgZqcgsRufH+QFX2VJhhN2pS57KgR85fa2wVChwgH5WjGxwMzsbW6GdUW7PID4ewQYFbFVGCSHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781599021; c=relaxed/simple;
	bh=9YaBEUyq/jIorxjpjLujM/N87PakSkTVv4vhaZrKnTw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MJlFaJJUnDoBtuSg3k/7gQXOh4rClcyalHoRqvDuizBXPwZ5lkC3qsDLN2eQ5eu6/CVC79nO1JNaZoQM5VbvaS/Xmh0dm0O3gt8hYISca9IYluJEnQhdYXiP7UNCFEe4DmtPicx2XQrM+Q1iVAY7jhS8E/8bvWWPy2mNPTLGvSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/5V7arG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/5V7arG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2EBEC2BCB8
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jun 2026 08:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781599020;
	bh=9YaBEUyq/jIorxjpjLujM/N87PakSkTVv4vhaZrKnTw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Y/5V7arGS7CL4gnWNV20O122jNTpjWgCyfvT42ecnvWjILr1wssHwvejOf4eQ/9/I
	 ar17oEqozE7n0bjxdL65KU7hlBRragsA/RUfLOdlIzDqTQniJIKdtWS5ffsGDJfnjT
	 DvTRL8SFh6JIKUtyzKK1XJj20dBTSdD78Uq4u6+QO+/UMgPrSN5gHYmGnAgHecVInf
	 bRp1tCkRn4HzKqQlKtKuUOi6xUXSrJC7+x99CLe1SGqxLWhPZp5tKkoz5e/gWjv1T3
	 W/xNNlT0IpBVWoKJn+MMG/C3QM2HK3OUlVTmoWqZDTfmvrkjA9EEQFmdEWbXjmk0ex
	 ibR9aHcSExqQg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D2461C41613; Tue, 16 Jun 2026 08:37:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204743] hw_wmi driver doesn't support enabling/disabling HP
 SureView privacy mode
Date: Tue, 16 Jun 2026 08:37:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nico-bugzilla.kernel.org@schottelius.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204743-215701-xCIm8yKJmN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204743-215701@https.bugzilla.kernel.org/>
References: <bug-204743-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204743

Nico Schottelius (nico-bugzilla.kernel.org@schottelius.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nico-bugzilla.kernel.org@sc
                   |                            |hottelius.org

--- Comment #2 from Nico Schottelius (nico-bugzilla.kernel.org@schottelius.=
org) ---
I got my hands on a HP Elitebook X G2i with SureView 6. Interestingly, pres=
sing
fn+f7 directly enables the privacy screen, likely done in hardware.

If I can provide any information that helps you, let me know.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
