Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5313529A0
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jun 2025 00:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750292241; cv=none; b=ktcM1sFM5TdqSD02sxT6EpU4sx4LBczpZQ53snE8XGHbWlOeMeZj4ZQl5GMEbUSg6outMXV+ep3QO3EiN4HV2CK+G2kJarRayu5U89rhOWZiyghgC8mQJLhooeFp/rwcF3sqCSxBVm5QqpAforWZj+FtGanr5vHwKRXlbu2K7Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750292241; c=relaxed/simple;
	bh=D8Qz0WdTiXmjOaJYxxU0fpZUVoyj4jTd3w8aJIQUw8k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Py5oSpLvnGxJ13Oi+hd3VRlFJXzLvMi57P2OpolD6fSzHvD1PDf2LofQj1KT/4o8e2k7RiyELT8qKYiXfiBRT3UhKvEWRXMHSGeWKa6IGchus7QEs0Aphd+j+OTXLICYnFnXVbT1Dduj11UL6ZnPsKCHZiZ4dY3iYePqAOrkfiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IT10QojR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IT10QojR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF5BEC4CEE7
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jun 2025 00:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750292240;
	bh=D8Qz0WdTiXmjOaJYxxU0fpZUVoyj4jTd3w8aJIQUw8k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IT10QojRP6tVfw0xxE0a0cA8efhqSbDwHpODcdirJIFgOyFtPJleB0krdAmI3YevJ
	 1R4ov0IfcmPDCWKHuvRxzkvqcLoVMV2ySUV/thsEb9g7D70K68XizFI0GwK7VMc7Rr
	 up3meR8c6VRIBul5FKLpVPh1ZBVuqZpwfKELF2HOnaTup7Ob1G4nbkKNM8FeQ+DqKb
	 oTdEVmWwE/RmQE+9avaS20PvcFcvIT+0hgePrLDbDSC9jV/p1KZkH0LPsuSnT6RlMi
	 Rrv7qlLrCVCpfnx6M8ud7sI+yV3twTH2GIwqW15FigPqg43cDgYRR2k46iDyORiGQK
	 DG2u8cm+fqIVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BC6A9C3279F; Thu, 19 Jun 2025 00:17:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Thu, 19 Jun 2025 00:17:20 +0000
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
Message-ID: <bug-220246-215701-7XvjLdDQQA@https.bugzilla.kernel.org/>
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

--- Comment #16 from Armin Wolf (W_Armin@gmx.de) ---
Alright, according the the example code provided my Microsoft it seems that=
 we
are supposed to call the enable methods of WMI events even when they are not
registered as expensive.

I will prepare a patch to fix this, can you test it on your device?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
