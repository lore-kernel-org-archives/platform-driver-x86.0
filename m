Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473E332E757
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 17:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780681448; cv=none; b=Nvat4pFVyQOrU+O7ucfFrkfLzuucc6I5J5VcIzofHWYhT5SbqdD8P5a9DTCECcacXE236ny9QezNXDMItkq9eWzsCi4r3yh4kwXs6xHyYhuE53XFigp/ahG0CBAQtiankLqLHcjS4JY+VCYKdqlJk4a67N6CFqTPQIR8WxK2FG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780681448; c=relaxed/simple;
	bh=2DYivg1XTJG3UNhLkk5EvP/NDo5XzlIld+t4iq9cm5w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IWTYZOmsyxBHJrQ7TvO3yhbR1D9JYOODyK9BKy9kiSmHn+5YsfG+zkQjt8Yyd3SFT7UFoeUvD4g5bTEPMKz9WC7b7k6fEP8h3dMIs9T81bBApQWN2/dJFSVlxlmgq2THCPXUFFf6gKZhVoSwGWXURngvoeTlA8XVvkotCeepgus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OyC/ROFL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OyC/ROFL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B6EBC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 17:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780681447;
	bh=2DYivg1XTJG3UNhLkk5EvP/NDo5XzlIld+t4iq9cm5w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OyC/ROFLnmdWjlqbiAaCXNaJvZc9l1f4z1NJNDvQSc+JBfPTnqmV67Rg/yoF6f/w5
	 j8ZColNJ9+JMUbcQtJ5GmMWZbSikK4cm84iyY6GeRM9VC8tJRVrZAazR6R/rr9DSJF
	 1UyCSeIgJ9RjhLwFRRxSeNfFcAE4IhA7DTVN/uFyYCHIT1SdtwrkjcYdcu2llI4ngI
	 bIhXY4kxao6Bn7LDlwOzgzSRdV+lqN7RxIqY77Ukppb6YV8BrW06rail76fKkXfqBJ
	 cJGZUcAp7bLI78+aJibPgEfZMqjlIMECSNwBGthJ6qhRK/xPCNqdSaSs/0HMIpahl1
	 4HPIuoElH/QLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 76BAEC3279F; Fri,  5 Jun 2026 17:44:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 17:44:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-X4TZnKsakk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #17 from Rong Zhang (i@rong.moe) ---
(In reply to George from comment #13)
> I reinstalled Fedora on my laptop I somehow messed up what the power butt=
on
> does.

If acpi_listen can still see events from the power button, it's probably ju=
st a
configuration issue in GNOME.

(In reply to George from comment #15)
> Sorry for my poor responses. English is not my first language, so there w=
ere
> some things I didn't fully understand. I also used AI to help me with
> certain parts because of the language barrier

Well, you can ask me for more detailed explanations.

While AI is good at translating texts as is, things could go wrong when it
starts to explain them. Also, Qwen is not very good at these obscure issues=
, so
try not to push it too far.

> and because I haven't had much free time due to exams.

When I check Bugzilla, I usually take that as a casual pastime. In other wo=
rds,
I'm not in a hurry to get your test results or feedback. You can take your
time.=20

(In reply to George from comment #16)
> Also, regarding your question: when I manually wrote values to /dev/mem, I
> remember the software state cycling correctly through 0 (Off), 1 (Low), a=
nd
> 2 (High). However, the keyboard's physical backlight did not change.

Then the previous version of the DSDT code where "Off and Low worked physic=
ally
and the OSD appeared" (comment #12) is important. If possible, please attac=
h it
in a reply.

> I'm going to start over from scratch and repeat the process more carefull=
y,
> this time taking notes as I go instead of experimenting late at night and
> relying on memory.

Thanks.

Do experiments carefully, but keep a relaxed and casual attitude. You don't
need to do them overnight.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
