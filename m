Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E7418E02A
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 08:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734943119; cv=none; b=dvUc2c7rW1RA19kTafeuvIVwibFQr445GQQz5Lq7+o1lew6LxK3iPwDTTg7yRzACjbG5k/1tiCs9MNSvHxZDv7qKh7XyAn6uieNIZxyZgzK55M8UbolPbbYBEbAaTx3M6FM3Zi8UIHnae/rCcHwKEemtCCBaOW56a1zrSQ8+0ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734943119; c=relaxed/simple;
	bh=pypMi1rBpeXrKg2CiBjTxq9q6Aq6Jmv3eyYI6Zm346s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OlvAsIun7W4PTYMuGXElEWrbSOtSHLArX+5FZmR6xZdAzfiJTkeD7kGUzO5rgSWrvt+nH0UfFb2ivYipzk+WRNaEA2Utn5GGYPLDC1mXBGEaSQDdUHhNTBgw6H1UsOJVgaha+uCIWBFdeDfpKHzSWvxot1Ec4Sw1ejNxuZStn4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXReQT69; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXReQT69"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A131EC4CED6
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 08:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734943118;
	bh=pypMi1rBpeXrKg2CiBjTxq9q6Aq6Jmv3eyYI6Zm346s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WXReQT69uT2QaA4hchhOFFhU/nxNsy22K146pWUbpk24hXwmvVRYgcDYOl8UtYFoM
	 7ylmrP59vOEPv0puPoh0UnI9sDXnzjwJ1w0cfgeKv+KUF5yi9zLhvPqgtg7pfycb0G
	 D5S4Vdm+8l9FaFXUu7AWVIeFwUOe7vZukl6LyS4YaO7RQgZTY1ngQ/TXRdinHhGjj2
	 m5u7jPUUU9pHXw1Z21ZaXtAsLsNuBAG1KRRkQ+aKnCwXWKE99QBRCzt0v7lzt/5qt5
	 GV1fUVik4yeQORybuiOGP7Y3l1xHLsmr9Dx1O3LyDQV6XnslZjRoEO8E1s/vjr6JTn
	 c1cDtbuLxMPiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 93D5AC41613; Mon, 23 Dec 2024 08:38:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 23 Dec 2024 08:38:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219495-215701-FT1BJAcJya@https.bugzilla.kernel.org/>
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

--- Comment #53 from andy.liang@hpe.com ---
Created attachment 307386
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307386&action=3Dedit
No Patch dmesg with Kernel v6.12.6

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
