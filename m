Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E895A1F03DE
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 13:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782394721; cv=none; b=GPkq88BDJ/OTfC2mFcfRQ2PkAxCQBuQ9hRsjEigUDRa6Dqch3jTyPi+H+gdnWhzJobWj8vCoBsmjkwfzDMD3auGUajMZUaCP7prFkD5u5YlBrmIfB3EFr/IZPmooNLRNqqiT6Oa+XDvFFFGri9rDHJU5vjCNpPW+3bY4ZFi297E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782394721; c=relaxed/simple;
	bh=Qb5uu9HUZ6Zs3OYC6hGCwhW7hksxteKhVsrGCTg3RXM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GChGb/tDr1b11EtjClwSKPCd0lTtShS4PxNZjILWPp63x8fqMGx9zMLKkKYW1j/SktoZSWCoiKcP0kV5tobhQJfAFW41ECy60P/9tp7kWhJ5eewQ3APfpPMhU+T1DkjkYF1HMciartouUt9jkcsyoPRHyxJtIyR2/DtsG3uRls0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIzFsK0N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIzFsK0N"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C5FBC2BCB3
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 13:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782394720;
	bh=Qb5uu9HUZ6Zs3OYC6hGCwhW7hksxteKhVsrGCTg3RXM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FIzFsK0N42WsFCkndAlqSVUQBY6y2HR8Nx+gWbLaqoX2sUJD1Sa4PUuO35M73RaLS
	 RMf5hYPeM+hVzsqumCNgWVG+fG8W5EIZCgzaNW1wD1Zz+/7h4hNEJnCb6ebV2Iw2t+
	 JW+B9nXuq5pf/b+YBbU20U3XDZlyPCRWZE4SbER5AKwGbaUErU4dz4dQrRcPk0grjp
	 ighLT00/t2zvdAoa1M9AGE4auivEuqVwlGQHNLHAYTiDfu0fxw5jpWKiH6zavbDGma
	 AMwOXOaGEnDD0ZPj2gkU+NYiknz4bNK3qH3U9EUCJmk7tLthz0iBmOIyb/1P4rTlwn
	 62lItnZbremCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AECDCC3279F; Thu, 25 Jun 2026 13:38:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Thu, 25 Jun 2026 13:38:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-2vBbO9VPAr@https.bugzilla.kernel.org/>
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

--- Comment #59 from Milan Oravec (moravec@ukf.sk) ---
Thank you, will try it and report back.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
