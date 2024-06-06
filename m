Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E6F19D8A1
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Jun 2024 05:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717650224; cv=none; b=YbKbzV2tR2TxPQlyCT7H4+qoxpHxtj/AZS6n3fsw24Ffl0zVLOm5gLsDFxuLDomlTDeQElG6ibmP4c445D1R+HE8AYx4uU7n3s951/25VmrnQdLT/A33ZneO1UwCUI8tK0i7vNP6iR1FKhw9SXh+hYWtdzNB132M4CR/kt/P3EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717650224; c=relaxed/simple;
	bh=ONnprVj6qI12NcH41Yik+OI9qpT/A1SIotyqL+7dpQU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z5ipFUWlUWz3o3K5hb0JuUqQIMWcrZssn1vJm7MC+07d+Igpf7PLOcLjBaQI+rNPhVYuiltmej7kwTXuV8sZG5rQWFEx7t/Ho2I1vVpY8FTee0c82rbASa2I/IBWutxFjb6zcvP0ZASUllulPKr71ZQyJ2DziOtvIejsZbqiDPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeirqPPA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeirqPPA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91BB8C3277B
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Jun 2024 05:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717650223;
	bh=ONnprVj6qI12NcH41Yik+OI9qpT/A1SIotyqL+7dpQU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PeirqPPAQm8Y6bZqyY6PxmQ9dsM8IkNVMP2BLnEI/iq79fTDen/7JS76MvC2yLrEI
	 NIfwb8NeEvwReD1xg2Nr/ZL2LkVIB0Ie1fJf4bFHqhfBzxfXROtO5JtNZibNr15kD/
	 +V7ARWOXk0kYpZOYz9yDl9XM6WG6UVj8Xp7XHmNfK7TRsL9dWvIh2huWNPThGUriXF
	 aa7r/gCLIu+GHUYTDpz7m7ypR3GYkYJLquw95HGJhdTGRgUAA4xAGS3U3Cv93WVIAz
	 5pdAgwr94p7dhQyp8Ofuc8UAx7tiugKxO7WrWRTylXBjk0yF/FX3LXgte+pwgoKP2s
	 178oFwkCp7bAg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 89D4BC53B50; Thu,  6 Jun 2024 05:03:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 06 Jun 2024 05:03:43 +0000
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
Message-ID: <bug-218901-215701-G7ZaDlRRFR@https.bugzilla.kernel.org/>
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

--- Comment #44 from Armin Wolf (W_Armin@gmx.de) ---
Can you test if both modules work on your machine? I just want to verify th=
at
the changes which i am going to send upstream are correct.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
