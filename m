Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D330392C52
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 22:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782253339; cv=none; b=bTMyvCbLFPsheI43pbYX6FGrpHA8hcMDWXPVm/APQwnB/BPeD4VtQ5JRzT9kXT4LQchZpgPKuFn4RVGprkwoRUs1AEhdLMXw8+zolPSaTY2t7rfAPAVnRzT+kMQHa0oHMTD2pvpEcf6xT6snnDxMJ6MV3Zj2gW9KUYExt98QYRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782253339; c=relaxed/simple;
	bh=7+sk9b2awxv2ZJOy90bynGZvM8MmIb3bJmTCCb1bAAI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gv0QkVeXCsmb+Wfjz9tE97/uAcyh5hD6Zta/SZ5p5u++PH796Y3pwknP4sVwhjwCE8qXbA5/mhb1i+Wv9ftPRLryg4CO2KOf1toyOKLx5I10vI70VkC2HUz6Jq/ZwE67AtGuLhQz0CZJqK6iTvXD6DrjpIw2xS4p8/iC9aYMylo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CV28pgAX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CV28pgAX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39FDCC2BCC9
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 22:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782253339;
	bh=7+sk9b2awxv2ZJOy90bynGZvM8MmIb3bJmTCCb1bAAI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CV28pgAXw90xM3eBiw+FJBnAOm1ujhhPjFGXb/0cO6Ct/eNjIXqnaeI3TIZHr1Jc3
	 X74ZmLDftQQFvNMVI0DXSg1iYSlC670bbrRbMFwk9uF3WlB9lG60Sy0G8ZKiM8YzvS
	 ry90IyHwAJcbcUZ61+lcwaKb3ahrCiFwIcUZcuMu8DBKEHahrhN9rWRbcYkME+2kKW
	 Al72tRb3M/wQ02WRVf7WFmsqX+v7b1qUJpQTL8rh5Ergc9cJx8HUwPcuhgYTL1+OW7
	 A3ooRBwuqzYdO/XUyd6FBEN+if58cy2mXRSupUz6GaUDWhTOOvseYVwIZupNv98g/O
	 B0dQjCUcUsNUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 19F57C3279F; Tue, 23 Jun 2026 22:22:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Tue, 23 Jun 2026 22:22:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: scardracs@disroot.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-Ett620pfuG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #52 from Marco Scardovi (scardracs@disroot.org) ---
Hi Milan,
yes you need to revert my patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
