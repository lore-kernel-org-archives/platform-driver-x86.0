Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2319137CD50
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 20:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777061990; cv=none; b=dBqr2Xz/U1xmPzq4yFm7sEV3IElB7mu2QesnrpyYmfrj8iYLLQOeleFmqXSLSJ3jSFhFcNJTiqAAgb1mAKDgPrdGvX0Cz2HldQhegiwdIWqkQTw7RFYE+WTD3tTEufcyderc6TtBWuUdA78BBq6t8mnLegjYpCBBMkoVNsh91gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777061990; c=relaxed/simple;
	bh=dtbTvyE2UXMo997k22I1x5DV5l+kffYO/fVwcimSEU8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qmcVoQo6my9elRcRvta+uumFSmZewuayQVPuAJe/KM7yi82RUo2DFi+giZ7rQLP6jGzEY0R4aHQRU4y0Wg0dZa1KLIHWllBBOb6a7KXu9GnMe2TBIEzJWz5EutfjNsI/2Rkkfq2LNU545GAACX5yoqyH07rbuiKA1S+pJe/+1hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKchCZbs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKchCZbs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9401EC19425
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 20:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777061989;
	bh=dtbTvyE2UXMo997k22I1x5DV5l+kffYO/fVwcimSEU8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EKchCZbsOM7wSAUCMbc/+xqv547/PWYyzxTigeHozPsY++gSFKyvLZItobjXjmOW3
	 mE4kfTwligCnsiA2cT2eqKocYUHwt90ZyJ2RzgFRx0xeywgmuuzg3zHr3+VJivkv+k
	 2TYkyNpnb6qZEytW2q15vvTy4BPPRaSXJKYjrXn7VVynL6vz9r6+hFKtTJi3872Lcy
	 H8W0u+1TFXZYo530/YvUfLQd9bhcppn2gv1lEP9/rabo0RWU5+FOi3nHFrukwv6g9+
	 7eggWu6xPs7epgBtm4vyhE8JxToXF9Qm8Hq4Fhy7MeMml2pFsGOceKARngYBS9me1Z
	 QO1XHJR9XPcng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 84918C3279F; Fri, 24 Apr 2026 20:19:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Fri, 24 Apr 2026 20:19:49 +0000
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
Message-ID: <bug-221383-215701-ypD0T4qalp@https.bugzilla.kernel.org/>
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

--- Comment #28 from Daniel Gibson (metalcaedes@gmail.com) ---
> If you DO want to shoot in the dark and try to change timing ...

Thanks, this was a great idea!

If I add msleep(1500); (1000 is not enough) to both amd_pmc_s2idle_check() =
and
amd_pmc_s2idle_restore(), everything works as intended \o/

... at least in my patched kernel that has some other changes like longer
waiting for ACKs in __ps2_command(), I yet have to try the vanilla 7.0 sour=
ce
with just these changes.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
