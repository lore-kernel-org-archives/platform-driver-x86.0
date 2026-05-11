Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC49383323
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 22:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538577; cv=none; b=DAZi+DsvsZ4gYxO0jSvrwKJcG4irBVC1EMDY54vIa41jj1IXIRsCLcoynJKpI90nwpdkbGcmH9zKFP1uDu/+lALpdGvz4FAs014vziZHl+c4CLkeFd81q/xOTvbYV9JUEiMzRcpC9bDJCDNAMObDd4jrqz9Ehqqw+PSCqC29aTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538577; c=relaxed/simple;
	bh=1VXpp22FZdGmquW1s1Ejhfc5U8WgPtTRnSVsPug9oWw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BF7vesVuOJUb2m7qQ2QNrTLBQcR+uZzS63eJ1Y6T8qHz9tJOqk3KJ3Yr99hkLlGKKni3/RaK4NDiTQFuzBrPpdk+d4tuetIdhEUPz13XwwsTXw9KH8F5FnSIMmZPDK6KcqupYVjc5ExWckORPZcRrEiNG/vtJh91763tVLPLoJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5xdBZNC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5xdBZNC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2806DC2BCB0
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 22:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778538577;
	bh=1VXpp22FZdGmquW1s1Ejhfc5U8WgPtTRnSVsPug9oWw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=a5xdBZNCu2ecqMYZaB3Y8D3f0p8arlIPwTzAeOMaKEYTx6tjGfa6R+1/fR50FnZDn
	 GCCw5OnDeVz9ERYbEWdabFAknGNDYN6MJoZRbF+TvoYlE310AiwuqWEp38uhEeFf3e
	 NbScakOf25lEeSISxu/BPSDu5RjjZQlud/Sp1/qPa5R31KGFRyey9uzy1sTDNl1YZw
	 nYYZoQZwYMTb4IXNgLmi4dl/iyV0SPA2/dFC0M7W6H+xbipB9SKcR9gQmm+G4Imans
	 X3cKaMl8JfmefnVoEBRkKzJIm2QvqWt1gKjiJrIRzPLQMyJtvrkkZvP0Q0nMSRp9aN
	 buRqTSekpCh2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 166CFC4160E; Mon, 11 May 2026 22:29:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221430] nvidia_wmi_ec_backlight: brightness writes silently
 dropped on HP OMEN 16 (2025)
Date: Mon, 11 May 2026 22:29:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: floquimaurice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221430-215701-IOvbFUyBaw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221430-215701@https.bugzilla.kernel.org/>
References: <bug-221430-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221430

--- Comment #7 from floquimaurice@gmail.com ---
Hi Hans,

I added acpi_backlight=3Dnative nvidia_wmi_ec_backlight.force=3D1 (and
nvidia.NVreg_EnableBacklightHandler=3D0) to my kernel command line.

Here are the folders that appeared in /sys/class/backlight/:

    intel_backlight (max_brightness: 192000)

    nvidia_0 (max_brightness: 100)

    nvidia_wmi_ec_backlight (max_brightness: 100)

I tried echoing different values into the brightness file for each of these
three folders. The commands were accepted without any errors, but the physi=
cal
screen brightness did not change at all.

I am just reporting the facts here. Let me know if you need me to run any o=
ther
specific commands or tests!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
