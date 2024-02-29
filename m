Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C880D13DB9B
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 15:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709220655; cv=none; b=XzuTiinv8ZlkyhaRcvOYG+OJ0Dg7Ur+sOCH88bVvs1v9h/CHW0TMdA61VEMG6Nm6hdP6OLSU48ZesPeIdgHjogjhTpJ7bwKWOF2/c5+iY+Uy1BZ1kNbLGjJxXvFus4Vqkzavx/B9dabYXt5mqZh1duQGNFBGqez/5nOoCREaXAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709220655; c=relaxed/simple;
	bh=1e5wzfLK7T2VBjYPlV2b/krL+ulZw5K/Bivtfj5Flfc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gp4NCNOlyxoXwVz9b5K2tFlP2owTEPLKBwbspFIMWtC0BEYLLZ/qHqP+wMbhwlo05le3pje1kth62RIPRWzSzh6/iLbwFhgcHDhyiSsl72nejAawejRnXLFI/Z7loXwwfruCtnQNgrY+V4e3zP3ir1N1qfRjQPKxUsiVA2JUbEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=omwpCaz3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="omwpCaz3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5923AC433C7
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709220655;
	bh=1e5wzfLK7T2VBjYPlV2b/krL+ulZw5K/Bivtfj5Flfc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=omwpCaz3oI4oYgQSEcP6qdNKpPLg2W5ZAOESCzBbQHanVXObuaBmNMbyG5PWZT07T
	 ISKxIDJeDSUiZJ9p7rARfGKcJR4X8mrdQ+QNGcIW+lNLjGXCm4hbtl/SULlpPWHnc7
	 XFfiOFfUeZq0L8v6Dc1jHLUDwvK/D0HCVGSzOmmbjI77EDvQuoHGgVa+7ojlmLijtR
	 KWhQH1SEmJooGVuLW0W1sWMEPkE7MYGqeFraX8UeOQzLAHDRfSS3wL3RTR+MMXNDwy
	 Ca2l2Zhn2pk14eCst/f4uMkVXR0zA3Ot3H5nQqplPX6h/U9dvc2emZPOMAy7Kbgj7d
	 xpZ1vtzFlv2Bw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3A05EC4332E; Thu, 29 Feb 2024 15:30:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 217057] Asus high CPU temperature / low fan speed
Date: Thu, 29 Feb 2024 15:30:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ted437@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217057-215701-iC8WNYJ4YB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217057-215701@https.bugzilla.kernel.org/>
References: <bug-217057-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217057

Anthony Rabbito (ted437@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ted437@gmail.com

--- Comment #6 from Anthony Rabbito (ted437@gmail.com) ---
I have a similar issue on a UX5401ZAS ec_probe doesn't seem to make any eff=
ect.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
