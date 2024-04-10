Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A4C15EFC4
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 14:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712759054; cv=none; b=KMaXzM65DEAk0K7888DRhZqTiPQTFmS6DAh1zSVfBeWImfT97M7wT13Jd1R6XPuhaFxvnV5pV43xGSqlmH0hXiUIML5bDLOv4C6f5hJDb8nwuplARuaR8uiYxVWexnmR9TOoj9uEJ7Jo/fnIZ2hBTSKgrS9ph0p4MiCH/GGu9Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712759054; c=relaxed/simple;
	bh=zDc96iTId5nan1kZhmcrS6tLdEFJN3m+iQnINJAm/hE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D51FOGRXi/cJL0z1wCkLWkmgWbrHd3B1f6PDKqxBNuWbXcV8lzWH4C674YF2qBprVfSqeUS5TQ4A1fELSZrcuyNeQx+NE3SspnQblsdPolWCF9tOPjcgTiTbt3QaBv6oAHKYkGcvLd8gS448JVq1tfrbmLrqqL8X9Xu37GMbiZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJFgY70T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJFgY70T"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85905C433F1
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 14:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712759053;
	bh=zDc96iTId5nan1kZhmcrS6tLdEFJN3m+iQnINJAm/hE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uJFgY70TWPkTjCn/3pUNwKiooOprF2A0N0MEXRfTH6Qk3RHszal8l9pdrTVBRCQbr
	 /4UonP7cEZiUl24MxGFsZ9ZgOeVhlpe+5I8f8D+Sd9JQxYaWpnPJyu8vSbZAIP0R49
	 CqR8LX8hRNxZw3PGx10usm0OOBQw7n03Z3f+jXafkx7xbC320lkKj90Vi4+uuYl6j7
	 Ud/byozE/pXyPhhfCAKFzb/qrScG6ViksdVFPqJfPzT6v7LKQshwy05fepA8D62hXr
	 TcfNEl0oRpQJtHdg5H2D6/32wqKPhl10mvx5OlD8XW7jtmo+VP1c7HALvP3Nt8mi8A
	 61aIJCwLUU2bw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5EBC2C4332E; Wed, 10 Apr 2024 14:24:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 14:24:13 +0000
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
Message-ID: <bug-218685-215701-OcjiT4Dh04@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #34 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
I've posted a quirk based on what was in your dmesg attached to this bug.

https://lore.kernel.org/platform-driver-x86/20240410140956.385-1-mario.limo=
nciello@amd.com/T/#me44972a836808229f63a8afa58aee837146f26ad

Please have a try with that. If it doesn't work, please get dmidecode attac=
hed
and share the dynamic debug output when amd-pmf is loaded.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
