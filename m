Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1FF170
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jan 2024 00:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705710103; cv=none; b=PWNJ8b8mQ1FZu0k6jM84npTUCpKI+64kPbPdXXoKfZMkJX4P3xZ1mvfDvezyKnqPqr5IJKwW20Z27cmvIDhr1XwF+2A6YcIajjErcLQnM/qRSdk4j9zDuJGS9xoF1ASRLaiDKtqB+uqJw8+/RHVhbjQlOh0xJh3epq8Y7UBrM4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705710103; c=relaxed/simple;
	bh=nj3UDayATAVqsfeU7X3gKKdiXBKlJOC5B8tMNrC8wzo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZddSbItTlPJO0w0F+M/Xm09fCcDBeCim7HawozOj+KPot7BtUVoT9BBxSlGmt06QmK8A711MWafnSmujm+cvjd+APRtoDbappomyFmwNzXjXCcUpbkiPlBFDBZgAyT5Y+ceVjnqkuCkZ8BKDa7U7Kpa2EtD5uBiUrNfrFpXuvmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rubub8ff; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rubub8ff"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EE12C433F1
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jan 2024 00:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705710103;
	bh=nj3UDayATAVqsfeU7X3gKKdiXBKlJOC5B8tMNrC8wzo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Rubub8ffKjXf6C9A/CoiJrF18WzvpYHJu44oz+i7ywSeHDrsi48+D/HZ+0M0FxfE1
	 ucznJJI1Nwh52/rynoo16OKLHWdtgltMW355f4C5jKXkInNCm/s2jsTUeFKRWfQ/0V
	 7WUbt54mX/Uwx/1ARhDfE7KIiqVISjEC0shr/86UI5ilHSl2+IWGTwKGjqsdt5eKLf
	 zbEh93iJTfBLxc5H0Rn56yFjhWebwPDwG9yPrmuMFcUS6r7Set+MpYeCvr4/THUiwN
	 12a791t09298BGyFGFXnWMWsBwfUP2W/6W5pkjBpdnJ1+XFVPVNtQH4maOd4SAi+1/
	 3KbGEk9jDnMZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F40C7C4332E; Sat, 20 Jan 2024 00:21:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Sat, 20 Jan 2024 00:21:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-UKzbktX1R7@https.bugzilla.kernel.org/>
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

--- Comment #20 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Can you guys please test this and see if it improves the situation at all?

https://lore.kernel.org/linux-pm/20240119113319.54158-1-mario.limonciello@a=
md.com/T/#u

Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
