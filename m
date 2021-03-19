Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18CBC433DB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Mar 2021 19:14:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77D3161962
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Mar 2021 19:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbhCSTOL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 19 Mar 2021 15:14:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:42666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230264AbhCSTOA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Mar 2021 15:14:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5872461983
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Mar 2021 19:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616181240;
        bh=tQYa1a5Kfj7kcrJziZJ/8zGruv59LgE/Rgnds3Zet2I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QpQ/vH9i373UHWQS3fOoED4m1Y4RdQXYr3NKTV5H8L/OGg6pPpUjb0Tls0v495GWb
         B/X1tLkwNOY5lstIiLeuq6MpMmRBaLWR5/0nGNlZZsZzEX6e3PqKlrrV4AOZqu9jYs
         9eOmP3dutLZlf/H5yp1x1/MUSjNy8ppLCVabPD6N8Wj/3hNtU4bfl33EHJFooJXJNu
         LucUoUS/ukxySG+4PJr8JdsIUK9veWd7BiB3V18UkNuy+6hFQehy5CDbcRpTF+EgVl
         erJUQLIrNg266q88rEMy6jnhPUC7LloUBWicMqugZdyNC2ppI0XisjsI9UEGpZWgTj
         uGlfOjNUC8JPQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 19 Mar 2021 19:13:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mjg59-kernel@srcf.ucam.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-204807-215701-0hKz8MV5GT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

Matthew Garrett (mjg59-kernel@srcf.ucam.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |INVALID

--- Comment #37 from Matthew Garrett (mjg59-kernel@srcf.ucam.org) ---
Here's the situation. Your ACPI tables declare that your system firmware may
access the addresses associated with your IO sensors. We have no idea what =
your
firmware may do here - it may do nothing (in which case accessing the addre=
sses
is completely safe), or it may use them for its own internal monitoring. Se=
nsor
hardware frequently uses indexed addressing, which means that accessing a
sensor requires something like the following:

1) Write the desired sensor to the index register
2) Read the sensor value from the data register

These can't occur simultaneously, so if both the OS and the firmware are
accessing it you risk ending up with something like:

1) Write sensor A to the index register (from the OS)
2) Write sensor B to the index register (from the firmware)
3) Read the sensor value from the data register (returns the value of senso=
r B
to the firmware)
4) Read the sensor value from the data register (returns the value of senso=
r B
to the OS)

The OS asked for the value of sensor A, but received the value of sensor B.
From the OS side this is probably not a big deal (you get a weird value in =
your
graphing), but if it happens the other way around the firmware may decide t=
hat
the system is running out of spec and shut it down to avoid damage. This is=
 not
a good user experience.

Why does Windows not have the same problem? Well, in the general case there=
's
nothing stopping it from doing so. Vendor tooling usually takes one of two
approaches:

1) They don't use the hardware sensors directly, they use firmware interfac=
es
to them. This is alluded to in comment #31 - on Asus systems, the sensors a=
re
available via a WMI interface. Using a firmware interface ensures that the
firmware knows what the state of the hardware is, and avoids any race
conditions. Your board may well support an alternative firmware interface a=
nd
Linux simply lacks driver support for it. If so, I'm afraid that the correct
solution is to add that driver support. Given that this bug has ended up
covering boards from multiple vendors, it's no longer the correct place to
handle that, though.
2) The vendor knows that the firmware makes no policy decisions based on the
sensor values, so it's safe to access the resources even though the firmware
declares that it uses them. The problem with this approach is that *we* hav=
e no
way of knowing that it's safe, and the consequences of it being unsafe incl=
ude
data loss. Given the choice between users being able to look at system
temperatures and users not losing data, we choose to prioritise users not
losing data.

Looking at your ACPI tables, we see the following:

    Name (IOHW, 0x0290)

    OperationRegion (SHWM, SystemIO, IOHW, 0x0A)
    Field (SHWM, ByteAcc, NoLock, Preserve)
    {
        Offset (0x05),=20
        HIDX,   8,=20
        HDAT,   8
    }

This means that there's a region of IO ports starting at address 0x290 and =
0x0a
addresses long. This is the same region of port IO that your sensor chip us=
es.
Within that address range, we declare that 0x295 is called HIDX, and 0x296 =
is
called HDAT. This is consistent with an index and data register as described
above, which means that having the OS access this space directly is likely =
to
race with the firmware (ie, it's dangerous).

Near here are two methods called RHWM and WHWM. At a guess, that's "Read
Hardware Monitoring" and "Write Hardware Monitoring". These not only access=
 the
sensors via the registers described above, they do some additional hardware
access around it. This is further evidence to support there being some
handshaking involved to avoid race conditions - the firmware takes a mutex =
and
appears to hit some other register that may also be used to guard against
racing against system management mode. We really, *really* want to be using=
 the
firmware methods here rather than touching the sensor chip directly. At this
point, direct access isn't so much walking past a sign saying "Danger, keep
out", it's a sign saying "Proceed no further or you will die slowly and it =
will
hurt the entire time".

RHWM is referenced from the WMBD method if the first argument to it is RHWM,
and WHWM is referenced if the argument is WHWM. WMBD is the WMI dispatcher =
for
the WMI function with identifier "BD" - looking at your _WDG object, which
describes the available WMI interfaces, we have the following:

            Name (_WDG, Buffer (0x50)
            {
                /* 0000 */  0xD0, 0x5E, 0x84, 0x97, 0x6D, 0x4E, 0xDE, 0x11,=
  //
.^..mN..
                /* 0008 */  0x8A, 0x39, 0x08, 0x00, 0x20, 0x0C, 0x9A, 0x66,=
  //
.9.. ..f
                /* 0010 */  0x42, 0x43, 0x01, 0x02, 0xA0, 0x47, 0x67, 0x46,=
  //
BC...GgF
                /* 0018 */  0xEC, 0x70, 0xDE, 0x11, 0x8A, 0x39, 0x08, 0x00,=
  //
.p...9..
                /* 0020 */  0x20, 0x0C, 0x9A, 0x66, 0x42, 0x44, 0x01, 0x02,=
  //
 ..fBD..
                /* 0028 */  0x72, 0x0F, 0xBC, 0xAB, 0xA1, 0x8E, 0xD1, 0x11,=
  //
r.......
                /* 0030 */  0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10, 0x00, 0x00,=
  //
....)...
                /* 0038 */  0xD2, 0x00, 0x01, 0x08, 0x21, 0x12, 0x90, 0x05,=
  //
....!...
                /* 0040 */  0x66, 0xD5, 0xD1, 0x11, 0xB2, 0xF0, 0x00, 0xA0,=
  //
f.......
                /* 0048 */  0xC9, 0x06, 0x29, 0x10, 0x4D, 0x4F, 0x01, 0x00 =
  //
..).MO..
            })

The format of _WDG is 16 bytes of GUID, 2 bytes of ID or notification data,=
 1
byte of instance count and 1 byte of flags. The GUID used by asus-wmi
corresponds to the first GUID in this file,
97845ED0-4E6D-11DE-8A39-0800200C9A66. That has an ID of 0x4243, or BC - ie,
it's not the GUID we're looking for. The next GUID, however,
(466747a0-70ec-11de-8a39-0800200c9a66) has an identifier of 0x4344, or BD. =
So
this is the GUID we're looking for. Unfortunately asus-wmi doesn't handle t=
his
GUID, so new code will need to be written.

I'm going to close this bug again because it's turned into a generic bug
covering different motherboard vendors, and there's no one size fits all
solution. For your case the correct way to handle it is for someone to writ=
e a
driver that uses the 466747a0-70ec-11de-8a39-0800200c9a66 interface to expo=
se
the sensor data. I'm afraid I don't have relevant hardware so can't do this
myself, but please do open another bug for that.

tl;dr - the kernel message you're seeing is correct. Avoiding it requires a=
 new
driver to be written. If you *personally* feel safe in ignoring the risks, =
you
can pass the acpi_enforce_resources=3Dlax option, but that can't be the def=
ault
because it's unsafe in the general case, and so it isn't the solution to the
wider problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
