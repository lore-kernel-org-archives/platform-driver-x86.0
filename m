Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E5F1339A4
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Oct 2025 07:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760773056; cv=none; b=Ro3un6auHFId0lyGzkwKp48sXUevYPhPOxWXcXmokCq8aM6zRn77tJBTc/QtSv40yh3JYV+iTFdTDcm1HdiHOcb1CiyFKSQdNdyNAv3qPCoH9u/wZYvcFVDc47WBMONdAtKGZWsWXZBhpDAru3rTyZgWCK7ycZk0MrkHWKNX3wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760773056; c=relaxed/simple;
	bh=eWcwUxTFM+jopTnlDTGL+fovtTIURi/V68DlihqTSdg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YbNRpktIaJsZu2hqPs+L3UcruOmi4nk5x8oXbvBM2V8spAAzNoFswzdDLQIld8GD3DpVbg3pgGuRYQ3agEX7BmE75DKNaGt9HZfjQhwsBz6fpomP5V5uQsBabusELvJV6IRBhCjz4gp4eXYz5vN7Sn1yW4fJR4Nuz6u/YJsLKpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NSEj3aiW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NSEj3aiW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7047C19421
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Oct 2025 07:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760773055;
	bh=eWcwUxTFM+jopTnlDTGL+fovtTIURi/V68DlihqTSdg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NSEj3aiWCU7uzurx6aadvU+yR4C4dXqsR+xr95G8GStAsEa3xqoYuVnh8qKCr0dfy
	 3taMdqik/1QpcVK9NMSipWRI42kg8IBMp7u+9t9j2NKn+hw8yVeygnc6txQLNTnkFy
	 RuZGsgZSdvYyE09phYqUqvhawLPiQvIcURnMv2jIbiTe1YiCDoycslp0aapd6UcFZ1
	 Wa3HgiwLjYUdb1NJlE5a5VyYeZArebUCj3SuDeRHoyOhnJna2DvJ4VEPw8Pa6TJ1gy
	 nadZKcv7OTNSNxXugXMbNWYKCJACJEbLCd4c63GqwqO1A0RL3KS+gRdXH9Dz1Byfyt
	 N61EtljqlB4/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AFB2EC3279F; Sat, 18 Oct 2025 07:37:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sat, 18 Oct 2025 07:37:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: ries.infotec+kernel@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-gJ1hRymPeq@https.bugzilla.kernel.org/>
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

--- Comment #138 from Peter Ries (ries.infotec+kernel@gmail.com) ---
Hello,=20

I most of the time jsut read/follow this thread as my testing knowledge is
limited. For a whilt things seem to have gotten better, but with latest Ker=
nel
update on Arch (6.17.2-arch1-1) I now nearly everytime have low CPU frueq 5=
xx
MHz or 1.1 GHz as max. After a normal suspend/resume cycle when plugged!

Have HP 845 G10 and EndeavourOS (Arch) all most up to date.

Just curious if anyone else has this.

I will run my laptop on 6.12 LTS Kernel for a while to see if it gets bette=
r.

BR and thanks for al the efforts or Mario and the testers :)


Can we somehow get HP to do "their job"? Write emails, sign letters, ...?

BR
Peter

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
