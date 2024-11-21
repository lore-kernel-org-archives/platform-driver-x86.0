Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5E11CD211
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732195495; cv=none; b=DxHdJFH6gaYJiN+4XN4xJn9JkJcotfeIsEEMzR85XaltA+mWm85KPgK2l0tb1e6QwfFkNPqzCR1HNSDhTQVXOP/GjnQDAijg2WlidsGTfWpi1hKOV4fxzPfdVX7L3T3UNQ3+F+7CCwjucs8gsUP3z8a2ujxmE8J/5exOk/rCFT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732195495; c=relaxed/simple;
	bh=n8vfw9Zc/bCzHVQoAca5pKXwJfwAleFhmjRX0XVpVfg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oA/oFB69Xf27WyPtorGPwecQKAc6Zr8KUNyLtqWulI1tA4400qsc/ZXhGeGEfgWGlGDrxi9YQue6Ez2dKkGoeUkI7tVIzYUTAHEDVvbAoRqVicjEQMS5hfb0esJSP0/mCWARYEBeIjeGM7o7piiBBLmrKAR3Bb1HdLO0sYO68to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odlMHWi4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odlMHWi4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CB36C4CED0
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 13:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732195495;
	bh=n8vfw9Zc/bCzHVQoAca5pKXwJfwAleFhmjRX0XVpVfg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=odlMHWi4cX1Y/tQq/DDo+2Vvh+yQ4F4p73dpom6lcdupN9L95atKVCeV0Cx72Rnw3
	 bXb53eW1XtBi6XOSGUdSuwBVQtrOBQM8sZ8XZnFN5/koJ+fKeF5E6VEXfQHxCmsUje
	 h+umIAqK9oLMO7fFYao8WuL4pgqYQMr4X44f9ibZ3teXi77Tg3gF+to9ElhXSSiuda
	 TmLo5GmvSeUZHAa/8NcpRxFLjMjJvJ2ruJlZgRp+aOF8bY4+/EbJMKda2AfPqXJC1D
	 lg4s/zGKUJ488kqJoPbRiOq2NvupL6piYV+0eP1+rnwc+WB2ycr5IqUncPmbZNRsQr
	 qx9QKsTKoaPQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0AE17CAB785; Thu, 21 Nov 2024 13:24:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Thu, 21 Nov 2024 13:24:54 +0000
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
Message-ID: <bug-219517-215701-HnKiPQakFU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #11 from Armin Wolf (W_Armin@gmx.de) ---
Can you check in the mean time if any BIOS updates are available for your
device?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
