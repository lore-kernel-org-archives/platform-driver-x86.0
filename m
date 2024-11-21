Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0FD1D319B
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 11:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732188373; cv=none; b=aNp9e166xwr2fYfprA77BKkiZSKPn8PxzcxT0kbATR/s1CyxpJtV5iksS4v05tvOykcxAkiS0hZXv1cuwRnjCLMI+6IbA20PlHaMpRqNrwta92mCpwX8Hd2hLWswLW62KCTN28lLkXsfPU65GuJoPpQS1D16CEUymbf5A4aXYLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732188373; c=relaxed/simple;
	bh=Plk1IRMJOLWAFghptFwzPQEuqeUhwO55ub25BEVs4tM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RIKtdOg0GaQwtiOI2U8Ar3tOYGWFpUPsJmSrhdDkL8mGVVSl8tD41P4fKTwfDN4JP5xgnncoLt5iypew0WFI0VC3wPl86pgsyeuGh4lFDYFu83L7B/36rS+vtv9fdKWnd0L5ky8+Wctxy78aJhdBThRbaHuZXSQjJRLb21yUZkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tfwR356R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tfwR356R"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D20BC4CED0
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 11:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732188372;
	bh=Plk1IRMJOLWAFghptFwzPQEuqeUhwO55ub25BEVs4tM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tfwR356RFLq0UmmG8KaQljijw2zJkJWwNiN6lBpfgssp9IVpNvVpqiD4lYTiAOMWA
	 XbD6QCSFHltDqfa/TmLgS6dR/DUKW1jSnt+X/u6OzoKJecjri1kg3A+NeT/Vh5V/WM
	 YLHXc4YkEyUpbuh+GyVnoC1wZiOb5MVfwCiNCVQjHCLysjWDnXXG5q6SULmsBcen0G
	 HecEIXcR0sIcJpqY2ivcuK13eNjh037fkRPT5cS08a9lxSyhuNHd4idCZ4HTcQzKh7
	 HfrwI9EeazHxLTXRbs4eF6fBNHIKiIKR7soLTRY5/DK8W69i5lE6K0kpqcX8ADpzPE
	 RBH8QSqK/whug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7DC3FCAB783; Thu, 21 Nov 2024 11:26:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Thu, 21 Nov 2024 11:26:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219517-215701-yHpkMtd2pf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #8 from Armin Wolf (W_Armin@gmx.de) ---
It seems that the ACPI method responsible for setting the thermal policy al=
ways
returns the thermal policy passed as an argument. The driver however checks=
 if
the return value is zero and returns an error if its not.

After checking the acpidumps from other ASUS machines, it seems that the re=
turn
value has not special meaning (some always return 1, some return something
different).

Can you apply a patch and build a custom kernel?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
