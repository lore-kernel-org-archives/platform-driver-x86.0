Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1122731F99F
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 06:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282188; cv=none; b=hh28ZzT7HkddJIqijUaUhjTqRpu6TzoOkhcaAX70rD4Xu4jLPY0/Qizn9newIEpRvAuyKJSFbZ3ewiFLUiWm0twQcYj7h4lAG5SN4eJKNWbaPAstATuhn0NvSkpZ8wBAc07I+rXL1C65OtBLVqC8E1rucqtimQ+9XpxjKv+Q/rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282188; c=relaxed/simple;
	bh=qr7ZWxiA21lrpb6wSSaitEWe6RHmzcGNm1cl564dJS8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NwGgtTdobcZo2LNiVsfhGbZGF6HEB7o7H69VrKT1x0tl7mtzf4mXbE+oMJSamj9iH+FSd6usNXrfl1qSFlBrCQS5CX7VsXeISphYur6lbuXuJXKHU7O9c4yL6niiIiUSGquPLmIgDZhaVY9ob4ZUFZV9PVgyfluRH0SwYTGFUeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qmudoRaE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qmudoRaE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96C0CC2BCB7
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 06:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782282187;
	bh=qr7ZWxiA21lrpb6wSSaitEWe6RHmzcGNm1cl564dJS8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qmudoRaEnu9S1UHmq3085kyyzPioSJDFztinudpUL9JHwp5HaLHIscokOXFEwbB4S
	 g1k16wOcjrENur9AWB7NK9fVLi70qRmkYL7VMCw1YX9OtsOOg4QmQVtMOhRTip5aVH
	 PD1y45InAN4Y5G/N4vMrlFo/beIDLdp2m1YnbAb7jTB4ywap0gdhlTAkyZTqSBbH88
	 0QGTDZamvNFpFHWqU6SoxhY/4qGBohBY19eVJt34/MMIKyt+W4LxqtWZYxIAsrNqOt
	 uj0q9nCnJynwmwdKxoefcYCRQDKXhmwf99nYTWgLA8q3y7CGkfjoBAIYqczDTyArHM
	 wGuapibJsI2EQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0847BC41613; Wed, 24 Jun 2026 06:23:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Wed, 24 Jun 2026 06:23:06 +0000
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
Message-ID: <bug-221569-215701-QMxDO1uxp7@https.bugzilla.kernel.org/>
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

--- Comment #53 from Milan Oravec (moravec@ukf.sk) ---
Hello, sorry for that, here is full dmesg log from fresh boot and with patch
from Krishna only. But output seems to be the same.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
