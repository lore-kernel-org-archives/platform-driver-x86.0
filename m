Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7CE53393
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 May 2024 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715419383; cv=none; b=YMbTdqtBQuAfRibAvGT6CyhLwXY7J6wPok/7/wo3wITMFnBxFZ/fKjquxnewV8Haz1wuQJr3XvlTUV1Y9dQkrxWSve01bOxzsS6c30lDnWij32drf/+1MULT2/fXLnqYo5MCGuPnlc/9TfFI/2PYJwW1MLZO7y0qKFPXUvtxjPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715419383; c=relaxed/simple;
	bh=bTD/IVwIt49w0RtzdTFCVDTx7nO+EiT91spM//TybZ8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=omaU0ymVpVArOE7/1PDXnvo/BfploKEdGkK0QQ5r2E4jkT3+iu16ENSPPOXYsDfErFaUETqW7E7T9Ihurtr7/bwyczgkTWLAUORWt3cBehzhJ5ByFjP6tUlMkrckRt2QBTMp0f/FHeSY5eefwB81d5K7DcXcct31V60LPBXUn9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EebxaNi8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EebxaNi8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E6A5C2BD10
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 May 2024 09:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715419382;
	bh=bTD/IVwIt49w0RtzdTFCVDTx7nO+EiT91spM//TybZ8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EebxaNi8xdzh+r1obp3nmSQjW4HCFjLvlf5U85D7UIv66nhTrtk3HM0ek+Ksjy9xU
	 jfTseXDeDGT/BIytVTIuGDHh3fTEvv4cVvOFfDNqEGN/7NJsbrHCbpSPzG9uUKXMT2
	 AB4+jZ945mRvgFcS/klEu3rvgOw7LuAtCTj+44OKubmkl17z0+IWQMcSl2qS7SAJpl
	 ifk+9q7e97wq3vu0bIK4cppnA2B/AW2EsrXh/Lgl2fVWn5U3NXZuMYt8LUNfvbBAXZ
	 NMxLunHQl3x5yUiRGUtmXjTy9ayauYRSOwkn5SkgBe3XMe/+zgpCJYoHPWp5Vi7QTH
	 QFQ0KnPrjmHtQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 946E4C53B70; Sat, 11 May 2024 09:23:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sat, 11 May 2024 09:23:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: darkbasic@linuxsystems.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-TL1vHZcvBl@https.bugzilla.kernel.org/>
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

--- Comment #69 from darkbasic (darkbasic@linuxsystems.it) ---
> Yes, it "could" be related. This is getting OT, but if you have enough po=
rts
> on your laptop without a dock you could try to plug dongle(s) for monitor=
(s)
> and a regular power adapter and see if you can reproduce the same behavio=
r.

https://www.amazon.it/sicotool-Adattatore-DisplayPort-Thunderbolt-Compatibi=
le/dp/B08B647L2X

Would something like this work on Phoenix (HP Elitebook 865 G10)?
I'm pretty sure it requires DP Alt mode.

Also, would it support Displayport MST?
I would like to keep my setup the same to make the test more valid and I'm
currently using two Dell UltraSharp U2515H attached via a single mini DP ca=
ble.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
