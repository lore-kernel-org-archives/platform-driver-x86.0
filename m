Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F6328682
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 21:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750283212; cv=none; b=BXYc+778LRkStyr86sAZBBEo6c/SVJojmSlpl3/ehB5Rn1iMeV/Ix4m6DOVUfpW7YR2lgiit9DkjUsxQQrRYMUMJo50aRk5ToJKHWr5eqylxnloUjvNA9/jw9gv0OyGL9EZIvz7CL2Yowej3QNSRc+acT0ZN/sLytpSW7Hk67W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750283212; c=relaxed/simple;
	bh=R8AawmWBDEPYjBC12Y5lirl6l2zZouLgn0wNB6+nFEk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L2DM6RMMtqV8pnY5zocjhyLVr7SQO/PH5PonIbtwbFIOUOBBemO8+Gns/5un3W/cALv5UWaDZEc3kiFBfQC8J2yt7/+m1rCw4EqU4ZKjkaa8krZiyoER89sakXutU0los/wbYno1++1ODw48K1k+RP7rh3dU3ds66lKy3eAwYIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RrvKovlc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RrvKovlc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D8BEC4CEED
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 21:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750283211;
	bh=R8AawmWBDEPYjBC12Y5lirl6l2zZouLgn0wNB6+nFEk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RrvKovlcTrZMfN4zqjlEOx07WSXLD6NRPX6adk19oaqV+HBDB6qK9IfhSTMGw1pGI
	 gQSGIbjPpLeuJCjpEZJ44IYU763EwQqPdAEiNiSGroCswF8OrPmwj6PyUOxD5poC5Z
	 i8hbvJc73xI9vVoOSQ9bYR8/LBDpS06Le1ZLA5ycp0cRZIwo+9629QaepWh1AO0sTV
	 ILixaFgzvXfVVQgh+HwAHVLe9TdPvHACUG4kgoPFtaVliJCm9SdudVOd9asD0m9kRE
	 xAvAjJbR77Ao86CXKQPFMaLU9wWAt5wwiPrwrNCsdvej5D33lAS6/qYcuJGq+qHvi0
	 eyvF+EuCOyL2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8B8CCC3279F; Wed, 18 Jun 2025 21:46:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Wed, 18 Jun 2025 21:46:51 +0000
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
Message-ID: <bug-220246-215701-Qe4j6MrDMp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

--- Comment #14 from Armin Wolf (W_Armin@gmx.de) ---
It seems that the WMI event used by the dell-wmi driver is not marked as
expensive, but still requires us to call the enable/disable methods. Since =
we
only call those methods on devices marked as expensive the WMI event never =
gets
enabled.

Does the WMI event work under Windows?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
