Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F497136358
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 06:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732169346; cv=none; b=KqOr2qwwEnrEIq9Nz7c+w13BdkCTOjIN8WIALmMtEJvwbwQ+tVdfSLoSx87ijWe+R2TCr/QwQ00x+6TNd5g6BfXTlmB9CtdSQ095YoZ2m/oH3C5SsmFriCEANx8H+xh1JOq/HoLJh//aK9LQVUGOhosxpa/Z0+Svq1WQOxShtYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732169346; c=relaxed/simple;
	bh=MxOzY8WF5NPU0K4hSquiJQVqXIYfYjLUvHRENGrrGqA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ps/PXJUBZzvlMQ+e65Dt5i+vEI33u8SiQ14bTsSI9HocOZjR4Nq9QugN/rWSGyDuLoo5ijFHcqCICqSOD149WK70wKUaAAqHmp4nT0dusJvOGNQpAwx91cvZFJOjSNyuQ8oEEOzV1KfreABxguCxoYsyNpNHW9swZs68MVI0FwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D38d7oba; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D38d7oba"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0E7AC4CECC
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 06:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732169345;
	bh=MxOzY8WF5NPU0K4hSquiJQVqXIYfYjLUvHRENGrrGqA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=D38d7oba851qQF0mR8Vm8s5jv5GPYua20xCVZctmTFSDVz4UcW28AO1/YKXlDtzQR
	 uqQJt++kfg3xt9l+lyM+SXr9Mf1W+e5r27IjAIr7W468LiEYQdNMjyp3SV9sAKrolV
	 sb0SI23j9ZOBjQc9oDD24F/hFbwB/n9Zi2/golfGMCshhz7IAu8otE/BBtNuSvVhTe
	 a4hVNeacjyTfSVC0lIhUJXRR+bme1fGa4tD/TX4M2EIWCSULvvTBw76WEpuH7NnUVW
	 c5AqtkXChCX3tKer2jiYf7T0st8GM841Df3y1QPRKKHc9rU8RjdQRiqG2HIFaoeLUs
	 cprB3oXfNEspQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9A312C53BBF; Thu, 21 Nov 2024 06:09:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Thu, 21 Nov 2024 06:09:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: auslands-kv@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_regression
Message-ID: <bug-219517-215701-51Gk95SjWm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

Michael (auslands-kv@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Regression|No                          |Yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
