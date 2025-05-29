Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE38D28DF38
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 May 2025 10:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748515892; cv=none; b=QwmNqiSJWJk9A5KwoHUGwQtqsvjBz9N4hY6Be6sOXyWs8q4yqj3piVL4aOPijXyyaZrZen5OuhjkPBm0NGGgxbBOWAid7GHVlcZNr1MfgqS+PW/EldTVt3n54RU29YIhs1lu3CV3RXF+g4LdQA+C2rF+1YvFerZsTVxSzb4DCLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748515892; c=relaxed/simple;
	bh=1pmmDyz0xKPcFhCurDtHjKEfEPy37f8mycu17ey0D/g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=safXkpgoyNgzcMfazLKWLP1o9CSl3fpqLff0sBgVBFK8dQTJyL12St1J9z+wr7X52mGIUmw+TjYSkMAuxsElCyww5Jsmst24uX+pLVkbDU9UBwXSQvkV/uneUe/FwrMnYFZw5LxAhUZMg2aF13OZ7BZAEMht1foRqobtobm8MO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nd1uQ4dJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nd1uQ4dJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 431B5C4CEED
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 May 2025 10:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748515892;
	bh=1pmmDyz0xKPcFhCurDtHjKEfEPy37f8mycu17ey0D/g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nd1uQ4dJhfkBweOI/jcQkLUDH7ZFqROtgtINfMVLPanhWTsosSEvSHp58kdu8LdGE
	 nGAMPiDncKtu4J7SeSdJ1mXJWJBSLqKH1W4f8S2LTdTM3VJ5yTTxbyswXroKMOM/hQ
	 4sBGAPXaGI1UNAu7hmNK/B1m2N08/TkT8Q1+QYUYaEqgSueHJISUrImTSl8EBrCC5c
	 FJDGEZgOaegU9raBJovmRqqvpRzn/hjLO1nd5WseGP1cIm0ijXkZ9qvaR2hzAEzkqT
	 dEjmFLB1sZDaGL3p/iOMHwUFjUkw3XfoC2Imxos3op7kkNPKmZThxEK9/iO3JHJPnJ
	 Cv6r810eZJUTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 34E30C41613; Thu, 29 May 2025 10:51:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] [BAD FIRMWARE] amd-pmf AMDI0102:00: ta invoke cmd init
 failed err: 60005
Date: Thu, 29 May 2025 10:51:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: shyam-sundar.s-k@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218863-215701-siPrr9DR4z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218863-215701@https.bugzilla.kernel.org/>
References: <bug-218863-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218863

--- Comment #41 from Artem S. Tashkinov (aros@gmx.com) ---
I can confirm that HP has actually fixed the issue in the latest BIOS/EFI.

Type: BIOS-System Firmware
Version: 01.09.00 Rev.A
Release date: May 9, 2025

- General bug fixes.
- Fixes a BitLocker issue that occurs after a BIOS update is run.
- Addresses security vulnerabilities CVE-2024-36347.
- Improves battery health protection and reporting accuracy.
- Provides general stability improvements.
- Includes the following firmware: AMD Graphics Output Protocol (GOP) Firmw=
are,
version 3.8.9 AMD PSP Firmware, version 0.2D.0.83 AMD SMU Firmware, version
0.76.93.0 Embedded Controller (EC) Firmware, version 60.37.00 Intel/Realtek
UEFI PXE ROM, version 2.046 TI Power Delivery (PD) Firmware, version 4.2.0

Some issues remain but they are totally harmless:

hp_wmi: query 0x4 returned error 0x5 (
https://bugzilla.kernel.org/show_bug.cgi?id=3D201881 )
nvme nvme0: using unchecked data buffer (not an issue per se, see
https://bbs.archlinux.org/viewtopic.php?id=3D303412 )
block nvme0n1: No UUID available providing old NGUID (This message is curre=
ntly
logged as a warning but it's not actionable and according to Keith Busch "I=
t's
a harmless informative message".)


(In reply to Laurent Bonnaud from comment #40)
> Intriguing.  I am using a similar laptop and I still see this error with
> kernel 6.14.8:

Update your BIOS.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
