Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBB319E98C
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 17:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757957166; cv=none; b=YEsFPp9BRuDVXGqjXQ/QYhqMsu78iRQCR/TqiUN+1plFV+jhz7kZZpu88T4c7cY0aGFJ0p8INjcJDhqiPbuo8ASSnveerYdZzjaQTw6LL2U1TCQgrQUUij/4y1uwMv2PyHmQwlP0PMcnhMBPd/blUwL23Yydsk0A/CCwLXB51UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757957166; c=relaxed/simple;
	bh=phmOTxGABwKDN7SlYa6sdszzOjRLtyl3eWXUFctmePk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I38B9sHZF0OyC0DP8fhkJhR9NQ3ya+jVutn1XC3Qrnm+Gs1/su+42gKp3IUsaefBMmqqxwjzgwGClT3wgv9frdF0VJNcu/5yj6chC5CvRVbbmY/hQRG5SfcuHBPt438qabjr2RtUHb4XIyr3eAcxrDxXxqG9XY2yt8jrPKML7IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zyu5OtJH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zyu5OtJH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4AEDC4CEF1
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 17:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757957165;
	bh=phmOTxGABwKDN7SlYa6sdszzOjRLtyl3eWXUFctmePk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Zyu5OtJHFLQskpE7+SgLYEydrvzfgq3QLmUKHOt24S0O1N2EoplJl/A5KQpr3QTUQ
	 lLDgsCH5oiLpvXoY61jgPQeHPn2NL78nO4+C1KxRBD8zujpOkdwT+wCZRfMLB46sIf
	 FJTNc1BXUpqAFWdAFf5hDhlTiFbFJ5uIMQqCS5REATYA2rS5PkchDJFiroqh340qh+
	 eVd7gcAZicSggvFea7ycH3VkWA45P+2zr7DlzqSa9DuyTUrQPUgQ0bbnZvaPYq1+VG
	 LaqM/5zeLG8qrnkybtqcM4Pz8aXR2nKDCPux0ajQeDsnS9N4dIG7FxR1DJLXJI2m6I
	 +jc9fJOPeycew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BC360C53BC5; Mon, 15 Sep 2025 17:26:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 15 Sep 2025 17:26:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-n8DJzdYUrs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #127 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
This will help you get started with dynamic debug:
https://www.kernel.org/doc/html/v6.16/admin-guide/dynamic-debug-howto.html

Turning it on for the EC gets really noisy.  I'd suggest you do a script th=
at:
1) turn on dyndbg
2) run suspend
3) turn off dyndbg
4) capture the journal

Run that with patched and unpatched kernels and we can compare the journals.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
