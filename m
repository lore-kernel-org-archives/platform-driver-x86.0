Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A3D17548
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 18:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749061954; cv=none; b=pboyz6/L5jq6mmtlna4/ywtzzRuKyOA6Byzfli+D1/VHGEkUqpqpX9H2S56UAk+CBLv9K9+dqDbOqPuruBoeMkh+SMdot7yGPyYc7+KRqb0XkZyuw6aJgOedOzqeWAfNUuZWQgduQRlIyq7XbhxPQ/Oeo5t7gCShs+V7biKD9vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749061954; c=relaxed/simple;
	bh=E1lDNo/zO2iOsCPPzUKvgFeGF4PvkLzAEFCsnlZHI08=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lXgBC8KorsuaE0TjC3Bea71t0/m+pvfH6Sqv9nosHyXkGBC9xRYQsNRK/AYErR0bM1cUsepKF8+BC5eQ5HFr0Dk3p7SA3JpdXIcDoopBpY2rMeUg2PwHz9vMQo8U02gyHskGm5DOah80O95vhs5KHAlLP7O5GtrlbZx2nNntdv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9C5p5yX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9C5p5yX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE0A0C4CEE4
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jun 2025 18:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749061954;
	bh=E1lDNo/zO2iOsCPPzUKvgFeGF4PvkLzAEFCsnlZHI08=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=a9C5p5yXmeODoUREqhQqrZpOexWI9vpA71aNs7x2tQK7zW/1d/gESWBgiZggzXbLc
	 /T2cgkrn+rI7TSt/Jf1h+1bvLAA+mjqvFWhs5lQG3pwgt6iq+tCKpErlWEIFR7GbiN
	 fxWnBmrcPcHabzUU/bbaqnM3vBeBmAiKAnHZiCasAsMgKjgJuLSjq63ZP3aNz0jzWK
	 r8CZrI2nauBGKARWB9Ep1tetH5cog/0GWZ0AYGTZ95oeK/+lBgH6vK0D4pZ0doJLRJ
	 n0vlEnEB5XC2pLurJUBNsGbBTxjVLpaakxOLDAmMVPQvGxb3MfupXDofmdN3lHitzl
	 XAP1ODuVh35CQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DDD72C41612; Wed,  4 Jun 2025 18:32:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Wed, 04 Jun 2025 18:32:33 +0000
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
Message-ID: <bug-220116-215701-42W00EIdoY@https.bugzilla.kernel.org/>
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

--- Comment #17 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---

I still see the keyboard wakeup marked enabled.  Did you forget to disable =
it
before suspending?

=E2=94=82 AT Translated Set 2 keyboard [serio0]: enabled

Also I still see the extra setting on kernel command line:

/proc/cmdline: nvme_load=3DYES nowatchdog i8042.reset i8042.nomux
systemd.machine_id=3D0fbf90921f964c578cfe50596ce020e0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
