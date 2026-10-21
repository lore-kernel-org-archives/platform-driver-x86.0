Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792570288;
	b=HA7K7vVb+GwlxjAKNqcS7/k0lh/xMK9qb050Rguq4Dxui5RdI4RAvH099X0a+54wAuCV
	 XpKQEe40wM42BPAaRta7R/TOJwhyilT7vjgqpOmKI7z2l3FLG3VxyUV5vIrDGPBs42XP0
	 AaF9skdXF3tV8Ou1pyqFKZF8oCwiLB206TKA5zsxJuB8V3fNK4J7+KOiX1ykv5UIrgoS7
	 pVU6rFKwBgd6XaE+0BgLd1oRr69lxsNN3O9d1muyN0jGXRIFjeaiS5jdi8No6rXnQRAg/
	 tmdSZXCm4+9/l6Bth7IaJ81S4PeWEAo8rLEg27ndATMgW/XPnutd44yGl9WYM1WtYzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570288;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=7LBTd8zYsbBMWHD8ToI5lLSztEE4Z1Z6VaoGZCzMjgg=;
	b=WlC2WngXP7dVqnLHyDg1RBVJn+S9oWLKFdICbEgu5tnPqnUrhrzpVCE/CDC7SVF5VNv9
	 xnbZpwCTVczPpl3VpO3SMOn43b0+i83Dm14ux97urbzputISXoxqgXb5Im/ImK49KeLvs
	 UkJa34TQqW0LSi4mRaZSKBnUWDwE1cwByRxw3hdrVtmHXY5NxdCrpCvenidezVHa7N4pK
	 CroEBZ8sW+l9tWg4uv2UwKvhHn5J/O/XYTwiARZktB4IMcFiJ8Q/tmahInCZUr0AUeZ1i
	 j6Q9krp0YJYEv8UIVjpe8B2fpH9KrvExVcCDrtMnC7eBp6yJKDLZS3ttXSSM2mr+nUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IIZ08eNa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02AE606A320
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Wed, 21 Oct 2026 08:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IIZ08eNa
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C366225771
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 08:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792570287; cv=none; b=uKg5atlgg+0rNqZgNM9QmMzxPeXzlYxFTzGjK4IkI3me3h+opJpAhEktb524cgaQZnl8iwI2OUrTP34vOUVXWve7/YmB3WVe0v4lPcfFwUDeMSAZWpGjF2z4SlE1aI2MGyYS3c2X0Cse0cEc2s6GRUQP8OMuxtcKEBhFr8iGvII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792570287; c=relaxed/simple;
	bh=7LBTd8zYsbBMWHD8ToI5lLSztEE4Z1Z6VaoGZCzMjgg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WmA0Lx0FAbgtDK8Tbb0Km4B9wkpGhHo2sMLbxlK8UhHJeinwokIFERPGS+Sx09bKdo2mbEe2nmE0rQYQyrz/i8gFT5BaYIyxYJSuw6H5SWtygeSgJeMKqKT5tBX9CRuU5trAh3kP6NVDfBO/M6D5BmwnSLQawn1dp0eI1ZOQ13g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIZ08eNa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29807C2BCF7
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 08:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792570287;
	bh=7LBTd8zYsbBMWHD8ToI5lLSztEE4Z1Z6VaoGZCzMjgg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IIZ08eNajWklNs4t4Lvg3B7rkcks/9xzSyq0r6GtZZEcLMm5EljrdD+QpScPTs6g8
	 VkKpgwI9PSQGZxLD8A5jKRiPacl7NvtywDAvbZhKflYKjIiKr7/FmoLAfBxDoGTnO8
	 1mh/eavpD0ZdVqqnrgxJClMCCcbByLkZTTwQrzkRG3kjI+ci5NAnAjqBWzKBl6NhzM
	 ytxp+YnVTuqTCgyfCDj9IqdM2TyW9Yp6DetrvS5bVVhdz4qYanzP9WvHRaDXEUIW32
	 lFHiBvXChLLZC3OwNaH1gO88VUFksXUHvVsU/XUzE9B2DJCZGoBn10i1sBCT9Fk8bB
	 WbTNhNku7hw/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EF699C41612; Wed, 21 Oct 2026 08:11:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Wed, 21 Oct 2026 08:11:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: helian.caumeil@clever.cloud
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222161-215701-nhVpdG53yM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222161-215701@https.bugzilla.kernel.org/>
References: <bug-222161-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222161

--- Comment #8 from helian.caumeil@clever.cloud ---
> Maybe you can zry to disable the auto repeat feature of the keyboard?

I don't know such feature.
I should i have precised that the bug appear in 7.3.
I don't see any change that could have trigger this bug
on my keyboard driver.

No problem in 7.2.11 neither all minor (i apply every release).
I verified on 7.2.11 and 7.1.2 to be sure (with "evtest"),=20
events with a value of 2 where present.
For me, those event are totaly normal.

What is not normal is having keypress on the LG WMI hotkeys part,
which i did not see on the 7.1.2 and 7.2.11.

> So for some reason your keyboard auto-repeats the super key.

Following what i said before, this does not explain why my
fix make my keyboard act normaly again.

Tell me if i am wrong, but i don't think my keyboard "auto-repeats",
it just tell that the key is still pressed.
The test i ran are just confirming me what i think in the first place..

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
