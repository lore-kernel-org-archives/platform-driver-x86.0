Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2492925A658
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jan 2025 04:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737087357; cv=none; b=Mid+Uijj+UdllyCuxg8d84FXFPNozUuqnpjUx/6Qqb4T2HUcEqBGg0ZllaX7SDhnNy9bXil/dYsHjpIWpRk5gi7OeSTfIxzqnotFYd9m0omPF0l3o1vpgtNPy8cej1XHs/QKjv/JHOZJgF/4agZWNwdYxEHLCIgriN1QYEf5dlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737087357; c=relaxed/simple;
	bh=SMKxqSvKj32UPvlyPiI+1fvlLbJHB36b2xluvFmW6rw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CesfGAhRtQYIb73Pp3yLWwJkaN4ZvZbKd4KjNGwd2cBDUR/dyTtA5+UL9Pf0S5Ooiu4QSG+nhrqzoB11kYJ/m2VELJRIEH1ZfJYcOPIpb1B3CLa5b8XOXWetFWRjQQqY69xxV7MMKZMmNE/i25zHDuPuphu0E7LAs096Ls+eahs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s4vuIsVf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s4vuIsVf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95B3CC4CEE1
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jan 2025 04:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737087356;
	bh=SMKxqSvKj32UPvlyPiI+1fvlLbJHB36b2xluvFmW6rw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=s4vuIsVfBCcVch2xTZRyBzA3gFZGJWNt4pX7kCb9tfduaG1970vr3aSOLpn1wZog/
	 oY0/OxRSgr5Tn7sxpWzc/RYY1y34nYBktupj85QOKLeCqzkc1sICwidZQ49sIYax99
	 wHVNgQYwjV2BOmJYlHWjStPuJaVwhmjU2oCMbu6vIpqIbqBxrZwSMpLpap4MJHA324
	 rPc1Vy6XXyuXc0yMM389/bh75fNedsRWr2RZHRI7/PfqIodRShJ7Z9xpLLDq22+Dmh
	 U89ODYTyAH3jh/EYAUtJG39D5Nh7r5YLAIRy1dR2iOkCQG7QacXd7OYbHBpXXj8NTV
	 pB1MT5xcesvuQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8F4A8C41606; Fri, 17 Jan 2025 04:15:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 17 Jan 2025 04:15:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219495-215701-jexSlOSCaC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #70 from andy.liang@hpe.com ---
Created attachment 307499
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307499&action=3Dedit
v10-patch-kernel-default-6.4.0-150600.1.1.g2cf6431.log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
