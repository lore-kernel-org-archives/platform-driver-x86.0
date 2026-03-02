Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6D3331A41
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 11:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449606; cv=none; b=fEVslomdr3sq17fIeyY4XWsKs6pGg5LtMGsQumYVGMvC64mJlsZxdsEtY6sgMPbfaH5uon9FYqcHA4n/q8tFk/OhWZmGHCKsGnhZo6I8MMhKiPOHLcfuz9R/QJBuS7abtzS/uTYtKQQkM7E2dcrLpm5Ez3hdMLEWmGyytvhPp6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449606; c=relaxed/simple;
	bh=gikijVcQyvVfG4kqcPmys9wffVXAWhwv9/UeGJGwmQs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BpD02TJuIumsn/4pJ6lhYcv9JYj0TztapwgpI8nmxa7OI42lvhx81d8/pcLi6QHyUQPcVlIC8PNpw5SHggHDQZ2HStfWi2BwxALa3hXsieFEEqlCqSQzTCh4hUXEsymLDDYxQhuRhOUnqCTRFndKuKYaZMkXRHI7J5vZXrpSdl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cx4vZG30; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cx4vZG30"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCBF2C2BC86
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 11:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772449605;
	bh=gikijVcQyvVfG4kqcPmys9wffVXAWhwv9/UeGJGwmQs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Cx4vZG30pr+pjXLYf1gifwKLMXF/Ii36pgDzT5QCpg5NNoqfQvYQpvlO4iaLbuaVk
	 0HIMw322UoU9cXnTopKXTKrl1xfUuOJdQCFim6OL3qUNS28GG+0bIWUNXQzpSVhmUQ
	 oddfEVS1n7ySGVTQfJTHH6i7zQ0D58IYObgHtl4cw5bWGTyQLVwJ4WRuEGTFt01Xel
	 KmSESc4uAQWnVTvgrqwUFZCIqftE34Km7hDdokvaBdDuXTYFKHTLphBRoUt8nrg6Fv
	 Wrfw1GuOcwpu51JTDDn2mQsagxEoKfFZjKnBt9kZWzVcKChQKgrtZDPjFXT8D+G4KY
	 GqqmmBBMa7Zpw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CA375C41612; Mon,  2 Mar 2026 11:06:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 02 Mar 2026 11:06:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: team@nitrosubs.live
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-VGnPoYE8u2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #43 from fililip (team@nitrosubs.live) ---
I apologize, I was looking in the wrong directory.

cat /sys/class/power_supply/BAT0/charge_types returns:

Fast Standard [Long_Life]

So it looks like it's already set to long life for me, but the ideapad driv=
er
thinks otherwise.

I'm on 6.19.5, running PSCN21WW firmware.

BTW, someone in the thread seems to be spreading misinformation, as you can
unpack the firmware update (PE32/exe) and use the included ~34MiB bin file =
with
fwupd which is how I have the latest firmware actually.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
