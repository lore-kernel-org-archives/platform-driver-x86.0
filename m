Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB78157494
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 May 2024 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715016385; cv=none; b=VdF8UzUVUb1Ru5aA6SzG1Td6gHSZ42Sl6VlF8widfr3/4mbk6r7jQhbIoHxTNbkIYkOkR9f4UgRDTjWssyIsLmuD6BiLCciuwoBRRTtqqCDB97oMHDmdFK2izJ8FhVN5xcMXoltC0/xQm10YnvVjihRtqlhpfB7iHzAVWrYNOsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715016385; c=relaxed/simple;
	bh=c1inpWFflJ5lSg+HLGiv4xUPPQMaOLCsHuVDDk0+GxY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kJ1vsNCw74PnO2Ky8SUJn23NAtHxqcRZWzCpns8K4vn6LCrABIp0/MeWYIEiW/dtCPA/Ed1TwXcSsvufA1iYvnmsCt/ginaY/MLMWd11841vS7N7rAOUGxgntHO0oQC/9kirz2tOcApHA5CI5qq57ZtLh0jD4GeVfL7FSSwfBk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nL7B0NUc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nL7B0NUc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BBE4C4AF66
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 May 2024 17:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715016384;
	bh=c1inpWFflJ5lSg+HLGiv4xUPPQMaOLCsHuVDDk0+GxY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nL7B0NUcrs4hMwh7p1Od4hBpekjSF4N0QUn7e02cfq/IpUY9k2eKOIPe5SyYupiFe
	 rYx57QGBR+uI6k9m5rRIsWS2eD0MvnAQwQhWTEyMaKHAgyvWU0khJMifQgb1BAPoSM
	 xgUOBm7y/PyUentZ3S1PaAWKpCpmrXpOcc71nB5m+km6OtgtrbnACFBb6nLd8+3AUT
	 WL4YvaSDCNT9XxME1bH6TFj2kE62Ejh9pZGGTnYs7/1h5cFrr++wCY3T/5L2CTtCSW
	 JGqNr2+ysVl4O3n+ZJRLiuzFlLvQcKtKQWC1/iPB03HsEghzxP9abRJqlgugkWUOjX
	 TpyBJzP83fGDA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1B46AC53B6D; Mon,  6 May 2024 17:26:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 06 May 2024 17:26:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218305-215701-YWevupMWqK@https.bugzilla.kernel.org/>
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

--- Comment #59 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Created attachment 306264
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306264&action=3Dedit
debugging patch

I'm attaching a patch that isn't upstreamed at the moment, but you can appl=
y to
your kernel to try to capture a debug register for me.  Apply it to your ke=
rnel
and then read the register value like this:

echo "0x59804" | sudo tee /sys/kernel/debug/amd_nb/smn_address
sudo cat /sys/kernel/debug/amd_nb/smn_value

Here is what a reasonable value looks like on my local system:
$ echo "0x59804" | sudo tee /sys/kernel/debug/amd_nb/smn_address
$ sudo cat /sys/kernel/debug/amd_nb/smn_value
0x017f1201

Share to me the values that you get from smn_value in these 3 situations:
1) At bootup (before you suspend)
2) After you've suspended and reproduced the issue
3) After you've done the W/A to undo the issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
