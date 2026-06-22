Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8906E3A1E80
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 09:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121529; cv=none; b=Qji0k+JCyejveX8tOSfVkAvrwPueJe1JpNoSAAUNcPkmdjk6BbfvWRdG942Vxa0mzOxir+oVT+3oMtgJg5CI6zi4S7CW9si6TEETE6CmFKvENbxPHyDPXppcsKRFokpaI6J4Chw8AdcorbZrloUW01Dq4jnNAu7r0IoEqKyFGus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121529; c=relaxed/simple;
	bh=ewe7LB81ifzl4JWZ2nFoB5vF3JwNwmLz+5XEonjz4Wg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CCFNsQ+yDH0M+5v6M8fJDgFvKUD3wRDS1k37BtBiwT9W+osVTgrfivXlnxba6pjvvO6P8ZWsR/9FCBJxFD+oR4SP+/wFrhS7UQfhh4LrUbE6pQ8mXB+XAduP/aFJrRlp+OlR9Cdv2Twoh9x7XSPe5LOpTxteLJ9LFQyX89UHN4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1ADqUE2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1ADqUE2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF9ADC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 09:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782121529;
	bh=ewe7LB81ifzl4JWZ2nFoB5vF3JwNwmLz+5XEonjz4Wg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=M1ADqUE2s4rA2baahcGydBWzULC7/fZ6kTnrgv8B4O6VfpywNUj560U7HUo2I4mo2
	 mvAl9+CHQYSSAZQOy+qPC+PxO7VEqFB7A+76y4VSdRwkSPbYj0ZtQAitnhpRVmg0J9
	 YxBn0HdXPl8E6jz3WoPmTFzugbm6lnln9C00RgGrzIUEqC5nJjLTR0e4s+X36uh7TV
	 Yifjkv3zz9LX6Wfz+wmb+ZBlYL6DqMaCYO+V65xd+/nlt9gZIAvG3V7a6qwt71gK58
	 bfgT5EuVfQP8FgwTi46+wqsMeOXnQ2QtViYlANZfI4J6YUGzSTV8ybtCFTEumxri42
	 3e3YHNiTiUrUA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D40B6C41612; Mon, 22 Jun 2026 09:45:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 22 Jun 2026 09:45:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-Ui863I5u46@https.bugzilla.kernel.org/>
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

--- Comment #47 from Milan Oravec (moravec@ukf.sk) ---
Thank you very much for your help Marco! You have done excellent work! I was
afraid of this answer, but I've anticipated it.=20

Will you push upstream those two patches I've tested? Thank you!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
