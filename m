Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F0ACA4E
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 02:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771293978; cv=none; b=l5Qj9g0G52k9K59tMQGEM8AvbO9o1anVgj4D2XP16I6LTbcK5Iyo8PXMawB7Y4pfHdk5yRezPpVktYUaKfBbczS7Hje1QhyFl7aqQ/MuO95nqSe9Hm4a7ZiAguInwd0mp4gn3hVvxaaPcjA3V+3Q+oEXck3sLA0WS4DBm610Jmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771293978; c=relaxed/simple;
	bh=m2hizQlYxNN3tqQO1zLMsh8jbFjETGsndET/IrNikU4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S54uddqyINDnPQz/RTJBZxaR/5amjs88H2ieC8e6NgkGX4czVP6sHjC0pk4Hlkw/28PMpaY6IO5rtiFGwnAirpGMRfTdlPuPjFaHzLtKWZZReWArwaQfNgiT1mMKKBz3pelpo8C2xeKLOhak3VzBlMI1zV5CZqqR3Lg7hGf7xik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhYSYnYd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhYSYnYd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93099C19425
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 02:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771293977;
	bh=m2hizQlYxNN3tqQO1zLMsh8jbFjETGsndET/IrNikU4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VhYSYnYdFDGHnYWAlIG8+2Ywr8h6TSFAgYLOuw6FLIujPxTJkcxz8rd0xmA3V5cDl
	 K//TTUTqeddqB/akRaLdpBG7Ghr21m7kQW2WnMCAqL+P4pg+L2uD/8EDXz0XQgI3wn
	 We98T9mqSPy0Nzbjjl7YM7/bCNaB4Rv/bvt/YOO3Xdh7kDD5yRKKG/9BRGkLvntsLa
	 SzVMg0s/XqpHxAP0bWvAvMELcPg1R6Ne7YcWyDlqQ8bu35nvyUR3iysbgnANtcd3eY
	 ApBXvkBj4uaduVBab04wwkunpGcuyA1UDzXLV3kw9n7Lc+GYBykZjo2v+gwBQZR4we
	 djbiLzMqBDR5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8108AC433E1; Tue, 17 Feb 2026 02:06:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 17 Feb 2026 02:06:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-qCV4WtFYxS@https.bugzilla.kernel.org/>
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

--- Comment #37 from Avraham Hollander (anhollander516@gmail.com) ---
(In reply to bcuseudshjvtquiocv from comment #35)
> If this is a system firmware issue, we can probably close this ticket.
> Ideapad laptops are not supported under linux (they don't even let you
> update the firmware with fwupd even though the infrastructure works just
> fine, you have to use windows) and it's extremely unlikely that someone f=
rom
> Lenovo will be interested in fixing this if it works on windows.

 Rong Zhang's choice to CC Mark Pearson proves otherwise.

There's also a difference between "not officially supported" and "we don't =
care
about this at all and will offer little to no help."

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
