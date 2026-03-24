Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EEA3BE16A
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 18:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774378115; cv=none; b=ld+62Mpk0tSVLXfTs8jiBTIO1V9kcI+jZAifID4ZzBxEASJ5a+pU6Grqt4IvoLDz2uuWAm1CwqNFEfiP0OxfVaKGAq9D3vJKWxH+VE4dCvfPz29+nB5ssaf0cDsUhAixesOjvz7vjGiF8jDU1t+C7cXPhMKfr+GsFQEeqFTcE6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774378115; c=relaxed/simple;
	bh=4Y3Au8SBIKv15WN0DuKsgKskFTT9TdXNUKpSW8u7oqI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LdyhkYiIidJj9fJSHaF/FG2DYgr8h4v6cHl465QKTXVbm987lYh4FvE3x5s+zBONUs7edgQY2kuq7KcC9UTgZbnfrStfmGzYLFiAfVanbuQDwO2MjGVWrxW0ame6HzSuzN5yMl6krYizfdHIPgPwyeh7vVMzeeFWHJS9uZFhc5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QN5h12Cw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QN5h12Cw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5A02C2BCB3
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 18:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774378114;
	bh=4Y3Au8SBIKv15WN0DuKsgKskFTT9TdXNUKpSW8u7oqI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QN5h12CwYv7yYxiqlj9E9Wg9i1FwWkIiFi/WkV7VmY6NUdbLEmX6XvgXCeDv8+RK3
	 wOHhtjkrkA3WY3e5OSlKDE80Fuaj3nLlFUDkI+l1Hi5IaKtNtlNfTXJ15FWCCZnEcV
	 nzQ8o0aUBHF4NFXO6c9T9Tb72+KWaGdx6zxSWgTsGsrf5T1AnywqIX8F0vtZn+rqDE
	 ZYDbCTSyjz0nq8VcTL50Sh+rCkQwDzSDJZ90mJg/NPKu7hmaoku8tmTcs1xAvl0JtO
	 Y3wxHU9TMKB1y4U92KLFAYK36STvYPF6L1Sn3yIYRo6b1KPEDYGKLhvvC523etd4ae
	 6d8ZsvO78+OSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9C1FFC4160E; Tue, 24 Mar 2026 18:48:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 24 Mar 2026 18:48:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: naelblog@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221065-215701-99AfD8Dukw@https.bugzilla.kernel.org/>
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

--- Comment #54 from nael (naelblog@gmail.com) ---
Created attachment 309759
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309759&action=3Dedit
Yoga 7 14ARP8 acpidump

Attached acpidump

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
