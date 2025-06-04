Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1601E5B72
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 17:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056847; cv=none; b=PpS461CEcQZ1A3pzQWLM2BNuWxZ7IS0ubV3t84Hf7PsKfXdEQfxlXLq1onpkvFEZ5YzZXpVo5FvfqIZZZnDQlCvWk6MQKuMVMTv+eJ1U2v1ppICT4M0xi/E+Sgft9gEsvpVyswRiYj6mg1WWmWXwU+uIDw663N97uDdgW8yX7ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056847; c=relaxed/simple;
	bh=mdfMJreSUydGht4zc5zHs14WIQKYElA8inXN0mA81Jg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AlRpYsXLOdd3G8D0cYyl2LB7gr8Kn3j326OHw+F032FAYdjCW39aG50qYBl7XomV+TyP1LnsgEnwpTXnq5yD4TCoyDTAEMqfzFKvafnJdrCcpzKVYIcEzEg27DaYpqS2CDsiO2irCbHvInRoVxdKO3arftkRzzTB81qwrJfDyGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPhbokiU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPhbokiU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6323C4CEF0
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 17:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749056846;
	bh=mdfMJreSUydGht4zc5zHs14WIQKYElA8inXN0mA81Jg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZPhbokiUJlNZcvzqtgoX4gXq0Ma7rc1hdUj1cTq3r+cd/35TzY5vTFJXYGuotd+sh
	 VO0+kfCCiCLx8LJS0b5GMvP9fAp8C0Apqeo+Ki5MRks+ql+xHy3ow1h+jlX1w0qfFc
	 xVqiutPcf/56wk0Ys4GTAiiIx8Gj9QN1UrYeZKLn0f0jvkbCc6bsk7j7RisG1gPkvm
	 l3d/r5vi6s2XSTdx+sFBHF8bGyunNCbchR9Mp5GYP/NQ7a18DvoOkaR1v6vviA5gz9
	 SYuhlQE4cWQL7E70Woylnu3RiAoQUtubAxxGq1UU9ZuJeg+nQ43StnIL6bT9sKQH3E
	 OfgCiq3zUiUiQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9F3D8C4160E; Wed,  4 Jun 2025 17:07:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Wed, 04 Jun 2025 17:07:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: mario.limonciello@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220116-215701-gUGg2TabGB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

--- Comment #11 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Your new report looks "better" actually.  I see you're getting into hardware
sleep each time.  If you run a longer cycle (say 60s), I bet you get higher
residency too.

Is the keyboard "working" after you've resumed?  With all the errors listed=
 for
it:

atkbd serio0: Failed to deactivate keyboard on isa0060/serio0
atkbd serio0: Failed to enable keyboard on isa0060/serio0
atkbd serio0: Spurious ACK on isa0060/serio0. Some program might be trying =
to
access hardware directly.

Other observations:
 * AMW0 notify only happens on the first cycle.=20=20
 * Spurious ack events happen on all the cycles.
 * You've added i8042.noreset and i8042.nomux to kernel command line.

I would say drop the kernel i8042 parameters and just turn off the wakeup f=
or
u8042 and try to run a few 60s cycles and see how things look.

I'll let Armin comment on the AMW0 device from the acpidump.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
