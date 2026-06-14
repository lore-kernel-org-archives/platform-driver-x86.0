Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC2E2EA73D
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jun 2026 20:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781467248; cv=none; b=XXL6psjo6WfwrTvu6GbA9dijn8/IxeYG3CyyGWWwV02ajI1bPNZ7O/++vh70EdFIrcn90aV7js6wbZXaNbW6gjEyS3XxlvY2vvK1ir7A1DnSQ4SUPawHVKP6QnrzcOstYGjsPNYs3bbOurU1SBDyJ9+S347GHasFRv3HyMWVPdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781467248; c=relaxed/simple;
	bh=9UgUf8wvjViTGVGweuQD9W1N28uPz0fM8ZON4TYrjuE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IVZ/PpbPe6I+zBwH6FDPvtmFHo3sGG8yeaOrKAx2gQFcriD7Me+EXR6R+S2kQwGO3olxdNK5WMlNITV2DM+EEtmIWu3FIAeYJtNs6Se6WaemNXu7XLkkt9sspP4KyW5H0MXzwpuGERw0ymqPzQZ3B64V6LPlbAlsFyWaWj/j5L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nh859R5d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nh859R5d"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2BC0C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jun 2026 20:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781467247;
	bh=9UgUf8wvjViTGVGweuQD9W1N28uPz0fM8ZON4TYrjuE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Nh859R5dOQgFDZ9jEF7p1Ee2Hp5xfmw+2kfB16QIxK9W+6uZZmSIcUqZgBRYwtybj
	 IhlE8+HSqHYf2ds7QfkEjGSTZ/szddPgr2ShevfqxyJX4q/HytFtvvMg4CYHEr2YNR
	 /s8PcgrZzCw02TZtKAmL73RrOyuQQKTB9DVat5R7BPYiNf9kfTwqRraf5Ve+FKKLRA
	 Bz34XYugWsyuQCjIhVp/2//vbYgBD4u1gkkHIHFY3luVEcg7jGxYt8O/DESChK4kfL
	 O2QtU4258UFlbFwAxG9bwToEOyiA+4YCywe6qnSjzzooneXf0Plhyyuah9klrg6LrS
	 DEu0q58SxBfwQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9B2B3C41613; Sun, 14 Jun 2026 20:00:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 14 Jun 2026 20:00:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-8aThpB2bGQ@https.bugzilla.kernel.org/>
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

--- Comment #100 from Armin Wolf (W_Armin@gmx.de) ---
Alright, i worked a bit more on the driver and i think i finally found the
reason why some features do not work on some models.

Please both test the attached driver module and check if:
- keyboard backlight reading/writing over sysfs works
- changing the fan_mode, usb_charge, reader_mode and fn_lock sysfs attribute
works
- reading and writing the battery charge limit works

You can use https://docs.kernel.org/admin-guide/laptops/lg-laptop.html to f=
ind
out more about the individual sysfs attributes in question.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
