Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792540445;
	b=uwFST//CPrdSL2Lq5VEb03wq0EMEkowBxXLDMjfnuLXjEMKKX4TE726MFWFpdTBmvNC4
	 varcpTYoSvz2j072IStoOhY8DaEO29jFiFMxDv2WGkVDHbnZhfKNij/yymktghdTx/PJG
	 t6wk5whA98mKugW236hQf5k4E4ym4dqywXGJLPOSJdfvkgfxvgyMJo29ZY5dF856kR0g7
	 hrIkW67lL5tkwNXd14WiV2VJOesg8MUajjZ5+FqI3CUvFzq6qw7PfThobfW+fqmbFDlyO
	 4OVEsdYO7eXzK3sCzIufGFKjwuam8SDwaXpBeq1ZHepUHyUcGfnJp9dMZ9YyvvJRK5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540445;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=O61bEgmpX4RJHMbA2ReiOME53YuLJwY/mmThroXQbPY=;
	b=B2LqzASAV3P12oUSIR1QeabFMJC5n9pHWMCCiH6cm8PKzvKw5ir7dfOtYsduWNauIbL8
	 AvHNwViXhAFp021tgLYSCjR/jvHf/Rpx4MIBli8tdSl4M3o8A7KBJATkR5mPjl99jDlGv
	 LfFfOP7cbBQ1+QzErg8kGa2YhGxVwetW5LmYhbcCIpM9SsFLcnnh03ZzKGcfd7GhwD0J4
	 a/iwttylFwb+Wz8DvukLhLGBqyMShIwhP6IygpkX2Ys0JtZEuwCIa/Xu/FDRzBzYvGKbX
	 VZ4WJmxIkBpQCPP0fP251UWg8/a9PTSJatz7D0woijTcCRvghCe7ZAsjZbu8o9xhD/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SKZayqSD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2BE606A319
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Tue, 20 Oct 2026 23:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SKZayqSD
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DB025771
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 23:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792540445; cv=none; b=IsK2//MIyyeb3yaxuvCvdut9qBJkeMKm/5dnO3vlsjwA7eKY3cwNaMF68jZ330VIZtq5GLei7aeibpWY71KUjZeeQKyB6cD9xsswPr/lepOLH8PiDSGjcMZ67U7dq+2vWK+8SzkMJ5ooWS9pP7F0qAVHPC+upTGuEcesOtC16Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792540445; c=relaxed/simple;
	bh=O61bEgmpX4RJHMbA2ReiOME53YuLJwY/mmThroXQbPY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s2K6XtY0YkgFbBS2Tiu+s5YaNB+AZzP4xnrUU3S5s0gjt+QTNr4TookkjqXn42rHYZd5RDOCcrkuAa4eaB6UrOsUybO1DkC3KWO86WqhLlrsOGeVNbautDvdHdc+FKhMHkanqGsnFMDeNNHeCXPQ0G02qBJ6p3LYm3wPAep9JL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKZayqSD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D892BC2BCFA
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 23:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792540444;
	bh=O61bEgmpX4RJHMbA2ReiOME53YuLJwY/mmThroXQbPY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SKZayqSDpKcdeqPWwSB35UL40n6lAANy3cnB3eiCtxXzqeoMtb//BdsXQFEAMo9to
	 ycztdkxAFZTxKOCIx1oSFY6GrgwXDPLBVgVbjeFUWRoMO5yF/ARfqc6tZwR/3ADw/y
	 0VcqvuOchfKJ97vonNpgYv4NE91htEkDv6osahVorbYaaIWyrv62zLmfCNkoDsVKUh
	 poGINXwdHEfMpG4y3GcwsOAzu3q4PD47pB/LgcqxGWOOE9l2ioNBL99BVhfSJTXaqq
	 Oj1tJENi4QjJ5x3F/kkpJNjPUqEg4Y/6wlJdB7F3LZgo08NBMTREtJE9AHQWKImDKp
	 X6AxtsW618Irw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ACD2DC3279F; Tue, 20 Oct 2026 23:54:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Tue, 20 Oct 2026 23:54:04 +0000
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
Message-ID: <bug-222161-215701-T5eoDr64a1@https.bugzilla.kernel.org/>
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

--- Comment #7 from Armin Wolf (W_Armin@gmx.de) ---
Maybe you can zry to disable the auto repeat feature of the keyboard?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
