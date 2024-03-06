Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3061361C6
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709742026; cv=none; b=QYxGd+Z52TpWHX7EKgYpxtSukqYEJ3LTdZsWfZUVreC9sTKTIQqUlGS8Z+mPxmmAw+Inbc+sfZEAIBQQI/nVIc25y3hGK2Vqy+2ELnZSC6KLwyzk+8rBKa7JuAikhdysVEmXj2YWduuN1k2dVCoTAxi1YBiEnRqMo2ZLi6N+1kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709742026; c=relaxed/simple;
	bh=FP1jinns7mriggSd3jFY/9KFGDu5FbyHGU2qbRfxXm0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IFsPsRdSTU1yBw6VKBYJLuXZgEmWvNupGY3IyWeoklgGUikCSoGOwxLfdJl7/x52UYg7waDTT+mx53p8X03k87QqlHd49Iw7FIkSa8lnC5Tz11nBfZFSYE+zFSa7e6UErqbd6oeKljrLkpUMxKxsF7tRK4ll1NDL22Qbw0xvMwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldi0mlw/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldi0mlw/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21513C433F1
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 16:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709742026;
	bh=FP1jinns7mriggSd3jFY/9KFGDu5FbyHGU2qbRfxXm0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ldi0mlw/c2vXDeXk94YH/qQeqljqHS9g09DXlUV2cXnKXEf6om9OpJ5OLMeHYcvzX
	 AUs/bQGWGFIS89K1Aw2HNDZCSDoMVNE9t0RyC7N6PnHX++dybmdqHWWzgrDuefXvU+
	 4h0HGsaMdPuDnVQlsCK0Z6G1hpjUR+9xqVqOXfPaXAlzwimbQz26yQGMmiQ8s76Lon
	 j5LKQxnLjpFm9pMWUQkeBFUKaTiGeFumIrleNAQhF3adw8K9X908dyjc579ggFNbmk
	 sDKtxdL/9S0WQpcFPJkAW7FdM28WToF+zOTPTSEJPDzd7SBvse1V/wMgUY6NM5dHnt
	 IiXIH+r2WqkKQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0AEC2C4332E; Wed,  6 Mar 2024 16:20:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Wed, 06 Mar 2024 16:20:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-3JK9Mlh7kl@https.bugzilla.kernel.org/>
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

--- Comment #29 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> I've just added the firmware file, "773bd96f-b83f-4d52-b12dc529b13d8543.b=
in"
> (what a weird name) and I will test 6.8 as soon as it gets released. It's
> coming pretty soon.

OK.  Separately from that I'd like to understand what you were getting at w=
ith
your ryzenadj comment.=20

I don't know if ryzenadj accesses all those coefficients correctly; but we =
*do*
export them properly under amd-pmf debugfs.

There is a debugfs file called "current_power_limits".  Can you read it bef=
ore
suspend as well as after a suspend that reproduced the failure?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
