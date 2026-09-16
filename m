Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4A73E0C68
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 06:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538592; cv=none; b=bKCoTTty5ommqWZ9PHgIsLVIecNmXFWvpBvSOynRlBBw8PxLN+/gAt/XywSknefa3qHqwl9U7bGpQu5fvEaycO8QfUcSXLj6OJzSuq6FrnhXFUt+xnpfXkOaflwYZ+lmh0rDBSW/HfNaU/sRnU33IV6YSAA7o0Xzrhmx0uPOUVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538592; c=relaxed/simple;
	bh=bgUkyGOnDVhb8RAyzbxkCxdj3RWBPxJG7l88275YLOY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pY8UIlSq9Vz1xN1PMwSXfAXl956sN1cNdiQEdJYqfHbBSxScFzyfxvr9xVHhy+y5dSdBbYy2byge+EO17NOdlqOBp5bjQ5Zq38WkVc6x89DIKzsGVH6cDwjDhWTEvCr0ooe5AU9r0OEFGH86FLu/JuiZTTqKVnm8k/rw2+/l1Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djMouWf5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djMouWf5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACAFAC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 06:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789538591;
	bh=bgUkyGOnDVhb8RAyzbxkCxdj3RWBPxJG7l88275YLOY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=djMouWf5HKNfNYKQXbXWTzPOPHFzKzqS6IJS72tguAWzlbduzovxOc5Y2mTN2Te+e
	 CHLMP88fueuJY+uzDb+RvmU/+3GGlIaK6gzBgbeFRypZ6q2WPwhz1EibE4EOxB5j7c
	 FP/42ciCnxnW/7lEo9gmkpbRnyj8Tv6LIcHR3Cuob7cnS949OGfJW/pKpzJ3Z9kfHn
	 KaEE4oaqbyjd2EV2/Tu6sVz6g87mMqEQsgb610OLOvnMeUiRixyQoAePTSZ2zN3E6Y
	 D/7X9jRGlzb3Q6Syr3lPYHR7GJy6AcqKbrfwkrmdWhHr5gY17ScXKoga6dYf7RpL8O
	 EECAe5m/8o6+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8CB32C41612; Wed, 16 Sep 2026 06:03:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222002] [BUG] alienware-wmi: Missing support for Alienware 16
 Area-51 (AA16250) lighting controller (AW-ELC 187c:0551)
Date: Wed, 16 Sep 2026 06:03:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: adrienpantovich@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222002-215701-nOjSPEYFtg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222002-215701@https.bugzilla.kernel.org/>
References: <bug-222002-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222002

--- Comment #4 from adrienpantovich@gmail.com (adrienpantovich@gmail.com) -=
--
Here is the output you requested. I am working on reverse engineering
a way to send information to the controller manually from dual-booting
windows and monitoring USBHID events that AWCC sends and receives to
the LED components. OpenRGB hasn't worked for me at all when I tried
installing it either, which is why I'm trying to do it myself lol.

On Tue, Sep 15, 2026 at 2:16=E2=80=AFPM <bugzilla-daemon@kernel.org> wrote:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=3D222002
>
> --- Comment #3 from Armin Wolf (W_Armin@gmx.de) ---
> Can you share the output of "acpidump"?
>
> --
> You may reply to this email to add a comment.
>
> You are receiving this mail because:
> You reported the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
