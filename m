Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDECC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 May 2022 21:46:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbiEQVqj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 May 2022 17:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbiEQVqi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 May 2022 17:46:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9192113E11
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 May 2022 14:46:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 36C9160F40
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 May 2022 21:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94F04C34100
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 May 2022 21:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652823996;
        bh=jSK6uSf9EDnTK8pfovww/gr70c3i91LjPsHobGbUr2Q=;
        h=From:To:Subject:Date:From;
        b=lLBDhn3NuI8Wmbfm/uU7TuBI29xA4e0W4l0ixA707eJ0OinjOZYg1mOhkd9x0VAyW
         BXLYIf4MTbHVj7k6dVsL7OyNvksZtAKhIkG3qVsGN6c4TKFpMByDjlatuxpGFzXzC8
         xAQAQX/6Nw2xewvMDKlj7qkDrtassbk9XNgrtNr7NiDzJL+NSGAqLUjeqA2INX+edQ
         a3aiek80ioYJ1vCwAVa4l9ZLpuNLsTkXaJrDoTHEIjNEtvP5jaPKcwcjE9TvzaZJxH
         3lolDhF3X2xAAHrs/tshHgG8jU5y3nyUGNZQqku285wK4CE7hbxZ4MR4w2X8asmIGF
         4jGQqunaBcyXA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 72BDDC05FD0; Tue, 17 May 2022 21:46:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] New: Serial Bus Multi Instantiate driver fails to
 allocate SPI device CSC3551:00
Date:   Tue, 17 May 2022 21:46:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: matt.perlick@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215993-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215993

            Bug ID: 215993
           Summary: Serial Bus Multi Instantiate driver fails to allocate
                    SPI device CSC3551:00
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18-rc7
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: matt.perlick@gmail.com
        Regression: No

Created attachment 300984
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300984&action=3Dedit
Boot Dmesg

Distribution: Manjaro
CPU: Intel 12th gen i5-1240P
Kernel version: 5.18-rc7
Problem Description:

TLDR: I think ACPI device HID=3DCSC3551 should be supported with a new driv=
er but
dmesg shows:
Serial bus multi instantiate pseudo device driver CSC3551:00: error -ENODEV:
failed to allocate SPI device CSC3551:00 from ACPI: -19
Is this a bug in the module?


I've been working on getting internal speakers functional on Asus Zenbook
UX3402ZA. After ruling out ALSA issues and ALC294 codec configuration, I fo=
und
out this machine has two amp devices (Cirrus Logic CS35l41?) connected over
SPI. These devices are declared under a single ACPI node with HID=3DCSC3551.

I found a patch series for supporting this particular ACPI node in the LKML=
 (
https://lore.kernel.org/lkml/20220121143254.6432-7-sbinding@opensource.cirr=
us.com/T/
). It requires a special driver because declaring multiple SPI devices in o=
ne
ACPI node was not previously supported. Looking at the Linux source, I beli=
eve
this patch has been included in all the 5.18 release candidates. I've compi=
led
rc7 and made sure to set the .config file to include the new module
CONFIG_SERIAL_MULTI_INSTANTIATE=3Dy.=20

With this newly compiled kernel, I see this error in dmesg:
Serial bus multi instantiate pseudo device driver CSC3551:00: error -ENODEV:
failed to allocate SPI device CSC3551:00 from ACPI: -19

Could this be a bug in the module? I'm not sure how to proceed from here. A=
ny
advice is appreciated.

dmesg:=20
Included as attachment

ACPI dsdt.dsl Node:
    Scope (_SB.PC00.SPI0)
    {
        Device (SPK1)
        {
            Name (_HID, "CSC3551")  // _HID: Hardware ID
            Name (_SUB, "10431E02")  // _SUB: Subsystem ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Sett=
ings
            {
                Name (SBUF, ResourceTemplate ()
                {
                    SpiSerialBusV2 (0x0000, PolarityLow, FourWireMode, 0x08,
                        ControllerInitiated, 0x003D0900, ClockPolarityLow,
                        ClockPhaseFirst, "\\_SB.PC00.SPI0",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    SpiSerialBusV2 (0x0001, PolarityLow, FourWireMode, 0x08,
                        ControllerInitiated, 0x003D0900, ClockPolarityLow,
                        ClockPhaseFirst, "\\_SB.PC00.SPI0",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000,
IoRestrictionOutputOnly,
                        "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0156
                        }
                    GpioIo (Exclusive, PullDown, 0x0000, 0x0000,
IoRestrictionOutputOnly,
                        "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0065
                        }
                    GpioIo (Exclusive, PullDown, 0x0000, 0x0000,
IoRestrictionInputOnly,
                        "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0165
                        }
                    GpioIo (Shared, PullUp, 0x0064, 0x0000,
IoRestrictionInputOnly,
                        "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0064
                        }
                    GpioInt (Edge, ActiveBoth, Shared, PullUp, 0x0064,
                        "\\_SB.GPI0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0064
                        }
                })
                Return (SBUF) /* \_SB_.PC00.SPI0.SPK1._CRS.SBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((AMPP =3D=3D One))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
            }
        }
    }

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
