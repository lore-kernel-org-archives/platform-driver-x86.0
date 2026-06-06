Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00D13B47FA
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 18:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780770416; cv=none; b=mePPG3Ko7Z+tbJRGsXpPEIYfg3Ev4J/aLD6ZH0wWnv6jxIkzkG3U4YevS37GgQJrjNV1TfAAwElgK4ew87jFx310OrsDcxAcRY27wfPwHy/GhgJ3MnZZXuxt7RFddYi1WsdfaCcox0H5dN0XQI/DG7OMPmqSEt8NI3754MQYb80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780770416; c=relaxed/simple;
	bh=B0vMWYeVJHbf8sTz1MJJtlyybbhytsCCrl3F0KHRvhc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=chCTnS+4dIlKf/mRNusDeRZ9vGJ97ecki1UdQt8MqCBKsnLdKKJKy6NN27/24gSwq7bH5pep4j76u3JBEtLaIlSKudZI0ESgv5i6o+0l18GUO/T2aYlNoOudXoWh3t8hfiQW5Fl9XlObcGIyB40VMAmFdaTCcx2gBMPn4KtTo0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HROJeWUQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HROJeWUQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 241B6C2BCC4
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 18:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780770416;
	bh=B0vMWYeVJHbf8sTz1MJJtlyybbhytsCCrl3F0KHRvhc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HROJeWUQDL2J8rcyfRWFq6I0I01T21T/9QQZIZaVyyUejladjDFJ4Nc0i3ly447me
	 vzSo/MMbZFrtEhmne7UpM30RamNd4L56E4iFWxUdrMxhmzOmcPhVMkRKU9dI605kSl
	 n5lrIuOcV0Yt7jbvpiB/gb+bN0J5DrQvS4LhHQwLGJNMQKwRYYH7lEoX0ofNQbGDLA
	 IKyyydfecKRIYTZR5Ha4b09xc2HHfhqamEkCNTgc6T0UtDES8q6zipFmplpO5rh5Gr
	 Q9HHkYUYqmoBl2ad7cozDuv6hrfjCWc8m5gy5uMIlYjeIau8apOXgUn60MNHazlGH6
	 bdlw+eCzifpKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F3C7CC41613; Sat,  6 Jun 2026 18:26:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Sat, 06 Jun 2026 18:26:55 +0000
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
Message-ID: <bug-221583-215701-ixi0YL4AEZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #32 from Rong Zhang (i@rong.moe) ---
Then I doubt if clearing KBLO actually also clears 0x2A.

Try:

1. Set physical keyboard brightness to Low
2. sudo busybox devmem 0xFE00D42A 8 0x05
3. sudo busybox devmem 0xFE00D48A 8 0x54
4. sudo busybox devmem 0xFE00D42A 8
5. sudo busybox devmem 0xFE00D42A 8 0x05
6. sudo busybox devmem 0xFE00D48A 8 0x55

And also try:

1. Set physical keyboard brightness to Low
2. sudo busybox devmem 0xFE00D42A 8 0x05
3. Close the lid
4. Wait several seconds
5. Reopen the lid
6. sudo busybox devmem 0xFE00D42A 8

Please also try:

1. Set physical keyboard brightness to Low
2. sudo busybox devmem 0xFE00D42A 8 0x00
3. sudo busybox devmem 0xFE00D42A 8 0x05
4. sudo busybox devmem 0xFE00D42A 8 0x04
5. sudo busybox devmem 0xFE00D42A 8 0x05

I also have a slightly dangerous idea:

1. Set physical keyboard brightness to Low
2. sudo busybox devmem 0xFE00D42A 8 0x00
3. sudo busybox devmem 0xFE00D42A 8 0xFF
4. sudo busybox devmem 0xFE00D42A 8 0x05

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
