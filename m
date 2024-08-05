Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1BF17C
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Aug 2024 13:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722863939; cv=none; b=blBaaB1Ke3t+A5Lgr3Q/7lEUHBnLKE/TIBrSRZs/KbfwJeKJmUNMEt7c7Gc8APq/+gNwkH3Be9cosxeT5hviYPQWwJP9eYMpc223I6Md1sIbu0HvmTIf9jvB5yhUxuHhvu8xA3S0QxD92uBSxH3jZsVKTVOelQ4KT489nc92Jx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722863939; c=relaxed/simple;
	bh=8SdifW93HqqBaSslgZiF4wsWQHLIyZsh4RWkh8Igd+s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SMemOjvWuv2toky5XCq5r9gZzl/7lFYt5XkExqxhjhFPm8Ctqs0cxwn2JTlxTROMqeO56lIDfuayQT/IlP7ax9JiYNKUIXSNCOhAbfiCv8KheUilcyeauGY4GMojuSippevdNVhmB7ZAJRKuMfzX7uhH8JZwH+nOjUg9wuE4h2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fdo/VlD1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fdo/VlD1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CAC2C4AF0F
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Aug 2024 13:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722863939;
	bh=8SdifW93HqqBaSslgZiF4wsWQHLIyZsh4RWkh8Igd+s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Fdo/VlD1OGY2S1fNiNlop3LIIY4/MenpJUIMIg40ElNcO+HQYVHHItdnbPXrlMf1a
	 LC5EKIzXKR6pM08NbnZ5Ah8HeyeX5ONJmqID9aQYIOPPB/rUefo/xHbRBTm1F/1tZO
	 jLFznjzzH7hhtDJOGcWBVwxgtmzJW1+hPMphETKXv4Z/joXGrRs/GF0lVnVT141bmb
	 dYUy1ciQtRqwMngQno2AcYkto+iEcUSLFouQ44zSf8J6LzvOwOqkbrHzAgLPb+fSER
	 u95couB3i8AkOHq2kYKEcmHK/WWuFaxdMG52twDiUjrbNDI9qokS3ZZxuiofMug95F
	 PHwHC5yZrJY7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E0546C53B73; Mon,  5 Aug 2024 13:18:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Mon, 05 Aug 2024 13:18:58 +0000
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
Message-ID: <bug-218901-215701-xBYXVkXNsS@https.bugzilla.kernel.org/>
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

--- Comment #52 from Armin Wolf (W_Armin@gmx.de) ---
I think i found a solution for you thermal dmesg spam problems, see
https://bugzilla.kernel.org/show_bug.cgi?id=3D219075 for more details.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
