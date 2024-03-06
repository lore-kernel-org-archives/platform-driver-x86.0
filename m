Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0741C02
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 16:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709742694; cv=none; b=K/KU2Gx6QfLoi52tSG9F/g0hdvPufbHTyffkwH0yGj4AIJKT9UoN6bO7CuFNB+Zyd74GloDYghsQaGp6moUj3PjfPN0F1uaDad6snzwiXQJOb4KeN2fQRkM6KNp2H9R1EGwh1CyfsfwkQ2aQx9iey53LbRoj3udxqbOZGsdfijk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709742694; c=relaxed/simple;
	bh=rafvIva/TWmAqp90idfd316S3GzvLOT6s5jdVCxh/Mo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=thpCnEK/C+MiEYlNR5J2V+JIcvUBQi1pCfQAMpuWrry5CsSk5GexTYCOEPKPNCRWReIZlsiXGL3Iqs4HpHmFmWwLieO+hgGSIccPmAA0fihJnhgh+oRw2yAOHInvcDqEt6AeJk5692Oqa8INuPGKehZfE1aiAIlF85HEPpj/Xb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afJG7g8c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afJG7g8c"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2029C43390
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 16:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709742694;
	bh=rafvIva/TWmAqp90idfd316S3GzvLOT6s5jdVCxh/Mo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=afJG7g8cgaGStw9wdsGPmh6GLJVR6tNxOKjlbMxrFAALUW35UiiU9+oF/h/Xo2vz8
	 HX7y7/E+U5M1CoywvCy3ZGgDwQ57yhvdtGXH7L7iYRUM6Y86ZsUenXHS1jJTblhHQh
	 r4ivTvxyB98nYQAC4w/uA5ThA23m7dGdYiNqq80bYe0SsqZOIIz0gzaRYObP6ehIv1
	 Hs3bdZ9jEcTsuWomJcnjbYoyqRCY44PEPZoinawkjXx/T5zm8zMrbOM1c/XdSM6U6m
	 BM4hyn4srkMmGJLTXhppJEkvRW2p5JrgTW/dCRqET6LTM8WEyJf0qJ5CfcXVyctYMr
	 voZ4IKfw9laOg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DCFCEC4332E; Wed,  6 Mar 2024 16:31:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Wed, 06 Mar 2024 16:31:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-IZyfTaxDE3@https.bugzilla.kernel.org/>
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

--- Comment #30 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Sorry two more things.

First - there are two sets of coefficients (one for AC and for DC).  You can
see in current_power_limits_show() that it will return the table matching y=
our
power mode.

Please capture like this:
1) Start on DC, capture the file.
2) Switch to AC, capture the file.
3) Suspend the machine
4) Unplug adapter
5) Resume
6) Capture the file (while you're on DC)
7) Switch to AC, capture the file.

This will let us confirm whether or not there is a problem with the table.

Second - after the issue has occurred, does changing the acpi platform prof=
ile
from sysfs or powerprofilesctl recover it?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
