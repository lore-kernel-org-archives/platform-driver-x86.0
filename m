Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FAA23BD1D
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 02:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776911198; cv=none; b=QLIY6QJw1utRdrGvWf9zFk2vaksOg5a1CMPOgDZgazvSu9Z3yPKbdG0b3m0dnWJs9ui3XInpg93dQVmLDCCgFgXzG4QYWQS1VDOHm8Vpl6UrH1HwhMLLj2uAq10q8hxBHrrClEiUlBRSb3FbHeCuo4+qzSIcs/AaXRDZK/Sx0AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776911198; c=relaxed/simple;
	bh=Y/ffFomzhywnOCMPPzjVFIIHi0IWINlji6GoGrMl+dk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dVF/Rmt7G8LSrY1kRN7tuWIMX2OoixvWzXpp3GhBaU+9QLtsxYIGCCzYNNt3JwQgm3SJVWYVfIxkdAr26kaT4S6f3SJZzxEIW9MRC8gK/CYSUSGwWKiEk4q/YWk1UVMoHj6HwMPxyiUmaBy2PHg6u4EedE8tNZuv5otiYyd0F5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N40FNNaE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N40FNNaE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B2B2C2BCB2
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 02:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776911198;
	bh=Y/ffFomzhywnOCMPPzjVFIIHi0IWINlji6GoGrMl+dk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=N40FNNaE9XcgdAxdVVayruifLSGP+R4zhw41XIRO5s+QgE8zY84qUOTjLrzwW8y67
	 G7HqD2Fu/wLtt3RVMw/awLXt/KkNUIOw26WBpv/y+CFmiO3zZ8kfzbeYzTSJZsR7t4
	 zbGiIaz38fHC3MpGkFWcMfnXXs6jeAVmIsbe/+EX8W138yDUrXYC2dRiM4YmQV9cM8
	 VFuWXHi4NVR7V3cIr8Hz2nVwTuEWfvn1C2qgAGTTzBcDoHyoa+63GP6mu5oe3FAIj7
	 FfCJ4SEDHpEM8g6+Iv9SoT9mtPTwjzlAIY2W5y/rGnjLbFjTNLP73ggEqzH6wHV+fH
	 OtZbX4AuwmA+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 62DF4C433E1; Thu, 23 Apr 2026 02:26:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Thu, 23 Apr 2026 02:26:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221383-215701-pXAInZWMqs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

Daniel Gibson (metalcaedes@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |metalcaedes@gmail.com

--- Comment #11 from Daniel Gibson (metalcaedes@gmail.com) ---
I have a similar issue on an IdeaPad Slim 3 16ABR8, using Kernel 7.0 with
XUbuntu 26.04 (I'll hopefully post a separate bug report about that soon,
unless I should post all my infos here)

Here the keyboard doesn't work at all after suspend+resume, unbinding and
re-binding i8042 makes it kinda work, but the Fn keys don't work then - and
neither does the LID SWITCH.

I also get the "Failed to deactivate keyboard on isa0060/serio0" error.

Adding i8042.nopnp to the kernel commandline helps a little bit: Then after
suspend+resume most of the keyboard still works, but like in the other case=
 the
Fn keys and the lid switch don't.

Anyway, one thing that makes the issue go away here (but is no acceptable
solution) is to blacklist the amd_pmc kernel module, or unload it before
suspend.
Then after suspend+resume everything works as expected, but the downside is
that the laptop draws more power while suspended (measured 1.4W on the
wallplug, when amd_pmc is loaded it's 0.4W).

Could you check if `rmmod amd_pmc` before suspend, while the keyboard still=
 is
in working order, works around the issue for you as well?

Regarding Windows, I didn't test it that much (and replaced it with Linux),=
 but
I don't remember seeing those issues - I'm not 100% sure I actually had the
laptop suspended there, but I think so (Win11 does that automatically when
closing the lid, right?)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
