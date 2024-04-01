Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BB68BF0
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Apr 2024 14:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711980289; cv=none; b=IuS+kAjlx3v7Agma7GLRvs86CHwC7f22TSMv4yr+P/bPyHEKHE3FTqNDzzsAtsbzUiVfuIs2Umilxe5wC6z7KyhkaAyb/X4URgdo2E7rpspH66UyAa/fziB+QON9CnSwLXkA0ZTC0wZ5gASnI2l5j74uMo7iIDFBo0k/283y6qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711980289; c=relaxed/simple;
	bh=0+iAdt7gAz6Wc7K1yWtSUJN7AFxbH49gAJaiEnKiF4Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lf4OtNv9UblC6NeWk2UwPjU791URKkXibRcg4wyoIqpC/7Kg11Lmf9IVZZOr6gxQmzVo2ffF33YMk2DWE4iUBp13Q22nJVYYohxtyUUFmARmvMhdH/uVrlwW9Rfh/lIRbt8pix0Wr563SqiO/dAkPWd/n3BXY35yp0AUYmBYaOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1uicdIS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1uicdIS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00A03C43394
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Apr 2024 14:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711980289;
	bh=0+iAdt7gAz6Wc7K1yWtSUJN7AFxbH49gAJaiEnKiF4Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=H1uicdISMFB03a3Fakb8rYE2N3aLnY41mmHa5Jd8Rif61+Q9Whk6e8gKfGZqAU/AN
	 EFNyRyiaIWfnTsEsQKJTogDN59/oxpwIWFjIolinkGRNUuAMaE6rhVZUZAimoHayMp
	 caRITdvjZ4mjNucjId9ie4liilsPpChWo9Y7BW2xQ4qPxoRD0hJbG/lXaBZAgMLRrI
	 piOYw9rhCCQ6qj7bDcZj7W8mQoB/2SN8SAhtFC35jK46SjxYyWz/7ACEC0RA4Lste5
	 AE8Lu7BMTHBNpLdOzIU0qKOyg0PqiK2JuAzwUOX38bnJcHlUBf1VqKtU96U/C/glhH
	 RyWrbiZV09avQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E8A3BC53BD8; Mon,  1 Apr 2024 14:04:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 01 Apr 2024 14:04:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: ries.infotec+kernel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-o4XvTiNkEm@https.bugzilla.kernel.org/>
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

--- Comment #43 from Peter Ries (ries.infotec+kernel@gmail.com) ---
I have=20

$ zcat /proc/config.gz | grep CONFIG_AMD_PMF
CONFIG_AMD_PMF=3Dm
# CONFIG_AMD_PMF_DEBUG is not set

Unfortunately I could not reproduce the effect during the test I did right =
now.
Subjective impression is that the bug occurs less often since 6.8.x kernel.

Testing procedure was:

Plugged - suspend - unplug - resume - OK
Unplugged - suspend - plug back in - resume - OK
Starting plugged - suspend - resume - repeated 6 times while plugged - OK

Resume was done via "systemctl suspend" command on my hotkey "Strg-Super-En=
d"

Then I tried it 3 times by using the lid - same here - it works for the mom=
ent.
So it seems to be more random that for Artem. I'll check if un-/plug proced=
ure
helps as a quick fix to not have to reboot when CPU gets stucked again.

I somehow need to find a reliable procedure to run into this bug before it
makes sense to test the patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
