Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EAC32E6A2
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 21:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770758439; cv=none; b=H5Bz+yrmUS8qHEfJuEcGvDfhwOdiW8YEPZam/t9S2UP+rreCqAoBmwShGInlkklMxoZpmDXbhWnhBF8oqwrjV5stZlBRtbz2muWEYfugeDtDezpL4xQhAu3RIu3+A7jYpMXM78F+QsZRWGGu0rBpOTt4V6ZJtlrKi+UcjnVIAtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770758439; c=relaxed/simple;
	bh=nVa9AbgORjZ9+3+Nhj5Q83+V7zE+fAHT7iJHDivZCF4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LbpM+p/RPojSwA5RgLKY2yc+FmNPI6QbhtJy2ucqMo02Okls5XSYj3B6zmIu5CbFVVyNPZrgo+T5gPUXu+3iPoC3J3zTgJPG+3Jh9u5N009OIqb8DbUrjrv3tp0pCEm3WMNgK3UMMugrxmb5ZAcUZ1KePNINAoy7qVUmCVCNJHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qGtKMKmS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qGtKMKmS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62B22C19424
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 21:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770758438;
	bh=nVa9AbgORjZ9+3+Nhj5Q83+V7zE+fAHT7iJHDivZCF4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qGtKMKmS1iDnb/u7bQNsk4I7aW1Kgwq7zZYn8nmCBIJ2ALp87CYs+5xu6Sb6G9hyr
	 0dGOJCZ+Fjs16Q9B2txjHKEVOBqIKBxNmykUg2KwWIUI/rZzoxG/IcBgn3u0oxIwAe
	 4oUmtIe/WXZReUanKHQ2rihETCUEVwjnvyGNmKft+02uH7X2K03siqwzavOjbMUCKk
	 +nzN/TFDuBWOjdJ2usUUi1gQYGZANKtjkSNoGsOcpm3MgTCTHVG01OiYsMYAB0j2Fg
	 w8HSK2Nr03YqVqv05x1+XQv1sBwpGB+EJ+EnOKvSnws8CaMC3inVji2S5dhd1kSEkN
	 Kn/ObMtaqhgxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4F6F8C3279F; Tue, 10 Feb 2026 21:20:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 21:20:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-Lnld3de8uV@https.bugzilla.kernel.org/>
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

--- Comment #14 from Armin Wolf (W_Armin@gmx.de) ---
I think that the ACPI errors you shown us are somehow connected to this
problem, which has something to do with a shared memory area called SMA2 is
protected by the ECMT mutex

Both the usci driver and ideapad_acpi call ACPI methods that want to access
SMA2 and thus attempt to acquire the ECMT mutex. usci times out after ~2
seconds when attempting to acquire said mutex, but tries to release it anyw=
ay
due to a firmware bug, leading to the above errors. ideapad_laptop also lik=
ely
times out when acquiring the mutex, returning a bitmask with all bits set a=
s a
result. ideapad_laptop now sees that all bits are set at the same time and
rightfully complains

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
