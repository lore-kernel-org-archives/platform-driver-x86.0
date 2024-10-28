Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DC61D88CA
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 12:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730118280; cv=none; b=pmNVHhkYfORV86ogo2NMxWcCdsqQ7+Pbgr2oNmEVKuT9T7E9h2abOJngAebRbrs07j99K1WJyuJQ959PP50+cCYLk6eYocrzJLqtfCgdGOdcrhyUYEUdwla51nsIQrtAZEEDls9Eu2vGiQTv7Y24ouRukFAd4IrFnFLxhqsHFO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730118280; c=relaxed/simple;
	bh=HQ3aTVPySFKcfjxLJ+a6j4A5vf0670DONOQJZYfaZyE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lv+ztpf+CQk7Zjp+ibHbIi2o1yv0BlS4nCv0EEM+yk11uO/aRBYXBnDtrd3VohPXGR519F1oT3PzaBxye1oFnhW4kJbDkeN+wIr0rswsRDisTZvu/ZBympQQfMe1FtChw0m47rXxGp/Sgt3DVgyhHQWB6LNuJsPoJDuG/JGstAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fV2XcULZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fV2XcULZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 902E9C4CEEB
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 12:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730118279;
	bh=HQ3aTVPySFKcfjxLJ+a6j4A5vf0670DONOQJZYfaZyE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fV2XcULZQAB2cxOW36vXM5iRklo6t719pz0nKAGQkT5YEr5bwinVMpl1+HqSrjyBe
	 L5c2ZFQlQNRN5YKqwNv7LlrnmeWSlwH13u5DRXd/SxCTVYlDogXqOWqedM35jfg9Ac
	 9E9X6LSNUj1WwZ5wEp12+NVvqxqd3rqz4XvA52qLKMQfHjt3wFeo7nyUaN+T3yAQMQ
	 kVfnH7sp8AqY7XmVwUjFngE3bQKxcx5EXLV6JGOga70Nj/5dN4rxqNSjZ6CCxYl0Ej
	 C+wkGdKC9o08CMxCoL96Z/4uk32dL3VB4p78bjZQDJf8WwtpC+2pZVqtoVigD6SuWb
	 EgpHLzKEwaMTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8998BC53BBF; Mon, 28 Oct 2024 12:24:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Mon, 28 Oct 2024 12:24:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aaron@planetab.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-iwdujnbxKY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #343 from Aaron (aaron@planetab.com) ---
Can someone please correct my basic bullet point howto on building this? I'm
used to install.sh files doing the make dkms etc.
Plus I don't know what to do without a dkms.conf anyway and research sugges=
ts I
have to write my own.
Much documentation talks about system.map but that's apparently  ancient.=20

Deb 11 bullseye running 6.1.0-0.deb11.22-amd64

- clone git repo
- download relevant linux kernel source
- modify /drivers/hwmon/nct6775-platform.c with my ASUS motherboard
- make dkms
- make modules
- make install
- modprobe nct6775

That's it?

Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
