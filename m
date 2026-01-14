Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FAE322A1D
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Jan 2026 02:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768359400; cv=none; b=JapxfDmle83J/qwb3Fm0uloB24thCNKz3z9d8VWBlGO651+dO9hr9VF+bd6Z5nuUW09oVCDrDnZkPJE+v2SeBn6Gb/GgscJlTmZ63AJkmnGAj50cp0ZUOgco2YodcFC+1E3turIj3s/pezNAYuVUK12oo9rrqnIgXj9kg0ktSDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768359400; c=relaxed/simple;
	bh=mD6JtTVNd71pgU9KT7CQx2ebAwv8ls+ap9BXgDHAd1w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=urwJ9HZkcGQEWpJm5/nvwPsfqC2rCoFnvGvbLyxzAxEeIF0e5P/c+geMzQ3W2ZoGSGVCLwE7Yb/D9hhp+mjv3KT4qCPIJULx2oXLMzUD6oI4KK3mjhXSDaQKEIGdyQFCpsejwm3jkV2/RQOrEzfsadaohFWjbfPxpnc+kwnBhz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geF+HAbc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geF+HAbc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C111CC19421
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Jan 2026 02:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768359399;
	bh=mD6JtTVNd71pgU9KT7CQx2ebAwv8ls+ap9BXgDHAd1w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=geF+HAbcj18cB2QKRImc42GTQbXmKoat3lEto4hv6qiX2G/Z7lSKTE+kMKiYK7mFr
	 7lTSaExld+qEzfIS5tbZj07yU9dbrZLH2Nv31lfY/yjvRSqWWA+gZTFd9WlJUEKw/F
	 6uJ9AgjRzwVYJp9APYl5yt/Pz/S9WPnyFqLJM2CLlmEfKpaKVwhthkKWFP/OuOEf8u
	 6pJpaUiuxhUzGyhSkmV4N/p4D8x69jOSkg9kt6dH6x7ceUQzoD4YtRC/jQY5BdhFNn
	 67oC2rTN3tLvJCTfGgyr0O2k3P4i886fCZDavwYg0nQ4K0vRm+3T2NDyaX6Y8jSYSK
	 zf+nn/uG+ZwFQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B41A7C53BBF; Wed, 14 Jan 2026 02:56:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220978] [DRM/ACPI] ASUS VivoBook TP412FA: Fn keys send unknown
 scancodes after resume from S4 (Hibernate) on fedora 43
Date: Wed, 14 Jan 2026 02:56:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: monirloucas@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220978-215701-3EltMDQuvR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220978-215701@https.bugzilla.kernel.org/>
References: <bug-220978-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220978

--- Comment #1 from lucas (monirloucas@gmail.com) ---
kernel-6.18.3-200.fc43.x86_64

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
