Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5126717AE1D
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Sep 2025 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757600286; cv=none; b=agj0abwrvmdiSI09HixQdpg5KokeMVCOWSbaF2LOECuL/Oqc6fZsKgiqvfwbri921+w0HZj31Q6u8DgqQjVpg3Q0JYQR6oXKQ++nbHhsN1IcK8S0sgwcHZcdK2N7/vFpv1rKy1RSRoF+0JSzJHZ1eyO9mTIT/VJ5fj1VqEiZxWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757600286; c=relaxed/simple;
	bh=TJ3qw/1Gi7ZEtcqri87L5DQVPeMD3J43ju5foEVL9qo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ln6XgxnCfvq1I+AP6Lv1JswdMT9kW5ks+JSNg2WPKF3CQ5lj4f8NaP8GOABfRfplUH9HAcXQS20/MILyTAaY3yJzeGcTQXfcV/CtlSUN4Arg3UrEjsH1Zd9DkPrCqZehG1nhvNXetGvReZFpku5feoRaSKPwZ4/lErdAlMqhL8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7uHZkg6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7uHZkg6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D40B1C4CEFA
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Sep 2025 14:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757600285;
	bh=TJ3qw/1Gi7ZEtcqri87L5DQVPeMD3J43ju5foEVL9qo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=d7uHZkg6CnMyx0mhjKFnM7E4nT15q8xGWWVY6Vppj9VF9KQJzqvZRD0Y543ueMQ2B
	 11sgAXS6dFtAHhp+MbTNDx1WdodMh0SGn41/f9ASL4kDZXkipsrFmze8+VClf6Peq/
	 IKG7rjttwUw68AxMkWOXwKOEI15W9Y3zIloaMbbeHtfs2jwXY/h85nf+h8X+lI2FtK
	 804zavHA9VDlWoEn8Rqp41OlVTnfVzdJ/LTalpn/imXupstQ6Uhv2+oBZbK4qCcONd
	 kyrAR8re5ceKMDYrytPi7F5UAyGwae0PlwNuly3EKCG9FVw6Man2MMLDcJeqdQ3Yho
	 W+TuBk9Ieag1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C80D6C433E1; Thu, 11 Sep 2025 14:18:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 11 Sep 2025 14:18:05 +0000
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
Message-ID: <bug-218305-215701-gUm1sF88TA@https.bugzilla.kernel.org/>
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

--- Comment #109 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
I still see the GPE status bit loop.  Sorry but I don't have any suggestions
for you right now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
