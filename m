Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C95325482
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Nov 2025 20:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762372856; cv=none; b=EBgkF1GZoRxt41EUFsO+xGWLHge6eaUuOrUKwXCgRt68j5NKNgjNK1r9qa+EIGSN1GQHzHraZ+qv0Y5W8Uh3TJWeqnTl7Mj/sCrPDe2F6RKNqUWS67QjCSU+AfFx6KDInRR7O6/6iSRob49adqotTWFJ2E6yYarTJ558bdfM6Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762372856; c=relaxed/simple;
	bh=b78/d9dJgvMm9uyR4WmL44r99JuGz7vOwPfLn4HPwb4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rhA/vMGhmPhoM2NM8+FuQaLZGo7rlQ9u3bE9etNOtOv8q/FBeOchc4Opk2hT2bjATde/Z0um1T1qrC4TfnV9tYVlGM1/GAqdkFJS9+5LH06QQy82VC/Lb2eJbDUT/uTmK8eySqOf+tUv81BZhsAVc2Na+2uDHKhuVOGFaN6x5iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBgwonGc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBgwonGc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19A77C116B1
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Nov 2025 20:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762372856;
	bh=b78/d9dJgvMm9uyR4WmL44r99JuGz7vOwPfLn4HPwb4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JBgwonGcdxnfbP3Gv6nJJOpRa2DHABUdcJsXJTkFKvlLu/l6Rikc82/OkWUNYfMmF
	 kIr1R1DZFQPX3/gxWPjayPMn2t2ztj++TslJowOL8a7zGUeiRW6H6CmW1EfcqlKtis
	 hTKtYxqOybKnTjuLoLdvw0/THHNWbRDSlIUTun0OazZ64yLNHi4N86q9MGLfWY1dJ5
	 nwKVhLXktJmCQLht3BYh/IoyOOP8Mzc8tT3CElFqyDhgU/K8sl+6BImb60TtzZyeoC
	 S5cfNzEg62gykImCr3d1vcVUgNzZPeR62yC0ItKDcodKi1b5gKCC9xYOHu5ESyMyO5
	 8H5jY9PQi5XAg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 13EC3C41613; Wed,  5 Nov 2025 20:00:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Wed, 05 Nov 2025 20:00:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tobias.diendorfer@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219904-215701-rnoEVOsauc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219904-215701@https.bugzilla.kernel.org/>
References: <bug-219904-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219904

--- Comment #12 from popy (tobias.diendorfer@gmail.com) ---
Just for info, they released an F35 BIOS for the "H610i DDR4" board.
I flashed it and the issue is the same.
Up until now, no answer on my ticket on thair esupport page.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
