Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C2138331F
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 16:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781196498; cv=none; b=DLuGZeAkNoBuZBidMKTQmnnT0iXfYlDuxlSQPmHrPQ9s6vb+ewFkhBsbb5HKi9I2GDXS1N9KBuVIdsq8xmWisr1yc+jeVTcSm5fAWYDQkO38zi7GdSYZiNzRJ9I1ebqkmWTgq6p+PuvHVC36VceKHY7VGMeIzxNyZbCHEcMW+os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781196498; c=relaxed/simple;
	bh=Nw/xPZtCbol+i59Ux+9LuQomkFfwfE/AmPxzq9yBMw8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=agjkiOTLt3IRKuEui6VXBhfFWGjSJ79mAAdYTNoCX18BHcpLIWOhk2CNULwBcDrjhz1UjBrOSs7D7va9B3yv2DCFvY9iVP0FetRmwh4fJeVVoV95HfapcZyGSzKoanyFuUxa8fPe6K04WA4u/XmoE9VgOZ2M5BObLammgYiEMr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1RmsO/4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1RmsO/4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BEBAC2BCB9
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 16:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781196498;
	bh=Nw/xPZtCbol+i59Ux+9LuQomkFfwfE/AmPxzq9yBMw8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=k1RmsO/4y+v5bcRXGyMss2lhHytA3D6xVfaB+JkAVDqtRio3Pnpay5kIXAzeYdbrZ
	 9oEl1FfjDn4u34zBmkkj1oAV/7P7nDpS65qS77eBH3unuy2W2KB1DSo4ECqHv/fxCZ
	 LDoIWcoEX90oTbF738HbB4PnZDwZS2p+lDTTA54/VldM+wG6+JLZn+F2Yxy0KIScDg
	 z9Y82nGC3Q6GaMZ+9Id6IHaskXrGGs+ixllXKJL8fEn/rS48J7nYQ1jPT6z2uUubJa
	 eJLhhXF8rfZJ0hAC4CmxScytjikCqXt5bJr3+OYA0UfbDhucEyZGWwUtUIirmVvuEn
	 zfRpQGWcLkv/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2A369C433E1; Thu, 11 Jun 2026 16:48:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 11 Jun 2026 16:48:17 +0000
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
Message-ID: <bug-218901-215701-BynVCqz5sz@https.bugzilla.kernel.org/>
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

--- Comment #86 from Armin Wolf (W_Armin@gmx.de) ---
Nice, can you upload the output of "acpidump" on your device?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
