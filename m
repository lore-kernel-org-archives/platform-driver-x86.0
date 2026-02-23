Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDAD30C37A
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 17:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771866745; cv=none; b=T2J0EQlREkxka2ZXoo/v9Gzz7KKNY8gW0RpDq1OAVE4xyUrU1Igz6EoRcXY+J2qpDGo23x23cNtmw9UAW1VuKOKlrwkupA9msnInNaJbBhweisDU3eNjMLy2X/543zuO2i30iie85dbM0+wE+ABnXSIKKVEdnFluUDi5PXlw/PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771866745; c=relaxed/simple;
	bh=ehD6L1LhBHOcNXcYgHrcJIVGqaXvfNDVDFWmKtlSz3U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B7CCKeNHOuVwLnj5O4kQzGFaptvvC6G63/BXKV53et1RT3Gs8cMMu+z/mSlkTSqgSmgS8MxZ0fDuoXE6C8MBfXeamP5jeYLVeXe9uLpqW4eNOSWH/HpIIoXmYnevFpbHrJdShQZRvSujzOnP9mqkE2rRETCuADQ3EJX73DjwqM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AwbEwocd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AwbEwocd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83DD6C19421
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 17:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771866744;
	bh=ehD6L1LhBHOcNXcYgHrcJIVGqaXvfNDVDFWmKtlSz3U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AwbEwocdYIkMtQGz4/BSiv3QRqQhX6Ltt/JQIuBqbFjEksK8E0ArLodZxl1CZYKk9
	 wglRZ5d9dKhuxEzs2jhyLXRwkoFetqfCgq7Cfc8J+svsb0nmC/ROnUUUCkU1ai6JwN
	 +846eTSbY5xusDVU7mtKzvLJ2ZLKYrKO3gd4Bb4uPmEz36cEdAuuU0dHQFQlpRaVx0
	 KF2VFWLgoqDy7EIjhOpMwRaUg4JaO84TdiD5YIAOavBM2um5TcpDToOn95g0U27885
	 Bkp/Ob5sD7AD3Y4lDBfmooqozq0fzgnmRiKXCAZssDfNGKD4MyUKr7H5CTa6y0wLNy
	 5CjzMszopoOvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 72199C3279F; Mon, 23 Feb 2026 17:12:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220722] Non existent battery reporting for a laptop with
 touchscreen MSI
Date: Mon, 23 Feb 2026 17:12:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hansg@kernel.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220722-215701-6vKuiQL6NK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220722-215701@https.bugzilla.kernel.org/>
References: <bug-220722-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220722

--- Comment #14 from Hans de Goede (hansg@kernel.org) ---
(In reply to ggrundik from comment #12)
> Isn't this a GNOME problem, not a kernel one?
>=20
> Current PCs can have quite a lot of battery-powered devices, apart of PC
> itself: wireless controllers, mices, keyboards, pens, VR headsets,
> headphones, etc. Most of them can report their battery status. If a deskt=
op
> environment cant separate them apart, and dont understand which is PC its=
elf
> and which is not... Its clearly fault of desktop environment, since its
> quite a common case. KDE, for example, has no problems with that. This bug
> should be reported in GNOME, not in kernel.

GNOME already tells all these different batteries apart. e.g. if my wireless
Logitech mouse battery is getting empty it will throw a "Logitech mouse bat=
tery
is getting low warning", not a laptop-empty battery warning which you seem =
to
think.

And in case of these ELAN touchscreens it throws a "ELAN Touchscreen Stylus
battery low" warning and it does so *all* the time, because upower is telli=
ng
it that there is a "ELAN Touchscreen Stylus" battery at 0%.

This is really not a GNOME problem, this needs to be fixed either in upower=
 or
in the kernel. GNOME is just forwarding the info it is receiving from upower
and this works for all those other wireless kbds, mice, game controllers and
headphones you mention.

(In reply to ggrundik from comment #13)
> Best solution could have been to hotplug the stylus battery device when
> stylus comes in range first time, but that would be quite a trick for the
> driver.

And probably also hot unplug it when the stylus goes out of range. I would =
say
patches welcome.

> Less convenient solution could be to hide this battery readings, if stylus
> is not in use. This is a userspace solution.

Yes, fixing this in upower might also be a solution, see:

https://gitlab.freedesktop.org/upower/upower/-/issues/197

for an existing upower issue.

> But current solution, to hide this battery always and from everyone, seems
> like a worst one.

Patches to properly solve this are welcome. But until there are fixes to up=
ower
telling GNOME that their is a "ELAN Touchscreen Stylus" battery at 0%, the
filtering out of the HID battery reporting on these touchscreens is staying=
 in
place, since it is the least bad option of the bad choices we have atm.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
