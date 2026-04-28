Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8505E2DB7AE
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 02:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777342743; cv=none; b=HORBpmLCkA8He7cAGOJJJI+JqeJk9bWopegbQmBdUu09L/qxXsg8GA+cGpPJPOyonypR6XQW2MGH8Pubo342S4F0sofP0wK0DL9KD3yoJF0R7irmybxnEQlocWF9e5wYk5/qAGAFq1p0AKMDxkENDU4JDxkB0mxYohn2oBAduOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777342743; c=relaxed/simple;
	bh=A9Kmm5DUUxGO21Efbo1qz/0U0eCDHsqXlyDOtTBDmjk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P1Af8Z4yx7sjLuXSc2bvRKSPf5Vu9yw0gWx8t5FxCceB70ZuTs2fcnoQsNY9hYho9vRPoSg9CvxlAGSqVzMwJrWMrrFKjWrNDMFGmZMr2NZ0hZ1T/S/C/EFpr/bimix8FTb1AjanFZyxFHk2cNJpbcaI0mMLyE5M4Bz0+0wMCdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpJOIoN3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpJOIoN3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66239C19425
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 02:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777342743;
	bh=A9Kmm5DUUxGO21Efbo1qz/0U0eCDHsqXlyDOtTBDmjk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cpJOIoN3ipVLIbvR4jGY4SMdjkPLqA05ecnwl7v9/Qu9oot3SPJmz+CuiM9q2Set0
	 g9zfmBDPeI3ffi7ZRV2s5YM0K8FEyUP2/ggkt9IU9JmcYGIXnZppLszxa4oK95i8aO
	 IaS1O4ChhWJB4pDny3zoJwxqlPDI/gqMt5seHvt5zWe6HzqiLXkQR29taFWTxfLO6N
	 feZw1XzvSobQhzcT+6jWp106eZaDQWmAZAft/jnIeh2PZndbqYeJKoXKcAyCsFcRC3
	 Dw+XWnWiStol0cl8mtQj1VUCNgohT/nWOk414t+gOVPOHJcRwuYYs9+tnzkXQ7+dNp
	 QxO6vgj/5/Wbw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 54BA7C4160E; Tue, 28 Apr 2026 02:19:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Tue, 28 Apr 2026 02:19:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-KGHEEhJndQ@https.bugzilla.kernel.org/>
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

--- Comment #51 from Daniel Gibson (metalcaedes@gmail.com) ---
> Module parameters are usually frowned upon for debugging purposes.

It's not just for debugging, it works around the issue for devices that are
affected but not (yet) on the quirks list. So users of such devices can add=
 it
to their kernel commandline so they can use the device - like all those i80=
42
parameters or "acpi.prefer_microsoft_dsm_guid" in the past.
I think this is more userfriendly (and a way familiar to many users) than
having them write an init script (or systemd unit or whatever) that writes =
some
debugfs option on boot?

> So both a DMI_PRODUCT_NAME + DMI_PRODUCT_FAMILY match?

After looking at
https://download.lenovo.com/consumer/mobiles_pub/ideapad_slim_3_hmm.pdf more
closely, it seems like *ABR8 and 82X* are not that closely related, it lists
several 82X* "machine types" that are not *ABR8, e.g. "IdeaPad Slim 3 14IAN=
8 1"
(82XA) or "IdeaPad Slim 3 16IRU8" (82X8).

From downloading a BIOS-update for my machine I know that the same BIOS is =
used
for several (probably all) Slim 3 *ABR8 devices, so it seems like this part=
 of
the product family is the best way to match those devices:
https://pcsupport.lenovo.com/de/de/products/laptops-and-netbooks/ideapad-s-=
series-netbooks/ideapad-slim-3-16abr8/downloads/ds560742?category=3DBIOS

OTOH that BIOS is also for the "IdeaPad Slim 5 Light 14ABR8" (82XS; note it=
's
"Slim 5" this time) (-:

Hooray for consistency!

IDK, I'll try to find out if it's feasible to match each device individually
after all, if I can find all the DMI_PRODUCT_FAMILY values of the devices u=
sing
either the same BIOS as mine or as Sindre's.

(I fear in the end it'll turn out that at least all Zen3 and Zen3+ IdeaPads=
 are
affected anyway, but who knows - while many people have complained about th=
is
bug online in the last years, a lot of them have only specified "IdeaPad Sl=
im
3", and I don't think there's a good way to DMI-match the CPU generations
anyway)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
