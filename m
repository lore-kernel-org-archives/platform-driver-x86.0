Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48312E54D3
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Sep 2025 04:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757392065; cv=none; b=dF9EGnFrtplWc7dcOkct1Zh3hDbJyaXuHZLvKOQlqfjGG6RUGIHg31Dh8tFW5YfN9449dZoepJ+aU7COfLSrP+cp342DYk/Z5GHTws/NAZqGUbX6l+jxESFFZ3wMOHtKXiN/fw7rihbridd8Mb8Zqw6BQhmtEo0X4PxbJbZ8xEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757392065; c=relaxed/simple;
	bh=qvklgSfS/TkTtZ3f6UD9xWaMDORAGH1HpgT64VGxKy8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MFiXLhSRj8RzT5woSmTghyTfjQ222ip5b1jnnrmo51IchyXzjwK+KimcNytAm2rpm3hqCt0Pv9moZAPpRB0gxEIblOuL/LHiN1vKV8BPU8wH3mbRO8m/ptdbZNTLdbhB/vxtwwsQr6uIshS9w+6Xi/F7yNKw38GPyoV71kOIAcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sn5qOBVs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sn5qOBVs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52B4CC4CEFA
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Sep 2025 04:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757392065;
	bh=qvklgSfS/TkTtZ3f6UD9xWaMDORAGH1HpgT64VGxKy8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Sn5qOBVsM/rvCR7Kw9UAW3jshUwEtQeUYAS9prajDgHU4nbDMMKxHymPg/bRhLpH4
	 3tmcDvXsLg6VQOGREpOrjpVryKIT1+nPHzyklEKXof5SjX5Y++HfvkvNsa5u4SNh2E
	 s9NE49wjsihcQmx77SrnQ7ZpB5kBWPxicH8VHyOn6v/QahxhE08BX7q4BRrjnYsod6
	 RNNr3wUJzPbcNZuNPJjqq0+7jSy3HIo0k7eL4sqjoI3UGHfFixVmm1y56Vx8z62FZa
	 m5k1aOekRFCIjBwjNWWZSTojJYde8DRH7qa59zBTmljCHch12mB9GybVjWDFlanBw+
	 7RX0erTe93yKw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4B131C41613; Tue,  9 Sep 2025 04:27:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Tue, 09 Sep 2025 04:27:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: petar.vidosavljevic@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-SwXBaKitjA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #102 from Petar Vidosavljevic (petar.vidosavljevic@gmail.com) -=
--
(In reply to Mario Limonciello (AMD) from comment #101)
> Those of you that can still reproduce this, does reverting
> https://github.com/torvalds/linux/commit/
> 4dbd11796f3a8eb95647507befc41995458a4023 change anything?  That commit is
> correct so we wouldn't revert it in mainline, but it might give a hint th=
at
> there are multiple timing problems.
>=20
> Please give it a solid shake out (at least 10 cycles that you unplug power
> adapter during suspend) before reporting back.

An update that might warrant some investigation.  I updated to the latest HP
BIOS, which is:

Version: V82 Ver. 01.09.02
Release Date: 08/04/2025

I thought I'd see if the new BIOS fixed anything, but I was able to get stu=
ck
in the low power mode pretty easily so I figured nothing changed on this fr=
ont.
 However, I found steps where I can consistently get into low power mode and
get out of it without a reboot.  Here are the components in play:

HP Elitebook 845 G10 - 7840U
HP 65W USB C charger
Dell WD19TB Thunderbolt Dock

Here are the steps:
1) Laptop in use plugged into WD19TB (normal performance)
2) Unplug USB-C cable from dock
3) Close lid of laptop
4) Plug in HP 65W charger
5) Wait a few seconds
6) Unplug HP charger
7) Open Laptop - See that the CPU is stuck in low power mode
8) Plug laptop into Dell dock - CPU is no longer stuck in low power mode

Now if I return to step 3 and follow the steps, in step 7 the CPU will be in
low power mode consistently.  It seems plugging into the dock resets the low
power mode.

I'm not sure if any of this info helps.  I'd be happy to run the scripts to
capture logs tomorrow, but I thought this data might be useful

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
