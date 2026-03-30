Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD81334572B
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 15:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774884242; cv=none; b=VVwTOjEeaLDvmekHS7ClVxjckFjPO+vVJ/D38bV5LyFSsxDC1+H8zyivFHbTT7XnpR3bSJkBiG65BwZrUtYBGsAVn4KHmVhix3YfgeeqgV1qrTQSWYKeLdtvwzTDHKOm0NyrR+YV8fL2fXv+JOx6BtrnQLhWpOlhYsSqrpvASik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774884242; c=relaxed/simple;
	bh=4bVxk4o+yO+bq7fXUXEefvWZSOKMDe8deVOp/7upT/s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KOwgcPGASLuRPqyyNjMkbvr8rX3tknDeo7zHpey4ntfmyV76gHU6xW0IH19OchzzBEDbOagcX48eQ+fiap1gQ36XLo3Hla1Nt9EXMHr2pbeB550+lM/O9EUlksYVEWQkG9bfsqFyw43g6Zo8fp+sj0LoU0tivnePLw+BFNBNHOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LcX+tWK6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LcX+tWK6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84BBBC2BCB1
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 15:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774884242;
	bh=4bVxk4o+yO+bq7fXUXEefvWZSOKMDe8deVOp/7upT/s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LcX+tWK6ZPkbeHaK83ua+Y9d0PDmDl1Tc18H8ehpWo90Uzjg2Sm3i+cG/MxwKvWzp
	 KiwBASby6MpydlshWq5AWApS2WfKfKHceosn1gEQhYIvKyLPpOv1qtd8aXn9nprhuT
	 yR8B1vhd3de2tZeS6j1gWMIQv+UO/OrsgSfNgkkic+FKsQwRQw/0k4cPB8oRdU6lHW
	 +4qe4y7lv67xPJ2wQowvywJV/1vPwVkKg1P1UHsYwZEe4uq5bYzsR7Ic6yGUWXtav0
	 xgYY6BLkj4ZXtw+NOwi0qn/wOQjFg0RTX4bRNf3vxNd9CWS/nxtrKp98wrCty/lAhP
	 pL13XWJh1m1VQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 79EB1C41612; Mon, 30 Mar 2026 15:24:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221149] hp-wmi: Fan control fails and RPM always reads as zero
 on HP OMEN 16-wf1xxx (Board 8C76)
Date: Mon, 30 Mar 2026 15:24:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221149-215701-NWl6hJae5P@https.bugzilla.kernel.org/>
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

--- Comment #8 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Hi Enderlava,

The patch for this board has been merged into the mainline kernel. You can =
find
the commit here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D84d29bfd1929d08f092851162a3d055a2134d043

It should show up in the next release (likely 7.0 or a 6.x stable backport).
Since the patch is upstream, feel free to close this report as "Resolved
Fixed".

Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
