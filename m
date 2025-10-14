Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C766F2D46D8
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 22:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760479716; cv=none; b=PQgDTdc0e+0zGUkwfAviAzlt2mw8bGOP2mwBc3TFItFmkhs/RFCUXgLglOHMLIWpciYwrvoudnb332RFIfjXgj2NNslMhVAvA2XZbZ8vJjtHeAFXGhKyqdJyiZSaWaaW4lrNEkVFm+2y2pf9dMD2WhzHzgI51qhPmbWl75R26pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760479716; c=relaxed/simple;
	bh=zOJW2Em1KOlv0cK/XcHmZMrHO1NIb+WcL5CUJ5ec4nA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LStSD0VdT6BJsWHY6JjntTcjhUGRayetHFCHBvxY9OmEKs6xhulc56D/h9hQWEA/0EgdpARtX2Q8AMUDB7UFIESH5oAA3oX1Hh7RwsB1/6oevRJcbeW3vhZcyGiKlvmeyrOjYBsbnBVdzrXJmQKLwuqOltGUsH0dsPChQKMiaAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PoKwV1zb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PoKwV1zb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46347C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 22:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760479716;
	bh=zOJW2Em1KOlv0cK/XcHmZMrHO1NIb+WcL5CUJ5ec4nA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PoKwV1zbQjH4SaA0Fx/0/xBrcRrohSAhVsBqcJaLeEkx2zUj+hBs4iMAliRpsKmOp
	 dZ0np+208MnYea06vapEzq4rmLqIPTh8kfrE0x80dAZg2BUG9Zl1SK+o65JTNDfJnf
	 Lkxd2mbK+bfbunCKXKi1Xp4H0N4vMTyXi8+65Qiu1EegCiy3FOSurwtT4GqJzlTGB+
	 0y42RN4lC94bVVqirwZsDYeoeGBS41c1Y2Wsgc9sZbsOSp6s9T26m+hxMObgF57+jm
	 k/eXWKWakdzr7NIAgKPYgMMUQJ4crTHtzzloOdMjDhUzVtlH2aZAwFnJl3pnfd+6Xo
	 celB96cJx3ivQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3FB62C3279F; Tue, 14 Oct 2025 22:08:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220662] hp-wmi: Add fan control support for HP Victus s0022nt
 (DMI: 8BD4)
Date: Tue, 14 Oct 2025 22:08:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: falper2003@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc cf_kernel_version
Message-ID: <bug-220662-215701-GQvMsvppDL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220662-215701@https.bugzilla.kernel.org/>
References: <bug-220662-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220662

FatihAlper (falper2003@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |falper2003@gmail.com
     Kernel Version|                            |6.17.0.5-generic

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
