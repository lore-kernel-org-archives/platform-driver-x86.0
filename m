Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7908537DE9C
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777319744; cv=none; b=SiybObmVhxw04zhDWWbda6/I5lfI/rnUEmXVi7ujicCyfKNQA0wXFjREo/M6tZnqlMh/Ib/0Rv6acbm9smZjFHqQ/QL80iLxKzVubXagIxaGOos+8aAM+ZJbxIr35f7pGrSdDsSB/pscAK4J44TZAEgbidQWQAhp9WVK7s5Z8fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777319744; c=relaxed/simple;
	bh=dSsf4gM8tKDXJovX8EisvU5vTUjaYU02tQslzhS98Ec=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ro0+l+bULIkt0MJaXV3748K9/j5RlzAI45D/wDoC2dFgoiY70Egg91hFIfZCWQ5Elh1RLyeMtmI17f8BdMDhQAVbbFqd+o1ylymbLP73hLLfApodqw69LEtaMJ6YnNe3uZ0VdHcvZTShuuxf0t50DwNn7Wxi0VYMaQxKnO30yiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNYDG5Fv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNYDG5Fv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C3DEC19425
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 19:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777319744;
	bh=dSsf4gM8tKDXJovX8EisvU5vTUjaYU02tQslzhS98Ec=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZNYDG5FvvzXWvvEvHgef8A8kJS1C1CsaDPVzOP8zHhtL6IxP6QsKsVrBLJ/ShzxoJ
	 kHVexCz66pRC8eOhzhd7dEH3B//IFZmxtwcF6Q7oKWVR8GSPdA5YXn/Quln66Tsede
	 7njOCkXRHkBKprCkiBAn4hyL9/axlDVud/ALtqtRQH/0CEmklAnj/kXCj30akAW3lc
	 9iiwwSuWt+Ux2imcBhOzEUCMeQWX3oBqu97LvUg+uMq8a+v5h8dGrrRg2ETnt64Z2G
	 iuESLm/x6hANQ+Cbz6l7JP3WrPIIhxIqF/c8IaXF30YJ1v3PTTJjpKskvxg9XRC+at
	 q4/ToEHhC7UVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 107C8C4160E; Mon, 27 Apr 2026 19:55:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Mon, 27 Apr 2026 19:55:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-eDjsmqtdkW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #44 from Daniel Gibson (metalcaedes@gmail.com) ---
Great, thank you very much for the feedback!
Good to know that despite the different platform generations the problems h=
ave
the same cause (or at least can be avoided with the same workaround).

I guess I should try to get it into the kernel now

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
