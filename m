Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA342F7EE4
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 20:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780689687; cv=none; b=Rr4E0G4op8d/GVyKdzDZRGr8EZrl3ZJt0UXfVQlM7J1gaPYQsuqObjRcDC9hklxg7ff8sxlyQH3+Gc8iolxkp1WNgdrXMbDebJM7OK6OhoDyRVH7P4IyruPnJ9xOVTb0ryXjQ4IdoX3ibLHriwWRihRUBH0xyNDA7iNY6qWhnL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780689687; c=relaxed/simple;
	bh=HXxlC7Vig967PdYt7q5088uG+jKXZAZPvyZ/ujiaTC4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jd2duiATCiyyElBTKDDwoBkO6aL2PUGU2keud9tZ9LBYD76waldaD/b1aePopxxYsm4AFb/JVGpkLWfNKhvLAvLXDSFJdGz0ERUGOXF5n2L4vZfAH7VngNmw+50LCJkbaMAmjVnJUzgg5cNtqNNo2AG6w5M4ivI+5aYkbR535Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8kbgVCg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8kbgVCg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83C8BC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 20:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780689686;
	bh=HXxlC7Vig967PdYt7q5088uG+jKXZAZPvyZ/ujiaTC4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=K8kbgVCggwJFpbFgEpmHwdcB/yKk2H9ISr+M5+sFqecmpj75C77XREvrhQGan9jxs
	 qTJJezws3UhGpXNG7PcuG7nsjWJDZzJja7S19nUpT/2XIpvO7mhdanrhPApZbnLWLg
	 s48IApXAkUWGByjZ/URquRsfTjnH1gv5v9vs6AhI4SdEfv5yY+/7h0kEffVxrGgiYT
	 UtSEFno1V4ZO+Voe+ldjRkgnAgZG9yF19gn2UzDgJ0RQJA88/UCU4sB5a1s5s7wUyD
	 Srbjr7HlR9wI/PYgTx/1MQnr3LvyYcrGOx//C5a61Ya0iPHtdHME106uyh3agF/dj9
	 0NWRIW7TwbAsQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6766CC3279F; Fri,  5 Jun 2026 20:01:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 20:01:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-vvnTsiYB28@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #25 from Rong Zhang (i@rong.moe) ---
So this version returns 0x3 when the ICMD is 0x1. However, ideapad-laptop o=
nly
accepts 0x5 and 0x7. With this version (it probably also has my modificatio=
n to
HALS, i.e., `Local0 |=3D 0x10', right?), ideapad-laptop would use SALS to t=
une
the keyboard backlight instead.

Since I am not sure if Qwen made any other modifications to SALS or the add=
ress
of corresponding MMIO fields, please simply upload the full DSDT file of th=
is
version.

If Qwen didn't modify SALS, it would tune the keyboard backlight by writing=
 to
KBLO. Your previously attached DSDT
https://bugzilla.kernel.org/attachment.cgi?id=3D310268 also did this in KBL=
C, but
"clicking any of them has no effect on the physical backlight." Fine, we got
two inconsistent results on the same bit. The only difference in your attac=
hed
DSDT is that KLFS is also touched.

Could you try to massage 0x8A manually and check if the brightness changes?

1. Write a desired brightness level to 0x2A. It must be different from the
physical one
2. Read 0x8A
3. Manipulate the read value to make KBLO (bit 0) =3D 0 and KLFS (bit 4) =
=3D 0, and
write the modified value back to 0x8A
4. Same as 2, but KBLO=3D0, KLFS=3D1
5. Same as 2, but KBLO=3D1, KLFS=3D0
6. Same as 2, but KBLO=3D1, KLFS=3D1

You may repeat this procedure with different 0x2A values, i.e., brightness
levels.

Also, which BIOS version are you using (see dmidecode)? Sometimes, a BIOS
update might fix something, and you would probably want to try the latest o=
ne
(IIUC, it's GLCN68WW). I ask this because I found your device's ACPI tables
have no PNP0D80 for S0ix (which usually gives some clues on how to turn on/=
off
keyboard LEDs), but I did notice some S0ix-related mentions in the BIOS
changelog.

Another thought of mine is that you could try writing to 0x2A, and close and
reopen the lid to see if doing so updates the physical brightness. Accordin=
g to
my experience, closing the lid causes the EC to turn off the keyboard backl=
ight
temporarily, and reopening it recovers the backlight. If doing so can
synchronize the brightness you've written to 0x2A, dump the EC's MMIO regio=
n,
once with the lid open and once with it closed.

Anyway, I am going to sleep now. I will reply to you when I wake up and dec=
ide
to have some casual pastimes.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
