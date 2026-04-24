Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E383D19A288
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 13:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777037981; cv=none; b=mQPcArJpAF1NlYEn22x8GBlPCFJRI+eEBMEXKgGYcrJ1AV8VLQygNnBRQuz8fbixMDX9haKn8HIC9bi82FK7m2FC1Zq/KcJlUWhv1vkg4uUmspKyT8HaPYkNbJ954sgLvP3b3YLJtQ739Bxs+5qM4MuiYXYsW9m/cC9UziSwmHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777037981; c=relaxed/simple;
	bh=wyb7z2RTUU5sko+OBSQXUhnoHb16coEkDxqLj/OBAqo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CWLW6nuUlCYd0QM/iu4E4QoB9PnqC7IP7nlL8M9kO7quUL2hBUOSC1IGT7INmmkPyswIKG4P/ZIeiciAMpTDQIHjKeXAT5p8HN6SVuLHarRxQ5rtTU6dzC+WpL8YnZ7OM1ZMbyGEPsBBG19GR2vmHR/Zl+VK5EtXLap9TQpYL44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xc9+nSM5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xc9+nSM5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A9B4C2BCB5
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 13:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777037980;
	bh=wyb7z2RTUU5sko+OBSQXUhnoHb16coEkDxqLj/OBAqo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Xc9+nSM57eAaLe8MYOdHJEG9E1MOQt0lzYVS5eSvqC+EBac6mrBOV77exFGbZG5lH
	 0ECm326Q167WdiksNvFAbgrI/AwrdJXoxSAkvJSeECEVD46kn7hXn/rAeIkFDnbJQB
	 7o+DwprodMlSMRPn/qdsyZr7eSxlX4SGTQT18vu9razXuXHmqnkjBGYGVNx7jpCnEI
	 7a82U9WFJDNWMKkW/i58ugWi3VgN7kC6Rm1UVDOELLuj3GmUepmRsyATj0qh0NXkg5
	 3yywPkjL5S9O4nXQgZNkwAvscMNs3wzpoOInq30ctyX9mX6qxml4PDynN6Fd5K9aw2
	 GB3RMRCE8Buhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8B4C8C3279F; Fri, 24 Apr 2026 13:39:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Fri, 24 Apr 2026 13:39:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-DpLg7yCluQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #27 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Yes as you noted for Windows it's important to note Windows needs to get in=
to
what is called HW DRIPS.  Windows kernel waits some time for both software =
and
hardware to quiesce before activating HW DRIPS.  This is what Linux does
immediately when you have amd-pmc loaded.

So there ABSOLUTELY are some timing differences for Windows and Linux; and =
it
wouldn't be the first time timing exposed a bug; but it's shooting in the d=
ark
to assign blame on timing without evidence of traces of activity to the EC.

If you DO want to shoot in the dark and try to change timing (for example d=
elay
HW sleep) you can modify this:

https://github.com/torvalds/linux/commit/9f5595d5f03fd4dc640607a71e89a1daa6=
8fd19d

Just drop the conditional there or add an extra msleep() call.

---

Regarding getting EC and PS2 traffic from Windows - I completely agree this
would be useful for this issue, but I don't know how to do this, maybe some
others do or you can see if some of the LLMs can help with this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
