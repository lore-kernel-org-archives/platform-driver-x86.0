Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35E4349CFA
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 08:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302226; cv=none; b=S3oDVq/Dz5eipBxE5bd32nFxXw2sr1+8aLQjFqpn/ZurgGwUNwGEbxIafT/9mkSs07u6vW/tlC5iiITnqDq3/ix99Tcxw9FW1TXnxj6YANK/UXTDQo47nkG5PsltkrFlUUFWOonJWFIydexZeaZrwvZK8HZ0j5Dbp7Bun1CaxN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302226; c=relaxed/simple;
	bh=JBj677ZCOvxwfMj39gpd2QjDaPEG90uNKqOQ2LUptT8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dk+2Z7EaaXemrMdBXlh81TKgOvcZY+Do1YoRhnjxJx4Lc5u/i7GTOXAj/TPyAmCG+1mC72LSaTSN8lGHB2cbd56yvSATNqYnWe3fUJxSZAllclpFUpomngaCeoFYtwDB3qumPRRbpHE/htib/Q1Hqjv554YEOpT5I/pegZyRorg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kku2wQQc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kku2wQQc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E8ACC2BCC6
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 08:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780302226;
	bh=JBj677ZCOvxwfMj39gpd2QjDaPEG90uNKqOQ2LUptT8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Kku2wQQcugfFXbE9iUWjFQ6wOMeTpbMRiQ+C14HrdL2oHSA03jYiQiqZDZMHd3YXg
	 KAujSpih+/tSK19rcO38KP/1CDfmvTCEX1CrcoNe4rOchTU8LMmPVLD8nnRxX5Uc/F
	 zg5Bwe15G+5V+UFNaf/ouZg9CSob7CkgT+pqfnRJjzMGHe4yHIgtZY7iCUu7ICmIKL
	 nlPGQjdTzwyXfg5BxDAsS9g3GGgAX4+h14aYCgK48YC+H34bxZgPUS6ajTgmMapSon
	 9+9I9EGANwE4jl54NVTJQxMG/L6kjgDX/T5UqLWdU8iNZWrX0sy7LPmfRRFuuT0PqU
	 du5s9UHAQ+KSA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5571CC53BBF; Mon,  1 Jun 2026 08:23:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 01 Jun 2026 08:23:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-Dj2wRrtCd0@https.bugzilla.kernel.org/>
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

--- Comment #10 from The Linux kernel's regression tracker (Thorsten Leemhu=
is) (regressions@leemhuis.info) ---
that's odd; is the wifi temp high with a working kernel, too? And could you=
 try
to block the wifi driver from loading to see if it makes a difference?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
