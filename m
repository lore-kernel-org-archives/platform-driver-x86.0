Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A735B26299
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2026 21:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780178018; cv=none; b=UTAuxDasGAoixT0KVbG4IIq2TnqwYFvtQJw6u7RQU6AfA6nZ9deGvvoAh+HOKkfBNDdANyd35rMGcCxXB/oBOqEmrtsN6m/f9laHiVpnZuAfjwLNNeU2b+1btf/cKhkyJtgWhRTCRF1oU3GY20DOp+yaZu8XiHR2lfrph6MLDvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780178018; c=relaxed/simple;
	bh=kbmpDLBu5pJyC3GbdmV2MteLpRKDAOUMBxC+3uBorMA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UIcgqG70gXeqSm2AAk2WsLbI7sBYoY6xp/Xi7D0JQLGNXD+lqIn/o5THmDDTMgIsEXP766vwb/0HZL8Pv6/HR0eOQ7+Q6oC05xka6aIx52Wj3S0lFuOoSrn8g0YIe/q1lJQQ6YqIzeu6HqyfH8aKAXj4x79VU3o5L/biqTemTyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LiWWwRbJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LiWWwRbJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3EC08C2BCC4
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2026 21:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780178018;
	bh=kbmpDLBu5pJyC3GbdmV2MteLpRKDAOUMBxC+3uBorMA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LiWWwRbJSsg2rTLARqMI1e9XYC4J25QzQGxCu4Xk5N/imlTIcrGPNJkofh+a5zon/
	 +a2Q/fu+vcmK9MmFTNWZbZHYn4sR1nvcWKRAtRP6RFX6OHQUgsmoQ6fq1UMzwSPodf
	 XDEzJMu/HDC5r63bBl2JbGqhz24YC8dYf+vKrQZ55k4svKuFCO0jxDcP9pL5ph8sty
	 uQ16G4f3TNMhoZifNx8BJ8y0C0X3udjoOOPm+k3J+DKz1PGIPD8R1dVp4tN/EYEhY/
	 Yb3wLKkD0axNAXvawxVAlm54NRJRV03dx5DFHsJidG7lFJDTB4yNhVDTa9yWn0cY5d
	 ms9Y+thbWVyBA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 19624C3279F; Sat, 30 May 2026 21:53:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sat, 30 May 2026 21:53:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-0YoDjPD7wk@https.bugzilla.kernel.org/>
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

--- Comment #56 from Armin Wolf (W_Armin@gmx.de) ---
Please execute "echo "file drivers/platform/x86/lg-laptop.c +p" >
/sys/kernel/debug/dynamic_debug/control" and check if "dmesg" records any
entries similar to "Type: X   Eventcode: X" when said keys are pressed. I c=
an
then add those event codes to the driver.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
