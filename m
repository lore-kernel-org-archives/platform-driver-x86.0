Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3E954765
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 15:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734882723; cv=none; b=byp3QhehciaDmmZDnjGVNQrAr9dpnDaODcCanbHSHDQ2yI/GxqzUgO0nWY6GvljHxjqSHb14gBle9t4au6VGo37gYoOM5qk+YpZH30KlEXfnR78WKme5RUagzrTzfmlyuSTC7BKf53vsb1wXFK4hlmgWHSI31deul/sxqIJEazY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734882723; c=relaxed/simple;
	bh=8c1rh3lsD/5jENGaKPfr6M9jHFOWC/iWvpwZLNWgKqI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jxa6qlB8sQjTpfy96qE8LMiT6uFBxmr+Ala08EBIdwD5V6W2hjVFg4E8LKCXoZQbvNj3NtXU9rAra4AfJ6KU+InTf7W2PMAN1WPDBRcq+3hZCHlg04KYj+99eo0Sl6e1YD+2qlDTHZqRauZqHrGLlmpxS2YcPXT4XxojKNFW/9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dc7lrz1A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dc7lrz1A"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71C84C4CEDE
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 15:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734882723;
	bh=8c1rh3lsD/5jENGaKPfr6M9jHFOWC/iWvpwZLNWgKqI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Dc7lrz1A/EkKsSkjxGs3EUnLbfJe/eFMA88MqjCSnHKmxmOaEbmU1IyZiyMx2m+bi
	 qP1o0YqARjlQ0N3/CD8jb43bbmdpFgMbb0YgvpYsLh1f2X6WoWcD4PijlsYEvArjV3
	 SrlnlOHfEgF2QUbc9e23AW2Co3yLi7QLJdMdCI50FccpW6TFVBn1+cffKTdXVNGtKw
	 AZlcAgT4DqfcKmvqPjIX5iYHUne8/5pt6QE2IHSCj24UwIlUl/oRTUCQIW8KsjWrvl
	 LWpaaYEw56Lb7pBUA2QJ9U+xkT7tamMs5Wm1klgFQDo3mbbzrYAdfDpyTPSxzBLf5j
	 8lPAtSRKiXBcw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 60AEAC41615; Sun, 22 Dec 2024 15:52:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sun, 22 Dec 2024 15:52:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-JSEJe0gQUc@https.bugzilla.kernel.org/>
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

--- Comment #79 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> Mario, how come two unrelated vendors have the same EC bug? ;-)

All I can do is hypothesize. Maybe they licensed the same EC? Maybe they use
the same ODM?

> Maybe AMD released something buggy to its partners in the first place? ;-)

AMD doesn't release EC code, this is proprietary to OEMs. I have tried; I c=
an't
reproduce on reference hardware.

Fwiw I have also tried to reproduce this on a Framework laptop which has an
open source EC and can't reproduce there either.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
