Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63595366567
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2026 17:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780160793; cv=none; b=JRwAth7//qAs2wbXfPA52zXDfkHMyqBklbIgNbfol1Hv+NJgGXbYm7VQ2I922GPaaqt7o3bb8GzhZwvFiWqZNAxzTnQgN59g8lDqmWTbGlZlEfu5YlcNF3ValMXS/j7e9JlqxyVUMtgSN8aLLF1pzrK24wMd8SE4kktMviSQ27E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780160793; c=relaxed/simple;
	bh=TOwlN9VFzVh5v3TaG3Upx49/7hOd1pqBhMEVhQdElvk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W3OpLLyyrKWfmmjjlQGVSoasy4irDQV8g8bUWfu+HUGgd408j3p8lUlUjpYB5c5OnMLdulePR8u8Q1kjEKZ5CDQ2fc3NylTYfEP9HT5APUYg3nIp8F8vQ7fXXi2rcnlQOff2ZoZej5A555jDBh/XDKRTjw1iLsbd4MEafOPDjjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqIrzqj2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqIrzqj2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 151D1C2BCC4
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2026 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780160793;
	bh=TOwlN9VFzVh5v3TaG3Upx49/7hOd1pqBhMEVhQdElvk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eqIrzqj2/lWpmOjrvjErHROuH85TYhFEkLcYZtRi10yU7N0rrjJaz4kFNWNzBTTKg
	 9MhM2eFLTh9emLp9C+mkncZPDnPOh/sk/HQom6RtqNR21/9lpRmurj4rlFsPosl1s7
	 EHUyGQRVebwj2DAZJYXA/btV6xh7xWUqmQQXmCIAz2c+XZvwhIa4byWYv5TcY8DSoA
	 1uAY8wrHhXhD5AXmUmKq+ICmZAOnYoo++RHwamhFCINIso4alN6o3WDQZ6aodzSDLE
	 gQXw1X7g2fCdB51KyAjJ+SglPwx3+tO/Kco3nt83tget5DDJyhJQmPWa11bjDhk9Wi
	 RvGplMIzw4U4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EF318C3279F; Sat, 30 May 2026 17:06:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sat, 30 May 2026 17:06:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tacodog311@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218901-215701-V496B3pVjm@https.bugzilla.kernel.org/>
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

tacodog311@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tacodog311@gmail.com

--- Comment #55 from tacodog311@gmail.com ---
This is still a bug.

I have an LG 16T90SP-K.AD89U1 LG 2-in-1, which has had issues with the Fn k=
eys
as long as I've owned it. Specifically the keyboard backlight, the micropho=
ne
mute, and
the camera disable buttons do not seem to do anything.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
