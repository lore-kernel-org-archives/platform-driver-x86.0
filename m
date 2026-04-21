Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0C13033DF
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776786055; cv=none; b=q90EZRBDj+tbYvEXX4/BHECnzFE09cvVF+TWyvPlt9olQ+XxBfoicVulxffN1t6uldMGkrC1Mds4pqFGRSoPnwqcdGIIpEvLGYxZZleItBONtkJo1yN9iXGKLvadmt4NlcFrNDFuQykSLe/A4dpv1om3kesslJekHD4Qvy/28T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776786055; c=relaxed/simple;
	bh=npG8oZFEGm+DDgYtx+NWYyb8XK20aFACqhzCTTOrCxs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QB5YMFa4WvSUwWU1z3Yx76mIItUgoYMFCT/3YpAnoDEXdCFDdpE1UPpdZoiY3/ma5GZrlAQNWbuqXNH8MDOP4hpwH39LW4G7Tfk6nbc1TuhjO17qyRM4BZG8MGd4859H4J+3R27BLKSnRSrxfvH738AV/DQ8mehiSb2izSoVd/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ehu6mF+J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ehu6mF+J"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFDC0C2BCB6
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 15:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776786054;
	bh=npG8oZFEGm+DDgYtx+NWYyb8XK20aFACqhzCTTOrCxs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ehu6mF+JEEE2JDE600zvFpL3gOIRAAFvqLFCgqVOOye6v/9DkrDaLgV9oivFTrsXL
	 YWaBdA7eJG42PLwoWVY6BY+W7AeFVwPXnJm06EMWDA/+0YjXksALEiL6Mony92TU7v
	 G5fXFqSP5y2glD7v395WAhwFuWcRIM3ilf2dii97dnCL1tNNCl2b5/eVZGgXZh9Svl
	 PgImrjxTHXgboW572x/v2fjsxGJFqqCuLlkPEB9/BMPZf++Q3lyZ/uimIrb5LtlC6t
	 C8R96vcmKEbjgapt2ZjQ3KURm4TYr+fCpgtQXKboloWlqWaV5x8Vb+FkIfdJnjrXvJ
	 AC/wd5B58I8Mg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9DED3C433E1; Tue, 21 Apr 2026 15:40:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Tue, 21 Apr 2026 15:40:54 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221383-215701-UxxMX5IHst@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #10 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
This sounds most likely to be an EC bug - have you tried on Windows to see =
if
it happens there too?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
