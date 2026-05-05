Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595BA38946A
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2026 12:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983822; cv=none; b=AOTz9m+m8JtBS//JknLyy0pR4FoqgNlL93SSt+87otiSEEfJ++DRcNXNY30OAho0Qw+6CXyBc73Qoac4s7dSCMRF9zXdES1j2y2xuOOJliDpxcqV/FARNs3E4uqVArm833eh/lJrWdfJsNxtJEdgSyKi4KRNOh/TG2QagCyG528=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983822; c=relaxed/simple;
	bh=c1cZQ9hyfMtG5zd+08P51YMKB6gTwCH4M/NyY4r8Zm4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RexhJn9cyG22I0SFUmXsxbRw+AO5SNE7+RUf+AYFoj4YaWTWdeykAOkHy/wKwE+8SfgMo4mJiRbfJH1h21YheWjifeTSPX3HOjH8XrZSicWXyegBEw2QhOmBneDe6ADSrzDt4hRAS5lA5XDvWCDDoj227a6o3I87hhK6k3hTxEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNR39m3U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNR39m3U"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03A33C2BCB9
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2026 12:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777983822;
	bh=c1cZQ9hyfMtG5zd+08P51YMKB6gTwCH4M/NyY4r8Zm4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HNR39m3UV/PJQb+uoBKlvEQsE0jBF+lJ1QiA0VRrNONqfG+MKuJ/KBZw9As5qxcej
	 P2aYliGI9evY+VkAKpgEI8ZwiNQ+W4Xt0eyFSa3xc8/JExVVo+fd77V2+f4PnLGEf3
	 kLtWMAhHgLaADTPZX0c5mmym6Q+exp5EyxyYefSKGtVjIFlaofubZuTzXWyzcdy+iH
	 OmSNfAFd2rCJqa9xi6fHSCh1hhNrZA2JGNprQaMqpfjH8NrH0xBxemhiulVt9ZR18Y
	 bUJq/cXV3LpPgAeffsbkGtRUtZrrdscfOykNxHxRZW6BpcbUd9ba8H/NfNkj64HVRu
	 S2m7IMQENsTkw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E51E5C4160E; Tue,  5 May 2026 12:23:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221430] nvidia_wmi_ec_backlight: brightness writes silently
 dropped on HP OMEN 16 (2025)
Date: Tue, 05 May 2026 12:23:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hansg@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221430-215701-lgKHZzqwmZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221430-215701@https.bugzilla.kernel.org/>
References: <bug-221430-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221430

Hans de Goede (hansg@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hansg@kernel.org

--- Comment #4 from Hans de Goede (hansg@kernel.org) ---
Hi, thank you for your bug report.

Problems like this with nvidia_wmi_ec backlight control are a known issue. =
I've
had a plan to properly fix this for a while now, but I don't have the time =
to
implement this.

I've taken the time to write this down, see:
https://lore.kernel.org/dri-devel/f10c039b-e9ef-4aae-8291-8f1e71074586@oss.=
qualcomm.com/

In the mean time as a workaround can you try adding "acpi_backlight=3Dnativ=
e" to
your kernel commandline I suspect/hope that that will help.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
