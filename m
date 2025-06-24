Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D662C15A3
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jun 2025 15:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777630; cv=none; b=YzuqmJ/ojUr4KEuttJwId6mdimKune62zh81KV4FCksyqxGL7gL3mBW3dRL7BVBhqLOpb/LT6ZnNNexQi+W7eX/8xvn9+mr8q4XrnvkjqQGFJBUdqPaYO9ZDLnbUo3ZJnJTF3vAIhloQpJcNR1mCws+lY0Uw9grQflTwXQE2Ufc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777630; c=relaxed/simple;
	bh=c156r/k2bxmwJH3frnm8EiN+EguEZA7OvrZ5rmh6Z8g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PpHC7lQ13BtgMGFeTrRAUn301MdMoCnKSQZeTpfuAeNBaS1V0LlBeedA/PuM0GY3xk0MfC/1/5JF8wu0CS2c3wO5EquBQR9I3x0IEAJuU6U7mq3nrYCz7e4d9PWxVmVIFO+XgEl9DORJx5zq6aXgeO9FYX9WqVmj7lJcBHeeCBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GINMQk2l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GINMQk2l"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2BFEC4CEE3
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jun 2025 15:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777629;
	bh=c156r/k2bxmwJH3frnm8EiN+EguEZA7OvrZ5rmh6Z8g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GINMQk2lxI1HCJwutSDH2Ylo0uYkdjBZirvxOYMZZAtuIJMF7e9cnBLtna557LPGc
	 8doHQOGMsHrsOf6SNiDb+SBkXkT48mYxwjYyNT31s2V1dclg66nXCTHMS6K22WF407
	 liE0OZkmIVP3SIiMbJp6GB1Jswxbndw/2h6Hlu4RxP790D465Exoonu0pzECrh0Fod
	 QGzu8Kd1uM84gOEeMTLqTVFyALcoGZpqwOQ0cy3KUxwRdOeboYEWWZmlXsM4pZRCwI
	 mmBGaaRTeb8hVB0tAjkytMUxcWKUlzILIwDszENWv1bPWcsy52m7zCHtx44InCe1R/
	 iCQ7aFWEQDG9g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BD198C433E1; Tue, 24 Jun 2025 15:07:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Tue, 24 Jun 2025 15:07:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: grzegorzssuwaj@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220246-215701-lgCtsny9HO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

grzegorzssuwaj@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |grzegorzssuwaj@gmail.com

--- Comment #21 from grzegorzssuwaj@gmail.com ---
I'd like to confirm that I can also reproduce this on my Dell Precision 3550
with kernel 6.15.3-arch1-1 and your patch also fixed the issue for me.=20
Big thanks from me as well!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
