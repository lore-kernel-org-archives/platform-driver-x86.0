Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90D9329361
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 15:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207052; cv=none; b=L2mkt5TBWXjXcspWMCfsYIdez9ZKA7bOq5oCxj9JHdhUVtkCOQgVicC4M5Gb/za2w9gbWl7mFCEjs4rTSUmTbwkLy7qxBGRyNbbVv6y8Acc9KEMJfCkUIGKJmrPr4g9EiTMaP9ijWBlScx50Y0ziPEOWN6Q31qnYwLaRjO55wjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207052; c=relaxed/simple;
	bh=7OE7GXipJRRv8FwMF5NgJVLns9OQkDSFW6slC+3ThBQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tnmoH6ZajZK7zXGtp249ternArW7pMP9/+oHwhKAK8orZYClckMOfUwtXv0hemBMsZyRtdPG0oLvgVRjSBzLkTdMaQa/r3cIMiQqPPHv9Q+b2E3c9DTbCXbuzCdOqaY37PmtSZM+6pZCtdIwuxRkrqhKn4+OdZVZurk8YDicMeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcr91zTc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcr91zTc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51D80C116C6
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 15:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772207052;
	bh=7OE7GXipJRRv8FwMF5NgJVLns9OQkDSFW6slC+3ThBQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jcr91zTcHoGI7BSmd9HuxpeuKq8EfIkQyiKfYKQT8HACNUd35QoOGZg5CPf26JKtD
	 94barWmQLlOnprSSICMLj/SElV4pK2aQoDkswkChwYXr0dnMaidPVfbOQJ0a1PzGGf
	 N/025sQCdmnnYo3o3b9RRMiZmV8n1Bzp9U2M8rvVMhJaBOzhHPH/2JAA7foApRq95O
	 7o5PWNqnO5XXQGMTfztcq2OMpVzIe74YmgBug8IgIs42ZGS6EPU3X13fccuHWEMB19
	 tvJj4meRjsBemTXq3pPUuEJHxFvJ+rTlr5HWGZW4qIFFxQdwjRwOfbNXtw+XLJey7/
	 vO43wfDPo2b9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 472F0C3279F; Fri, 27 Feb 2026 15:44:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221149] hp-wmi: Fan control fails and RPM always reads as zero
 on HP OMEN 16-wf1xxx (Board 8C76)
Date: Fri, 27 Feb 2026 15:44:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221149-215701-pqmGVh1uko@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221149-215701@https.bugzilla.kernel.org/>
References: <bug-221149-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221149

--- Comment #7 from Krishna Chomal (krishna.chomal108@gmail.com) ---
I have submitted the patch to the maintainers. You can track its progress a=
nd
the mailing list discussion here:
https://lore.kernel.org/platform-driver-x86/20260227154106.226809-1-krishna=
.chomal108@gmail.com/

Thank you for your help :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
