Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE2F2E1746
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 02:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776912507; cv=none; b=BrXEDsq+xCR7pji5hL2alSENmVx61+CGS3y2CLIz9gsSUhT5MAPbxpi3rO5hv75tvzKv+rohBgNZCaQZFKFDHpFYk84h+7NjL56mECscrQ8MMb4D8IkOKYfa4iSKvw1R6Vqs5GsK36Usn/PmOjtUk/Y2aDWvgkzlwtvjMr9dBiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776912507; c=relaxed/simple;
	bh=cYhHi3teHp19agdCdA6q6RLvCY59fASCGMHL0afeTg4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IPdbGWuSOMltB1gKHlAC+ArqXG7KiLZ4br5T0DlxoF4B2EAibutL5eLIpliq7FwGWMV022PH4IGnfg6ds8p6V/R94TVIZcYyETQu7Fh2jbYH1GugWBbX7THMS3qtyi1IWv0fvg2rAqu7mz2LXFlBzAMDFL8cjy3MP88xZ/296Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NoJeyXzk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NoJeyXzk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9F69C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 02:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776912506;
	bh=cYhHi3teHp19agdCdA6q6RLvCY59fASCGMHL0afeTg4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NoJeyXzk3dw6wHI8SdbcOMt0eyxzsQYnz0uKj4d/Y0MfubDm9jkKxJhosiURQZ56k
	 0vxqQ2t89mf5UorVSClyFPRmzj2KfSzCRHb128SC7BrM5Je+N2IOn3vVbmR0U0SHvn
	 Lsmml5fNRvjTFgjAJZr81fAV1igK3v9iGRhsc2HRZocqJqpVQt/WE+WIFvNZQRpyry
	 kkyDRe5by7pa+zBQvqlcoPgcJ/MdPIW85ZuN7VRN50M+Q+8yIbicoQuQn+7AUuRBks
	 7s4A1qonx91Uy4GRvoq0kwtwhmLC198F806jJi6aVFLCzPUdTTM7Rb5Kka90FZVPaN
	 A3C6/Zc+trJag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9631CC433E1; Thu, 23 Apr 2026 02:48:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Thu, 23 Apr 2026 02:48:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-sV4gbA17xY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #13 from Daniel Gibson (metalcaedes@gmail.com) ---
I guess this at least rules out that the functions in the involved drivers
(i8042, atkbd, ...?) that are called when suspending and resuming confuse t=
he
keyboard controller.

Should I create an additional report with all my infos (dmesg, `amd-s2idle
test` output, etc) or post this here?
My IdeaPad has a Ryzen 7430U which is Zen3/Barcelo R and uses DDR4 RAM while
the one of this report is a Ryzen 7735H (Zen3+/Rembrandt R with DDR5 RAM)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
