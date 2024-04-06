Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2FDA50
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Apr 2024 07:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712389703; cv=none; b=AV4P72Mpj87wF0JYoVMZN0FigUEiHgxJt4nm42suA8icKGQkDFPcUGV/883H2t3BsGm1z3JYJrhiYGmEuhpNCFnanE4y9h/0Sl/JD7n8GUwpSx1PAlAz2cpCOLBci4iP08LhCKkScm8ZiwWnv5rLDmoxdr8r+gEqc5KiGc6Mnbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712389703; c=relaxed/simple;
	bh=3aRYt4wb75fyJyH39gGbxrYQ/cZ7hFdayzs78BqHL5A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LmLYLCc4poKGGBZZiIT8f5ooaW2jDc6aqrVmvC1v6T/SLZzdE+gd3e+UxMvdTlincQ7FbO5K7IKdvHBtGmqTQXPqQJ1q+Jj1vVxzkiknYoK/qe5SLbmUEj3U7YJxQmoF57WkFIgow0v1r69O61oentWGAOQJlLChEUZ76x9YjtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPNXXRzr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPNXXRzr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C58D9C43394
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Apr 2024 07:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712389702;
	bh=3aRYt4wb75fyJyH39gGbxrYQ/cZ7hFdayzs78BqHL5A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MPNXXRzrNL3MQfaWUma4Hg8DpXTr3cOKMx67UNjRKHOVtxquZyevTyDAqoTihDgAA
	 W4FKy+S7dAUkiZ3JYDcFiCkyH7J5eDJmAt2kTAfg+r4FWxp7Ta7QrHOPoxMAP42vw6
	 FleQMN4FtAqvycP0XfvFLzIdr4LRgECEXL++jG6ZSRfnyPiWldwewXPaw41LxpPsJn
	 fMIuI+kplO55wB93Cq7NzEiwtld0RDn+ftQSrcKMp1SCGpVHMgfVOhxJfFdAItd+BI
	 p+Zpew7Ngito5ODInapKfHJevP+CaG5lk2zW7etNpOgBUY2s8NGUPpxnLU2JL8H28Q
	 AECNCRdxa12EQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B63C5C53BD1; Sat,  6 Apr 2024 07:48:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sat, 06 Apr 2024 07:48:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: ries.infotec+kernel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-rpTk4POGdO@https.bugzilla.kernel.org/>
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

--- Comment #49 from Peter Ries (ries.infotec+kernel@gmail.com) ---
Hi Arten, this unfortunately works for me - meaning the CPU frequency does =
NOT
get stuck if I do it like this.=20

- I put laptop to sleep
- unplugged
- waited 1 minute (without resuming on battery)
- plugged back in
- resume
-> CPU scales up and down as expected=20

I just wonder what happened AFTER I had the effect with kernel 6.8.x (only
once)


I currently have

6.8.2-arch2-1

core/linux-firmware-whence 20240312.3b128b60-1
core/linux-firmware 20240312.3b128b60-1=20

really weird

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
