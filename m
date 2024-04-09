Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD8328370
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Apr 2024 16:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712680221; cv=none; b=U5XdS21snN9Z9xe1wpHL3hl+Mws7OppFJ5zpj+y+eB15Goi66OtkI3w8ZE7JnqQ06bt+R/744N5YYCRnBrYC5jFU9FcMB/GmeL/InkKodEt+sKmlzGo9TSWvihHaENLYSfbE49JL5ePs2tBYdko4/T1Ll1kBhNiQ/MVPGv3aASI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712680221; c=relaxed/simple;
	bh=CxqjXeSQj9r3pyxsEZCfOnKdPHkmaQ8KXco1BOsVOHo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o9r1shP9h6iGwMDPbKJaPX3Dsm2P+kbWizHjObienda655E/1barFRumQc/si4DRfsXFrBErlqqV0pQ/AWAZj/RSUskrKuEP1FfgWWAuk6RM9hEVXVUNkDXKJYRGlrSoxWCAFl8zME1avCJCNLFyMknKXnXKDHsp2vskgURb1qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAAYA82O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAAYA82O"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17FFBC433C7
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Apr 2024 16:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712680221;
	bh=CxqjXeSQj9r3pyxsEZCfOnKdPHkmaQ8KXco1BOsVOHo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TAAYA82ON+M6GgPBov1aZq7+qoYSZtsZ08Np9zCXnvRo3cDswjRrfCrAUhxGtvOsH
	 9Fzoc09fpSTMhgoVSkHYv8NY3Jvjwti/80ZusKfShIuSBXRO3gG86qQaNFrOdZWOtN
	 t+4XzpKkL6fmzhoWM48i3uyOqUdeb2LAOGgFa1/MXLtWn6Nk2IhPXvdbwbZkcj9aDz
	 VASjQUMu9odDdxK0z0/eJ8PQi+r/zxBeAJ3w+NfZmiVO1EE4vgL27L1qfKidrtFOOV
	 TrXvDgyeBdhjBRvt2q2FNZA8+KeIdrin/Kob6g4dokbcXvKbEGPN3vD6uVK7tNG7sf
	 9e1KMybSKk12g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 00E41C4332E; Tue,  9 Apr 2024 16:30:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Tue, 09 Apr 2024 16:30:20 +0000
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
Message-ID: <bug-218685-215701-IKgIyUZrDr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #11 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
sudo dmesg --clear
sudo rmmod amd-pmf
sudo modprobe amd-pmf dyndbg=3D'+p'
sudo dmesg > dmesg.txt

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
