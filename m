Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB453264C2
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 09:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780738261; cv=none; b=fnOG6SYd897N5oXYmKe9sWa7k4M9S0Mpq9vWwZIDoaUfjWbFLApEbDlXSNUPOAd0A+cWOXV3HUH8lVbSYoAk5JE+a7GFCdnHS0JcUP9QyQfyEy3RItWAM2yxxXWeSM8/kNvq6rS3EuREAMaiyp6CATXnZffhNlVpIdF/7Q2e9+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780738261; c=relaxed/simple;
	bh=MaXJV4EQlXY7IFX2yRCZc0wgNSLTATvZv4Fc/JTIvIk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=exJ3h+baCYFDSbZ33MP/dXEvKzHTkEA4lo0mVLNCtIiH4BTjArfkZ5Y0UYqsxr9Nu6+0TTuu6KDFryYCZD4DygtC/5gPJrAHOPxabJQcwjZQ3Ey62NVaPb1SfXgYkZ/diJVqmPOf8xaHMZ4NscnShwGcUVLzOcskUhc7eMvHfi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSq8UE5k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSq8UE5k"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EE9BC2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 09:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780738261;
	bh=MaXJV4EQlXY7IFX2yRCZc0wgNSLTATvZv4Fc/JTIvIk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dSq8UE5kf1y9vwC7mtPzMpKgncbeUnYFx6izuN3miq+35SSv/ma8cdiA5ppKy/Mf0
	 E7ZQu5AU3cfW1ImXw8yDoE7kfSdEvnOoWozpjjDv8Wq0mUx2M80+85Tln1wek2qaoU
	 bhdQZ8YPhwHxF7Oi8qXleTgrI6xZ/Ouy92xCdvkaReGt4JCjMVlOQobky8a2baHu3p
	 C05VIyQH/KPGrY5u82QVz0Rj9oRed/Mc14R7EikPTq+cjx7Om1angJA2EDyHOwtAZE
	 lULBBg4VB2oOiEbeuRhQ0xYfHdYASRskAPVRwpDKTInHN03QYPf56j8NHdzvMTRulr
	 +25rYlvwU5ieA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 11064C41614; Sat,  6 Jun 2026 09:31:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sat, 06 Jun 2026 09:31:00 +0000
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
Message-ID: <bug-218901-215701-gPxyibYvGL@https.bugzilla.kernel.org/>
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

--- Comment #83 from Armin Wolf (W_Armin@gmx.de) ---
I think i found the reason for the keyboard backlight issue, but i need an
older device to verify my findings. Do you have on older LG device or know
someone who does?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
