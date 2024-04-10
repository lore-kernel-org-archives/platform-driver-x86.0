Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFB9288AE
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 05:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712727357; cv=none; b=foVcnYLyLR8V0EMq+B1pHpRyEvr71F1Ji6Uzm3YXqgjf4ZKwVT/qm8nfVq0I+LFh4QDJv2HmQPfbY1LSDVrWgW3OZHCV6Lc5EzAZUgCBdOV1PpS4RPiFnc2ANgTsapW4Ulfrsxm9GCCJAiQjZVenf1oLXTeGoxn04GB57ATO+ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712727357; c=relaxed/simple;
	bh=uBtzaoCJWrsEN0+fvedofNBRBNY9etl5S7zS/r7GUZs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oo7/enBZsb7wknN2z4jbtnHhPIYt1okUAD9mXpO03U4PWr4jXh80ufCQoaHfr5XV4Kx4SQte5w3Yk7cdp/PqQk7UjWGmnic4mNSrU7jaZhviv2WBMtAhF9hkdRjm0FjGQhghRGT9ZxAO9zrTp1TBs0tPwEiEtslotVvb33aCjfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jyni6rFp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jyni6rFp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54A9DC433F1
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 05:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712727356;
	bh=uBtzaoCJWrsEN0+fvedofNBRBNY9etl5S7zS/r7GUZs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Jyni6rFprgdmlGSVvpbLOyHL8NhXrEOVr1SHBRP70qK7J/0i+XXVig0C8DnJLgdU3
	 eazh778hwvYOtQVcDo7iIuGDnx0y/IjCgSum7Dw2zlBYn+q68ugfGKoXcQez/7TGco
	 fd20VNXqHWmkqvvxx+U0LNOsHYay+Ex3yr7cDSDdCSS7EFUizll2qzekJxInnmPXDO
	 UmoHHV8kWdBYdY8Vr9IWUFxJxGHOaaww0t+T+Qqiv8uQM7UwtqCTSOZjDJeo8cfhZ0
	 VK1LlNEZLOqePwy48TqXcw7rggasmNkDvQBVW7XShWnBRzRF4ud0S53VFJFj2FwHkg
	 09eGESf3vvOFA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 45E84C4332E; Wed, 10 Apr 2024 05:35:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 05:35:56 +0000
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
Message-ID: <bug-218685-215701-YficMqo73J@https.bugzilla.kernel.org/>
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

--- Comment #18 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Wait; you're not changing the right thing.  You should be changing
/sys/firmware/acpi/platform_profile

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
