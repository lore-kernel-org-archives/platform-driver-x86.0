Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67451FF056
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731502056; cv=none; b=hn7QqpHfgpJ5aRIoRfqF1UMU6J7r86BGOsdRzp9bKh8YPo+RGbZ2c6nmuNeHQ+I+WIlWcLsivXqRrctV1GVcqUPDqqE5uafKa16J1xOmXI8CowzQbkTIlF+oeua0z9U7uMeMENCi4wU63qKvaD9eV6VYlZB+VulhSRnuQSVXvp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731502056; c=relaxed/simple;
	bh=NTeVZ3WgGGo8m/q7MKXRQZtQKOPTHIKfEDZnE4QIo4k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aE2JlwfRPAGxmcigzI7I/K68Hwy9+qZs/bmK0QpErRochyOuaoXR9B9nYeu7EI/NjX66YWvRmwudS6yX6dbq0NXjNtGNF9AJRLqn5X4Kt8MhosineRegdYR+SCsz8VXDKIIq47dgfAKZ8oSBHZq1+c9TaPLTYlOlfIfe7Xy2afg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jnvfq+XO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jnvfq+XO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F710C4CECD
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731502056;
	bh=NTeVZ3WgGGo8m/q7MKXRQZtQKOPTHIKfEDZnE4QIo4k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Jnvfq+XO6pijmIny/FLAdiiqIPs9HG9qTtByG4LasEh4avospj/POPXPaPeC2LAuT
	 HYo+SI0JTVZXc48cHQgI3Hl5BtOHGIPN+gYB5FWIxwm554Xx3kLbKZBitlmaXDS8KD
	 b2tF13ha0c6ncnhXB9dcEfz30vG8h7l75q2MjlWFaZLXwIJsCwCJ/5BPnc0Na9Iy0i
	 P46+v+G1+hLDKFLgfb6IQmuL8SRsDTj0YawQ7WAr7p8NBDXZ/2vsPFW/6bEVAzxLt6
	 ugju9Tk+zxg1R8anVv97Px+Sst17dy1EdsvjH95cLk6IBcfdV2ySxKbokiHFvpv/D5
	 lC8qrqdXQFc4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3CBDFCAB781; Wed, 13 Nov 2024 12:47:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Wed, 13 Nov 2024 12:47:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-18Z9NSVwWa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #6 from jarkko@kernel.org ---
I'll enumerate the questions because there were many in the previous commen=
t.
Ignore the questions in that, and answer these instead (just to help you ou=
t):

1. I assume you got the binary bios measurements after applying your fix. Is
this true?
2. I assume you parsed the measurements with tpm2_eventlog. Can you attach =
the
unparsed binary instead?
3. I assume dmesg was generated without workaround. Is this true or not? I =
have
not opened it yet (because lack of time).

I think these three questions should be enough for now. Don't waste your ti=
me
on previous questions, I can deduce answers from these...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
