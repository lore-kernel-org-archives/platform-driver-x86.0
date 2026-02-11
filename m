Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653093101B2
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 16:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770829131; cv=none; b=nOChw+20qJyCgfdc5BUBEM4J/eRDHs+oCF0LNvChS+Oh09vamtxFW/JRxfQHaoRkuspycnWucVoz850Cyg2cSgEr9+L43EdgXEJVlv2ZIhtmu65H3ud5Ag2RgMtFvPnrz8gTBg8f5Iu6/X3nm1qIIUYQEBmQ0VJ3cB/P+gxTXNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770829131; c=relaxed/simple;
	bh=+ESL6qmrqahAFYqFoCrowzP6KHxNxxnNMXl0EDI9JTQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A94J61K/LZuufrc5ZwTB/Ro4jW3bnjg0PlBbvIYB7oJHPt6Fj11AvUJxC4DWEjDcDPZZk28Qq2ZMYNparwFT5229IGPyBPQrXYP6qImOnkTsCRuyw9C+zqUi0soF6f4pJFVSfEJ8vpRdat9LN/qAzJBtsa3FPm3QMzF61qgAVH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLA9iiUV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLA9iiUV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FF3DC19423
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 16:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770829131;
	bh=+ESL6qmrqahAFYqFoCrowzP6KHxNxxnNMXl0EDI9JTQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JLA9iiUVkWzYGbEv5Xh93dD9C5vwU4Slit6z7i0SStg3F6NQW7NLLP7civBVcXz+t
	 5nImo/pyJdk0W3imqGF2gpeo5yqLrSPLsFroGaoP//stymRAx9Qs11avH6qWN8vpQq
	 2LDQJs+4CLShPeuS0CMGRgrxHk8JgCMXl20J948HOoW9BzmJJFwLTd9kAb4TgPL1ox
	 Y9h0f4B3ldxldq7nY+XPdzPaKI7QexHOaZEM8dgA/EGRnXikbhlRsjIjc4zN0QAs+C
	 QvV6X3sD+/c8oKjA60CRueFXSmm/FmnRGVmv3krVkEheJlgaHsOKgz4XTDlqug9M18
	 Y+XnEQwFBREFw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ED5E1C433E1; Wed, 11 Feb 2026 16:58:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Wed, 11 Feb 2026 16:58:50 +0000
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
Message-ID: <bug-221065-215701-doI0bHoW2D@https.bugzilla.kernel.org/>
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

--- Comment #29 from Rong Zhang (i@rong.moe) ---
(In reply to Avraham Hollander from comment #27)

Thanks for your test.

> It did not. Unplugging and replugging the charger a bunch of times results
> in:
> [...]

Ahh, my fault. I meant fixing the issue that ideapad-laptop misinterprets t=
he
error returned by the GBMD method as a valid return value. According to your
log, the patch seems correct.

As for the issue of the mutex chaos (and hence the error logs you got), we
can't really fix it from the kernel side. It can only be fixed by a BIOS
update. That's why I added Mark to the CC list.

I've seen GBMD, SALS, SBMC, and DYTC calling ECCC. I think we will have to =
add
a DMI quirk disabling most (if not all) features of ideapad-laptop on 83DR
until a BIOS update fixes the mutex bug. Doing so should make the mutex less
likely to break. As a quick test, could you test if blacklisting ideapad-la=
ptop
in modprobe.d (reboot required, ofc) helps?

(In reply to Avraham Hollander from comment #28)
> Is there anything you notice in there that could potentially cause the
> system to take excessively long (2-6 seconds) to resume from s2idle? That=
's
> another probably ACPI issue that I've always had. This is almost certainly
> unrelated to the charger bug and I don't want to go completely off topic,
> but I figure it's worth mentioning now that I have contact with the relev=
ant
> people.

I guess this is also related to the mutex bug in DSDT, considering it has a
bunch of EC queries calling ECCC. Blacklisting ideapad-laptop may have some
help, as doing so reduces the probability of running into a race condition.

I am not really familiar with s2idle and EC queries, so I may not be the be=
st
person to answer this. Armin, do you have any thoughts?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
