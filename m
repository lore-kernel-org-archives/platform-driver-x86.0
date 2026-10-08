Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6333C9EE8
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 19:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486975; cv=none; b=ONIWd4VUsoJ0YWYjdUdHqfHKD3SHC/yVfVWxelrtL39xY9AA4CnzH2nu6orNtUBhWMDsqDaK4y2E0pDYwZzFaFP35B8zX4xUKshH5Q/o4XwKLxgahQT3fnBaLHAC+snxFiYiXxZyC7vOLyDbTAfingi5kpELtzZCWavDEFBl30Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486975; c=relaxed/simple;
	bh=OSwbuNCtxFP3ZjoP1+GXrcMedCg4obJOe6a8FfRqW0Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ScIvV1li8NJMHfrO3dg71wUcT3chR8Z+upvvY2+x297gIM3C6ArOJvRDr9cq9aBbZ3MhSm6mdwxR75J1M+MJD81MEHDC1LdsaaqwJRxNbmP+TTl8pxpKpnWqQajFvlQ8eduSZeENq+h4HE3dy1OStjDKL3uQAMEKDC7YZp6jqA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WkzDqid6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WkzDqid6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 911FCC2BCF7
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 19:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791486974;
	bh=OSwbuNCtxFP3ZjoP1+GXrcMedCg4obJOe6a8FfRqW0Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WkzDqid6/iJGbUFvRwM4pJxbQ6jp9R31JSpDHM2lS4t5wGmkak0rwGPz7PHInhwI8
	 PJbMOdEpEcJLwRd3SqzDRnRqwD00U8e1kJf5YrsAXgmYifq/Gn9BoBpIKjFOZ/xHew
	 Oec9GwIFeIyUAM0bY1BFyEqblsdBfy0dfVNLR1WIZ/O8FH2XKVEGfggZ4mdaQGoH9V
	 0QwqpouZPS071I6/iSeR+6FQs08i5GPPUcXtheui+SU4WOt23ShqNlRuiIp0azr0SI
	 RJitpVPvQhKt5+HD2RVV8mBU1VVhxGd+ocqfvG01bYllzszYEKCiBJbzD+0zOeuHWg
	 s+YZrtOuvArcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8073DC3279F; Thu,  8 Oct 2026 19:16:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222107] hp-wmi: fan1_input and fan2_input always 0 on OmniBook
 7 17-dc (8D9C)
Date: Thu, 08 Oct 2026 19:16:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaeho2025@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-222107-215701-G2JxZ8wyZJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222107-215701@https.bugzilla.kernel.org/>
References: <bug-222107-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222107

--- Comment #1 from Jae (jaeho2025@gmail.com) ---
Created attachment 311037
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311037&action=3Dedit
EC dump

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
