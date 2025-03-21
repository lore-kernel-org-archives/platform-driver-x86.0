Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CA742A94
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Mar 2025 15:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742569757; cv=none; b=Is8fqfrStVPj7A2lRWufXqXP0g2EYM6P+Zr6hRJo7vtvUDDNA7WrqMhF6YLuPI9+ERg0iynBZQRlFucubnxBmIXj37HfjfSKkWb0rUDiYTmcMOkR9FiJ6lRg2jBDMMkrMqHspyZqSFJbf0Fe2/935fwDGXKT07djF+8nS6b0ZCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742569757; c=relaxed/simple;
	bh=rME9Yw2vu3ML80VTODjfnDgGc4zOTT0ll5OEBzuOQWg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jVrZ9D5uppkqcn+fO8HP8EG0++O/rkq8uHEHmR/G7GnOTZoGPtl5KWnFAtxmE6f4tFZDVn2MVKEE4LrC6vFzfDEAfjqBtOPZXdWJWmXRLU/JT/C7QpsfZoNOPpUv3HKLx6ZNVajn1YrpDT68ozkyx+Ex+eObjt5A3tTm9+wNmB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N57RlQjl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N57RlQjl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC4A2C4CEEA
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Mar 2025 15:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742569756;
	bh=rME9Yw2vu3ML80VTODjfnDgGc4zOTT0ll5OEBzuOQWg=;
	h=From:To:Subject:Date:From;
	b=N57RlQjlfRUxada+GSO7wNPlaZCZKA6boaOfZCjH6hPrXRO4F2k7F6GNvU+PveUju
	 Nnd5DzXb7oKrKlrO1NXAv3kbonD8mMjAlGq+RcSvqZ4Q7OroA9w5bviVXpLKSEBqo1
	 P1fvK3k+0UNyMkh3yKvhGPXS0Phj0AGvIIkq97Un9sTTmsigWtHkI4xVz6CU1BcQPA
	 9JbSLsiw0BgoP9rDUL87/DHPvs/DNviRbVB1OzyiY70IngJi2XJiNajNbpVl3ddfky
	 /1475zdfFCQlocaC/VvPkZjnTR1iJ6L9E8Td1G3+VxZb2iFyhm+P00nLCqfstETXPT
	 DrzH/SpV9/StA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 962B3C41616; Fri, 21 Mar 2025 15:09:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] New: pc speaker not working (just pop's/click's) on
 intel chipsets gen 6, 7 and probably more
Date: Fri, 21 Mar 2025 15:09:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tobias.diendorfer@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219904-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219904

            Bug ID: 219904
           Summary: pc speaker not working (just pop's/click's) on intel
                    chipsets gen 6, 7 and probably more
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: tobias.diendorfer@gmail.com
        Regression: No

The internal pc speaker just pop's/click's when ill try to play sound, with=
 ex.
beep command. It does'nt matter which frequency or duration, the issue is
always here.

 * The pcspkr module is loaded.
 * The issue occurs on Unraid v7+ (slackware with kernel 6.6.78) and also
ubuntu 24.04.
 * The issue is also present in windows.

The issue goes away when you put the device to standby and wake it from
standby.
That's really weird!

Here are some links:

https://forums.unraid.net/topic/168324-biosinternal-speaker-issues-clicking=
-rather-than-beeping/

https://www.reddit.com/r/linuxquestions/comments/10jg9ip/pc_speaker_makes_c=
licking_sound_instead_of_beep/?embed_host_url=3Dhttps://forums.unraid.net/i=
ndex.php

Affected (confirmed) boards are:

 * Asus PRIME B760M-A D4-CSM
 * Gigabyte H610I
 * ASRock B660

So affected chipsets seems gen 6, 7 and probably more.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
