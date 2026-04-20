Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B8D150997
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Apr 2026 20:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776715246; cv=none; b=gvHUfDlvugaObZI0J9zT5cpwVnVYzAFsoMRk7fhMx8WTgkpzbY2jeWzt6XHYDpFd6Qo7iHPIzX9mptrEBLK1/5t1iu972PCaCjYNBqoqnfEf4NtUUmLg0fUWZa7Pq4HMc4M0Ib/s+osaVbAf4zok9/a6yuXzQB1TNRuyJ2NITPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776715246; c=relaxed/simple;
	bh=aY5yDWOL0fJaJqOZ68iP3/ct2qJ3dQ2Ai+jOrId+twQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MiJR7Dz99dPQQcsHUNr1NVncPoiBSkW102vFCjhNn+AO+Z49+Q5Nr6Zu6IfjrDV156BXUmxtZ1TvO0Qlc8Nbtge6mzJ3kN7sZW1zVvWmYrfrVU7KieoNqS/iiRClWaMnmSmtbMHP1gIriBk5nP0Fg7/rc8iGoiNji4T5xnUZVlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TjVtpUoJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TjVtpUoJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC1BEC19425
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Apr 2026 20:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776715245;
	bh=aY5yDWOL0fJaJqOZ68iP3/ct2qJ3dQ2Ai+jOrId+twQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TjVtpUoJrwCImzuKUYWwakCe0Vvxmq2Gs1M3VDrcfj2KiK01WUiykgk1fzPMcoMKw
	 Drkorwa9GlBuxQosb4b/C6t3ioQPYbaaIRPyIDQpOy5lj+NlxJyBKnJTzxw6nohUQm
	 AdVhhotDSLHkPoftDaWptSE8scmcYJdby0XZemPhkco4vbc+bGKTrnN719wK1T4s/s
	 2X8sqJCo9cvKlMAzmOjhm+/043/rjrYTdMPgwoq/U08kt/dFgsBmTL0dvu/+Xumytc
	 xxsMmmvIKgZM2UIL1ip04lKocSvSPhcw2irtmGv169y80elun0O+AhYwSQotKRXOX0
	 vSsPTUUdWprgw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 99418C433E1; Mon, 20 Apr 2026 20:00:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Mon, 20 Apr 2026 20:00:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sindrehenriksen93@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-Wbo6XG4kdq@https.bugzilla.kernel.org/>
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

--- Comment #6 from sindrehenriksen93@gmail.com ---
Tested as requested. All seven modules blacklisted:

  blacklist ideapad_laptop
  blacklist lenovo_wmi_other
  blacklist lenovo_wmi_helpers
  blacklist lenovo_wmi_capdata01
  blacklist lenovo_wmi_hotkey_utilities
  blacklist sparse_keymap
  blacklist platform_profile

`update-initramfs -u` after =E2=80=94 without the initramfs rebuild
ideapad_laptop still loads early. Post-reboot, `lsmod` confirms none
of the seven is loaded. Testing only against /dev/input/event2 (AT
Translated Set 2 keyboard), since event5/event6 paths are gone with
these modules blacklisted.

Working state (post-boot, pre-suspend):

  volume-up   Fx press -> MSC_SCAN 0xb0  KEY_VOLUMEUP
  volume-down Fx press -> MSC_SCAN 0xae  KEY_VOLUMEDOWN
  mute        Fx press -> MSC_SCAN 0xa0  KEY_MUTE

So event2 works normally without any of these modules =E2=80=94 the EC is
translating Fx to the E0-extended media scancodes and atkbd is
delivering them as expected.

Broken state (after s2idle resume, ~21 min suspend):

  volume-up   Fx press -> MSC_SCAN 0x3d  KEY_F3
  volume-down Fx press -> MSC_SCAN 0x3c  KEY_F2
  mute        Fx press -> MSC_SCAN 0x3b  KEY_F1

Same machine, same kernel, same blacklist still in effect. The EC has
stopped translating Fx to media scancodes and is emitting raw F-key
scancodes (0x3b..0x3d =3D F1..F3).

Conclusion: the regression reproduces with ideapad_laptop,
lenovo_wmi_*, sparse_keymap, and platform_profile all absent. None of
them is in the code path that breaks. Matches your firmware/EC
hypothesis.

Attaching the two evtest captures (event2, --grab):
  evtest-blacklisted-working.txt
  evtest-blacklisted-broken.txt

Happy to run further tests =E2=80=94 e.g. dynamic_debug on the acpi/ec path
across suspend/resume, `pm_test core/platform/processor` to narrow the
phase, or acpidump/ectool snapshots in both states. Let me know what
would help most.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
