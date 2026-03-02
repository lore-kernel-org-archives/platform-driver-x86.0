Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3777227F010
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 16:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468666; cv=none; b=nfQ05DdMFAK7fP/HbZTOsAA+kJZE9cggqHq/ukh4fQJzF2njdRBhan9Xn+okOUerCMKQPtsXTqX7J/n+wcGv0SM343YxZtR9gwAaXzvuVDfZDfePJHZmxERUhm1LD5L8XVjnItlSHcfwnfoq7HL3SGs+4AQW/X1i0VPSwx/E/l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468666; c=relaxed/simple;
	bh=ed+FjaYhWYIbQdIHNCFMN2eSVC89mJNdq0HqHGSfFM0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tgQ4tcCeNc9GO+it7Ek/hE54k2hMMBFVL9phHIqpnT5M1Niz0HIVPnhM4NCXGTMfaJHaY3vDNIOOoNIOLCLNBA2aa8/XCrUnQ+Pz68Zyr/ltjdViZCCKpMvXeX9AtMWgDrb2vjOtdsZ0jwE1RC00kJbqZFgA7SqPZy7mI2gjmlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKfperf1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKfperf1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFDAAC19423
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 16:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772468665;
	bh=ed+FjaYhWYIbQdIHNCFMN2eSVC89mJNdq0HqHGSfFM0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BKfperf1K+lJG+gUNtG5Q6WwYVu3RZRUeF/iKThut1V1y14EZQDlvNKgXQVfPCQal
	 ERfpdg2qC24u1HhnBL0k8huDJd86tg/7xBzf8dbMQx1CbHLWoCGzXhSOizrw6cEmje
	 ZW/uTjsRz7iLHr3bYyBm5cuvzBMsM/1XNW4oyqWg+PTk2kSKF0N46IaQXcwu0BXNSF
	 voxCR5jOPp2PGxX4dNPwtbrKzG9Hq63v255+PaG4RP7FuOnlQoqFWjWSOpxQhlO3Yv
	 FN++XUZdplCDha6ZzbxxcCwieb7olRdRpcoaHnL36foUrsSRo1C1jrhAI9jMnOftzw
	 vicIiwV+tIXRA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BE738C4160E; Mon,  2 Mar 2026 16:24:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 02 Mar 2026 16:24:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-D4g7Mr3NKA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #46 from Rong Zhang (i@rong.moe) ---
(In reply to fililip from comment #42)
> I think I'm having this issue as well on my 83HN laptop.
> [...]

Could you attach the acpidump of your device? This will help a lot in figur=
ing
out what's going on in the FW.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
