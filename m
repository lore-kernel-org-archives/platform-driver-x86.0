Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C20314D03
	for <platform-driver-x86@vger.kernel.org>; Wed, 17 Sep 2025 15:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758124050; cv=none; b=ueX4ADuxNIpoP9elQHp5pCI/3sat4+UVAmntTGl6+XSZL5uCDn6ZgqaHQMqZYK+U4Zk0H/ou1cu9p/tau2MgHEyowmHmmqh2ZQLo9+ztec18Avi+QSnRtoRCYxFImTSLMUmFB7sRrTNf8vJ4+PuR9YLdkeAiPJqlTawGDeqjuVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758124050; c=relaxed/simple;
	bh=i59uP+6YC9C5sV20rF/G84S8pIiXbwLJI/DqiwGClMs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SWvK8UAyWxmY5rzuaeBHmc0R7JTlQTlbMzYbYfLI11CfJlIHJGC4z5Wubpvi+gdGWofMIPUKjEkokQFrvR3YCqdR3IWgaqpLRdFR7vVCMLzeB9iyFIgmYistqfMR2pDMqCDJJcVAoR9s+W7sC1zp0ThBLZWAkwHtB+BVC8EUio0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s5eXcLXR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5eXcLXR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E31FC4CEF5
	for <platform-driver-x86@vger.kernel.org>; Wed, 17 Sep 2025 15:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758124049;
	bh=i59uP+6YC9C5sV20rF/G84S8pIiXbwLJI/DqiwGClMs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=s5eXcLXRohMFx2EA45pJ8SepUpMsfDFuwCV2t0xP0S87NrKfYxnGPVYF2zFDNl/jD
	 12GBE9Nni+H332th5jxjCyngu/6q3ZDYbbRMsIl0oivYQ0Hj7TcOgGN2w49AbcOKap
	 Eu7B4qraV1Dlq4oHinndtIoZT5Ggmmc6Mdp08TuIeAQWGp1RpxdHUlCgB0yTgfqhCi
	 8rjfTVLxIi5QS0g6A2MMccjhnWtu+ieBd4GhcAdgl37jyk2VHGfskMAfjWZP89/ZRt
	 h8ae+d5sZdYg0ObYsro/hEQg44FV7MOElbuNHoh+0dAskp92Oaz6qEuaKPZb18tygH
	 O+Uw2vDS+9Bpg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7369CC41613; Wed, 17 Sep 2025 15:47:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 17 Sep 2025 15:47:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-NrRZvS2sQu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #131 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
C is the only one I saw a kernel log, that's the one I looked at.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
