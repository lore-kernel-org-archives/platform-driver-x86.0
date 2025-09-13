Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D41419047F
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Sep 2025 18:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757788472; cv=none; b=RB57DE8iqe1hPD/xJaaT4Z5X3ehrJs7IXqV2W8D7q6liKVyqidrRUj68jPEGd8HQjzYIWufXXk9sB/1J61vc6BqIQK+keX2p4D0Npg2F23Pcd9dM7PHFKihbDHGyqCMpX7o1qX07aakRwJ/LAabxJWLgn5+4Dw9isvYIUtYM6zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757788472; c=relaxed/simple;
	bh=7A0vMoXERqzmUbn8jrylsgGMciydVMITpfOLtIbzUdg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c62LW3IZdSxpQrvVjXQt7aTZTSEvkyJ16rMl1/2qsPxWghC+dWKtSgXa7tszQJ2NfkdS0/g5xZx6/RaoV5tQPsf8lykLdhRXyImELKmKyi8tw9SPKFKg0YdAvD2GEdpPlKWiSfw0SQE9ttpmI2mvjhJj18dzlwNmA1M2v53kfXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sBpGkGoo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sBpGkGoo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E19C7C4CEFB
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Sep 2025 18:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757788470;
	bh=7A0vMoXERqzmUbn8jrylsgGMciydVMITpfOLtIbzUdg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sBpGkGootrmvlUn41y+q1M9GCUm3IZ5wYIneS7SNVmjYk7cqiWeLB5qCDbPv6TXbB
	 b4wVT3ypb3FF5jAJGcXjNmkuAtjHDJ38Qr/x5BKwYj12Te9ptRoHu4KyiWSGr9dU2w
	 5N6IAbeI6ANII1xhUTBBp7ea4XNVCErGv/H70pNYRsoKPbh/5NUjXPlk8YPzfngqZ/
	 31GzVpFzfx4Ne5Lg4OqYfay3SRpiPSXYNoAu81Lh5tHx31QKUycD2aPWsPXEVH6s+0
	 uvmViOTtG8+Xhs6HZ4Vnw1uBbYNt8mTyZATYCHpQuEAUOcbR55tPCvhFylVY1zXSOM
	 ZaTduTZ1VBjCw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D7F5CC41614; Sat, 13 Sep 2025 18:34:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sat, 13 Sep 2025 18:34:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-vtKsqIDmjs@https.bugzilla.kernel.org/>
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

--- Comment #114 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
I suppose we could make a quirk for always forcing time before suspend entr=
y.=20
I don't really want to do it generically because this isn't needed for most
people.

Can you give me your s2idle report that reproduced this?  I'll make you a q=
uirk
to for you and Petar to try and break.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
