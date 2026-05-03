Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C043D3AA1B3
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 May 2026 22:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777846370; cv=none; b=HFpdQnV1goorcN+FXeBDnkhH+9iIhMFbj8z8y1g9xd8LQlI9pdtep731ZXyR2k5BxrDePp1+3V8LVnfJRdouZ6OQqfEwtTann6icHH5AMsxDFMm7etwqk9jzcrMO2GUfNkjop55ppTdSbO6Y7hmVSRLjD4bPIdbbz0L2xAwaOso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777846370; c=relaxed/simple;
	bh=3dNB7+LgIGC19ZjO6igenzFqTGaW+HifSEH39GB2aVA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RW/e5WVl9HlNVP1puImTwlEaz+Q5rQPaYqFSREB9zHKFXvNxJjP4s2LyA0nflUMEN0pZF7OJbZh3VrRfDw7fEwTvJ8JaFAcWPE8/YOCWNkD4woyy6o0jyvr6tUmclziYktDhH7LjKgX3flwrCKIC+EENP6wkzWJ5MRxx+K7kJCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZ5wA/Nu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZ5wA/Nu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 636EFC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 May 2026 22:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777846370;
	bh=3dNB7+LgIGC19ZjO6igenzFqTGaW+HifSEH39GB2aVA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OZ5wA/NuCyZHeyim5oP3m+06rjf10cHeA/RaDC8FRmxoGljTvNJzcnACwFL1RbBKf
	 qVcReoPsKotjGhjuPr67fdW93atAB3uI49IxXBRIHwqtYv4Yl2raCfjgMgmePl1uBt
	 0VToGdRxGPSvWXlQBaj8lpo/Rj6w6kmJh53y5VEE4kQ7DlSsvy7kilY/2qPD/qrtm5
	 UKBPaScskNO4S9kYuqnhmqRDdWErn5S0fj0qpJZgHmw54LitXDaaTyFPn1NSB0xyej
	 CT9KG4RyCyO8WMnO+cqeCvOROXfFlxAL7KvVsNjQ5tgnNlRlfpcoxOare5zbl43AH+
	 OvYflG2eKuB5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5569CC4160E; Sun,  3 May 2026 22:12:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221441] asus-wmi/asus-armoury warnings on ASUS FX608LP: no
 matching power limits, fan_curve_get_factory_default failed
Date: Sun, 03 May 2026 22:12:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: benato.denis96@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221441-215701-dAjA7DlCyW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221441-215701@https.bugzilla.kernel.org/>
References: <bug-221441-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221441

Denis Benato (benato.denis96@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |benato.denis96@gmail.com

--- Comment #2 from Denis Benato (benato.denis96@gmail.com) ---
Hi, you have to send screenshots of armoury crate for me to add ppt support=
 and
you will then be able to manage tdp as in windows and the first warning wil=
l be
gone:

https://gitlab.com/asus-linux/asusctl/-/work_items/564

Second warning I'll think about what to hear from the original author first

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
