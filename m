Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955A71FF7C7
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Nov 2025 18:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763057624; cv=none; b=BrERVM9KCA5df3iq7B7gLLlN782Y8Wa/K7oIbLq6bURMwFsoLMvg81zNGWNGcMQdFjjwFY+XDsptSUIktmaAzV+M0T5WUN0AH0Krs9e3HTk+KKNEvjE7Qv+nY5yhqQgv62n5AndtHhJwXyihxyqyQNIBIi8o5P03n9fbOR5mrkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763057624; c=relaxed/simple;
	bh=xAT56QCwiDxWT4Vw/+CTNW6DmqC/5M7fVjkA6PgPqCo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KKdLParXVeNdZYeDir5rdawkUjB8temG9f9r5jAcF345mY3vPbLGuVGfO2SqfGYXJNEhTylSNFOrZ5YU4BI/httwkbktVATTAbTEWHSyXX2VD7/+44WrOAEA0TI/vm+vrqaUvqTEynNnYpS5enG+NvGcdrKcREe3qzg8GXFKOIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpjPWwxx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpjPWwxx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D14CC4CEFB
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Nov 2025 18:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763057624;
	bh=xAT56QCwiDxWT4Vw/+CTNW6DmqC/5M7fVjkA6PgPqCo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KpjPWwxxL+Jw3OagAmPzvXk5UzroxbX3r5bmHkhtkfA1wUofjzOkOCUeTP+eDFAb6
	 BpmzZzNXWDToUrgRdd7WlwgLMwCIgcLSRTUsBfaeTWyUxgR5l7H49xZABRJYpLVEnJ
	 2mlUzybaN6vRAVqj9ljKoCi9ySdWulVZnA29uabBnqyMkBtu54LnJSBHYcerwlZdBQ
	 UICt2/FIQ2tpkvwuY9HNwTvQdZwgYLSHe3t81q/LZi+2iaWEvpZvSr2/8BdxTF+GCR
	 RLj+J8DIn3fQW42Tk2v30P3WFYPZ6sH85RF/ktlDXMSSKdqG3V2MtvCadB8ptvzs7b
	 enh6b77/jb2AQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 02DA7C4160E; Thu, 13 Nov 2025 18:13:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 13 Nov 2025 18:13:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mail@lukehmcc.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-wYrUEQS9eO@https.bugzilla.kernel.org/>
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

--- Comment #143 from Luke McCarthy (mail@lukehmcc.com) ---
I have opened a case with HP Business Support. Let's see how this goes.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
