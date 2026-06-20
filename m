Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7A91A3166
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 08:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781943016; cv=none; b=OJEgLwkSX7GzYdkCS07gVZ6Icy62LMaRpB4YMSRM/kE1AsFRtZqQndXfmbKqQcxlG7Pr8fHrjrK8+nT6UvU4YfHIFTy1t6RHX+5UAYcrbBANZYJtoSzmqFpxK+q/sVSJSflO8Sc4ZYjvjFLRBm0tHRwNpztvIZVZfmfJvd4F0FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781943016; c=relaxed/simple;
	bh=rum6nQq2qXlXVqmvcSkbJ4zUvwk98B2PLszvtpyesDs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DyBPdVRzMgixA03lszVr0hA5+Tvhyb3uVT0b1/iC6sUvjfg14O4mPI9b8bRpglIutsCiImywOkBRpg9IXykWUslT6ErfWZ4tI1irktLLXHKkMeOh4mrv5PYJhilH9KTVg3UG5qGlW56/WgPulodzro8PEAWSuMWY+A4CgZ4mfC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASO5QJEA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ASO5QJEA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E90CEC2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 08:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781943015;
	bh=rum6nQq2qXlXVqmvcSkbJ4zUvwk98B2PLszvtpyesDs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ASO5QJEAKpA62McW7VgmDtZdGRR3yZLGKYbMqm6aVh0GcUel7/1nkr/aGmLT502sF
	 uRT1HTIgu60iMqIWVkM9tyKKoCQg61xWNYuuIeULOdx19SdpLLcI6tgOGZX/+rbkQi
	 Xagev78E1ItyHlmrlXMlboJEbBqMMnqAn6r7Gub5F4g7nKOhAuBb9XIIm4nibS5l14
	 R4GeQrSfT3zWnjt9yhMvtYRdBMUfKA+TCMsKHN2C8aGkmNjeobJ5GSx+H8O7fH8AGz
	 egFykXngeVdlJT1F2MBERfTLe7HqJj81Oh6YtIYzaTZK7hMEx+grdouYs/n9m5gV/O
	 187i3re96r9fg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CE5A5C41612; Sat, 20 Jun 2026 08:10:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 08:10:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: scardracs@disroot.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-JW9WYQqST4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #26 from Marco Scardovi (scardracs@disroot.org) ---
The problem you are reporting is not directly correlated to my patch.

It's introduced by f5d1499ae209 ("PM: hibernate: x86: Use crc32 instead of =
md5
for hibernation e820 integrity check"), in particular the lines below:

if (rdr->e820_checksum !=3D compute_e820_crc32(e820_table_firmware)) {
        pr_crit("Hibernate inconsistent memory map detected!\n");
        return -ENODEV;
}

This means that the memory map (E820 table) presented by your UEFI
firmware/bootloader during the resume boot is different from the one record=
ed
when the hibernation image was created.=20

The hp-wmi driver has nothing to do with it: the e820_table_firmware is
populated very early during boot in arch/x86/kernel/setup.c by the setup_ar=
ch()
function, long before hp-wmi is even loaded, and hp-wmi does not modify it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
