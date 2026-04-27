Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0154F3B38B7
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 23:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777334314; cv=none; b=qIVdN/dAkm5AyHyMPJhvhhQ4OybBhlKbu+ZGlQkUHDaYtKEim7ySpBESG29Xu73u+TmKwLGnQ62eY66QgY5rAobxtre6qHwwpcUwaoeTEcrViF8p/9Q8p0IcArk5RXCELtQh1/vC7m2ON1DhBoLSsG5e/4Zp5dTGhAUPkGw9aa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777334314; c=relaxed/simple;
	bh=K0zvznhquZK5cHgpRgZIMLD4m94fOGzsvm9/TTEnVAQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rKUFgx/85w5i8arEKy6dEoLlgbLInl6ss/0OwnLJsupcT/uyO/3CUcj1Ucg9iJwVyw8KuBRBWTwe040tZ49yUFbbeQdPQZKhaEzXJsPGaOwPyr8QEaKRuc+lCU2J3ILJl0q072FIQdMGjuhQ74LK+p7UJtEjL47IMSk+wgzKlCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=suGh6hou; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="suGh6hou"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1C20C2BCB7
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 23:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777334313;
	bh=K0zvznhquZK5cHgpRgZIMLD4m94fOGzsvm9/TTEnVAQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=suGh6houUgHlaQhMGfuNE8nroaJdaLZRCT+lQHYCtaWa+PqFK9DGQ0pDfAOwXIjLG
	 SLgytK3OS78QwxFp3uFlKkdoNuZXmPqjg2urU8s9ZayoaJfVwXKUDHJIFTfl+YMaw5
	 p2b1Gv4RadbCbexABfd8qTdSIJaI5Q7vIS/88nJb8VuLE5pkx1vle/0WhWrbWLVw5d
	 XECoOVhMI13r3fGYBlB0zi6uxSnQgN8WU9rCRttb0J79it3+F7uOKUID9+OCE+l67q
	 xEcvqpA7kVojg56eHOKSd7NqXbQ9HJuTuTxPYt4gSIJpvaChYs2ljFwF2mLXSmmtNL
	 6/XeSB49Ejj4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9D33DC433E1; Mon, 27 Apr 2026 23:58:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 27 Apr 2026 23:58:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-CFE2OwgDZS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #71 from Avraham Hollander (anhollander516@gmail.com) ---
Removing ucsi_acpi fixes the charge state reporting problems.

However, with only ideapad_laptop loaded and not ucsi_acpi, I still got:

ACPI Error: Thread 2463875008 cannot release Mutex [ECMT] acquired by thread
2221167872 (20251212/exmutex-378)
ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0.ECCC due to previous error
(AE_AML_NOT_OWNER) (20251212/psparse-531)
ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0.RPAM due to previous error
(AE_AML_NOT_OWNER) (20251212/psparse-531)
ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0._Q93 due to previous error
(AE_AML_NOT_OWNER) (20251212/psparse-531)

When unplugging and replugging the charger a bunch of times to test.

Removing ideapad_laptop, you lose control over features like the ACPI platf=
orm
profile. It can still be changed via a BIOS setting, but that's not helpful=
 if
you want a different setting on AC vs. battery.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
