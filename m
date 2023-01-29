Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C6DC05027
	for <platform-driver-x86@archiver.kernel.org>; Sun, 29 Jan 2023 21:24:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbjA2VY4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 29 Jan 2023 16:24:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjA2VYz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 29 Jan 2023 16:24:55 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B1B1259C
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Jan 2023 13:24:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 16DF4B80DC3
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Jan 2023 21:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9148C43443
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Jan 2023 21:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675027491;
        bh=WprYP5g+IMj+YXfrwRFoTKxd+rYbe6Nl/bp44Iwm0vI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HntMQhg98XQFbRuY5B4cvBCAmBthk3xuKTsTJ5Y/ldmuBD/1WLcDTrQV6RYUWu/lA
         F92eKTeFWRRTnXZYdMkXS0AphOwQ6aKQ+Jf2iC+5/A7xUQ65bN927oMLin65yTn0/g
         q2A4cdJAFyR7a7T4DkfwuYoYHioQUQVSlJFgOLo7tklHX4m8/QtdcV7kJEXXk1qHGP
         1Y6dH47ZOEbCWvDjLWFqPqWOKMTeGj3aiLHBsj33bxvOBu/16n2t0GPQWn9FOnktv8
         TXlSM78SgApz/sK0w7yweLTW3/3Ra+mnRm8DkGFyDJjgN20LqPRI2UTikVd0jbqQJI
         Aumi6m192+bFA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A749FC43143; Sun, 29 Jan 2023 21:24:51 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 29 Jan 2023 21:24:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-p9XrGirg2A@https.bugzilla.kernel.org/>
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

--- Comment #292 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to Robert Kling from comment #291)
> I let the mainboard/bios handle
> cpu/aux fan speed, I'm not running any fan control programs at the moment.
> Would that be fine?

It depends on luck, bioses, hw schematic and so on. Main issue is bios does=
 not
provide known methods for sensor access and does not use global mutex before
access to the region related to sensors, and mutual access could be not
possible with such bios implementation. It works without known issues for o=
ther
boards with mutex lock (P8H67, X99-E WS/USB 3.1). Other boards could have
issues, like example it can be such:
https://github.com/electrified/asus-wmi-sensors#known-issues. Its different
driver but issues could be the same.

> The WMI implementation in some of Asus' BIOSes is buggy. This can result =
in
> fans stopping, fans getting stuck at max speed, or temperature readouts
> getting stuck. This is not an issue with the driver, but the BIOS. The Pr=
ime
> X470 Pro seems particularly bad for this. The more frequently the WMI
> interface is polled the greater the potential for this to happen. Until y=
ou
> have subjected your computer to an extended soak test while polling the
> sensors frequently, don't leave you computer unattended. I can personally=
 say
> I've seen the issue on the Crosshair VII with BIOS 2606 and a Ryzen 2700X,
> upgrading to 3004 rectified the issue.


Or https://bugzilla.kernel.org/show_bug.cgi?id=3D204807#c37

> Sensor hardware frequently uses indexed addressing, which means that
> accessing a sensor requires something like the following:
>
> 1) Write the desired sensor to the index register
> 2) Read the sensor value from the data register
>
> These can't occur simultaneously, so if both the OS and the firmware are
> accessing it you risk ending up with something like:

> 1) Write sensor A to the index register (from the OS)
> 2) Write sensor B to the index register (from the firmware)
> 3) Read the sensor value from the data register (returns the value of sen=
sor
> B to the firmware)
> 4) Read the sensor value from the data register (returns the value of sen=
sor
> B to the OS)


Or https://bugzilla.kernel.org/show_bug.cgi?id=3D204807#c69
> the lm_sensors sensors-detect script had overvolted his RAM ruining both =
his
> expensive high-end RAM as well as his expensive top of the line CPU. The =
user
> was surprisingly relaxed about all this, which I really appreciated.
>
> And that was while the script was not doing anything which we (the
> developers) considered dangerous. But the motherboard had a funky setup
> causing a SMbus *read* transaction to change the voltage.


Thank you!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
