Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CA230149A
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Oct 2025 08:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760602209; cv=none; b=FpGeZouZY5V8TaaIOR8ZrhflPdSpj03XYT3mO0KlOUmELtYckv2cfqyXj1w2z1Io4lvaPBvT6mavGAWmraLppVUlo8YiMhkUfVprjlD1P+wVporB5mxRmJdgJrjPP5ncp5ANV/2bZ/G+WP3KDQ17tycyTo48qg5/FUElxl9vhEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760602209; c=relaxed/simple;
	bh=EAensGHR251T/690lsy7wc+6s9CiHUQ7IVMy1OpJE6E=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FIT3rXg3ZmQGA9UHv++ybTCMqj2AiFeP2/yPkMIb6deSq76kKAw8sB05G5psV3S+HSmWw1WHsH5/kTrWe1ffV0PYrTRu0Evuiflu4IuCntA5TEQBQ08ZAKgsA72j2LFzuWo0rp4EmzKFkBZLwaMW8/plMsZRopdknBnmJ2bvU9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZL//baPa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZL//baPa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC27CC116B1
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Oct 2025 08:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760602208;
	bh=EAensGHR251T/690lsy7wc+6s9CiHUQ7IVMy1OpJE6E=;
	h=From:To:Subject:Date:From;
	b=ZL//baPatWLZLuPHIb//2IIy7qdI/6wfJvwwyx3DiwaMz68gDvyiX10zzcCj5z5k7
	 wh6GwaXqoON7CpneqPRf1Ewmfc8CwOnQoj9l1t/R+UMOKTx6J2YTLeJYztJnt0hzNB
	 kTpWYzjJUp27sqFUQOmKQmh3wYXfQfNURAikeYVg3HkVAN7gi9hea56EkzNUL+pCQg
	 SkFSL1FsUKnF67rEKyv5oFPdNMP2G/FLOi4qVvRsJC5XS0gBogzcldoknqppIyQWnu
	 sirC1p0IZNrIvP2iWhYM3A9Y5XCoVeN1VwtuLYfMLog9qQFWr+joP627WNXgm8I6kE
	 TjvZTVfX/DZVQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D63DAC53BC9; Thu, 16 Oct 2025 08:10:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220670] New: Accelerometer missing on cold boot (Lenovo Yoga 7
 16AKP10, Ryzen AI 7 350)
Date: Thu, 16 Oct 2025 08:10:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: novatitas366@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220670-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220670

            Bug ID: 220670
           Summary: Accelerometer missing on cold boot (Lenovo Yoga 7
                    16AKP10, Ryzen AI 7 350)
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: novatitas366@gmail.com
        Regression: No

Created attachment 308813
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308813&action=3Dedit
dmesg output after cold boot

Laptop: Lenovo Yoga 7 2-in-1 16AKP10
CPU: AMD Ryzen AI 7 350
BIOS version: QXCN19WW
OS: CachyOS but issue persists in other linux distros like fedora
Kernel tested: <6.18.0-rc1-1-cachyos-rc, 6.17.0-rc5-2-cachyos-rc, 6.16.6-3>
Desktop: KDE

The built-in accelerometer is not detected on a cold boot into Linux.
If I boot into Windows 11 once and then shut down (not restart) and boot in=
to
Linux, the accelerometer works normally =E2=80=94 it appears under
/sys/bus/iio/devices/iio:device3 and monitor-sensor reports data.
After a full power-off or Linux reboot, it disappears again until I boot
Windows again.

Steps to reproduce:


1.Power off laptop completely.
2.Boot directly into Linux.
3.Run:
   ls /sys/bus/iio/devices
   monitor-sensor

  no accelerometer device, monitor-sensor also shows no accelerometer

4.Boot into Windows 11, let it load fully, then Shut down (not restart).
5.Boot Linux again =E2=86=92 accelerometer now present and monitor auto rot=
ation works.
6.Reboot Linux =E2=86=92 accelerometer disappears again.


Expected behavior:
the accelerometer should initialize on a cold boot, without needing a prior
Windows session.

Actual behavior:
No IIO devices appear on cold boot; accelerometer is only initialized after
Windows has run once.

Please let me know if you need any additional outputs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
