Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E0E2EDD4D
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Oct 2025 16:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760286670; cv=none; b=Zt7+gOPi3vApDoWrZtH7rbHmoszUXd6E/pLh3GoC6Hor/NHAw6DDcYqAlwr5eZnuuR4T41tn2k9koRyi7MXCY3rT9htwUW/E1A9zIJaxxOdBa/KxrR51XrM9Kb+1gFBHhArLpLvfU6SK7c1dof4Cl8+DdmYpwnJpzsk3XsshYUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760286670; c=relaxed/simple;
	bh=a9CjQvWkOBQjSQVPPiEKQX1I+OEjkO+69SwNGOd9nwg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lsZbHLtqhy755WfBKhH22UYA0vbKOeu9hrnpVIU6Gg8jjq1jbHQFDbdq8btBRssXly6XcJ5gfka8NOCqxJ3egyRyquvxOhgm9MFNfx4UTKLHYQuqkqZzmgJ87jiiehZVaJzrU53IkLJxiUlKuF/BLog+uYBPNrFVrRgaYi2NzLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LuJgaV6w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LuJgaV6w"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8D3CC4CEE7
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Oct 2025 16:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760286668;
	bh=a9CjQvWkOBQjSQVPPiEKQX1I+OEjkO+69SwNGOd9nwg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LuJgaV6wudMwte+gXwDXVbg7IGgNAuMePft4OcqBbjeyFMCx5jzRUgYH1ywB+siHd
	 cpWRDJ5kxloc5yoSpkVqtmPMWieDnfCmNNpY4Z+Qh2A8dm8sTO/9d0YJNtmOatxQWs
	 90CT+SxtQXz/LLYOSrMadVJgDJpHA2Cymi6SbI4Dk0RAwmXeXyaaGuwoS2ii18CVno
	 gqcFdriW3V+/X/ZtkZedP5jmBO84Yo2KsJ7YxPQrW1RfI6XhtuU3c2rIt6t0I7ZvvR
	 xAVqo+axcnl02AKk45dRpCsyVf5W3j6IH5o/of17n6R1cvPvceOBDCLB4pTJsTnZFk
	 uEg+5qlZaMKHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D2F3CC53BBF; Sun, 12 Oct 2025 16:31:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sun, 12 Oct 2025 16:31:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: contact@pawel-mrowiec.dev
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-1TfZcU5MNg@https.bugzilla.kernel.org/>
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

--- Comment #137 from Mrowa96 (contact@pawel-mrowiec.dev) ---
Same thing happening on HP Elitebook 845 G11(103C_5336AN HP EliteBook) with
Ryzen 7 8840U and board name 8C6E.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
