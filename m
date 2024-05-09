Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9EE1527A3
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 May 2024 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715261510; cv=none; b=c5Ndc0ejLG5osL6u3IoX6ihmXW/w6eVMnm4bPWqpk3+PENG2Kp5Jtq0HHMRjOZ+UYVG3jF9TqZoT1MmusKw7lIh8Z/E6odZ6QgIPWx1TVqagDx+XWa10lgf0+an5Io0kfm4kgKzgDj4HDXRTPk3v9QY/wwwDBKtPbFTtwWp+9dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715261510; c=relaxed/simple;
	bh=A0WzNnqDOc1HjyxYG4FwM2YbiCj1hcPu20sV9IL04yM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KPKDlQfrS7ORPSORYknGL4aMr2uMTIQptta2fMwvtgnxbYhTp5yfaJC3s4zBBGHibp15K68KYDyqKKjykURzFWVwnNkcEn5sKL0SPg/HzgaUPfH4gLLW3RkfI+3o4xZIXmIOwJsI3butwMAYrEGzilttR2ZDQOWbuxgKY/iW8O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ju/W9vr2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ju/W9vr2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C383CC32783
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 May 2024 13:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715261509;
	bh=A0WzNnqDOc1HjyxYG4FwM2YbiCj1hcPu20sV9IL04yM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ju/W9vr2uGCKk1tqjzq+3TMpPpisMDT2CaLa5T4aMi/aSoZK/KoCf7X4yidbdNqcn
	 9ejZVehNLQ02EkF1Mmq5KlbFUuFfovgF3SvKsNLnzfPLmIozWUXbsnn9ymye8atbmk
	 vUzedblUa8oLK2M9OVQ0Ordx7Qfce9/3MKe4csL6MXEEuJz7clhhxwQ/R5Lq5V9M9z
	 Y87MM1RMJkg98NR0Ms8kyNdf4EFKjzggOQEL5XfsD6okw+Qd4wtNAus6IgYehs+iqD
	 6hkvFuhwR2wx8MyTROKjbrIkhC4kTIvoD59X8IHlWANhfvlTTuZ62tbE7ZXvzbDEBu
	 SJWlj6xD/FUZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B9679C53B70; Thu,  9 May 2024 13:31:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 09 May 2024 13:31:49 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-49LgDUWiBu@https.bugzilla.kernel.org/>
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

--- Comment #68 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> What does EC stand for?

EC is "Embedded Controller".  Here's the ACPI specification for how it is
supposed to be interacted with:

https://uefi.org/specs/ACPI/6.5/12_Embedded_Controller_Interface_Specificat=
ion.html

It's a black box to anyone but the system manufacturer.

> Might this
> (https://h30434.www3.hp.com/t5/Business-Notebooks/HP-Elitebook-865-G10-w-=
AMD-Ryzen-9-PRO-7940HS-cannot-sustain/m-p/9061799)
> be related?

> What's weird is that it only happens when I'm using the external monitors
> plugged into the dock, but I don't have any problem if I'm just using the
> dock's ethernet adapter or USB hub.

Yes, it "could" be related. This is getting OT, but if you have enough port=
s on
your laptop without a dock you could try to plug dongle(s) for monitor(s) a=
nd a
regular power adapter and see if you can reproduce the same behavior.

> Easier said that done: they don't care about Linux via the official suppo=
rt
> channels.

:/

> But why does it affect only Linux?

As it pertains to how the sleep wake up works, Linux and Windows work sligh=
tly
differently.  Windows has a concept of "dark screen wakeup" after any wakeup
event and will move in and out of hardware sleep while in this state.  Linux
once you get a wakeup event if it's not enough to wake the system (such as =
the
ACPI SCI but no other interrupt) then it goes back to sleep immediately.

This difference of behavior has uncovered bugs where the X86 cores race for
some of the same resources with the power management firmware on earlier
hardware.

So my working theory has been some timing margins for throttling are not be=
ing
met when suspend/resume has occurred under Linux.  That's why I was suggest=
ing
patches to try to keep the kernel alive longer when a power adapter event w=
akes
the APU.  But the behavior and timing of when to throttle are totally
controlled by the EC.  So if there is a timing problem and forcing the X86
cores to be awake longer doesn't help I'm not sure what else we can do with=
out
HP coming to the table to debug from their EC perspective.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
