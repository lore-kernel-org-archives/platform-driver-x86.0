Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC83B13212A
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 14:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737642534; cv=none; b=OFvCtNVQzPwarlNl81JkdZpcn7g0VLG9tZCrDNmSsNUQkuLlAS25xhAWFYDRAvp2dTTP30beJHdJsPSHMbBKk5XeSYSga0aYzwvjwQFQsEbK+yevdzMNviIIb8cdcY3LgUe9oaGGTqmY7g0QuIs9QVjJYcHn9Q84udRUlsUXF2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737642534; c=relaxed/simple;
	bh=MTF2Wwij/nAYmvtYVGK8K1H1IGWBhZZT1mUTk1PXe8k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uzOVG3gIkFeue7ZXMuQMvUc6M4Ooo5gxM2NuZcSUHY5sdTXlkG6Yn8t1g2qgP7w2HNrdKCb9bW1NUyUQ/e6Kutwzp+9/Z40l8aAzFuDZSL4jclQgA89a7MlBemMbV6H+T7Xt9/rdUK9cxm2OjiZ59eznALZ8qfCpSPYeDFXQooU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HUAzKNO2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HUAzKNO2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E4CEC4CED3
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 14:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737642534;
	bh=MTF2Wwij/nAYmvtYVGK8K1H1IGWBhZZT1mUTk1PXe8k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HUAzKNO2f8O7/Qqw7DW4Cg1GG6XQne/JmRzYNUCb/bmFouUYl6/7NRSXF3vbAHP5W
	 hYIJWgLbzEVPrwsyPPG/iUWRlwo5BRYbrIDlShdVAAWzS59SzxeH6pZLkWOBTP++B5
	 ulXF2WAdj5gq1+b1QtXuzqF9/5E7HBI7qAqZL+D38gaHmOz0oHZXphfiNdPZYq4T11
	 CGLwlbjyvEaiCNUa5P7VPyxSQigDrdpBYRtgoxLOxnD+d6jm7JUfqiui5FMUCP2Q/z
	 e7T8vPQO7PsKGqV1T4aKn+2zPNV6c0fVgs+UjcSPabs1HvGIeynzIkyIEQRfhSDvqb
	 6kWp13x/FeBmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2B11BC41606; Thu, 23 Jan 2025 14:28:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Thu, 23 Jan 2025 14:28:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-BB8WX5EGHD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #76 from jarkko@kernel.org ---
Placed into a PR:
https://lore.kernel.org/linux-integrity/D79BYW5LF81P.3S7NLCWK7RAL9@iki.fi/T=
/#u

So should be easy to pick for distribution kernels once Linus approves it g=
iven
that then it will have immutable commit ID.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
