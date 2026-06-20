Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C9A24A06A
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 21:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781990655; cv=none; b=YJ0xvFM+SPEUnPBUeap+ghNUURMhvNCvzO9Txe9Fh6GFj3pRWwZR/aCzX2lJ5oOlygGpIuObnhl5mmPTi6OAoPeZkLmHE7J5BtP77EQwRIHtckNXK1GChzmznVtS6kGsj5HnwIp9szIlHvzvM50Bdi1kww91vhIrT/RfFT1VOeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781990655; c=relaxed/simple;
	bh=XnICwyMDuEnugkEGtfRqhiHxribpJeKI8GfEJ3M1P1Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MM6jsahms490X533MXq9mrq7hQ05AiiH0KN6sUoS/JU0sk6uBT1pCdxBZOc+EDtK59/2v4F0+emByOexIrSrFUavSVgvDMCEUKmTWZpnRQu8FELZnNUqkVo3LYIs2I2DG9mb0ES+E7NygFghYic+Y0Q1/TyklSi2KpftEWDHn5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=stRyi+03; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="stRyi+03"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10422C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 21:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781990655;
	bh=XnICwyMDuEnugkEGtfRqhiHxribpJeKI8GfEJ3M1P1Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=stRyi+03kZv6ezaCGFQMQBSUoGb76qeiRkhzSxtun98G5e5yTRnaAj5WgVvshhSqV
	 sZDZ8/Ku9Yi6jZjGFpCAsAxhkSMtwH7YnDuThcO7BgSZf1guAyO3KSCFWAJZqiMffa
	 PDghnHbiuamfcLkZ+qhAyqCdxt1TNzStG7TJKuROFEZQhLppCTde9gU6MUt88yQxD9
	 F/BtnwIKQG89aO/OG0d1aV5DaprcCGkC0E9WIAVU3QVA3GDKC3DiMIZrSPPL3mVQn1
	 Y7cgHo2kMRBa+BwcfnRRldmQZBtZu81ikvgdnx6alHVGy7x6kasn8SvtbPgF+BrA/d
	 JsA6VovnipFaw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E90B6C41612; Sat, 20 Jun 2026 21:24:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sat, 20 Jun 2026 21:24:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tacodog311@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-VQcwWN08nl@https.bugzilla.kernel.org/>
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

--- Comment #106 from tacodog311@gmail.com ---
yes I can adjust the brightness on the 2024 model with this command as root:

keyboard backlight off:
echo 0 > /sys/devices/platform/LGEX0820:00/leds/kbd_backlight/brightness

keyboard backlight half brightness:
echo (1-254) > /sys/devices/platform/LGEX0820:00/leds/kbd_backlight/brightn=
ess

Full brightness:
echo 255 > /sys/devices/platform/LGEX0820:00/leds/kbd_backlight/brightness

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
