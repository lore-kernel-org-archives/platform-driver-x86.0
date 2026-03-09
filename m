Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF2C286A4
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 00:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773017744; cv=none; b=tzzXmIMzoc9N+s7DA3a7/EGgG+kn+qHcDoM4v7lXjgVAr0sAI8Jpvt3joXZ8U6i1NOWBF2f3SC16dd6KOkbNRPNNFHZZirW5WGkJ//TdbHK2m6aj1Lg0IFE24dGbaEHrNQpFPVkc+0vZUc22s8JCpf8vDcJC8GWeA5OL4TV3xDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773017744; c=relaxed/simple;
	bh=uTRWQLtrOe1olkShHuBeeViPbTk7MrIujnFq8ET0nzo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=blzVGQDv09ByUpB4alyUXRD0I6/cijea5o9UTsRGuckcKIFGRIwWxfu82u8dYz2hSVPAzPg5x1oXsM7/EG8MXHzcTn7wNPiMVGY2qSMhbuHaKGNf84uystWpNXn2m0NYqrpUkMezgRDEuiRmNEH0GRsDJCIy+XwMziQkc4voCAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKsE3bbH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKsE3bbH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16A8DC116C6
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 00:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773017744;
	bh=uTRWQLtrOe1olkShHuBeeViPbTk7MrIujnFq8ET0nzo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hKsE3bbHP1Brpo99thjZHBhmoL1oIOHpoHImmlVIcIwz8OuQtFnHVkQ5gq2tTphfG
	 K1Pifyrg6Js4dVw4tQ5rVLJF8oObhKXF0x94ogg4Dn6ftOZd3wJCfUhYgj6Ud2V3ya
	 0iEgfAttDBXndFhzWB/2KO2fsdDZOSHN8FXHsbd6h6puwLJGegs/8FkZ4w1a7wUHDv
	 99WgSrFfwewtietsTSGKb1NgZhxK7ZiHud2XEVzpP7hOZPuQwYZc+dUtbVQL4C5pRe
	 9eN6VAIBvT3Q9SK54R01ALufsta5DrenCrLuS3tEuiW/AxWtF24F5GKBBxa6KgmNgQ
	 osLgAwj7GGHKQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0F94AC41612; Mon,  9 Mar 2026 00:55:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 202619] thinkpad_acpi fills logfile
Date: Mon, 09 Mar 2026 00:55:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jonathan.teh@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-202619-215701-icwMDjo6CZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-202619-215701@https.bugzilla.kernel.org/>
References: <bug-202619-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D202619

jonathan.teh@outlook.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jonathan.teh@outlook.com

--- Comment #2 from jonathan.teh@outlook.com ---
Fixed in 7.0-rc3 with commit 53e977b1d50c46f2c4ec3865cd13a822f58ad3cd.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
