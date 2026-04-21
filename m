Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5319F1AAE17
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776783081; cv=none; b=bAaOV8F3GX+lASWVZhpY9oKjtuOqENJcAP4yW+W+hS10LvbE2aII+c+1IqACALmVFO0Y4RJOkkBWebt57Hu12GEgKcQ179g8NWGVo0pSTC58Mc3yOhhhrpAaWiEAWvmw/O8qoAxFx4y8P6xDDHrcc8vaMicHE6bZPa65BhX5dUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776783081; c=relaxed/simple;
	bh=fhF/0Z2Y0Y2iJrvJZ9bCVtMAXlSlN7RcehuFHZNM7hk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hIlAYy9IsWc8S6MZIpsOaui1pcZLPbfDcD3O2F5jJKOo/LRQmgOW/UrVioZfSSYNro1+gpdKzhg+pptxCgptlEJnf6ydw5WDkSTUWSbZSCyzdPWCgR/Ox8PGhdukZGaeE28Xqzp28xNlBWGGFA9z+aY4BKmLPK0DfJi39mPZfNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rd7i2r9h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rd7i2r9h"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C4FAC2BCB8
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 14:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776783081;
	bh=fhF/0Z2Y0Y2iJrvJZ9bCVtMAXlSlN7RcehuFHZNM7hk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Rd7i2r9hPu7n5KnCzcGYFJc8mBwP23zqR2L5o8m4Fvu1czAuIMZit3IS+BImCHxQu
	 X5zOmW6frzWz78TXMbMPOXWBLjPRvg8pauxMjcMKeyUYGGW+Nw80aStPMhlkqrm9SE
	 HjTBlOg0eos07+a9j+P6A0+NA6/8IZee+y/FM3VJr9SGzRuo9iQ3ll/q1ok/35f5pT
	 FJaNcb++PsTaWT6tTHGIDAwqN20qgu7wF66klm+rQHFM//z0azMCyDRiSzWS+oM16O
	 0iuysqSBTQ/49QCujQqVNsevmSWQ/9eO+azekLtdQwh0KRP1vDkMV6tIQwEf6QX0qV
	 YkGDVo9Q+Kj0w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 05954C4160E; Tue, 21 Apr 2026 14:51:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Tue, 21 Apr 2026 14:51:20 +0000
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
Message-ID: <bug-221383-215701-GQC5scVun0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #9 from Rong Zhang (i@rong.moe) ---
Thanks for testing.

I've just checked the decompiled ASL code of PNP0D80 (in SSDT4). Nothing st=
ands
out, and the S0ix implementation seems appropriate.

The next thing that caught my eye was the "Failed to deactivate keyboard on
isa0060/serio0" error. Some devices can't handle this properly and will run
into a broken state. I am not sure whether your device falls into this
category, so please recompile the kernel using the following patch and see =
if
it helps.

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 840cdf5878dc..7f5f1d1ca265 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -250,7 +250,7 @@ static unsigned int (*atkbd_platform_scancode_fixup)(st=
ruct
atkbd *, unsigned in
  * Certain keyboards to not like ATKBD_CMD_RESET_DIS and stop responding
  * to many commands until full reset (ATKBD_CMD_RESET_BAT) is performed.
  */
-static bool atkbd_skip_deactivate;
+static bool atkbd_skip_deactivate =3D 1;

 static ssize_t atkbd_attr_show_helper(struct device *dev, char *buf,
                                ssize_t (*handler)(struct atkbd *, char *));

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
