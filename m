Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2885286A6
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 22:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717366359; cv=none; b=GDn39z+OjdxcyZEl2b20Q+AV+NE03dnsn2cwBGdKO+ynMKT6FC9GUppuTipYJCseRMtOAJpGhNwuE2gC7xHydztrQx25QRQsHGkzMvQdoRVy1CVul6oHKEi2LQPS8vOrIrC06YdTomegHSSViRLQa+zIdp4FmGKXSF0kczRTESc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717366359; c=relaxed/simple;
	bh=AXqRYzUF4Kk7X4+d+nhkYw7B/43uX9kEY5iNe2ZBVQE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FhsmMPP9dSW3OK7KqFfQq7U1/tBwf7CajT9PA0MbFt+Ff/qvhFW5Ql0j1O5cTN1hv7cR+6N2U9jyuW/c3KtmaLrNoqCrshv86WL9Sj1qZ4Qhv2q0k6VwTvXsHFcv6DASsaGUOJZvz9DK98XisCPCDX3PvyXOkzrCcthNJiOyzTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ug71Yhdd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ug71Yhdd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41792C32789
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 22:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717366359;
	bh=AXqRYzUF4Kk7X4+d+nhkYw7B/43uX9kEY5iNe2ZBVQE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ug71Yhdd56vzinPLbnqMK+2c2PlEkCJxUyu8EODzMQ3LJYvH1XfF6D7BasmipGfO+
	 LN892m41V9HNjfNvd15aD7QGrFUcwX5Wvr/cDZbXrdXOKEgpmt+84EnuIXXuFgauaA
	 2ajBGYDn1ApRVDk4IXdnwLYCXHixoOUkieVuZBefjQ3otaaN0JoMHo969+otMJidf3
	 ny1VI/WfGteFv1Ii7c2g2HiKP7fPvXwQWzo2XUTrNUDKwDoJPAxitWGiSnnH0tzYwQ
	 XkIn30w1yKU35k4JtSdj2QKi1VJDRPxWgNqtxDB59NDdFEaV8stWDAE3IM84N8IX2x
	 oqzpfGGo2YQCg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2B99DC433E5; Sun,  2 Jun 2024 22:12:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 02 Jun 2024 22:12:38 +0000
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
Message-ID: <bug-218901-215701-SFXKBkh14j@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #28 from Armin Wolf (W_Armin@gmx.de) ---
I think i found the culprit, the driver does not check which notification c=
odes
it receives and just blindly assumes that its an rfkill notification.

I will try to fix this tomorrow.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
