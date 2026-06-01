Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F443CB2DB
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 15:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326154; cv=none; b=C5ZuNlvqFsv9AYgSZqHrc5DKBkU3p0+UjwZAFLJBkPd3dFyRNp/bZ++f8Y8Wgyd22h1m0QC5t9sEf3o9E5kiWbqAntRH6r30T1em16Z50z9o/uPr3McyqyfaQ/iMlYBBXSgWsOOxzLc7+kk3E321ZmqpdgUSV9zK500PHToPh0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326154; c=relaxed/simple;
	bh=auQnaRDf5qia92FSZ3J+J+/uwqawC4kw0ljRgUIlpJE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K0Fu/PXy7DVpyxUY0ud21oXv6TvdZSiOrvoYdj9dRCg0EIcooRoDBR3eX8yWTFsMoOmnBsA+cU5rLjiR4FYnJHh6EzRkWvbN3C++1v5IloBEd2/2PH9LHl9U0sGCWzew+Wjs1E9PSKyBHPBzr2dAvEuyvmKUu8YXNZbGZUpag60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MmtegfLs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MmtegfLs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 238D2C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 15:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780326154;
	bh=auQnaRDf5qia92FSZ3J+J+/uwqawC4kw0ljRgUIlpJE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MmtegfLsw7aDfKnoFMPlJ7G+/X6aRWg4eJpz069zghCq8U2BgweWu4Vody/oEmk5x
	 c4F2PB2n5qTy0EtWHPZ+xQlM1q1Httvt+ZOvClZP1UT9TbRQrfu8mGWjSFoNxqTXbI
	 ywxrMNFJa8LTw4IDYds740hjxjg4bCmJgPQW/Jr4oFeMvUxTprEM/V+0qzBJDkZ++K
	 6GVCczICN2bCXPrZ5ScX75A2vwK2KbDaZq3Mw9w1A1YpJYSJRBc1rter3eN3weNS8j
	 983Nh5CVJ6qdiV4BImS444tlvzPigUTAKzbvYUhkMt9qMd7HPysaTzIOA1IS3PFgZy
	 uCw9ayjiY2cQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F048CC3279F; Mon,  1 Jun 2026 15:02:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 01 Jun 2026 15:02:33 +0000
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
Message-ID: <bug-221569-215701-ujL0CDqmtT@https.bugzilla.kernel.org/>
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

--- Comment #19 from Milan Oravec (moravec@ukf.sk) ---
OK, temperature reading from wifi module is implemented, but bugy, it is
reporting actual temp only after some/random  reloading  not after every
reading.=20

mt7925_phy0-pci-6200
Adapter: PCI adapter
temp1:        +43.0=C2=B0C=20

mt7925_phy0-pci-6200
Adapter: PCI adapter
temp1:        +45.0=C2=B0C=20=20

When value it is displayed, it shows much lower temp. than on 7.1 tree, IDK=
 if
it is reliable reading now with this erratical behavior.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
