Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3568F2E6CD8
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Feb 2026 07:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771227217; cv=none; b=FpssdvjV07lfL1SLYogipd0FVqTBKveCAdyzJiErdoISSRWd6g/KZutX5N8pI/z95bST5Jha5J3MF2jQEJL3nXh6XZP98NrKTUjCgOxLojFXOFdqOOixsb2Iy+Suj8M92bsMLXfkcIZsB/gbG2kXb34D5mwt9FA+8fyxqtO3sKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771227217; c=relaxed/simple;
	bh=QYtjyk4uFPDukE7zdLeRAH97JhgulXQu8xaXrrd5S6Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V3Zi7L+5k2REeSrHNNiPkqWJUtmc8Lp1V3mj2FZP8QjQIiiJxpFfcAxfCPeMHhUtVn+x3XQC+2edpFupB+2/r99qsEakkGZ+tXPxiPfWbPXPNk14I2jG3zQyDoHi43rA+PFenBPqVW8hKTTBcPGzVOrctt+SZcM4BgC/M/I8TCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIWI3say; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIWI3say"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CED17C116C6
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Feb 2026 07:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771227216;
	bh=QYtjyk4uFPDukE7zdLeRAH97JhgulXQu8xaXrrd5S6Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dIWI3saySbWi0nrn/oPkmssFLDLtRuUicCwfUZCbDAG118vCGm1Dk0P3kswajM9JH
	 PVMDRRxIpWl1rDV9sYcNrRw+04srZmV/LM4XxYcljKFxucAY+ROgGZuypWzRdWPJIz
	 G5+YKbQ+rG+OaJv9KQryqFDgrX9aVhrf1md38GM41qFjI33fe33scPdvMYO5xLaeK8
	 Kb9QPO9D23SR84ZB7eBk/H2seJTV4/oMZZmIGn0SI9An/IDylvRUs2bi+8irdzUBX8
	 2wATIkeHmE/1iEciMzwpkF6GUcItcn4adbIlHTHs46qbsqvjVCW76VU8T1hDdeVp3n
	 lN0L6/eJf+cvw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B5C28C3279F; Mon, 16 Feb 2026 07:33:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Mon, 16 Feb 2026 07:33:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220639-215701-zxpydGczOZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220639-215701@https.bugzilla.kernel.org/>
References: <bug-220639-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220639

--- Comment #14 from Krishna Chomal (krishna.chomal108@gmail.com) ---
(In reply to Juan Martin Morales from comment #13)
> Thank you for this patch, Krishna! I'm also glad to see your hp-wmi patch=
es
> in the for-next branch; they are very helpful.

Thanks for the kind words! As promised, I have submitted the patch for Board
8BAB to the maintainers. You can track its progress and the mailing list
discussion here:
https://lore.kernel.org/all/20260216072003.90151-1-krishna.chomal108@gmail.=
com/

I've included you in the Reported-by and Tested-by tags to credit your
contribution.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
