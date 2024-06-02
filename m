Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7F8482FA
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 17:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717347769; cv=none; b=iFuZRF3QIQSXkA3JJvn8VMB9DbBDpbM7ByMTGS88SefF9Cg3Im3pL2tf8B8Vc0snyVfVWIBlJBKZwUmMC1lRN6AkNDZumNr0XOxZOQzfUnpgPuxur+dhKd6m6d5BJZxfF5aLrlUTpxURbgMwZDBDCH0sIrqWdl2rtvBc8Dx/ZJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717347769; c=relaxed/simple;
	bh=s0QuNA7ooGaCQR0kTibzlltofic2+tViu71b+YsR+co=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ljP1/AJytVJk13Et9TxQ21jv3ZCFHHFxR2J8D1J5VSEqs1rtL6gbpMyolk2Qj7YyJwYZGBmRK6day9PzTyCA/SQFSKOxVsDUx4t+NEWTpSS+pN+PZTvQrYG16B3ImTP+xe5JY1DPglsqZD9ll+axg4MKK7SXVp4qdgtrfrxxmE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUcnuw5D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUcnuw5D"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9650BC32781
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717347768;
	bh=s0QuNA7ooGaCQR0kTibzlltofic2+tViu71b+YsR+co=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RUcnuw5DFj7Pq3ubb8Zjs/ADLO5aHV4VxO7rGeXb2YROA03fgeafcxU0o50AywCU8
	 KQDut2qkJTiU2Fb98c0sXKy35TMP4/V3ORUJNHM4fxDV7mX5r7Jys7BH+mo3KoZLIt
	 jovoaOMya7YJOBD2y1thoVY+3RHcdTa6SF8E7Ic4DkcfY0WeZTvS+hm/4PQyhhurtL
	 a1EVKmxV9edhvRzc8yqTWOJFzoQ3kXcXSO2KH6/ZF+bkch7jPWJNnDMMxHWU49haD5
	 J8jZmol/9o7vXb1qElNxtaMGx6ZJ0vM+GmPittQo5pgCDt6LdySnE17MGDYk19gvIu
	 J3s8ITghVq/+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7E69CC433E5; Sun,  2 Jun 2024 17:02:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 02 Jun 2024 17:02:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-OMUxmfXeOd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #25 from Armin Wolf (W_Armin@gmx.de) ---
Does dmesg report any debug messages like "Type: XX Eventcode: 0xXX"?

If yes, then please send me the output of dmesg after pressing the FN-keys.
Should the wifi issue happen again, please send me the dmesg output too.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
