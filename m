Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439143148A3
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 18:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775933822; cv=none; b=bnfkkTMUoEdzMu/+H+fydPMXn8EHX2O4AxqwECF7c3nPMFhyZ4nnayYnZkCFXvowlgNCe6WFXD5x7JCalsc5HzKza3L0BfS31xb+2s0n+djG6t+6SjMrWrQh/WjUOKd6M8xOetW9hLVCjrP11ffHu0TguJcnQeSuGN4vxzCFObA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775933822; c=relaxed/simple;
	bh=k9ehWrFA5rhCiQkGgtf2Vcjqg0gKOufjImVSI9F8u/U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SDoRv3Umv/14fc0/Q1iPeoHpMzYwvuLsAsZ04K8PpkmKFZblwmP4D8ccn6Q2c4eCSmw7VxnohpoANfOdUbcfGDjSPgfs8XvZk/E+HAAciOaFgHAmHtXgewu42xftiBkKyZ7jo54Va0aXEbCJxStUkFPxDay8A0LeV7PrntTcZcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4yaINON; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4yaINON"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7665C2BCB5
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 18:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775933821;
	bh=k9ehWrFA5rhCiQkGgtf2Vcjqg0gKOufjImVSI9F8u/U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=a4yaINONgo8GDiALaWSVALEYsC1eNX/O9HJ4yS78EvxvztT3R2Q/VDqlCQ2kwl7F0
	 LM8f4mGYnR5FkXTbym4D/swu5dU97dZthZd5O5eNUn2/ijowEJL+WUGExcOBT0FYAp
	 U7ykweueMvvEs0m6Uc6yD+Z2jT+VQAYm5Z8aPl1O2EmqVO6z8S5iUpYwvpazR0NCiW
	 /mUEQ+KvrPeUv4B8GIfLdxRq3rKU6Pdc70ifr6Lu89U7Nummqf5BMHaz0oTjIhFIpg
	 lkcdrBx7iJmkJ59oIGoQNSFFipfAIITO0xwy+266Av6j2fMQWAfDPsQ7zLsSBAPePm
	 tMdFoKtuL4e8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C1A5DC433E1; Sat, 11 Apr 2026 18:57:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Sat, 11 Apr 2026 18:57:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-4PiW2zkKhm@https.bugzilla.kernel.org/>
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

--- Comment #59 from Rong Zhang (i@rong.moe) ---
(In reply to george.stafilidis from comment #58)
> This also happens on my Lenovo IdeaPad 3 15ALC6 but all I did was change a
> file from 1 to 0 and then back to 1 again with a text editor and now I do=
n't
> see the error anymore on my logs and preserver battery mode shows up on my
> settings. (I don't remember the file I opened I am on Fedora Workstation =
and
> Preverse battery mode did not show up on 6.19xxx kernels until I made this
> change.)

Then your device probably doesn't have the FW bug.

Seeing the warning message in this case is not a bug. It tells you that hav=
ing
conservation mode and rapid charge enabled at the same time is out of spec.
Writing 1 to conservation_mode clears the rapid charge bit. As long as the
warning doesn't appear again after tuning charge_types or conservation_mode,
you can safely forget it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
