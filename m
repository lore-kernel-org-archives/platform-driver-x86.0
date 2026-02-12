Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6119511CAF
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 13:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770903823; cv=none; b=QFNdVrMjc1eSJ27Va8l+A5fc8taTsWsSGBnqU5zlirTZ2icHLm5OwQz3NiGFWuYbPc5P1ljA9Q31cKkvHfiqtY75wcQSP2WacLVKuSaMd5urVKmrkAMPXrncRFsswk4dzLT9fg8SoxVtj7MZ4fZP7jamANXFXw1gefneWEUWwKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770903823; c=relaxed/simple;
	bh=AeWMa7ZqYknDoyIxTWzYEjK5L6Pjo4ms9oVqRdIanP8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NCrio/2Mwo91fbqedV/Rk3Kbh0LIiIpzld8rcJ1tV78sFZoeOPxpdTWUmySbR6yoVIVvwBDRPcI6oLzuz3wrzZAcTbsEPzeM4V9zPh6RbqgfrBWsWsDsaevLW3Atd8i2044wKc16pIfC7Xz3pgmq9Ilx/O2IqvFrm/35DqBu8mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rsR8M5R3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rsR8M5R3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03236C4CEF7
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 13:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770903823;
	bh=AeWMa7ZqYknDoyIxTWzYEjK5L6Pjo4ms9oVqRdIanP8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rsR8M5R3e39hVOi4lMwv51fZkCnRjiFlk5JlJ16UrDi20GyK8VEavL+V3FXVffqTo
	 +L3c0AYnMjTmUqNilaEcwexuH8uT3u/9NEEfRobSRPbmpC5H4fZAcgyg+iMsof/fyd
	 thHl5oA0IOCa8JGOIKqW2MHtIsrFp7K/T9gNlZxpUkbPuWuhnoKcoq1zjJg51nehvt
	 umfRG3CZIDAwb/ibRkYB6caf+oI2UDqjdInFXokbEYN16yW51m8njJP5cGnxAEt04c
	 xpIbBplo8mwqj9aOtv6KoYhvyr4dK6E/Yf/IjxBMXQpU4giYztdmc3MkuQg76A8toE
	 lE+K/JgEM3DOQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E18C6C433E1; Thu, 12 Feb 2026 13:43:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Thu, 12 Feb 2026 13:43:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220639-215701-fm520ykTAM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220639-215701@https.bugzilla.kernel.org/>
References: <bug-220639-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220639

--- Comment #4 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Hi,

As Edip Hazuri mentioned, this happens because your Board ID (8BAB) is=20
not present in the hp-wmi driver's thermal profile lists.=20

As per Noah Provenzano's unmerged patch:=20
https://lore.kernel.org/platform-driver-x86/20250731213529.27378-1-noahpro@=
gmail.com=20

The entry should go in victus_s_thermal_profile_boards[]. However, recent=20
patches by me (8ca7515d3c76 and eeeb4c9874bb), currently in the pdx86=20
for-next branch, refactor this list into a DMI System ID table to=20
account for quirks.

To build the patch, I need to identify the EC register for the thermal=20
state. Please provide the output of:

$ sudo modprobe ec_sys
$ sudo xxd /sys/kernel/debug/ec/ec0/io

This should be sufficient to build the patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
