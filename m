Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323A7137C38
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Apr 2024 15:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712678231; cv=none; b=LoVu4XNy1xNPOedcGVBiVlkmVdB/fDsrBwq4Sy1Z71ZK9JXvAVtNn1JCA0Eb6FjKfMh3EqA58hVfQUrYX3YHFTCicFgOwiFGXKM8JEpbJeLQTW1S8Ft92Qsl3FkjnB+hI18MmuFCkir6wTdkLHfRG28oIbD9k+zfm3qK4CEV8r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712678231; c=relaxed/simple;
	bh=m6T4F9tV8DwCb+qvu48ArAyeJVyom8PJeR2l40VXEBQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ORu/CtE4UFg5wJQyw0xvJ2ngLFfdP3lLU10BXVl7ysq4kBPAQm/rPi2JI7wpt1Dm0+V8WA1drO18loFhJS0x/XXR34x60xdmMLUqci92GM8yQu/DruuDiI+OyltJJIyNO1iil2ebWZnI6L6ADYr1UxLSIy8aixuBOrfKsuJG220=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dW90lNqt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dW90lNqt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4F0FC433F1
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Apr 2024 15:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712678230;
	bh=m6T4F9tV8DwCb+qvu48ArAyeJVyom8PJeR2l40VXEBQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dW90lNqtKIts4C31I0+uLoh7Elzcqrw8J/mnrYRryfGRmqPs+bF8SmrQlVLr7nCat
	 xHe82qlIHCO7JUUlpAb2eSu8nuqm+YB4nX0N3puJoLbGnvshnt9H9WhsBvJBqcppxg
	 4bXQS4Sr6hK0JVsMm0qJ1w+/CJloSKZel2LkEd2sLGN4/IPsORpwFX6FIpcXQUzTNj
	 LjZ48NdnfiN6s+RnCPwzZBPDTBYgVGGpwDwWoEE0MNrXtMshOyXMDNVMcgNJ4SwSoC
	 ZST1uFD4E6UgiB6jAFNvAQG+R2C6aEvcaK2dBbwjK2B2H7xADAb4iQHB70FqXuvE13
	 D8WL4smAnTv/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B6039C4332E; Tue,  9 Apr 2024 15:57:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Tue, 09 Apr 2024 15:57:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: al0uette@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-UUuMtR8K68@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #10 from al0uette@outlook.com ---
(In reply to Mario Limonciello (AMD) from comment #9)
> Can you please share a log with dynamic debug turned on for amd-pmf?  You
> can rmmod/modprobe it if you want rather than a full boot.

Can you tell me how to do that? And I'll upload it tomorrow cuz I'm going to
sleep now

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
