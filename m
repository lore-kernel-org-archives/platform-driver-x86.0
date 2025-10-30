Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61472363BB3
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 15:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761838910; cv=none; b=nojzbSU9KLxl+jN8NUCzR++sKSfvTWJjRLwMVOuMhExbiTlYoWP9PS2mhwxgRe1qWXPyaTY7T9geswO0ENHYGAtAnmytAy02T9GkelrG+Z2QHchukDqhEv9RZKyG5dN8DoTSepFbBNWQqSYzIfXE/buOlGL0nW15C0D3WjPmfHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761838910; c=relaxed/simple;
	bh=c0Ii3s9MDrEs3DlwFdhGNarnYo5ldHxXyFiS0mMsBG4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SYcaR8qzEX+XA5+T3KaOxWhiXJe67ZV97M5n8KJzoSNhcmzqXXrWw8/88dbTgnqmb02ssqqLmXLsd+hX8RK5IBVE7i48bkgWfM173tjljTTClzLBYBUubW35a0zqL4S92lUE0sOtHTJ3h/F1zEwsEz8tOLOMJRMlO8YaFBhhDWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUmaUOl2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUmaUOl2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11898C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 15:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761838910;
	bh=c0Ii3s9MDrEs3DlwFdhGNarnYo5ldHxXyFiS0mMsBG4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JUmaUOl2XCqoRTUXHrpw6Ls5C39zPYtXLGYf+3NkgTMHo4+FDNIbHqepjQPLsU/30
	 l39HKvHs38i2sdrENQ2/FCJoJmr8BFdUX+fZ6V1bR5pYgpx8FFgov8OsTBtaCKtLkQ
	 sskY1BIX9cfEuOluE0SM5VdpMWpUR9+7kYATvUDDpQGrFcJppuKZr8m5uff7CwRRUH
	 ThVNN+QLPhT5RlIw6Jh+HZh2M4lB31pre8Cm2oQbahw03oxBikBrHRIQmWVD5UgLg2
	 GHBqHFkMv572N/UAtit7QUOqYASUCcWC8zDtW49WcaIJVZCYGRWgquES8hqvikWwZ2
	 HgqTA6w9aJIoQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0CE1DC41612; Thu, 30 Oct 2025 15:41:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220722] Non existent battery reporting for a laptop with
 touchscreen MSI
Date: Thu, 30 Oct 2025 15:41:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220722-215701-G04YVuuOzE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220722-215701@https.bugzilla.kernel.org/>
References: <bug-220722-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220722

--- Comment #5 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
@Andr=C3=A9:

Can you test this patch and see if it helps?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
