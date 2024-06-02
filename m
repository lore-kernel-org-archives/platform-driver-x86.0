Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4284C8FB
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 16:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717347040; cv=none; b=I13K2J6AeZQvWmX8ssSSVCkO3p/wZ8KZ0UKhNo4RmCnmBc8PNDg3SpyTv1P7AN46YTYPALwOxcHktSxEsM5m5d+A58H+nfpWvEJduPMD53+JafpxlRIOO8gPTmSC3IWVzw4mnR++Hh0HL9vpqg/MBLmomP2pEqXr8iIzcZHwtI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717347040; c=relaxed/simple;
	bh=nO0Uonh5JHwDWqOTWNN/QnmU8cwcPbGUovw33MTTJMo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tTZWQPiCAaako0oFJTF5IHbegZVin24X7EK1CyjzqkwibnUJ9C5VkQNski48myGNBLOHpmx/JNncMVtcQxXLrjCdfVEHLGaXATHrVUlWL9t5PjUu76gxDkTeFEAWDgJNMwthZXe+cKYb6S1Db1CcQ6E9m+oeXpsOlXINPS2RxeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMTfP14a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMTfP14a"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24B7CC4AF09
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 16:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717347040;
	bh=nO0Uonh5JHwDWqOTWNN/QnmU8cwcPbGUovw33MTTJMo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gMTfP14ab6Fx3DTZ/V/MLSZYw3owyGR8yX59Q74efd9NaAlx098oXK3CIBgRYr7A5
	 8nU5aoxlA/KBlfxkoLwONJF5/CX4JWtojkMGU69oU1FBmrfZHJ2k4afHpoNLkT3I4D
	 iQjpnKLNnvERuvqi71zdGu3XcXKOzJIHptgmW4422Q4tXC8TrLnwuUAWgrJ2J8mOdk
	 gVq8Dl8QrSM6ayAajnyLTNVkCA+S0S5sK+Wna2j1gjwFOCfrRk+rc7Z1W5rpF/UGIl
	 zpfe/EbJYskgONR8Eh/hiDTDFNylmanh1OA1ua0Ur5nFz71XbLzxNyZcVK/dXiKXjM
	 T7UvucMlfMc0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0E1B4C433E5; Sun,  2 Jun 2024 16:50:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 02 Jun 2024 16:50:39 +0000
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
Message-ID: <bug-218901-215701-GOt9QQdKTw@https.bugzilla.kernel.org/>
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

--- Comment #22 from Armin Wolf (W_Armin@gmx.de) ---
Could it be that one of the FN-keys acts as some sort of airplane mode hotk=
ey?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
