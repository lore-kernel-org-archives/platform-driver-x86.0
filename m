Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF7F43B6E1
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 14:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783951213; cv=none; b=MXROuuivL+JGKqzr1oNboO0O6X31DnyrEzkowG80KUEkIduEgtIbwSKutXCbyvK7NHeQtPHJTFJrQ6m67i2D5jc3SeRyj3xANF81ntgXNqREQU7MwIRXiWMkTwZ/AvvkliEbu74U05RoEL4jj4iehjSXoHmwWGnG4lpO8FmdrQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783951213; c=relaxed/simple;
	bh=naTlm9x8zeniyCIWL8iTcWygOPNSV4m3j6iqx0vMDCY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BzvxkfQrlykoGdvGyr/eee1SQaKJhvw6YLiILMQKleXFmPZSV3gVJDmJKJ7NJHNS0F7IPlM1ttrq78tOXOh+8P1WcS2Izz2j85OJ5obWAndPSViWoSUtYs1vTUIxL1ezJTRio8Q37oMUHBaWHq/Ua3qkT1X5cfhb4yDHXpqUC40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7OixQ/m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7OixQ/m"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 409FBC2BCB9
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 14:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783951213;
	bh=naTlm9x8zeniyCIWL8iTcWygOPNSV4m3j6iqx0vMDCY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=h7OixQ/mYeSFVGWpaUzpxR/VlCH+tDiqER2pvjUQg1tcMz+SIiEdJL/LIjkcE8bxt
	 Bxw+i3MazpetacKoqAuWC6HGDJgWRGozTndbIPReQe7EwxMJ1SVtKfCSJNmhr4CFUA
	 b6O7OgQufLQqQ1EwiLZZJMlm5ZbSEhx3z8JP5pDJQFvI1bVrnjoy8T+hsK5zb0xQUJ
	 Ifw8Qulusx2e91uEahZcvxQ6F2veYQWxkDnIWFWj5ymQIH980zRsU43r9P8yXAl02Y
	 m5FnS4QY3nM2Euaq15QGP1rMo9rrzC0MaWBLWp4EZjl0CcHe50D6VQpWA64BkAfb2r
	 8WKdplCBYKrDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 30C78C41614; Mon, 13 Jul 2026 14:00:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 13 Jul 2026 14:00:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-nIvuZVp0aD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #156 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
> Don't kill the messenger please :-)

Sorry; knee jerk reaction.  LLMs can be a great tool, but you really need to
push them to question early conclusions.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
