Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A1A3033FD
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jul 2026 16:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783097590; cv=none; b=DMmQmhnHnyBzZxuqOZWz6ihaLV9K52ltWbSW9GsZL0xUQItxNBY5ypqNrtWve1lbRjMCb9VJjgFd7NPCjk64JBe/kgvj4Q5sdusCrorho1qEufNoSsGmYfKcA39Q2btPk/UKrS1ExKRhg5X7PqSLk8EuNxDDWlmcQImgzb/Igv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783097590; c=relaxed/simple;
	bh=fJLNbLTClPGBzh7VxA3i7SPqx+/Kj35x2rzqJUPgYZg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SlqswGZuHWVxHL0gGcG9DFwtNnqGmyuU6t7GZtV1R5qPZHYZTkm2I/wp8+hJVOtJfFVw2G04v9IcQf9Wy2vXiIoEkiWpbT+cac8tIhna885vBBNjmGagJMMG8rHR5+lEHH4iwI8Jg21PVScbNtV9WVS1it427sGTCNzBdBKQJ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RxgBoKpR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxgBoKpR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 613D6C2BCC6
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jul 2026 16:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783097590;
	bh=fJLNbLTClPGBzh7VxA3i7SPqx+/Kj35x2rzqJUPgYZg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RxgBoKpRMslf8Wfd5P44ZnM84vfXC2C9+aju2miJY0UofIDm9/ynudFcnruDpWrnV
	 gu/eg6Q5sQGUV1w+Kn/OEn5MGtdXatmEvg+qESCVspNqDFJZO9bP3wgXdlFwwbRobc
	 T0J+iHQToXQPJHiQ4hNHk15vx778ck73JH+NtqbPgpgt/ci9v0I9ovVlSdB9SLyr1y
	 m78EcJg4cPLdbFdCd3FuSxT7AcwZ3Ua10BMsZUyY7kjlnKwyOo+C84lhaE30187zVi
	 CziQ2Kzj/mqdd7JstUvqTH5N9Z3Xn8ABCrD8UrAYjCsft0/4p5XGNuRDEwe1yrcAm3
	 eMw1LvMq6jv+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 50003C41613; Fri,  3 Jul 2026 16:53:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Fri, 03 Jul 2026 16:53:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-ckroQqfvH4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #97 from Rong Zhang (i@rong.moe) ---
Hi fililip,

(In reply to fililip from comment #96)
> I've been using
> https://lore.kernel.org/linux-acpi/20260611-b4-acpi-battery-notification-=
v3-
> 2-f9390382c5a4@rong.moe/T/ for a while now on 7.1 and I've seen zero erro=
rs
> when charging my laptop using long life and said conservation mode works
> fine (stops charging at 80%).

Thanks for testing!

>=20
> I also updated my firmware to the latest version (PSCN23WW), unsure if th=
at
> helped to an extent as well.

According to the changelog, I believe it didn't fix the issue. Maybe Mark c=
ould
provide some clues.

>=20
> Maybe it would be a good idea to ping an ACPI maintainer to get a review?

Of course. Since you've tested the series, could you kindly reply with a
Tested-by: tag to the cover letter [1]? The tag shows positive feedback fro=
m a
device owner to the series, and effectively pings maintainers.

[1]:
https://lore.kernel.org/linux-acpi/20260611-b4-acpi-battery-notification-v3=
-0-f9390382c5a4@rong.moe/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
