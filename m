Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F651EB27
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717337301; cv=none; b=mMFcYJCeQM9oaGF+owfDo+7RWbGh/fAOeU7BTpMa4emhxsrmLpCVcKDJV0Iap+C0plFpuRphknF3QmCWVsjHxOIpHYsASUSXOG2FUvJ1IW2d0pieof/zgftSo3NoT6O9YZgy7EyEXTthoEQoloKi565A/4e4tvLoGPFfRK54hTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717337301; c=relaxed/simple;
	bh=y58ILlArUHq0JWlSbc/Fa9eE54Y9dOuRfuaeOEipiLA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RLYCC3UDDAuqkZSUAsuG059tSHbKsrKqdTOj+x3BNK/2NIGLkarWGeE+4nLTNMKW0n7Odrx4oKaevw3lcnx9ttCIlK3X+epN/ROuNOEHFiDG73qFfn5FUxJ30XV/Bvql0RAnSe3HWmqJAsWTeNiOajmS9FKF9RBbc9CREID9Kwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0R2rfei; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0R2rfei"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6CEEC4AF07
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 14:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717337300;
	bh=y58ILlArUHq0JWlSbc/Fa9eE54Y9dOuRfuaeOEipiLA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=W0R2rfeir3BE8Hw8iaFL8Tt8NBn/HKJMHnNaKlzSAl25oKQGNLRtWJ/z1JWBTaMGP
	 XdlUWj0iJglgN+3ATC/3mqyt/IN61VgDVu3g3HKX70GGvw8WNbFkqPkuqPYJMNnATs
	 sdomcaFMgC09ImsWnvXr/hROfhCs/mtJmskO5v7LYDObyF0lU+iP+x1saozfkh84Bw
	 s6RiGaHxc81U1GFx2YJs+DjxcE/TduK5KZH0xaPPgshvYj8ABQaWld/ASDvHI6D9UM
	 BEDhJl8OduRDboJEXj3yx5pz452ABeUVac8pwd7KblgRjOowpwdAwq2kbYD26wYv1U
	 MJ8rxCebyEdxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A0A22C433E5; Sun,  2 Jun 2024 14:08:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 02 Jun 2024 14:08:20 +0000
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
Message-ID: <bug-218901-215701-2wLOVNLZVY@https.bugzilla.kernel.org/>
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

--- Comment #13 from Armin Wolf (W_Armin@gmx.de) ---
Or does dmesg show any ACPI errors?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
