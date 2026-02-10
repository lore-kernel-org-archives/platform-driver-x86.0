Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF771318ECD
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 17:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770746244; cv=none; b=nQZzqz+HS+N81PvaQf5ME9BNvcqOQbtey+JjqSYCXvqMmoM8A0uNGnGO9dhduGMgfrdt6/85nxTASId+o77y+oWzkjEgoz0TCmC98viTLvwLooP4kV/YpXgKDjekku2Sfozvc5MkF/84UOFhI1wt6zjC9QjcJXpeDq7/CzuxRjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770746244; c=relaxed/simple;
	bh=7Euv4yCN4jKSpO9LDOmZQYzbdNJVfnp1DHCeBjJf4Kc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L0I9qDstOkgwHhINAYkwt0u+Mxj86a1ZYDUvIjbnr9U72a0iodZZUemTSokYM3JTWE4U3LHNuXeid2fQ1IGBf4XpcF6gxlDTOFqvhZ0Ps0Zw4Zq4CsZns/tK5By1iZ7iET5pVWPVUamleHpsCzXwWi2nwST7my3fNLL021glf1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwFq9hDm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwFq9hDm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74DF4C19421
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 17:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770746244;
	bh=7Euv4yCN4jKSpO9LDOmZQYzbdNJVfnp1DHCeBjJf4Kc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FwFq9hDmYkHARjWBlX3yTdfl7fIzsbSISHX8SSSZM5aYmhYOvYHLt+HFQRWWCWunP
	 DkRzKOoh7THPeqsukJwqoN65yHnssleeux0TqS0F2ZOjK/7KknZ1O6gtsOMs2irgxA
	 4r5ru9NZpJtGvdEmo6GyvLddVmYNtZz4jjPG9I95T9n9LNlvr6m889wx9mkuehABMc
	 Cw5aNO+Y591VsOZQ9sIhjtFFcOiFK5n4WObzGITWyPBqQBMmPhXP6F0nJQ1E/J28st
	 O0R6ikrHtg7S+yNIYnFqOVHeAv7M3edhWPxy4nTsbNTxouyuRAuuz4U/JSokjUuAUI
	 TguRq2PQqz8xA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6D70FC433E1; Tue, 10 Feb 2026 17:57:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 17:57:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221065-215701-KgsR2mEgva@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #5 from Avraham Hollander (anhollander516@gmail.com) ---
Created attachment 309341
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309341&action=3Dedit
dmesg from acpidump from IdeaPad 5 2-in-1 14AHP9 (83DR), but not vanilla ke=
rnel

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
