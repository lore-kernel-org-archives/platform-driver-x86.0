Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8EC285C91
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 17:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956361; cv=none; b=sXovlBJdrOdF2hEUHZws4SXfUFyNxa7XLxjniH1FHGDB8TAkOqdKTDAv8wbzcGv4j33a+RGRZRcvyEv0hgKKN5lMSG+iF/PYqxLe03nkfG91tYpUGjFIIGnVPr6auNHpiIlUDCWmzRBRbI9IhbcFp4IB/QUmVED1dyAFkHZ6Ygc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956361; c=relaxed/simple;
	bh=5WRJ05W3twTNVtGP3rSHsbFeoxU45vPFYClu3zHTvXI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wjq9w/6URXjrj+3f0xn+ATP9mDYqzH91zq9Y1FThDYA92Ag3nyfolEuuMlEi2qZGmBW+a5BGDJMIG5IunLx5BKPQHJ25i+Xm3hypipbdGO7DMu/RIh1pY23B39KxjJxwoyjphdLG+YPj/UkkNRaNrFokrAKGBpnFnWhMCuO2xys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwP/gnFm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwP/gnFm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46CCFC4CEF1
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 17:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757956361;
	bh=5WRJ05W3twTNVtGP3rSHsbFeoxU45vPFYClu3zHTvXI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KwP/gnFm+oKMWOVZ6QdTyCfbbcjhpk0VIRKpTjP9TUMTDMJ8fISjtobQ/nv7QhPWS
	 n9pf3NEsSB+o3yXm1HQl/HzRLAk9SjHcLY9MK/Dam8NaeByX7syUMX9tBGFyvOSqty
	 FfmKLlOV+mSOxzL5gv2ed/tuKhyGGmwkzoln2cZLP/naPX0I1pIs3c+UriCDiTc+By
	 8hEVyOUByIn6LXIvAciCq5FMkZlgTnLXVf0Z8PFIAhPLSeZg0we57fvt5E22CrUZZZ
	 snjctxuqGZE3k/79GRHSTQpUNg/g7yWf4xQG+7FzAMPcTvjtDMP+6WDDg58lotGO+O
	 2QahLz3vmk6sQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3BD70C53BC5; Mon, 15 Sep 2025 17:12:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 15 Sep 2025 17:12:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: marciosr10@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-W1idHKqiwt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #126 from M=C3=A1rcio (marciosr10@gmail.com) ---

> 1) Turning on dynamic debug messages for drivers/acpi/ec.c.
> 2) Run sequence to reproduce issue on unpatched kernel.
> 3) Run sequence to reproduce issue on patched kernel.
> 4) Compare the sequences and see if there are any extra events in the
> patched kernel.

If there's guidance on how to perform the testing, I'll be happy to run the
tests on my laptop. I have the patched kernel built.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
