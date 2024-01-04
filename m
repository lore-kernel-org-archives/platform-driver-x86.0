Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962A52420D
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jan 2024 13:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1h2iYa8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B4B8C43395
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jan 2024 13:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704376074;
	bh=kVkUwjOV3Xl8ydFkUhQwWBOs9S7xmlxJCejDtSTN2fI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=R1h2iYa8AfMpTNJfftVTuMEuHdxbeVVQSSA4ZcIutymFqoXaOPr9hLOTCYFAHrQyH
	 ZmVkqUp3fn90t+UDqRSvV48PasfCix2ZCvfDCcDk1NzWPQSBv6E0M8bvE+SFVVvuyX
	 E/uKvN4CTcTMhCT/dXmeBmjoNTP8eLsScsXSqnIOJulWCmD+9JmF4n05yN6FrVljap
	 EZVtlASuyoWj5hHzao/wXs/h2FrEzT7f+VFtJHT72NFQZMtEwuacXPkIwM5f7qLlII
	 n7G+ZPzv/JKVLjd7cUPetsm7TQTs8puo1XYgwqEn/sfZkf5DXoWVGj4X3lue7f2mVc
	 nfQlEI9TIN2CA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F3682C53BD4; Thu,  4 Jan 2024 13:47:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 203191] The fan speed reports to 65535, despite the fan is
 stopped
Date: Thu, 04 Jan 2024 13:47:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: antony.gelberg@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203191-215701-Ns044SbifR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203191-215701@https.bugzilla.kernel.org/>
References: <bug-203191-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203191

--- Comment #20 from antony.gelberg@gmail.com ---
Following up here. My laptop underwent warranty repair and all seems okay n=
ow.
They replaced the fan module and the motherboard as they couldn't tell which
was responsible due to the intermittent nature of the problem.

So I would say that it looks like this should be closed; if the problem sti=
ll
occurs I will report back.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
