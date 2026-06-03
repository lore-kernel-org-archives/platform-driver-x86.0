Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07063388887
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 10:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780483104; cv=none; b=adk+WHCzQ1rPHB6nMoMtEIUF2KTyvT39s9TZK8JCqw8N871/TTTQw1j7f99JVgVGy4ey1DjcmYug9X+06+VCZgwIij47V0wSp8iVEx4x7HY02MnMjkGqH+xB78P5+WMKMOlAx6KkgVB1Dmp+uL3P/AM4Wu11lKHO+TefZ3bP4ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780483104; c=relaxed/simple;
	bh=l3968OJaRF4ouvL2NbPVbh0TeQQPGhF1fppPYZ7RHwM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a5gl5skUwdjq/x8/Bj0pie5DHs2FkvRoH9KCGkW2hnHH0tge454licp1DaW4EjH2IRz+LlB9+FtXU00h2JmZGn0h7a61mdNrfZTh49d16hjlAOVRtH5pjmfH4iABnpt3t1OmyBcqgMlLFcejDOfBTOStZdkCerUNNTHHcqHtSr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqHTLzSH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqHTLzSH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94F19C2BCC6
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 10:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780483103;
	bh=l3968OJaRF4ouvL2NbPVbh0TeQQPGhF1fppPYZ7RHwM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tqHTLzSHNJl3RMDJgCbGx2GdP4KvAe41PNT7aYX54mUQEYaMHnnK2Thu/5cujoggl
	 AtVqA5lG/2xwV95LJXc8ASlwrDB2t4xdVr6maGWOMs5abpKbCGDo2LWGFxbp1/qJXm
	 slX7d7HLtSjk42kbJTTooTyWUujc2KufQvZaPOoMdzp8Q5RfCJPSZzoBmrR7EHhDFr
	 pUMJHPCn686X9rqMKY8ToVZ0Wi6nDppil7lLs+TS7fqLlJuBNRCXbVV06jMGTz36Gx
	 AA3auMhGB80n5Ziv2VT05UpBs/peqXR4jv3UtGzcTLuvhmx33wwUv5rc72nJ8M+YKq
	 ZQEtIFzB39FUQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 768EBC3279F; Wed,  3 Jun 2026 10:38:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Wed, 03 Jun 2026 10:38:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-BrloQkt1nJ@https.bugzilla.kernel.org/>
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

--- Comment #69 from Armin Wolf (W_Armin@gmx.de) ---
Please both check if the hotkeys now emit the aforementioned keycodes, you =
can
use evtest for that.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
