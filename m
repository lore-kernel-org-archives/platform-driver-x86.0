Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304C71494D6
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712750283; cv=none; b=Ec5dwx0450/YYBlmfFiCSgZLAs+j5vTOk7zlGUvGM7u+5b4A51Sr1qizODHotDcve77lJTs8GtE0XIdsaVDuamVqaQdGVPml8Crx6O1mxTI7TpVMRgo7+Eas7ZEMIS8Kcs/+gijHrsoWtUCWpgesVsFEZGRZFZZH/YiNLNb1qI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712750283; c=relaxed/simple;
	bh=WaxhAr3MUdVbM955XoxSGpU4DzGmKjh+irVvUgDgp8M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=glnvXEfITz0S9m69nS+KavnS6vdg0Gn/B1ZVzJ9Z5gbTfE/97gBMHNcTAK5uFMhow2GY78SaLvgxxX+6WqsylK8fR1xiaGzxVaSHF8FQhdU4B5uQZCjQMsA5qgErIfAfM6EBBAq1L8RdvTze866HgRkVx2McFj+EXXhiPBZx/pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7U4Qxr1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7U4Qxr1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EE70C433C7
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712750282;
	bh=WaxhAr3MUdVbM955XoxSGpU4DzGmKjh+irVvUgDgp8M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=g7U4Qxr1uxf1YzwJ9XCjySGmaEbasMkk4vjqqZVwsPolEWabLw/R91vuCQ1Lsk1Y8
	 GWzrb3X0oocoVYbjZaVX5HfmRH4NUSb0Ly7w8Wq4zLU0zQjL3wb0Z2VBgFpw4TO1xA
	 ur7jQn19yPEn3cV6zQ5C56oYM1TgFRvKZmClDADl4llWeoAOyI9WwxYQ1zHQy9Fdnu
	 LNKLLz0thhd/1wFVddQeqlUMNrtXMSx8LD3mGrRCzxECsnDUVUap5iRjBRosE1KvcJ
	 lwHEyfPrx7AiyQjRLYNVyel5ey4UCtTbsxxtPOT/Hfrti6H7axDzWyTTXDXng1EcsY
	 vF8uWiDoVEP2w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8E083C4332E; Wed, 10 Apr 2024 11:58:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 11:58:02 +0000
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
Message-ID: <bug-218685-215701-RZyTmKgEh0@https.bugzilla.kernel.org/>
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

--- Comment #31 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
I'm actually unsure what the quiet profile means compared to low power. I w=
ould
think it's better for Asus driver to use low power.

That's what userspace power profiles daemon uses anyway.


But yes if there are different mapping for different drivers that could be
problematic the way it was done in that series.=20

There could also be a problem of device ordering.

So I guess the way to solve it would be to make all drivers that want it
request it enabled with the profiles they support.=20

To userspace the superset would be reported.

Individual driver callbacks if they're requested to switch to an unsupported
state would be a noop.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
