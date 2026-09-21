Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65373E451B
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790000431; cv=none; b=AtzXC8t1UVanhQq4PQpWkCbEJ+VRYQ1VO5k5muyNSKGIMqS99ootN/fXvBlVmjEd8b3eyj3quXvSR2OjY1jVGgb78n9blNWGdHgTJT0qheRzq1OyWo57QpiGvkw0Iyumlv0K/wM1u4Lsj0HcqKZJ4JdbtAxviN39WTe7S3TBU0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790000431; c=relaxed/simple;
	bh=szyxgT213FDrOEeabKctEzuETUuQgamgiwFysz7h+mE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OQs5JItrG9dtjGCrXALMKQoaN3Nou0TW/1wUVA3u93nxqsTJ+9kFa4lBm+8E3sLWH6lroKuxIjKx3a/p4GFxWjUiFLoB6enSd0QzAUdb0Gr9MOZ2kq9cSBqWpY2nyvfBLoLPuTJ2MCxE2oTL0vUPyYbXMgEXUP9LQ7N+qdf8TuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kq3JqUiQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kq3JqUiQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8958AC2BCB3
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 14:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790000430;
	bh=szyxgT213FDrOEeabKctEzuETUuQgamgiwFysz7h+mE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kq3JqUiQdDsG2J/2laPtJvsZPdH4l5AWU927pIyMAUKlAobLrikPJYiG8WYJr4a2J
	 KLV7WxyJB6wdkkKc4uwIAXta7+nHUKuXYMpWj7HLU32jBIVxq+qIPSg1QV+ZuhI8L0
	 aFbSlCcNxQ0iGkn5wcBxktRQWiwH7rVs62Ff+JRJ2iAxEpQCYbPPyQpFa8Zr+pQ5aB
	 khyYefIR14+nJWbXgMnys5DKwXTjjWcqjnIyWXueEFNB+ELcIXe3Fvsnhv6X5DZxjS
	 iwRsGBw8SirzA8BODWkz20LWKhaORjwzAo+htvVYSh64Qyn/bCFMErgG3kONMRJ9c/
	 QO8r814KwirJw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 660C2C433E1; Mon, 21 Sep 2026 14:20:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221893] amd_pmc - Last suspend didn't reach deepest state on HP
 ProBook 445 14 G11 (AMD Ryzen 7 7735U)
Date: Mon, 21 Sep 2026 14:20:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-221893-215701-nxpCiolMu1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221893-215701@https.bugzilla.kernel.org/>
References: <bug-221893-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221893

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
