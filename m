Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9740387584
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 11:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920499; cv=none; b=U3zdGHGV6OMFLt6YJ0aqjREZrOOnXBJLFltzasamkBnBwkiSIZeoGY8/c73YtXTmJWXfk/+79Gy73A13yAGdj0zSU6Gtz3E3wP/sfKYoN35/eE4ij9pPp4hyAFaJsI+Ulsby3tFattQbMV18mGbayDC6U2Sc2by40uw0qM8XLfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920499; c=relaxed/simple;
	bh=auoiB5RfJMPo1ldliiGkRFkE5bNL7e63Cu0wy9OauDM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GUI++riPHvmjXhnN3q7jEBTxywlHBxXUA8pzqyClrU273wnvyj+lNc8QxJKnidCFmHZa0hJwmFXNLwhdoI0gK7YmkWU6UTkU31DuxgaffXnq56PUWnCH6XTG8ILV+5oJXNeatP92WNcfummhGv8lZMc9ZKED5ff3TO2O3IZZGDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1odGNde; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1odGNde"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D892C19424
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 11:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773920499;
	bh=auoiB5RfJMPo1ldliiGkRFkE5bNL7e63Cu0wy9OauDM=;
	h=From:To:Subject:Date:From;
	b=G1odGNdefKp1fd8wZbui4sHfB1kje4hbOi9H2/7GQOcoEwImBYKq/68jLFilmj1KV
	 h31ELxMhzaH6LIz7tR3ltVQ8RPiUOKWiNq4E7FTbZdEA+Gag/6YJ/48cVS8HvpmIzf
	 TWPXYsjy2rtkAKE/qMFxLMyUk1z+aAn1i9nEkkNDuWWIAqEGoiM9vKQoVswNjxznFo
	 KWOsQrVJw2UygnQsqy9Cf7luthbk1qx5cg39JVEUokXbU+Mfd0nyix6fig06ZBzdi8
	 Rksz7ixE5zDGCYwetZP2MoNuPn+VL7/OyG/T2PV+knr8sJtJfThSnqVrGsa9r+j427
	 hHnTeEo7KKkdQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 20BC2C3279F; Thu, 19 Mar 2026 11:41:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221260] New: Tablet mode doesn't work on Medion Akoya E322X and
 Medion Akoya E229X models.
Date: Thu, 19 Mar 2026 11:41:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alan90000@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221260-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221260

            Bug ID: 221260
           Summary: Tablet mode doesn't work on Medion Akoya E322X and
                    Medion Akoya E229X models.
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: alan90000@yahoo.com
        Regression: No

Hello,

I'm on Fedora 43 KDE Plasma (KDE Plasma 6.6.2) with the 6.19 kernel version=
.=20

When I don't enable the "tablet mode only" option in KDE Plasma, there's no
problem. I can fully fold the screen, and rotate the screen in all directio=
ns.
But the keyboard and the touchpad remain active. The virtual keyboard is
available.

When I enable the "tablet mode only" option, I fold the screen, and nothing
happens. I rotate the screen in all directions, nothing. However, the keybo=
ard
and the touchpad remain active. Strangely, I run the "monitor-sensor" comma=
nd
in the terminal, and when the "tablet mode only" option is activated, and I
fold the screen and move it in all directions, the terminal returns
accelerometer readings. The virtual keyboard is not available.

I tested the "sudo libinput debug-events" command but I don't see
"SWITCH_TOGGLE" or "switch tablet-mode" results. So it seems that my hardwa=
re
(tablet sensor ?) is not recognized for the tablet mode in the kernel. So,
Would it be possible for you to support my device and/or the sensor at the
kernel level for the tablet mode part ?=20

If you need information about my hardware to support it, tell me. This is a
Medion Akoya E322X convertible laptoo model and a Medion Akoya E229X
convertible laptop model.

Note: Kde bugs team told me that it is not a bug from KDE desktop but from =
the
kernel (part of the hardware not supported).

Thanks a lot.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
