Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4E83890F8
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 18:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411363; cv=none; b=lx4rF08lxRWnLKx5Vhw1X+n3EaoREOrYKtmJo8lnw8C3QvykvpTWj8JDLBYyt9Fr9aR16AdALJFwtSFM3veduyXMiai14I/jiMv4kgEyU/p/ugwxHJdFeQ9M5H8ml2O/es4/h+x157SqSc+KFwg//Ly46SDl7M4NDpTZkTcMVhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411363; c=relaxed/simple;
	bh=FYOL3sCfuxjtmPM0TgOzhc5gXb6dGT1hUtNjBAX03AY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CvQebmhn4pmQhOYhFv/RgqwZD/z7amJXASC9g1v0wmhavkADp4iG4mxceEd5P0XzC9dsgEYd0+eZJyZ+vQZSINF3xDRExN848DlMAomTII5hmKKRt3AHyPQoOOrVzsxtbVhcMLHxRcO0h9Wjq/zE6yHIgOunA9qlnJ44kFw/Tqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5UvUqzh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5UvUqzh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACA42C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 18:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789411362;
	bh=FYOL3sCfuxjtmPM0TgOzhc5gXb6dGT1hUtNjBAX03AY=;
	h=From:To:Subject:Date:From;
	b=H5UvUqzhBy1NsKxk+sb8QbixQC18qwwmtVxsqxim392Ulw6fWBjP2cLUcmvDrruRi
	 0dS3lC8V2xgyKTQdHVzN9JYqfJ+z06KKSfLBdyMBAEgDdqvugNw7VKD4rgdt2o0ewi
	 XhK6xkQa3suS09U/HfE8sda47b30choLbBaCCG8fRp98VlnuyMa//bLyu/zfZzQ1cf
	 n6Y/3jgQ7zfxhxMazwtrY1DSnTHEuHzS3SjPwnkXb+4OE4RkrtwNa9Fyt7VyrMQeYK
	 uEnMNpcjTMKZn/yYfT7Grx9ZLUxNbzHuKvIU4M8z5GAxgTlaG/MJ72YLHgGSOR8nkj
	 n36gqjX8LZZoQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 85D3CC41612; Mon, 14 Sep 2026 18:42:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222015] New: ASUS TUF Gaming A18 (FA808UH): keyboard backlight
 requires HID feature report 0x46 0x01 to initialize on cold boot
Date: Mon, 14 Sep 2026 18:42:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: imatvey.root@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-222015-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222015

            Bug ID: 222015
           Summary: ASUS TUF Gaming A18 (FA808UH): keyboard backlight
                    requires HID feature report 0x46 0x01 to initialize on
                    cold boot
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: imatvey.root@gmail.com
        Regression: No

Created attachment 310851
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310851&action=3Dedit
dmesg

Problem
-------
Keyboard backlight (asus::kbd_backlight LED class device) does not work on a
cold boot under Linux. Writing a brightness value to
/sys/class/leds/asus::kbd_backlight/brightness succeeds and the value is
reflected in the sysfs file, but the physical backlight stays off.

This is reproducible on a vanilla Arch kernel (7.2.4-arch1-2) and was also
observed on linux-zen, on a fully updated EndeavourOS installation.

Hardware
--------
System:   ASUS TUF Gaming A18 FA808UH_FA808UH
Board:    FA808UH
BIOS:     FA808UH.313 (02/04/2026)
CPU/GPU:  AMD Ryzen + NVIDIA (ASUS TUF A18, 2025/2026 model)

Root cause / evidence
---------------------
1. Booting Windows (bare metal, not a VM) turns the keyboard backlight on
   immediately. This proves the hardware and firmware are fine.

2. After a *warm reboot* from Windows into Linux, the backlight remains on
   and asusctl / brightnessctl start working normally. This shows that the
   embedded controller (EC) state is initialized by Windows and persists
   across a warm reboot.

3. On a *cold boot* directly into Linux, the EC is never initialized, so
   the LED class device accepts writes but they have no effect.

4. Sending a single HID feature report to the keyboard controller fixes the
   problem immediately and permanently for the rest of the boot session:

       hidapitester --vidpid 0B05/19B6 --open --send-feature 70,1 --close

   The tool writes a 64-byte feature report whose first two bytes are
   0x46 0x01. After this, writing brightness to sysfs works as expected.

Workaround
----------
A systemd oneshot service that runs hidapitester at boot restores normal
behavior. This is not a real fix, only a userspace workaround.

Request
-------
Please add a quirk to asus-wmi (or hid-asus) to send the equivalent
feature report (0x46 0x01) to USB device 0B05:19B6 during driver
initialization on the ASUS TUF Gaming A18 FA808UH / FA808UP, so the
keyboard backlight works out of the box on cold boot.

Attachments
-----------
I can provide the following if needed:
  - full dmesg from a cold boot
  - lsusb -v output for the keyboard device

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
