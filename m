Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEE83B8BD4
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 10:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772187453; cv=none; b=GCbGl/3KCXeiYUxCZFt4L2UVUA6ZjtRknoCNQnyp90R2SlCvjCowqUs1g8eBUEoRlx/JWI535yG37sCmDgOiYwWuP9vhnNaGJazWZBKStfuPOqbH3c7XYq8E0NgpBXBc7HMSkmakznN2m+wYEYI7dvn4owGOaBBrGgop4ALyjNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772187453; c=relaxed/simple;
	bh=SkpQSO4l8X9F96cNwgwNwX37n8rCYh1hEkJcNdjDhT4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k4O4aQVfUyWRqvtu3aF1X7HbQ2XeXlfM6urpzNk7wt7lP8n5uMIJ+v9FF8Thw612trsio6FywDa61/4SD1VBbynUm5+r0K6atVBX1T8/sLUGI3DESYTWmrs8MrDXcrkIWJK0JizHXb72KdZJUX2P+pWC9RrRI4XYvbnaAt6iU20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dvSZiyK9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dvSZiyK9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0253C2BC87
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 10:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772187452;
	bh=SkpQSO4l8X9F96cNwgwNwX37n8rCYh1hEkJcNdjDhT4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dvSZiyK94otUZiiJXLGnHu85lPr3LKsEzxFXOk7LkvTRAfwTVFOkDIPNNK18mDtmc
	 U2JYzS7XWUHiT0VoHYFkjotAF1jcg2K2QlV1FKu4ym6EPEpW6At3po1R34dHlN7P2n
	 XEl0lhDALygtr0QIK/8EV3XFVvnz6zp4M/oyHNr6aifmTqB3BJXh/qVaKkyc7xpe/r
	 Mi67ZId1pknLl6wyZmStmeyjLOI8rqKt5duiYSbn0mjiEg7P716/4pGVjwxkOZePgC
	 iXKXgd8mH44ULIA/ClTe4Cxnv5sctsS2Y2O/5zdp/xhMWayuE0NTwHoWkY84F5X6/E
	 ECLszwBFACnaw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C8326C3279F; Fri, 27 Feb 2026 10:17:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221149] hp-wmi: Fan control fails and RPM always reads as zero
 on HP OMEN 16-wf1xxx (Board 8C76)
Date: Fri, 27 Feb 2026 10:17:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Jie7172585@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-221149-215701-Bwe90MnL9y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221149-215701@https.bugzilla.kernel.org/>
References: <bug-221149-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221149

Enderlava (Jie7172585@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |7.0-rc1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
