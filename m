Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3661459FA
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773582972; cv=none; b=nsL8/9sCCWB/pc5/r1WDjftCLVXS1OFaS5ERHBS6uPpTkLErwL99YWQ0VzTdtL0DpBgBbpFhKBtC2XOK/g4gwVvy1v5jL8S76Xna9haCZeWnwldrB8ar+13rHliYI9zcEGXsdatXVswfBhzwiUxdnk0yQhiFl+WhLmvYq94rkvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773582972; c=relaxed/simple;
	bh=SxiGsze6/GDwOh3WThETneLsfdP/31w976OZttoIMHk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IUIuXcR2z+Joe9xSWZpDUbRB0gwEemjlVgng/4YoEoWs26DCPWp32h/xkhOtEGWsG9wp1lgj5A7ShWTdtHMmwi2ZK7VolZ6u1M+5Sz0BA0PF/eVw1dw7JYzTaZK/sirvrWnkrXDPFPQEx3wd86En4U3gxE2Uz8dhdo1+KQcquwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEQl8Nq1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEQl8Nq1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0A0DC19424
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 13:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773582971;
	bh=SxiGsze6/GDwOh3WThETneLsfdP/31w976OZttoIMHk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BEQl8Nq1UzyVZLfUCuLqJfhEZfztA0eY7bXIATuDcdtg3m5o3lIihkA7g6l29XY6r
	 u/vgd/D4mHv31nJfSXonnYnxYsRDlY2IN5Db6DRxFT1xErA2SPtrIPIdLkrTbC35BY
	 DqxuERhJHvR5IrQY3zzTRsLlNoEhOIz8QV36XPD301VCqBv5I2Oo7+2gBLQsqbmQxn
	 AVUYhclAMuXrVAr5Eb9+yJQLXm9yuwgbLVgn0/Z9UdvcHyJLq6SiW7CmNU4m7pY+Xg
	 wMCelyHa2RaEuXShtEQEgcvQZPF1lVLNP+yaafVBerf1mH8fBRkXVikdqc7mT0yRPo
	 AMipL68uBPXRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C048FC3279F; Sun, 15 Mar 2026 13:56:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221238] lg-laptop: Spurious ACK and dropped keystrokes caused
 by ACPI method calls conflicting with i8042 driver
Date: Sun, 15 Mar 2026 13:56:11 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221238-215701-IPu2nsJYS4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221238-215701@https.bugzilla.kernel.org/>
References: <bug-221238-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221238

Armin Wolf (W_Armin@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |W_Armin@gmx.de

--- Comment #2 from Armin Wolf (W_Armin@gmx.de) ---
Can you share the output of "acpidump" on your machine?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
You are watching the assignee of the bug.=
