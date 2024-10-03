Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D25C15887C
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727959825; cv=none; b=rFup/XOKHxRGbzliTTUi0qGtuaFdV8QyyrfVkoaqysBnDvk1L1TqfMFHcZ4Gt2NzqfQYTGSDB+CBVzwO2KArtELgOYbBg2FhStmoPRI+OslpvTdvL/Yk6/A1wKa58HQ07QhRkkJHPz8NJn7sli+j8/chvOLiQT0TWcKYuU2NGEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727959825; c=relaxed/simple;
	bh=++RmBhJ+TG/7/eXPmYraacyAMGK5PEWUCkyuhKiFk58=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BDPNvbrgZ7vP88tPx0r4q1zbfvy4WJ8Oa3C9S+e2UfVxDqZAVaujjhaGfAtjQudOKh4q87Gu78zPW2uEQPArHOBcLFfx8mfjXwv+reo9hFIQUoIxKHkaVJZ6uoBqYol1bCaAfJF3RtZmAhvzduIgNBLc0Vhn6DOUFkYMDFOD1wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koi8V0ih; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koi8V0ih"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3779C4CEC5
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727959824;
	bh=++RmBhJ+TG/7/eXPmYraacyAMGK5PEWUCkyuhKiFk58=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=koi8V0ih6Up3mJmgmmL8aj9GqRshFksCca2rGf9BUgUPSwx9fJaLh33YYM4Ia8gA5
	 1DCUO+nTGIq0oN1r1JuUGUAJ+/PSExVZmu+dtRuvSXSYYdgo44Sb80rvreew+gkzP3
	 8dRI/L7Si2pPUbFMtn3xrbMWt25KhVIjk4PjP8txzvyK3E3kecx2dqCc+w8A5CYRqd
	 7Cfxkqwf4oR2k6PqEWJHHAeID5VyVjglzsB12p+DlJZKnT7F2C1itLG7diTMCxFsaJ
	 ByrdEAnMSIub7tqrOYivN0EA4wskzzrrQnUtWdBcdWuGz2CDN3qHa+U4mMpJxa2QVb
	 9HguPYBJqOUeA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C7711C53BC1; Thu,  3 Oct 2024 12:50:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219346] [BISECTED] Disable ACPI PM Timer breaks suspend on all
 Amber Lake machines
Date: Thu, 03 Oct 2024 12:50:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219346-215701-gMtT1FEF5g@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219346-215701@https.bugzilla.kernel.org/>
References: <bug-219346-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219346

--- Comment #4 from Todd Brandt (todd.e.brandt@intel.com) ---
ok I just tested with your patch, it fixed S3, but S2idle and S4 are still
broken and still hang the system. The only difference is when S2idle or S4 =
hang
the system will display this on the screen:

[ OK ] Started Show Plymouth Boot Screen
[ OK ] Started Forward Password R#s to Plymouth Directory
Watch.plymouth-start.service
[ OK ] Reached target Local Encrypted Volumes.
systemd-journal-flush.service
[ OK ] Finished Flush Journal to Persistent Storange
[ OK ] Created slice Slice /system/systemd-backlight
       Starting Load/Save Screen #f backlight:intel_backlight...
[ OK ] Finished Load/Save Screen # of backlight:intel_backlight.
systemd-backlight@backlight:intel_backlight.service

And it hangs, doesn't respond to any keypresses, it just sits there. So in
short the only two changes are:
1) fixes S3
2) leave S2idle and S4 broken but displays a weird status on the screen on =
hang

So this is clearly affecting more than just S3, that timer has some purpose=
 in
Amber Lake that breaks when the timer is shut down.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
