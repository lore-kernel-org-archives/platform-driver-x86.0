Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6D827F005
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Dec 2025 07:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766388284; cv=none; b=ntXw6kW2O5yX9Aog1WR1X2xDJ247aitaeZRTxTy6lRs03g3MpEcIg9Px/AiAbZZAYcadWhwpphjufUW9O3bcevaOJP+iqM0zQcbpy+JuXRph6XC5X5IpQ6sH3UyP5J5Xk1CNm+AwBvEHRdGtXWFsqOrgHDxjvLx/AUOqxopXzgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766388284; c=relaxed/simple;
	bh=VE8+CUvIcVEdV17s4OGYgU2oKneN5/8ZoAZUy9HGnNs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=okf5sgQA/17kmKQMy4XDQdy8B5AhKYPxX5JbGuC+wdpwqiTretJZCbGSVMXEU8CxaLlNcQEVdRA0f4/Ab63jPHyzrYdtfW14UObMTs1V8+yLX7qsAay/AS7ezbEpYyq5Mxj8OmmmjUrQoH06Kh71rbDL/HNQXIsT4u+74upQHDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMJtaVE/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMJtaVE/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1DE6C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Dec 2025 07:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766388283;
	bh=VE8+CUvIcVEdV17s4OGYgU2oKneN5/8ZoAZUy9HGnNs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SMJtaVE/P0HYSCHOaOnbuwfrff4hB53Mdd2IOS0jMgFgZER2d7rMgZVI4a6jM9sib
	 0Ye9g50oGMiWTpnabxjNnC4a9W5BJI51KokSIapBuyj2mciz7OSdItWah8XKx4r2Yu
	 C1FZUGuWpQ75z24yTDwIjO3qeO0NlQrcZEEvfIJbVIOLUhxDZ28Nebaf+FTDEvdMa+
	 fkAXYdgfGHc1o3uGIwppc6SKViKdMr56EcUm/Mv1aSgsKv1///FplTfw3TW3kofRr1
	 wWCWdsTygRqaVu8LLKO166ApjuoH1C1xqSXhViA3cyvfgA9BQBZS9wCRTHmHxKN5EX
	 pFaln0Xlx8b5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BD052C4160E; Mon, 22 Dec 2025 07:24:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 22 Dec 2025 07:24:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rdunlap@infradead.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-219495-215701-TA8ZU0gKMQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

Randy Dunlap (rdunlap@infradead.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |rdunlap@infradead.org
         Resolution|---                         |CODE_FIX

--- Comment #77 from Randy Dunlap (rdunlap@infradead.org) ---
Patch is merged:
commit a3a860bc0fd6
Author: Jarkko Sakkinen <jarkko@kernel.org>
Date:   Fri Dec 27 17:39:09 2024 +0200
    tpm: Change to kvalloc() in eventlog/acpi.c

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
