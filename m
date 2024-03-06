Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5A85E085
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709719179; cv=none; b=m8eoZdeaRxL0114twa6gHrsEh0RqO1faGJ/0iiRR8o870ZgZHCy9Ek9PC36Cy48y8LfMvH82gFBkrQZ/nxx+/U2okU3zgZHFpFj6jCrayo/FzpvfbUtj+PaaTbSXnE7mCB0LSZnT1G/pM2OfkWG52M0ghrnqWEFnVZQnYrfTAsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709719179; c=relaxed/simple;
	bh=iWRSkNSWXOig1i0ZQ5/KDK71nvFN9gl30QZPTj0Zmvc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FAteRSzCSy9kGOSOhRspkthGUotgjZq6Sqawcx6ur63zOW+j9GNmK3CCf7vY8WNTOZ+xbAJunXdL1lgle943ebs7sLtn07yYchC5shTTpjaRNZR2z5bhOdK5WDM21OWPNKI4Njcw6OSOy6PmZUU8yDUfCQQ1hBBQm5jQUIz3qa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKRDO6V1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKRDO6V1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51B6AC433F1
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 09:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709719179;
	bh=iWRSkNSWXOig1i0ZQ5/KDK71nvFN9gl30QZPTj0Zmvc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dKRDO6V1R2q580lTsbDzyVMiWKB55MK9YKIjsWEkvm1tNy284ihY8WBGYeFjnPrkc
	 YzHspWTDmsX8W5VStF7BA48LdmsQhakQ/H97NNggg602b9IPK/WsC2OzPcxIlqtbmW
	 pqcclG88fWCZ5eVaTz5quMmpDSTLLLTj23bTiwPECEB/qIIvzgvPWnenp9egm7ZL7P
	 uDuNXJtnz1f4nmDhL/1sI3E8gafhHAFkE3/ZIq/QgnhNM7LJxzLA5GGlVdf5sYC78y
	 WMKYb83vADXi8XpatkquJzxDxSMmwlM1/OhATg6WsCuuAOZ/s8J9NcQMSMvstT6hwJ
	 +zJJ2+XwdEnLA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 37F09C4332E; Wed,  6 Mar 2024 09:59:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Wed, 06 Mar 2024 09:59:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-eq0XYGigKO@https.bugzilla.kernel.org/>
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

--- Comment #28 from Artem S. Tashkinov (aros@gmx.com) ---
> For the first issue, Artem can you update to 6.8-rc7, make sure you've ad=
ded
> the TEE firmware for the amd-pmf driver from linux-firmware and see if you
> can still reproduce it?

I've just added the firmware file, "773bd96f-b83f-4d52-b12dc529b13d8543.bin"
(what a weird name) and I will test 6.8 as soon as it gets released. It's
coming pretty soon.

Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
