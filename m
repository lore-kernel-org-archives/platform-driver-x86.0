Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B311A3148
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jun 2025 15:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749655241; cv=none; b=NQyjtTz/xz9XNiwCK9vPcOHkvwoRI5DWiiPP3B441t7ojxIMekRV0n0aaRKQwIb701vp1Nf0oQpnwTEbmz17vd48MYAjhiCfyWQlrgsTc4n22tm7FSloDn5KA+faskLLbIJwypkfVsDkl3vbN7kO8ZiSWqaWxJOlNutPKFqHAMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749655241; c=relaxed/simple;
	bh=dqnOTRVISBgeuh75wHXpU+kDTsiQOoLz+2c+ucjApAY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R+uR0ndoCLzENv1zbf/Slbq416dkMck8dWbc7+e6llQawIuzqActVyAHaoQd/g0ODmGc2AKTDGmf9oStMUBOqOQ70AY2uHdMaaX/6qhwoPhEyB/EhX8mGKa6mo34SVOriQT6rfWPnTAlG5E2l4XKij3iuywCzGmyXAx2TCqqBi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkwUILqQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkwUILqQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C160C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jun 2025 15:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749655240;
	bh=dqnOTRVISBgeuh75wHXpU+kDTsiQOoLz+2c+ucjApAY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dkwUILqQ0Ht4sFfc5RHKEemepIrIQg7cdPn1JQrPPIy6Zzn6QgkgvMwYRB9TqX/vC
	 mndCLO98B98ImUvyx6briW9Y8OtUJCdRcM6uQS1go5w9sKpfZH+I4Sl+L7oRGzyCTD
	 q0DLlGG29stl2ktMO+6+/Bc7qKJh1Ia4zYqv/VJGLnnHyTIWpkX1fF71Dag0+IbdTI
	 d2nkc/5wzrygA7EMhYe3/+78LIDPXaCqzVj5i4zdwFrWTyQGH2OF0NOyp0VKy+6zz4
	 MxWD0WBDMO7X+2nMewUsFZXItJaCMCItUJd76dC+bxEh33A0eV19bmJZ3KnADnLJ++
	 t2kepuWrgB/fw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 842A6C433E1; Wed, 11 Jun 2025 15:20:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Wed, 11 Jun 2025 15:20:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Input Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_input-devices@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220116-215701-kMmGhJn5UA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

--- Comment #28 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Whoops! Totally copy paste error. It should be harmless though.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
