Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA4528BA9D
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Apr 2025 18:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744655224; cv=none; b=MTNUVmL2T+ZaXJ8XFd0UkcGcI1WyTb+f3PK3a3Vn090AoVW1Mvp9E38/mADZX7IEVGr0iNPXXJHGO736khbVWWubbrlg6qV1qBzOPdSlXHpm/SgbBDoFnnGShcEDVkzybXCODdB9HYu73pvDVBOWFuohevnia3ZpqUgfKvicwuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744655224; c=relaxed/simple;
	bh=CB8RBshWlBae5lh3yzi1zPxOg8BP1dKg6vWr55Fzm+k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ukgw14+npFHfNkZoEFHg8pGpDh3BG1Pks8BFaB2iBt45sCi/qRRtcFNTlbBYiucRSwNH7bN+AnP6ls03tkVcSuGaEx7aYvxdhS7UcxJHbSG24jZK8liAY0BPgZKBRYWdBhkRc7Z3BljzdP5XFR5Cdy4ub0iU8SPQ9SONsJPc5Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bl7pa3N4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bl7pa3N4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56CCFC4CEEC
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Apr 2025 18:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744655223;
	bh=CB8RBshWlBae5lh3yzi1zPxOg8BP1dKg6vWr55Fzm+k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bl7pa3N4vNOkjaUHcqMb5BGAsAcedIzTFoFF1dn+UhyquXiVHcRc5ws9b8hb+Lyqy
	 1M/AHSVXXQflVOln6GeTtlrRQdLjI5LUQmsV7qc96pwMksIWc6VGP58AjTjWU50oIB
	 bR6znbeB/v4iX+wWkGSR842qHE24WB+Y2FqbONujmOwuuxomh5jGeqbdn4Y+75Hdai
	 K2Pvg20jDTelqEkVKuDRbIN6H/5JXtVdZwbw6pG3xpg/WIILAzlpdV0xF2IwY2eGrg
	 ewwMthXDDMrLwiIuv9itNDdoUpcsk+CBFXZQDT6Zkt0gJ7oBawK1/Fo4jhLwZnCdMb
	 2ld40XDmBfsjQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 49B39C433E1; Mon, 14 Apr 2025 18:27:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 14 Apr 2025 18:27:02 +0000
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
Message-ID: <bug-218305-215701-su63nKOOFT@https.bugzilla.kernel.org/>
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

--- Comment #91 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Here is the submission for 2.5s:

https://lore.kernel.org/platform-driver-x86/70dfa642-4c97-4aaf-aa79-7012797=
4f03e@amd.com/T/#m174cfe2f4ec5893e39cff6994a93ebd499ec29e7

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
