Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1899A266580
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 20:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755636045; cv=none; b=IH+W1DcMHhmV1wlNqBJW449DzqjVgvxyrTGlQ8bSYLWko4dEquZ+HT17l9KpJDTb03V17AXOvxCEHYq9t6ldBQd99CfBHZqN0KgJbsDPhkxP/OBjcFs5Pji0biGvpz1zc1S3p9zLpDzdij7/l1MMurWtgbJw33wJPpjY38xb6G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755636045; c=relaxed/simple;
	bh=kt3PeK0d0DAcIfp8NVhgksHbYKH118uzFuhbu4Pp41A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZxiuEtzTe7YUoGX4nvxkItqwrHPom7Gd9gE2GQn8jrI8o70QsZSZElBInLETXM40e3Rj/BdW4iSTnllH2aqcx0icphE+Qku3Bg2smN51kn4dIzMfXr1xth9+pZZV9miOLF7ME+RDPghB+dbN8NqH24oI7YcUkRuf5gBg+dYlNDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afeYvrfV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afeYvrfV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2627C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 20:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755636044;
	bh=kt3PeK0d0DAcIfp8NVhgksHbYKH118uzFuhbu4Pp41A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=afeYvrfVclLM9sLadDKYmT3EJ8dbnpsTtK0GXhljR5mXrkI0aLr20C5VwJtrA9sRP
	 PF4YiSLY9lhnEm4u1MWe2l4WHYhdxpMwWph0MRJ/2edLm4kl5wi+IDiPJkv9rtJrCH
	 x4jFoxDZuTmfXwYbQg5OUZtQbD+DatK8XJdP4jNU1dai70uUTlvPfr10iliMN42PeV
	 4P6Bbg3wLeSm+V1QPzzgSmI9RZ9OjDVMBfEClWfWDfqWtNdK60Y4641n3eFyJlQoUg
	 JACTGgunxa32dDaDLwBNUvyRBcQMma8/yLr4FQ3MZFSVkbgreQ0dTTD5Ez2zUqXckB
	 PvhhX7MN7Eu8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9325EC3279F; Tue, 19 Aug 2025 20:40:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220421] intel_pmc_core INT33A1:00: pmc_core: couldn't get DMU
 telem endpoint -6
Date: Tue, 19 Aug 2025 20:40:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david.e.box@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220421-215701-WPvPzTnTW1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220421-215701@https.bugzilla.kernel.org/>
References: <bug-220421-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220421

--- Comment #4 from David Box (david.e.box@linux.intel.com) ---
Patch submitted upstream

https://lore.kernel.org/platform-driver-x86/20250814195156.628714-1-xi.pard=
ee@linux.intel.com/#R

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
