Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EADB38239E
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 19:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780774625; cv=none; b=U98ugA/ZjmB0ER7lcQ9GRYzr0cDEydNCEtYqJZoji14MkHK0QogBYly3x3q8nbG8NwvONs8YB2q0mP9VZ3eMj3zsE3KgAuZl32zNQDFFGE2yhbRsmS/J3SX4LI74G8jWYptn3RBnVlG6C7FYlc97dnkb4kbhzeB6RAOSEoRlK0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780774625; c=relaxed/simple;
	bh=mU273zKSH26JasxPYXs9nmNfs5TszQ2WCvlcC709pdo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qTTcvCJEQ3gyQZ2IjqwawxV+nGsTqPJhQrt51CakWVjdymPhWacwfOwG/DzCZLPxK6swOzaUI41+nWeqD2aiCUtDFquzAGrU/mBGI9fCTUl5I4oBy8+t2Bv666t9nijRYzy7ltiugYNGQH/9fbCQIaZVxYerrfQ5+8FUxTx/1uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IG8k0YAQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IG8k0YAQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53B78C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 19:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780774625;
	bh=mU273zKSH26JasxPYXs9nmNfs5TszQ2WCvlcC709pdo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IG8k0YAQw44eSEb753/UoOOhXPnNRbdjHNJxYxd9IF5rH8rzq8fRhCkCKvl5GlrPe
	 tl66kXvRFRBWhbugaUAN95QjmQQ5mXOohi4laDei8VkVWtWDhmfle70CeE4MH+WxaR
	 iu9xxbHMeqmu2LDjH1v7JTT+1B71jWUQ2My4jnK4JHRaUV99R62ergflcoPc55h3W3
	 skmqfdfUnSuhyT3UchT+X/iMlauwv8MHaU6rc0+ymqo00kGRgupWfBO9YHvv+pweFN
	 34p2rsde9M10Mm4M4BiRk85980MuGTkYUzvaF02x3gtnf4xwfU2AK5N+DTPZikp5as
	 l/k6QeTwWjK8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2EB15C41614; Sat,  6 Jun 2026 19:37:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Sat, 06 Jun 2026 19:37:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-YJuqpheviv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #35 from George (george.stafilidis@proton.me) ---
Hi Rong,
I ran the radical approach test for 0x8A, 0x8B, 0x8C, and 0x8D. None of them
switched the brightness to High, and my screen backlight stayed on the whole
time.=20
Since we couldn't find the High state, I would love to take your fallback
offer. Please let me know if you need anything else. Thank you so much for =
all
your help!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
