Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA68434750B
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 19:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777319199; cv=none; b=SxTmU0/h6f87kxXFjo3wqkVdp46RfmBE57lKjuxCAez1pK+qVtrzS23D5FtJDiuTnK7uTKInXB3u59c7L8R/lO3lSb5fTmquCb8Tfh4wgjhKMBlUYgyAIKNNwMfBIj1+pWICdFdf0TrFEliPVKSVEvGZlYxGerOxmzvGnP278jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777319199; c=relaxed/simple;
	bh=1NindMKrHinVTaoeeUuZicur9336OpppEMX98sxgfY8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=daXsYA4S+7sLmOtVnVAMNlw95oX/nml/7kuADI+a6lam2WXJ2/icaom8+O1zuy6yQ/uVeZMQ516EQofK7b/bl3IEM81C7XnR/cuKdPrcdZyrzIYycFQ8XA6p6Iw1857RprwB2/fBUQRatllIqAPb4gjqYj+zh26QsWmoVRf+RQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFc62LHr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFc62LHr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE851C2BCB6
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 19:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777319199;
	bh=1NindMKrHinVTaoeeUuZicur9336OpppEMX98sxgfY8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MFc62LHrfDQnpOeK86c2d4p0nSwvqaWy5DSVykKcAch+2Fm4m7HuMC5xfuaSetY+F
	 neWvyNcxUgaofEsRg+R2FhSQtP/7YevhnkP2X3B17kChn/x8nHcCqHsqbPpoGzXbLG
	 QTXvdFFbIJPpWiwx0fcnZmJMRjbmdh3jPwD+fuQ3gYQVO1g/2KgbExBNHnOTuibW/I
	 zONkHT5yWjvG8yVkZWrRTkIu3shcAYL1+T9glld7hB/6yiuDRXIc5weI7dL3dfrGeQ
	 chDVH5Snr5xh3pxG3fAHFQSRYnBixCPEKut+zp78bt8m3ETL3bN32V/QOSmxqO+epE
	 klOBAUzsqZpkg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AB74FC4160E; Mon, 27 Apr 2026 19:46:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Mon, 27 Apr 2026 19:46:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sindrehenriksen93@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-K3lPxliO8v@https.bugzilla.kernel.org/>
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

--- Comment #43 from sindrehenriksen93@gmail.com ---
Nice! Tested on my IdeaPad Slim 3 14ARP10 (Ryzen 7735H) with the keyboard-r=
eset
workaround disabled. DMI match fires correctly ("Delaying suspend by 2.5s to
avoid platform firmware bug" in dmesg).

- Short suspend + resume: keyboard works (previously broke without the
workaround)
- 15+ min suspend + resume: Fn keys work (previously broke consistently)

Both issues fixed by the patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
