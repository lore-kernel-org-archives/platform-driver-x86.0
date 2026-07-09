Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313F5366DA5
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2026 15:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610559; cv=none; b=gD+TbNEA3Qf4dw8GzbH9jW3AdG6rktYEhH1HIhOmRMpbKqlKr7cmui00ZhtzbCPFJsAyqPqMSGS1SDdyLgF45mD4OpZDYYeT2u1tMGeU9yxjCGe6V+qmchMxuTl9cG1HhyGr39pfxACtl3JyyKKVjJaMp1zYZQ2dMK/AaNjI2qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610559; c=relaxed/simple;
	bh=ABnTleBlMJ+tuT4qGs1/2pyFnn4jgtoJj2lmbkqgZ2g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hHO1Q2dmPEisCdNzdX4tw5YxU0cSWoik5Mh83D6OJ9CR03ocDzfcQLFTYpqsIfS4ywNbJBQqyAQ5IkBdbroUwnh+xrT2lkG2iXWekbcgdqhTVdRXJowjUvAWbx8xMKosK6Q4UbUAwvd2Zg5gZvqRQqTFH3mlwnGCOOTtW4XBpK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gaTojA3F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gaTojA3F"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2408C2BCC9
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2026 15:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783610558;
	bh=ABnTleBlMJ+tuT4qGs1/2pyFnn4jgtoJj2lmbkqgZ2g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gaTojA3FZ7j9CZg2v5Y5s3x5CHyS5ydyrvnIMLTfQBwwGaitcIne58dEJqpY5OgPv
	 ZdfHXVQad7mMVMvwNZlZhCgPSZTsFciY24ceuZqq8mrmwqgQbOaCBMErcZJHBDQfTS
	 s/nD6IG9d1fI/8UFESdyRDaa7UKiXU3SPGnAGeZWnZoPR9b2iksaIN4nO1bvjT3PBa
	 HecwjrxEes9hsIm0NJw5hftkmu0wscWdMyau4Jl26mmJkJxT3qJvibzuKHi9Kcd3vI
	 tZX8RalHIPbgNV+L8F6HLzLMgg/s5Q3MPQMm9jER3263HO9Z/jlMlCk1UuWxiUjk4Q
	 hPxu5ICtmQByw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AA2BAC3279F; Thu,  9 Jul 2026 15:22:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 09 Jul 2026 15:22:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-fl2mCLOHEf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #109 from Armin Wolf (W_Armin@gmx.de) ---
The patch series has been accepted upstream abd will likely land with the 7=
.3
kernel.

Regarding the missing keyboard backlight toggle reaction: i cannot map the
associated event to KBD_ILLUMTOGGLE by default because this would result in
duplicated toggle events on devices where the toggle happens automatically.

For now i suggest you use a small script that gets launched when KEY_F16 has
been pressed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
