Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E9B383983
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Oct 2026 10:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282471; cv=none; b=chp1DP+R1o3Ck901sXzJlrAMqx3uHjqfIGDWf8mXL/5p8czyEqUNEhzkkrTTd8rS7Er3vThfkFifccK50+09uUAgAYpmQ91UW3FC7OVf14CmnpCecn6e8W47otGIAkwzvKobPJJozJKRa3Yy9u0DyC1Jp4+lUUz4Lm1hgNmJLGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282471; c=relaxed/simple;
	bh=+3cAfmewuI+YJ8YFbtr4ByXx61274g4ctP0CoEo5FIY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PB/l0j7hxFdin+BXMNfV3DEUhI9mLG10axcTczAOqyjXrZ5etYwLZVTRgEe4TbcmZaE9J8ZTtfBnYOH0rARHpjZP+xB7g9sckgxV0aWQbws7QCM64/e59HeGwwT6hTdhIXPSUa5zK3qVf+J74erZYOC+S+Q56cvhYio3CsezJbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSf93hJH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSf93hJH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BD66C2BCF4
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Oct 2026 10:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791282471;
	bh=+3cAfmewuI+YJ8YFbtr4ByXx61274g4ctP0CoEo5FIY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HSf93hJHeQHH7RxgxQNcKZ9aliUd1o5v3udLdkez/TOapvFW0Ucp2/eZtVeEGVy6J
	 wEjgHFNUGd/u0wK+Jz6/dhDN7C1NpmzvcLsObHIfOTdEuMZQeFM4RLlw67tQDyM1+J
	 nI/OM+72eGMBql+sKWV7TonlCCTrGyuxm7cNhpWEOM2UOm7T1ZRj8mMLfpIr2AFKb1
	 odbX94THI9aBI+GcRVDPSAO4WWweqtYMoDJkbZ+U1cSZn6kq2hQAzouMf52GADFpw7
	 leXwp9zYAVU/F3qPqiU1ODhVJXQhqiD5ddzp2hVPnb9EssSqYENVmifab/M+oDzjuf
	 vtDOIxaCYSDAQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1CC7DC433E1; Tue,  6 Oct 2026 10:27:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222044] hp-wmi: Mute and mic-mute LEDs not supported on HP
 Laptop 15-fc0xxx (board 8DC9)
Date: Tue, 06 Oct 2026 10:27:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aryanbabupiyushbabu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222044-215701-XqZ6K8C8Ys@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222044-215701@https.bugzilla.kernel.org/>
References: <bug-222044-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222044

--- Comment #4 from Piyush (aryanbabupiyushbabu@gmail.com) ---
Update:
I tested the vendor processing coefficients on node 0x20, and the F5 speaker
mute LED has been successfully identified!

Speaker Mute LED (F5):
- Select COEF index 0x07: hda-verb /dev/snd/hwC1D0 0x20 0x500 0x07
- Turn ON:  hda-verb /dev/snd/hwC1D0 0x20 0x400 0x01
- Turn OFF: hda-verb /dev/snd/hwC1D0 0x20 0x400 0x00

Summary of both working controls on ALC236 (103c:8dc9):
1. Mic Mute LED (F8): Node 0x01, GPIO 0 (active-low)
   - Setup: 0x716 0x0f, 0x717 0x0f
   - ON: 0x715 0x00
   - OFF: 0x715 0x01
2. Speaker Mute LED (F5): Node 0x20, COEF 0x07
   - ON: 0x500 0x07, 0x400 0x01
   - OFF: 0x500 0x07, 0x400 0x00

This combination appears identical to the alc236_fixup_hp_mute_led / coef 0=
x07
fixup pattern. Looking forward to testing a patch against patch_realtek.c w=
hen
available.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
