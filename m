Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031682DC32C
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 11:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781955730; cv=none; b=MOgI1g3TV03iXwphUIAoGcpNjiPL/hRV1Vf3Z/3ydMt0L0iEOKYQCka+yWXP7wAyfEt2RD+fTF0kzRjyXRaRUT9KTsr20dzn1la552lT/WqdAuv30PYtMaLoj3Svz7NX5Pmmi/FLLL1dYPdgoFa2GQuF6NTDLVsBmEVEWu/pdgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781955730; c=relaxed/simple;
	bh=pw28nBB814+UTgHscmRcgZrVyZzwVr8YL9cCdoea9qM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qrc0aj4L+7hu73qjZHRTTplPZAVi8HVX7Tqic0JmkLT5cMpu0Ii7dkYUYQFCEHaAzsLPN8qLLQYf7Vdl/GCs6Vdl0rx5C2QjJ1lItyRCP1zy3dtLh95GjTJFu6hloBGiAP2MMyU1ZGqxUVmKeV0GNiDTwG4It0VOdJJ8RKbC6Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJLi22i6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJLi22i6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A556C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 11:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781955729;
	bh=pw28nBB814+UTgHscmRcgZrVyZzwVr8YL9cCdoea9qM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BJLi22i6CdZSs/sesetJlxfjFF/KXsEozwalBBAvp68q39wQWQW/gNsyMsaYg1L/z
	 7R+UmiX/SdZrYpmoaPDnq9ivhu+uiFeyHkWHA8LbOE3Qf6CI2rW8zwlaxvjiKtNtf7
	 HJN/YeypGfPi98Z9KJf9+qT6m7h7rhZXHoyhuSB1+bkW0FoeFV3w2f62EYAEOqy8ec
	 jIMZNNCNBaOHcu41JQZ5U+Tp5XUkqWaj6U60Ol5ZUBc9ORKpfmcQxp4vO4PZZ7MheS
	 I7BKA/Nr11x9GU8KS4Nei74ndxnF504Ayhy26x8x+Bvn7oevYUWrEeGXCz2pdCmZ+2
	 pidHUcCDpegTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 70E48C4160E; Sat, 20 Jun 2026 11:42:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 11:42:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-sdU7ymBxx2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #37 from Milan Oravec (moravec@ukf.sk) ---
Thank you, laptop is 5 month old, and it is clean. That high temps. are
strange. There is not always that high temp. on that device, net connection=
 is
not heavily used, only some web pages and some ssh sessions to remote hosts.
Why is that temp so high? :(

Will try without WIFI, but that is the only one net connection on this devi=
ce,
so not really useful without net connection. :)

Here is output of suggested /sys fs:

migo@migo-HP:~$ tail /sys/class/thermal/cooling_device*/cur_state
=3D=3D> /sys/class/thermal/cooling_device0/cur_state <=3D=3D
1

=3D=3D> /sys/class/thermal/cooling_device10/cur_state <=3D=3D
0

=3D=3D> /sys/class/thermal/cooling_device11/cur_state <=3D=3D
0

=3D=3D> /sys/class/thermal/cooling_device12/cur_state <=3D=3D
0

=3D=3D> /sys/class/thermal/cooling_device13/cur_state <=3D=3D
0

=3D=3D> /sys/class/thermal/cooling_device14/cur_state <=3D=3D
0

=3D=3D> /sys/class/thermal/cooling_device15/cur_state <=3D=3D
0

=3D=3D> /sys/class/thermal/cooling_device16/cur_state <=3D=3D
0

=3D=3D> /sys/class/thermal/cooling_device1/cur_state <=3D=3D
0

=3D=3D> /sys/class/thermal/cooling_device2/cur_state <=3D=3D
0

=3D=3D> /sys/class/thermal/cooling_device3/cur_state <=3D=3D
0

=3D=3D> /sys/class/thermal/cooling_device4/cur_state <=3D=3D
0

=3D=3D> /sys/class/thermal/cooling_device5/cur_state <=3D=3D
0

=3D=3D> /sys/class/thermal/cooling_device6/cur_state <=3D=3D
0

=3D=3D> /sys/class/thermal/cooling_device7/cur_state <=3D=3D
0

=3D=3D> /sys/class/thermal/cooling_device8/cur_state <=3D=3D
0

=3D=3D> /sys/class/thermal/cooling_device9/cur_state <=3D=3D
0
migo@migo-HP:~$ tail /sys/class/thermal/cooling_device*/type
=3D=3D> /sys/class/thermal/cooling_device0/type <=3D=3D
Fan

=3D=3D> /sys/class/thermal/cooling_device10/type <=3D=3D
Processor

=3D=3D> /sys/class/thermal/cooling_device11/type <=3D=3D
Processor

=3D=3D> /sys/class/thermal/cooling_device12/type <=3D=3D
Processor

=3D=3D> /sys/class/thermal/cooling_device13/type <=3D=3D
Processor

=3D=3D> /sys/class/thermal/cooling_device14/type <=3D=3D
Processor

=3D=3D> /sys/class/thermal/cooling_device15/type <=3D=3D
Processor

=3D=3D> /sys/class/thermal/cooling_device16/type <=3D=3D
Processor

=3D=3D> /sys/class/thermal/cooling_device1/type <=3D=3D
Processor

=3D=3D> /sys/class/thermal/cooling_device2/type <=3D=3D
Processor

=3D=3D> /sys/class/thermal/cooling_device3/type <=3D=3D
Processor

=3D=3D> /sys/class/thermal/cooling_device4/type <=3D=3D
Processor

=3D=3D> /sys/class/thermal/cooling_device5/type <=3D=3D
Processor

=3D=3D> /sys/class/thermal/cooling_device6/type <=3D=3D
Processor

=3D=3D> /sys/class/thermal/cooling_device7/type <=3D=3D
Processor

=3D=3D> /sys/class/thermal/cooling_device8/type <=3D=3D
Processor

=3D=3D> /sys/class/thermal/cooling_device9/type <=3D=3D
Processor
migo@migo-HP:~$

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
