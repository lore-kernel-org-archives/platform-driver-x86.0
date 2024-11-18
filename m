Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBF31BC09A
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 18:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731956256; cv=none; b=QCPva5nZTLwz80dtBBSdp0G+9rFw8QUUPWKKHJxUd8dMwJ0+ub+Z9t+kTjRu3w9btp3rrERLYsSdJ0tuHMxsdpSpw5a5951SoCWlvbYVMIIvyPcHym7K8TquZU/JTU2y1XHkkDVAAtfHmKghv+HFP11BA62U8jn9ceum7RlcgF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731956256; c=relaxed/simple;
	bh=xCxfQxnAQ37Vx7/ZvvXAy1xtCkZHS8tmzFqDiFtVjyE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gINXM6sR1BV0ko0SNL3JHXiQxbY73R4PM1PyWhWZAmw50bcDAlaUmRU+cXg7vsZLKCYwMO8Jv4R68beL/ubJ/U9uVUs4/v1OuPXKfCAEulnL91qwmZpjH551ApVWAJynki9f3JQVCyvXmQy/RdsxrhNciwSPXuonZ96l2MeozvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qzeTCZ9D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qzeTCZ9D"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7994BC4CED1
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 18:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731956255;
	bh=xCxfQxnAQ37Vx7/ZvvXAy1xtCkZHS8tmzFqDiFtVjyE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qzeTCZ9DJqn3KnINUi3tSXsbjKzVQvpqaYjQfOgI5Xc9qzZ1vhjcDICM1oZkJ5gFY
	 enE/njRC19/ifseICaizqPt6of5a6DnZ03k9QMHo/jlTVw6H/mU3FoRhoUE939C4Q+
	 eDZTveaCuPpO/rZxHQTg9QMXuPAuqLPfQ0sHoAYHhnb7zeIKLfhSeUSj7JyNmb2Tt1
	 FzDljEthAi2jKisPVC9c3yNEmGCBXAIFNRxFJQUQZ2DYMEnbfODNcN/zX0/MjGLle3
	 UKQGyhHTWeM9CsRLQqT4Fwc1t69XqqIrQyIypLpy9vGpAbZ9eS7FFH7Uw2noXRkF8Y
	 oJMCwHPtCeBnA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 656A3CAB782; Mon, 18 Nov 2024 18:57:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 18 Nov 2024 18:57:35 +0000
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
Message-ID: <bug-219495-215701-zIv73cyzUR@https.bugzilla.kernel.org/>
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

--- Comment #12 from jarkko@kernel.org ---
The bug report is not acceptable:

Oct 19 06:25:18 ubuntu kernel: [    0.000000] Linux version 5.15.0-119-gene=
ric
(buildd@lcy02-amd64-075) (gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0, GNU ld
(GNU Binutils for Ubuntu) 2.38) #129-Ubuntu SMP Fri Aug 2 19:25:20 UTC 2024
(Ubuntu 5.15.0-119.129-generic 5.15.160)
Oct 19 06:25:18 ubuntu kernel: [    0.000000] Command line:
BOOT_IMAGE=3D/vmlinuz-5.15.0-119-generic
root=3D/dev/mapper/ubuntu--vg--1-ubuntu--lv ro

Not going to investigate a bug in over three years old distribution kernel.=
 You
should contact Canonical for this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
