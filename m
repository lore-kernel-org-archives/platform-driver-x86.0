Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793729337;
	b=CWFD+Y8ePiQIhPT/VYpFhdBuT1xq7hIS0FBeHiLh0zLS+X8wz1QeWVzxRf8uq7sJnV/v
	 5ixLScIdL9T80SD9EKUqk5dQuXcoiESXFASbsXqXnvMzVf3IWkYN8CCM5SDW8Cm5FciOR
	 GBWLEZrpPrTf3hsxAIrPVXGYCWtEiPKg3gCMlBJh3osi98Bkq2SSjbrIbkj+p09H1OdlQ
	 w7aNllUvFuYzS8yds24ZjfTJ2oIj+UTbXI/3UsBWTxT1lFm48TPZamHOOGvikFIm4bqBy
	 ohTPslyVusEGJZbXGdhIhHasdosG1gkcbN6RPP9S7b/qf2XfCvLqd6BViZ6bdtCVGhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729337;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=1NIrsn/E0ZN9MMIy/hk4lmJf5OWY9zaFsb6Ye2g1iOA=;
	b=mzl1l8iOZgoX2Gj8qErmPUn5307OwLfHMW8hWPNiXlIRGKGrNmVeGRMM9nL6z2P/undd
	 Lh4borO3W+l6ExBwj/yzagCcOzIzdYvN+m6smVRLkcypPxvs9C/vWU0L/dvH+EtWZGIVU
	 chnWwkEHLb2JDTLEaOAcvCrmvNWXzzeFOjcDVKT2tM31ruN1jbHrIDqCVdghK3mHI47W6
	 2zxsG9zD6prOOqGDYjf5cqj3HdASunBV9g1ov+se9vP/nuNQJ2XeuQpd0/L++DSXcAYch
	 TeQL4kLc7Li7xWAeO+XqET5S28y0dPLml75aL5LeIta0jb0gPP6G//4FqsL/fRzT87w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NEPZ50SG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4F3606A324
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Tue,  3 Nov 2026 18:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NEPZ50SG
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EB96513C0
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 18:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1793729337; cv=none; b=ofjTOfk8WMC4ZhuAOE/KTurNE8CdkOrA9NL4wZ9zISCZn1+ZW+yZ/w4IvHZkl2PJFg2kheNIOKA43OaoVlpb0OZLKi80utacs4CQtEA5CK/r83S3gz5HwUQtSKGUTQId/busg4LBA4CLEuff9Y9hLrsD5bxqzLCGpbsA3wXrww4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1793729337; c=relaxed/simple;
	bh=1NIrsn/E0ZN9MMIy/hk4lmJf5OWY9zaFsb6Ye2g1iOA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Acs+JXqeYV4jhQLt5PMNKmjg9orFHA/Tt6JVNBAMK5LzSPADv+GZJ+Am7ARTtnPi8BMMxiv/JY0gx5z6DcKJuNZVfBgdJy121fbC6buqsFRESg1W7a0PI7f6PUp3VllZ6GwpAxCcFXHpuIehIXMvCZOXtAaKFw+on858Yav766Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NEPZ50SG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DD66C2BCFD
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 18:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1793729336;
	bh=1NIrsn/E0ZN9MMIy/hk4lmJf5OWY9zaFsb6Ye2g1iOA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NEPZ50SGhBIMtKh+JrxVVaTIyECwxYzpq5Dyw+ORRlsMcl4wWAdGl9S4AaonFpIG2
	 hCi8qYskOtEUonsOdYQxdlfYxHoEcoo2I7dKBuJf8mQz+mE+NyS2gpYhpWqAAjqa8B
	 IDConu5faBJ4Ui1QoeFMzl8tTuo8VwPhUDKD5YWHkbYSVQ7RRF2UNiEHBieemhi4o3
	 c4CDF6g38Y67+AJbfH9mBOThseHQJ3SGALFyWxWUegntVog6oLuh0z8DpeDiqbWTDF
	 8QqAEe7f08DhqVZqGdbo5INTZ6zRk82qe2raIhRt6moCSatkRwt5HEbip3niCz79Zk
	 AahcUwCvSqrOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 233B1C4160E; Tue,  3 Nov 2026 18:08:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Tue, 03 Nov 2026 18:08:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222161-215701-mhaQVwED9I@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222161-215701@https.bugzilla.kernel.org/>
References: <bug-222161-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222161

--- Comment #17 from Armin Wolf (W_Armin@gmx.de) ---
Ok, i send the patch upstream (with some cosmetic changes).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
