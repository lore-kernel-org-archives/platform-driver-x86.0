Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC1F1A6800
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 May 2026 15:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779808743; cv=none; b=A6qvhzNyoHAyqugAARq+TLVZOtDq9GOt4bq/6pZZ5RLg1Ncki5rMGhqCb++89uZPSzciZPGrZMPXzjqjCZXPHLcwEq1WEkn0j3puTUBf4lT2VbXaoxEXBSp4QWwEG1NPFgol5MvlrXI1HuKX3yq38KEpQx00Hpyg7mVkiyImsOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779808743; c=relaxed/simple;
	bh=7OmEEeqiMxjHdImqD/fov3fuYTR8Ss1/JtHjrlf/cL4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U3iQMQRME6IW9lEOdN88/xf+85bEJflc7sulo07KdtHhRcBG8o6DR3m4SbdpPOUe+s0jMHlBniVdGd8A8g3Wuw1GzRM2gRO2rwwJaJCCHScZSNo80UAPHker/FVaq6u7p+EzNV+QaY2jmqkCdmZd275cjfY1kHuozC1yUSHgxQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2zoVlGH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2zoVlGH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5891C2BCB3
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 May 2026 15:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779808742;
	bh=7OmEEeqiMxjHdImqD/fov3fuYTR8Ss1/JtHjrlf/cL4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=l2zoVlGHzHBKM7PZbZ0rdqrQPJpilJNBfQckAJV1W/5PvPKChOhfJ/3apGMrehF9Z
	 KWNwPq1vGQ633reKTeZloeCikm0mY9FaDNU1zHtlx8gIuPzZE6nEQNmbekI4U9Ia9o
	 ov6G3FZrNSd/Ium+JE23B2HYkRNyZTxGKaD/RyT1bT8hJsaxfYyle8kY9qlmTYKE8/
	 06IBWiy/6Ki4b7kSgGecnW6j12shQTNi5d0NyoUgJuf8YrmseKvxCvxQOG0D6NLT24
	 ngDUM1FPS7JrEOIW8B5hDrdeproiAlHG3l/J0XlLQWafMK1ng/pflVmSr5uxgZnzuQ
	 +hzvn6OcJmvtQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C57AAC3279F; Tue, 26 May 2026 15:19:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Tue, 26 May 2026 15:19:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-igtICePt2B@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #2 from Milan Oravec (moravec@ukf.sk) ---
OK, thank you, I'll wait for final 7.1 and then when not fixed I'll do
bisection. Is it OK?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
