Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87DF15920A
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748281; cv=none; b=aoA2BuA67nHUfTcjXWuQvKJ+/9Zu0NGyqpYA27RR1/ZDtwjXPBeRCK0yFPYUVdSc7WDS9jHzJ4RpuHlKlDFz46ZnMVNlTEmCj+fe7UiTRrpobDgZSwSYTZDAAEaadbbAEjvMjVzzhtHy5AiDUD2l1T0ZAWVXiYW0SZPIdr21aYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748281; c=relaxed/simple;
	bh=+qrN8cWfOkEusFV0MQH7gkDZpOGtcGX79GRJIUf8F4o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q15ujt+k87vQSpEA1OrPhO1rwse7qRTyhcVUCaXtDjZiZ27dPy2IOKlh8GjenxFIIomBsVNvp4lpZXCADrOgB6NWX8hOPlGJFkee9YbmOEQATNxjpzEBlUZhWgncz3pN8Hy/atvu6n1JH/JjKP1MhMEFsyhRv/COeOhRhu9SLuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZRCla2C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZRCla2C"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3914BC433C7
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712748281;
	bh=+qrN8cWfOkEusFV0MQH7gkDZpOGtcGX79GRJIUf8F4o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZZRCla2CYxyz6i3/7YL4zHPWHBcCxIJcCBp53dcaid5vbzF3G+HMH/9bEyoF+ZzSk
	 G5y46qIyimAyRjlsxBmns/4YWtHmTcFuHg4ia6nZMXSewC7M5+o0W8PeEgvr+9ni/J
	 1WqTkYapN8PP7ifnZG36ywrOoACAQruPL7DiDh9UnAb506CgTCtpRNGh+2thnVCBHH
	 LIEDkZxPi6G+ZC8TaOharKfAp/l7s/pD1iG9Is0hCtIWfdt588PrygXhaWNABWtjY3
	 yMMjXXjOujBL9vdJdmYTnTf5NZWSzyqIed9BQSEY2gJTF83TiDLkc8RFiDsJgq3mkZ
	 BaV6jru4bX8Og==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 29BF3C4332E; Wed, 10 Apr 2024 11:24:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 11:24:41 +0000
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
Message-ID: <bug-218685-215701-T0R7o3v5UA@https.bugzilla.kernel.org/>
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

--- Comment #24 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
And before we decide al0uette did you already update to the latest BIOS
available by Asus? Issue still exists?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
