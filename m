Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494AD1C84AD
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 01:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749779969; cv=none; b=Iavb3h0J64DnXrCObACy1l8g2GY5H8DvhKusaJaGl595Ot6hSgA/SBIeK0tuwd1l0UEecRa6+Lw7lXkNGhQA9eAehmlmq7OdVPA1scGTH9y1ZhTBBZB7lFvbFe3FA4ueODoR6vrWQkwAYHbyfLj29Y+TZlE8drflFnboCoy4bDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749779969; c=relaxed/simple;
	bh=GQZWNs8BHKmSvPedu4/aytiJgDGc9ACVI2lgyFUroYc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jpjkcwjvh8TJEQxcnf1+7W7KiPV+1ojRtDYJzrq1RDGZfPH7Hb42G4I2jssIKTRld+Ek9CTCUF5ah6PGz3cbSeB+o+iRFRheemvIeN9GUINT0zKDZ2W/v8588KfoQTxFjEnei08oC/YKmMT5fpyGNSytawQDm32n975oaWDSOkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLmnwrnA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLmnwrnA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2566C4CEEA
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 01:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749779968;
	bh=GQZWNs8BHKmSvPedu4/aytiJgDGc9ACVI2lgyFUroYc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iLmnwrnArQm1Goy7oM4xrOp/C/7uk0IT9DnVNKaInUlbASk67f5w80ed0v8TDCuQA
	 HdYg3V9sIKQDLzPbpsu8mELkGzArBNzg9IeDxb086WBixT1sALjok9syn7oMcRb6tY
	 BeMIakRNv+ua5H1rqKjzy3Qt/7wZgMVNGDAgB3kQIdykB9MnPeOVTN4VImpQVfHLfp
	 Znx5WxDkWxMlb+8ouy8zoAptlnTzZ2CSAeaVsraSJ6u2SdUe4AoyxVFmfaylmvLlj+
	 ikoTKZ+dgoEQ4VsbU6l4s/rXNVyim1gu3iBDC/yyjH1G9gdz7zBD0NMJltA3yyy0QP
	 ab54ILg5Qvwmw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C6FBAC3279F; Fri, 13 Jun 2025 01:59:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Fri, 13 Jun 2025 01:59:28 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220224-215701-6euTtwLsLv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #6 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
There's a very small list of commits from amd-sfh in 6.15.  Can you bisect?

$ git log --oneline v6.14..v6.15 drivers/hid/amd-sfh-hid
f32e8c809549 HID: amd_sfh: Avoid clearing reports for SRA sensor
0cc2effbc8f5 HID: amd_sfh: Fix SRA sensor when it's the only sensor
01601fdd40ec HID: amd_sfh: Don't show wrong status for amd_sfh_hpd_info()
832ecb010e60 HID: amd_sfh: Default to HPD disabled
e38764f6dbb3 HID: amd_sfh: Allow configuring whether HPD is enabled or disa=
bled

Nothing immediately jumps out to me, but also a more complete dmesg would be
really helpful.  Anything in journalctl -k -b-1 after it happens?  Or in
/var/log/systemd/pstore?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
