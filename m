Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEEC2E7382
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 17:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781978134; cv=none; b=ZCdx9TRMr2HD9oBiyc4HPjZVCZiXtFUXursD9ztdjnlKSu2F1bzQv+RjgtZE+LowPGQfNHX4zPmz7oFU5VJfXD96jU537UgCjaMy3+qriI1EivGze3fVwXFw4YvQpAp5nDbtXVBkBPZHBoLfKZAT16oqCgO388utBxtyMe4fso8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781978134; c=relaxed/simple;
	bh=5f+1a0pxcZfptGZDIq5YWjtv1mHF6QIiMskAey77GMQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GJExb0BeWz0ClB760jKTcFoxJv/m8/TVYJKukLfZjakC7wY4Zu+qZQUl8oncBuCOQ2FnOthlJj4kS1qTiu7GcMunn1qvPCAleRu2fVYy1e0Z6IGnYuoRMJJDydpssTUwyJLTjbPWKK8FTFlSOQw7EqpsHWSg2IIMuv3mRX3UNR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MlhhfHYd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MlhhfHYd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6022CC2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 17:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781978134;
	bh=5f+1a0pxcZfptGZDIq5YWjtv1mHF6QIiMskAey77GMQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MlhhfHYd1iUogd3nonFumsLj3VYKzxFK/624jN3dcnSo2sCwMe0+z1z9pRxqrU5BE
	 n89EGj6rm5yuiTNKrX9c8FUR+Be/fzVPNFpwrvulqyZ17TUPQVDl2DgBuK9GMU9QbF
	 0kBF0h0AnVo2KUEBbyjttODNqsUTyDIXdiw6CIN6l5yrtUWRP7vY4PPmFW1QVohbmo
	 g4VLSJFFYRDFtN9DAbLl1mW1B5jmPWWJHKPXKUHLbugWGAKwddJTsfM6yDt3pJtR44
	 6a9Cld+5iwIpdZIpz/z8vDJC+dyfkG2H2bdztwrRzMe/YsJ6drFgh0fH90CqMuygWd
	 TQAVuI/z2NsxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 46183C4160E; Sat, 20 Jun 2026 17:55:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 17:55:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-3zsOo0MYhr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #44 from Milan Oravec (moravec@ukf.sk) ---
Thank you! Fan Always On is disabled in BIOS, that was the first thing I've
done. :) Than it is the BIOS Thermal Hysteresis, but that can't be changed.=
 :(

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
