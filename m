Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9EB273F9
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761839236; cv=none; b=fuvmeszWCBEvpbcRvdI9/Zu5FGe4mV0goWwHgmue8cWT4nuUrEI2kdN8F7WmZNV2Zy2Wrl1optd/eJzn7PGpbaEinW3lH8yBu0lNmeWvhl320qek6ajHdOwABelaVodGESFjXL3F3DhjAOl0JpEWtdJdFAhR4V0o6lfOn2NT5r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761839236; c=relaxed/simple;
	bh=0YoW/XFyxLwk0+MB4PFOmXkUA6W2ZBgKbTBQ7+aF5I8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DxY1E8w6DItEe/X8W/NW3lEDlT6N0KFCV8sIDC+9r5Xil02tqlmNi+KynpyY59zHJErc2Dhy1xx0UJwDrtoLLunEdohAVr1FhQI3Q06vaEKwz/LQk91MOjlsjjHaD3w4N/UqpTU5ksOHFATMw+f5zF7vgCrze5l+X3uGWBQOPu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KH54l32l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KH54l32l"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62F87C4CEF8
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 15:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761839236;
	bh=0YoW/XFyxLwk0+MB4PFOmXkUA6W2ZBgKbTBQ7+aF5I8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KH54l32l2pev8gRl9rLy+UYhXU/RBHf23WtletSuO5WI3iCROi3csoakuafXci+eY
	 2Rn0ODXwrOUDo6inrDaOzLPRp4r53OrS76aEy/lS8TYiCDXSU4XqhKZ9iiA176CBh3
	 vpbCISKhEL/3Zx415MM4JitZhx0g9RXMExJVyYea+Uu6Sh3qwFls9S+6YPI8+q8JFW
	 M+uSfnTW1eo8F0SyiUPtbepBA3quC72FMaea4a+U6e4JZ3Vt+0KuO0UP9hocdWTqzU
	 60SSOh5aECuWAOyEtmtb7dckaav/ThuSsyQbwYYHptrEakqn8Q0zbPERyGI0h1/eF3
	 9I30I8MH4eaKQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5C40DC41612; Thu, 30 Oct 2025 15:47:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220722] Non existent battery reporting for a laptop with
 touchscreen MSI
Date: Thu, 30 Oct 2025 15:47:16 +0000
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
Message-ID: <bug-220722-215701-0Y629P6s1K@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220722-215701@https.bugzilla.kernel.org/>
References: <bug-220722-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220722

--- Comment #7 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
This should help you get started:

https://wiki.archlinux.org/title/Patching_packages

If in doubt; use an LLM like ChatGPT or Gemini to help you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
