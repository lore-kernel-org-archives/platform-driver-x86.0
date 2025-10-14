Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5350A2EB5C4
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 22:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760479650; cv=none; b=KPtclSti9N2THbxBrRDdt1ork6kdTlFoGIv7oRFO89Ypin5UEgoda670owkgKYJZChvzZlgbY4B+glkPLPaQpUaLa68nf2le2hcuINZrs40QKwsy3bGeVMfpzNMZbPBoeOJW95f/OmDSmCs96EFpJcrMh6q3JlWf9LwpTWUa55Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760479650; c=relaxed/simple;
	bh=dRRumZncDypkz/HaupNkDIrBg0R1S7kx7OavwtQBKRQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AxkjGyQgw52x7czem5jAxUTFjkMd1heP56CxySIEbWW3E1EX/ETUnAPVhSz2Qu7szA9zzdK4ZQt6ngBc6gw3AGYtIUtkbNBlMSYRWaCYrpUHwlyVKGQ2EBm+3LEV6FFgJ5J8mISwQzeWG4ctiI8S4ctGjpxLjFgyDUjFfiMMFk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uP6wMKtt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uP6wMKtt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C81F2C116C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 22:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760479649;
	bh=dRRumZncDypkz/HaupNkDIrBg0R1S7kx7OavwtQBKRQ=;
	h=From:To:Subject:Date:From;
	b=uP6wMKtta0dPSx1UEwU29vL84kQcew2tDG1YwRRGWGPWymv/Y9eGHQN7xq0eF/ORk
	 JfgdXIAbQWtaN6847G7uy6XyEr6CivQPY22mq4CurMtDpPLyVZtNzX7uxvOsFuup6h
	 Mc+jomDnyO5VE//U9Pw62HK+AA+UXdLK8NVQQvAtoegHvOMgN2FEZeqamOMbCvU1Ej
	 wVEJ7vuBEumNz76yDwmMbShYVStGBC5FNd8sYpss3c648YRXaf7oX4tYz7+VgBGNP9
	 LXyBu0d1bIgsDRkqIgYKjw575XntJScWA2wKz3rZBz8ZstLUO53cPjNOulLPNDLTuh
	 P+n7Exe2pTJgQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B683BC53BBF; Tue, 14 Oct 2025 22:07:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220662] New: hp-wmi: Add fan control support for HP Victus
 s0022nt (DMI: 8BD4)
Date: Tue, 14 Oct 2025 22:07:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: falper2003@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220662-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220662

            Bug ID: 220662
           Summary: hp-wmi: Add fan control support for HP Victus s0022nt
                    (DMI: 8BD4)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: falper2003@gmail.com
        Regression: No

Hello,

The fan control and fan RPM sensor readings are not working on my HP Victus
laptop (Model: Victus by HP Laptop 16-s0022nt) running Kernel 6.17.

My system's DMI Base Board Product Name is "8BD4".

This appears to be the same issue that was recently fixed for the HP Victus
16-r1000 series (DMI: 8C99) in Kernel 6.17. It seems my model is another
variant that requires its DMI identifier to be added to the hp-wmi driver's
board-specific list to enable full fan and thermal profile support.

Could you please consider adding support for the "8BD4" DMI board name to t=
he
hp-wmi driver?

--- System Information ---
Kernel Version: (uname -r)
6.17.0-5-generic

DMI Information: (sudo dmidecode | grep -A 3 'Base Board Information)
Base Board Information
        Manufacturer: HP
        Product Name: 8BD4
        Version: 79.57


dmesg output for "hp-wmi": (sudo dmesg | grep -i 'hp-wmi)
No output.

Thank you for your work on the Linux kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
