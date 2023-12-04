Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08A7656
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Dec 2023 00:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czOwO+dC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56D50C433CB
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Dec 2023 00:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701650520;
	bh=rVGuYEQ+A4G4RSLgssl77PwB8bnmt9ztTGU5oAFU8Bg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=czOwO+dCk7vcpI0I/6pTAd1cVul6cekPUdHMITa4upnXPnasbtDyrSCOxR3AAzCXC
	 ch/UxUCNbC7YfmASv6RMvfpINzUMOdZ1F1CfZaOB64vm6nyyolxnzNmO2T6ruQ1HRP
	 A8+VKilHUA4ECg2mCZRI2Ugq+xGwolGhlvSnzPO5TSzV5unhaCEeJi6TddmX49y83l
	 vUSc5p0LQRoLMzCotyh5F2vse8bfeKgCDep4gRIQULkA0Ch+WN3JQMI4yGQ0iNn54i
	 Gcvjh4g4sMA3N9tpy65BmBTG2FwIxSHJnv2iyYjMcms04vs287CYHqzBuopbatgbK3
	 xN+nCT0oQbVXQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3F9DCC53BD4; Mon,  4 Dec 2023 00:42:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 203191] The fan speed reports to 65535, despite the fan is
 stopped
Date: Mon, 04 Dec 2023 00:41:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: antony.gelberg@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203191-215701-A1VY6TyYn2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203191-215701@https.bugzilla.kernel.org/>
References: <bug-203191-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203191

--- Comment #17 from antony.gelberg@gmail.com ---
Circling back with an update.

More recently, I suddenly got 10 days without the issue occurring. I assumed
that it was better, but today it's back again.

I've upgraded to 6.2.0-37-generic, but the issue still occurs (only two hou=
rs
of uptime before rebooting).

So many people commented on this bug a while ago, is there still no insight
into whether this is a potential hardware issue? I'd love to hear what work=
ed
(or not) for you because I can't believe everyone who commented has continu=
ed
to suffer the issue for 2-4 years; it makes it "impossible" to work
effectively.

I've opened a support ticket with Lenovo for a warranty repair but I am ner=
vous
they will say there's nothing wrong as the fan does pass the stress test in=
 the
BIOS / diagnostics (although I only ran it once).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
