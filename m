Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1CD154430
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Dec 2024 06:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733206950; cv=none; b=B3MtlLFe71lCgX7HgMKU+dMOPhs37OFEtxQ7gSzUzqCiLw0M33a5nF6MWc6eZHEx4UPWjvdjtunzXuQ7iEj9T36Wm0Nj5KXEHQ3xbfpldGDgyV2Kzwi90OFDN30qjgeO5Z5royujp7ATpkLoi6PdTfEb79l0ZjveSZlBFH9iX4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733206950; c=relaxed/simple;
	bh=BUGK9jqglW3SiuqkPcYa82L1VtqZ1azCrWMwQV9i3t4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J5eI4wx4WhDQrlNOubkqXcnfbxHdevuj4LwPlqzY5UmVIECouHxAS4l/o4UQ+SUOtuDmhDKVBbI909vannbVBMEsZYdoaxsuwZgsczS4sG7fG3iMx2PXQHvM8T2adkACZCb0PN+/ycilDAOGSuKDnnYHONRASfrZ+3L9AOWLScU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8inugcJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8inugcJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E225CC4CECF
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Dec 2024 06:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733206949;
	bh=BUGK9jqglW3SiuqkPcYa82L1VtqZ1azCrWMwQV9i3t4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Q8inugcJFKeydPbFjw4UZ1SteBRKePSwT8tnrgmQq5LuKtjp/OWVSDiOJvfWHFrS0
	 xNkeDzd5/ZtZ9tUwtz2rW6f+pFTImTBBvkebex5QxQqnPLASCidrKtM3Pvl5NJO7zt
	 9pZmw4M9ABx6aVB/Rl8bqWqLidFCrEqTrGGahw1oJmQcOQqZeIbhb3yMAjJr5niohn
	 BOR9H8sNjPkZyth/ulUk/nH5FyGZfbYNRgmdVNBM0DMlSvHTzRekWYEC9lPD6TZfCk
	 eNPgj68/xjruIMNKWaT7GCPyvP5PYiB1Sq5eJybczu4FfJ93J1WATjjfcCsRmJRb2X
	 bgCykjuIogZ6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CD8A5C53BBF; Tue,  3 Dec 2024 06:22:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Tue, 03 Dec 2024 06:22:29 +0000
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
Message-ID: <bug-219495-215701-Ith0d9GZ8i@https.bugzilla.kernel.org/>
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

--- Comment #16 from jarkko@kernel.org ---
I've missed this comment:
https://bugzilla.kernel.org/show_bug.cgi?id=3D219495#c14.

Looking at dmesg next week.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
