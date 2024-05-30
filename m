Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127C615748B
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 May 2024 19:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717097513; cv=none; b=XKibtItxDadzwq6QNfCIrZ+ern9Ar89AmRdLDMkLuMXKeWsNE8+PvvCdNs6VHjFR/VAluhnFZGvzou26pqy2EWF3MLZHtTlGQt/J6V2dJ03xyjnDNxEH0kZe+l0HpgwqPSbnwUalBEbCkTG26r/AYzrizFiLIqtHK26gFacK++k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717097513; c=relaxed/simple;
	bh=uh0Vi5q9FCVn7x4O+cB90QoQAfdCke9RcJa4foZEHMw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cNNpkw7/57pV2rb36yAdEoEXxac7I4nWVAQCL99zRshIAU143eZp7veaeGqBuCWtKU3uW9v3d1RsbaR8o/bW6Y+s++FjdqmEdwjOCIS023jqwpbZCWQ25HThsYEujOpC5PqgQB/JgYzW1GIsPwZSkLoEPAfbh4p7OGPxSlAu5uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Un4cKT+H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Un4cKT+H"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E50CBC4AF09
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 May 2024 19:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717097512;
	bh=uh0Vi5q9FCVn7x4O+cB90QoQAfdCke9RcJa4foZEHMw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Un4cKT+H6cRSQBwz+o3b0oIYhfdSuihTXbXEdD2GF8WNVFyGRQVQ/TmgGCmUmh7/k
	 MzuUYG4s0gEpgkm6yI9EfHEhcCQAz7JX6FrgWAyqPmD2LbVrRUAy88vgohCm8Vorzr
	 Pw+nqJyDxH2cAlUCtwCwYhb2hvbHp3g97/UfSzjA8ljSg82jSMgS7TZ66YBOBTD+wn
	 PDFn7ij5Oj8+4jOrk0DNHD4hSXJQzEpB66Pj3Bu+a8ZACK59D4OTCVqp2OXYFFcfcL
	 7ou2ai9PRWSHRM49/4mDPMoia9xbHvVIqwGlxwCsKWasdqqpcx6gjPRa5qmgyTwkyi
	 XudRgqi+JQcRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D1906C53B50; Thu, 30 May 2024 19:31:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 30 May 2024 19:31:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-s9BoiLvigG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #7 from Armin Wolf (W_Armin@gmx.de) ---
I think i will send you an modified lg-laptop module for testing.
Before i do that, i have some questions for you:

1. Does /sys/bus/platform/devices/LGEX0820:00/ exist?

2. What is the content of /sys/bus/acpi/devices/LGEX0820:00/status ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
