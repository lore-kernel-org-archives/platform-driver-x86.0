Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED5138B7C4
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 21:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780521544; cv=none; b=pjR+MReGrRAAjLJugVfHVfdsTKyO8305yEI1sOtzF11U5m7qxk4LhLP7TDJhwSQo6xcMv9MpSeJ4joJbT5gLQFnYVlesVs+LJ5q4JnVzFtM0nZaMYJjJjfZabUVys5lHjTtVKdM9IYagUGbWCxdkS4OKnQECMgsykGDjubD7AbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780521544; c=relaxed/simple;
	bh=iyXk8F5hJle3mKVFT1OJ4/fm2U8/kFvtdq1dVofCtM0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q9njyJgZ26uk1OajhEuUDcyRiE2XKyj4NfQVSGBSkHQWuxdbjHUKnoGAf0Y3kdds1h+4H5RU+YsxXB/awpVOXDa5We6MLe4Ox+Qgkg37WX585TQ00TBnNXz3ER+9zDgvGhEKL8zYrHxvyffN/Ia1Q8qwTT97uyV9C5L9phG19rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YoU7br1h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YoU7br1h"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E570C2BCC4
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 21:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780521544;
	bh=iyXk8F5hJle3mKVFT1OJ4/fm2U8/kFvtdq1dVofCtM0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YoU7br1h1zTdf+TC7/owJFqbspgHuS83NktY+hY4bQ3tIHZtxLrQm4eTgVlWBDv4f
	 8bORueRAO8+LAMhCBKDbWm2U+v13OURpiEhLuZpVqAtE+spAAQAaEAqy9Yn6cAOcs1
	 lSoNNBv7HgxLghLEHy3rb7ZBoaHyYpNFqDh2++sw2jYLR+fRzMh824lHlmhDep052X
	 dmeGXYNEwFB5UVZjff4UqscXVkpGjEMlp2f5dUM/6oXldDUWIeiF7u0VpzX57gKvjl
	 JJ4AA8Fuo4COIIvbVaz2MmwZ54ZdojmUZjeDwf2sDYKL0QPQiiV+HGCdQFTnwZLJh9
	 0qSTfHRT17GDA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 125ECC3279F; Wed,  3 Jun 2026 21:19:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Wed, 03 Jun 2026 21:19:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-dncbve2YIX@https.bugzilla.kernel.org/>
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

--- Comment #6 from George (george.stafilidis@proton.me) ---
Hi, following your advice, I dumped the EC MMIO region while cycling through
the keyboard backlight states. I found a consistent pattern at offset 0x2A
(Base address 0xFE00D400).
Here are the exact values read from 0xFE00D42A for each state:

    Backlight OFF: 0x00000000FE00D42A: 00000001 (Hex: 0x01)
    Backlight LOW: 0x00000000FE00D42A: 00000011 (Hex: 0x03)
    Backlight HIGH: 0x00000000FE00D42A: 00000101 (Hex: 0x05)

(Note: I identified the laptop in dmesg as ideapad_acpi VPC2004:00)
Could this offset be used to implement software control via the ideapad-lap=
top
driver or a custom ACPI method? Let me know if you need any further dumps or
testing!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
