Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0339D40DFC0
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 03:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773976576; cv=none; b=VrZ/EjaFoAK7aRTTDr7i04rKHCMCPFwXFt0+uTkFPAoRd9o2KRCASdY/3evLJpDxV6S9aRsV/Ll5aZYco85BAAlppPkkrlef0+U1FUTv/VGfFfFerTjIil5ov7K+yi6xCsUbtp7z4JvBSAPZtHSlwZJe7wsvZHSPLDcHK/3ZFbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773976576; c=relaxed/simple;
	bh=d3JQRdn1yDM+9JvBBS7yYNy8AnVajvHYQgesmO5A7bo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s41jAEMYNjg1pqtHstkvgKU/FV8OOgJv8JNEeVBZHIF3wyrIO7/nrVpy1D0CfHuyRjGCXJqWxQl8SwmTJf0FKoVrKGxXY4UNKcEzMs95oB2iG/Z53DVpLT5+WtLzjKt4UbbUxcyFSTKRmx60H7tZNlbN/mKlgpAK/9B+sYlM3yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aI8JlYVF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aI8JlYVF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90BEEC19425
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 03:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773976575;
	bh=d3JQRdn1yDM+9JvBBS7yYNy8AnVajvHYQgesmO5A7bo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aI8JlYVF6CFnMwLsRyBR6tJiv3HV68634wUJ9c/2qlz0bx2TQmJg/ylacefW7Vu/t
	 OxdHIdDRv51f55hIBC458Jf4Wet2wihTHiyaA0ad9k0PefH64+46lWgMXfVokmtT+A
	 7dokVhtPAESHzLtVjQ1PUdJUQq0+fetBkYaIGV1bWofYL2zpOHlu9Mt1VDT3q4O4b4
	 Y63x2icH/ikVXnT3QeW2E0toW6PzmoE+0cjK0Sel77INgGFCS+eD8Id23IWtOv0bE/
	 eXR0uJtKj0tsYR2JddFRxOykcxrTd53H8iZKk4kBkUP30eIkPjjPbp3MU6KFqvQUnY
	 zTCVMt8gRVTaA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 80742C53BC5; Fri, 20 Mar 2026 03:16:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220473] Linux 6.16 doesn't let me to shutdown the system and
 sometimes to boot it (lib/list_debug.c:35)
Date: Fri, 20 Mar 2026 03:16:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220473-215701-5GbDwfsORD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220473-215701@https.bugzilla.kernel.org/>
References: <bug-220473-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220473

--- Comment #15 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
I don't follow.  That commit fixed list corruption; you're showing list
corruption.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
