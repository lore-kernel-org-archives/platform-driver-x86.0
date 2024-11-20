Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54A5158DD8
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 07:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732088315; cv=none; b=c6HlAH0FTGsaRYMdSfwq3sG6IuEgd78Udlsb+dvXvL93JjOMekGm98kir57xGRwji0+mut93B6WKuFv9VK7M8qSxFHBtD222bZPjF+pYLoekyYdypb8ceaFIn+f5oKlB8yOV5A9vz8WMd9JtCWMAsAMXNH0Y2vSw9rmC5UhYEQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732088315; c=relaxed/simple;
	bh=td9opLzl3zqSxSsnl/FWRnXuBxUg2wURu6tyjRdo+5Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jWl/eXRy6mqKMaQJHtBYVc6aKgeLaPLOXNRkHyf2UxUmkkXFo2/IDLKyH0RE4hgdQUr5sD2Y2fVhJhLfIgc1n9y/+recQfTNu/J0MbUSPod8KNk0XyouQcWWbIpLm11Y0xhU9VqDGm9h/Uamr6sLDf2iprQPHNmRBBSq63bhOMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u3DTbDJV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u3DTbDJV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E8AFC4CECD
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 07:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732088315;
	bh=td9opLzl3zqSxSsnl/FWRnXuBxUg2wURu6tyjRdo+5Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=u3DTbDJVEQ6p2Si/Ch7Es5na9UFSO+AptXJ23z0qWTRM84QzFoCbjj+uPKyb+JuH1
	 IBqTE245YJKRaUBCpbinqmuecWH3XqALe1AC6v3okGDYOHLCsifE0CsAiIdneM7bLD
	 KkTfr6t0x+pPSpZ9om4cipV7YAxEdvEYSj2u5Lthp7j+pswa+nhfZyyX/Ojy0GT/us
	 9ZgAL0jyI1Bj8Y1XiXK6JT4izaVtGBazdyXRey1taOyI6KK+87uuCH1IOoaUD3Y45/
	 ZZG1DKNWottygcF9YZpZjxVi/Qk8JPxQ/vp9hHeOEwDYGLjnCvbf677puvJEVLUyuc
	 6d5WRbBL+isIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 46032C53BC2; Wed, 20 Nov 2024 07:38:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Wed, 20 Nov 2024 07:38:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-fQkk1JcSeE@https.bugzilla.kernel.org/>
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

--- Comment #13 from Takashi Iwai (tiwai@suse.de) ---
It'd be better to choose different words...

Andy, please give the kernel log from the recent upstream kernel (at best
6.12).
If you don't know how to get the latest kernel, ask your distribution for h=
elp.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
