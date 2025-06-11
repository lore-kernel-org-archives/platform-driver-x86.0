Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68822253F3
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jun 2025 06:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622246; cv=none; b=eLRzNVvwA7liwAUut0H7EdAwVz/msCnDFA7jKkVpe2IqjGZXpymTw1ErSuNfBw6SFiEfU9p8yrn/7xUaSNppiWPKpMCekn4diAt9KWAvvxOPxOC0X07HJKH7kH3TvQZvZ3fW1g1JlyTKNbKtVKy2pRzwetYc5QbAJvQbTlcFZDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622246; c=relaxed/simple;
	bh=BE+mGOyahaT9r6ZdTZ3GOhAGIxoFT78r9UDxCzbA4W4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sXsPfFx8IpM6qMYdPqT0fgrFwCBweoF0Vk0gzTyfAuCaUMcv0GfLU7AkYGwGBBbsYyi3aJM2fXMJqXD7MdwcjcnNckDxBSXIEi3We/ODtmM0qJjNuYOegS1gsDJPVcWDWtnafFzu5ZEuqxi8w4ZHyaTkos2SdMYDOZc5xm+4WWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=du+0iKgD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="du+0iKgD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 463EEC4CEF4
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jun 2025 06:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749622245;
	bh=BE+mGOyahaT9r6ZdTZ3GOhAGIxoFT78r9UDxCzbA4W4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=du+0iKgDbJFGKMYCGHK3wiDB9ii+OfUmNDMk9DueoK5Nx2k1vF27LXSwwE9lF0C61
	 VhwzUo+i1/NR3P7UjHclBPLkSKFMwD2tP0RRgKDMWO71LxqG30ZYzOi6/bA6Ee1Z/8
	 Q3bQTbAWi2Wouf1Pfl2DYvSvGeEBjesiUA63xgtIj+UhJm46JsKm+thuNbjgJVY+mo
	 ifb/kTVvj/4x8+TLIzfoAfO7Qw2qm+7EqiMjs/9l4Yx44S43OeKwAjA0SWvymf7g4e
	 ccIGjfSjjltdsf8UrEp2PmiQQYcrOTNLGQ/PlrkcWfkj5P7aF7q+nOKW1nwxLcAYS4
	 9IFIoirHKq/1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3E717C41612; Wed, 11 Jun 2025 06:10:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Wed, 11 Jun 2025 06:10:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Input Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ein4rth@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_input-devices@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220116-215701-UzlgFAeFI1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

--- Comment #25 from raoul (ein4rth@gmail.com) ---
I haven't heard from the linux-input devs, but PCSpecialist replied they do=
n't
care about Linux, so no chance for a bios fix. This keyboard also seems to
cause issues like lag after a while while I'm typing, but I couldn't find a=
ny
message in dmesg except for those ACPI errors.

Anyway - since disabling the wakeup fixed suspend with a consistent 88%
hardware sleep, I guess defaulting i8042 to disabled for this hardware coul=
d be
a good idea. I noticed other manufacturers share the same hardware (usually
Tuxedo and others release theirs after PCSpecialist), so maybe they're goin=
g to
find a fix in the future.

Thanks again, Mario.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
