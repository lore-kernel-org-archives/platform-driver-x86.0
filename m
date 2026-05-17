Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A7C271A6D
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 23:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779062397; cv=none; b=R3qAK3lNbmiFMCDwk61VGkIia4kEn9I6UpLGnGUPi+zc00zRT7EWZHzy+Ykoy8Ph2zcjlyCfTOI9ZLXgiviYxPyOkFTYIG1Bw7qMH8S4HelJzuw3mhSszqjZSZKH208UEW+fKPEDtJg7jpH6aVZt0KhMOVsSZ4jk5Sx2W5ikgbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779062397; c=relaxed/simple;
	bh=yhA7L+o2OQoMpNH3LhNdiboU8fGIUgEhe3Sm0Kz2xCY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lZR3ydVQOiWg4TCpAwVWTzt+nALvJSvQddZeOt3zF9ov8DtK5u8NP+QSTJQB6A8hxMaQm9N+tekxQppbfQYkId6aMofEQANoK8rGvQpyA/3WozsGp2mGrL4TAiO0eZsQI8+eo8kqaVLjiEffKqSmuDBBJsWjM5Yf2WVx2HZxCa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2nDF8xH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2nDF8xH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6ED7C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 23:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779062396;
	bh=yhA7L+o2OQoMpNH3LhNdiboU8fGIUgEhe3Sm0Kz2xCY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=s2nDF8xHw58A4lCQZJbQzSi1Z6bV33UWIJ7iU3BtZHIUbkEVd66A2VyCYFI5/bnU1
	 fXU/NtpnvoVYu9Zd8iw/FMsFzRT1qM5jhhW3R33jisdu4q4sfmj0WUDz5fvOa6rsjy
	 GNuuxqLq/ZLww+BGr5ggo58P+2lY3AqCE2Rz+ememmEZGQEADuTD83x+8nMdodp2k+
	 iBdubqBJe4RZLZBH/b6fYET57e1+rWCcKx2BP99GzVYhGcyQF85y2KV4ULLWtOJLQ3
	 b0glzDhzYsBvKhHcHk/zHsiY3GxBsqxdYqvt1ubTgGxbRb7w5BFaWvO+h0iwr9yXa+
	 O8VDlDM4rVRYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C5329C4160E; Sun, 17 May 2026 23:59:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221523] [BUG] hp-wmi: OMEN 16-ap0xxx (8E35) - fan control not
 available (no PWM)
Date: Sun, 17 May 2026 23:59:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sivasli-ahmet@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221523-215701-8oND7D1YCE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221523-215701@https.bugzilla.kernel.org/>
References: <bug-221523-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221523

--- Comment #8 from Ahmet =C3=96zt (sivasli-ahmet@gmx.de) ---
Hi Krishna,

I tested the platform profile and I can see the CPU and iGPU consumption
increases in performance mode. The dGPU consumption does not change with the
platform profile.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
