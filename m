Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9371953A4
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Jun 2024 12:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717675767; cv=none; b=iQ+Q963pcz64q1jmZRCjTCHU3BZfGvLadb1BPKa5qxK0a2XFC7pL2BQ+cm6oO0Lhu0umYm99mNpOReOSIRe2UmCsqrMW8Wiu4a7Gw4QlofC+Rf2hlk1f1EXf/dtGSjM7FAuslgSJHvEBUixMf9eTJC4nBYKeLX/QWDn88NrjPRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717675767; c=relaxed/simple;
	bh=qdrgSswBbs7wry9VeRWkbkX/Y3hA+paQGsePCSU9kiY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Df1zl/W3AkEhkWWrFf3p/HZXAGFhAPRLsUq4DWbv78Cz3/D0gCdeXDJUaZfhZLJ1KeMf+7koJiFvCybZAJV84H1PZyhdDDq/bEzRINAWeg+yBL9VQkCo1wDufmSGiMyqBjVHh3xwidLoUpbMkUkMi2sa5LIHcAA5DpTTPEN09o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGVQnyqM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGVQnyqM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1CCDC3277B
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Jun 2024 12:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717675766;
	bh=qdrgSswBbs7wry9VeRWkbkX/Y3hA+paQGsePCSU9kiY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FGVQnyqMMTt0/Hj0vfwByq2N9owya9mj1iqUw1cJQXUN47QiitGxitcISDigk9EXT
	 c90uZteYLPaWZQemrEZud1IUsmyNzgWQtcmhiqDxQIHaEKfriNkJoasuFRZY3euGdl
	 Zk+xic4D7UX/lBf6x5teMyu6nSpIfFLJp/qvAvsxLPNTKwjTx3RsNIT/0ycTQU/ykJ
	 EG6mTHwwZAQqstPd8E6eCPW5H4A4cErL2KE5PDeLCkykpgHM1UKBqX0cN6feNSD44O
	 rcoWhiNfgfQnV+F7l2OsFdvqghJZVB3EGYyMfW1RVd3coaFKS0lflVVEFWzDhbd+A7
	 n6u8ZOkvyGRAQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A3817C53B50; Thu,  6 Jun 2024 12:09:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 06 Jun 2024 12:09:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: agathe@boutmy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-VVb3Z1y44X@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #45 from Agathe Boutmy (agathe@boutmy.com) ---
(In reply to Armin Wolf from comment #44)
> Can you test if both modules work on your machine? I just want to verify
> that the changes which i am going to send upstream are correct.

I just tested both, as far as I can tell they both work without issue, dmesg
isn't complaining.
I can correctly write and read the files in /sys/devices/platform/lg-laptop=
 as
well.


Regarding the reader_mode one, it might be very subtle, I can't see it at a=
ll
(I'm colourblind but not in the colour range it's supposed to affect) but my
partner who works as an artist and is very peculiar about colour choices and
nuances tells me the display is slightly pinkish when writing 1 to it so it
might just be an issue of it being a very subtle reader mode.
FN-F9 doesn't seem to affect that tho.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
