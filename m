Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B741F0E57
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Dec 2024 11:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734003512; cv=none; b=GJWhgOiK4TgDNlREnm+dgG/6+3o2/T8/GyGctbE3oOVM/Y4joRpNLvf7zl/yTum/eCNPO2Qmg+E3rSn4AWxCskF+1nUTduePWDKW92ErBTgXTD8rodTyowhcuaD1tz5xCvFUfgxYDedHwlZcZ0koJXv9RxPGdTsbfDYdMwYOzbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734003512; c=relaxed/simple;
	bh=jNzEkPYOOEJUTun6ugf6cZGFnx49eT7xu1NsYvsnN+8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nzNyBKrIrdcYzV7sJplZweZIsfhXdzpBl6Yrd7PxgH79rFm/4DqUiBmoIGZbNMWT/K+UXFoFIwRN1af8C29BtkqtTWvNTC8GAn4fRe/gB9CPLqys9j7cvliuT6/Y4kcKdex4RRIau5ANg9THBnNI1ytk4Y0I9f4BO/TzfAKK5hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YrPx9rcX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YrPx9rcX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A2ECC4CECE
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Dec 2024 11:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734003512;
	bh=jNzEkPYOOEJUTun6ugf6cZGFnx49eT7xu1NsYvsnN+8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YrPx9rcXUeY+x2Usb3OQBbQ/kGfoOVanXB9IgpiXaQTPt1ngicprahuvskQnGlX/P
	 tE2x9E3YJtvDEzJhxmVUWeZJ4cRgzZbghYkde/2gvbO6Zr1CE0V66VU8DWWwHqgecE
	 XztDcYPmF9mbeAkJccWWvFApUA9gi0yprU2VqoxZeqLPWvz8PTotHTK7Gjd1znnF9H
	 ZKzOyQANEw0WWA02fCKC7JhXLvMfUbPwygqJ6LQZnbEOV5zjpFpCcni/akJmj2S3bN
	 Bpw+QA/DWjegAI+DIjNSNXBfi70AFnn2X4/hySx7hH/mWjyhEc9Fk6C0Fkt2KfVNEV
	 ArbZgy/PNswOg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0E484C4160E; Thu, 12 Dec 2024 11:38:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Thu, 12 Dec 2024 11:38:31 +0000
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
Message-ID: <bug-219495-215701-4OREX0DGwM@https.bugzilla.kernel.org/>
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

--- Comment #21 from andy.liang@hpe.com ---
Created attachment 307351
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307351&action=3Dedit
dmesg with kernel-default-6.4.0-150700.1.1.g45e5524.x86_64.rpm

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
