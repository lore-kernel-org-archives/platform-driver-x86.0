Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A35C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Jul 2022 15:34:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233859AbiGLPeS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234186AbiGLPeI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Jul 2022 11:34:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EED02B623
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 08:34:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0BA5F61726
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 15:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29D40C341C0
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657640046;
        bh=ulbuyC+Ba0RQ8Rw5Nl8FbNPfWtO4YsdRxiOwU2yAzjY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MUI/ApeLsKD4kf9cqBOWjQ90BldDAstsmdW8HQd9B1DO1n4fmBkFWH7DWyvIXA09T
         /CM2JDu2fT1cW0w9lUESJg/pPWCB8TlJIr0Sgy96t4yz2etQSkeqslUL+H+iz2iJGF
         466Kavguepg/C1z9NuK6QDvszIRM/xLKQ8YadG6xv8OIKbOEylWQUc5D8q68onUArf
         xWoavgBwIJbHRh4Hhq6UnqvYvcZvKCtUUmyU0TdtgeaHOr+i4to5GQWWmudH2cBEym
         lY7yzg8iNQqtnBQ13rJPghzbtyG8DAUbbLnAZU/1lZvX2nN69QVcPFqW+DHBLTajNR
         HC69bsmvu8+qA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 15FF2CC13B8; Tue, 12 Jul 2022 15:34:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Tue, 12 Jul 2022 15:34:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-216230-215701-DUBuSv3cSE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216230-215701@https.bugzilla.kernel.org/>
References: <bug-216230-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216230

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |ASSIGNED

--- Comment #16 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> Knowing this, is there anything else you'd like me to try besides your
> suggestions above?

Actually this does make something pop out in my mind.

In your failing log above you had shown this:
> [    4.295526] kernel: Disabling IRQ #9

By this happening before pinctrl_amd is loaded might mean that IRQs are not
being serviced anymore for the ACPI SCI driver.  When pinctrl_amd gets load=
ed
it tries to service IRQ 9 stuff, but it's not destined for that driver and =
then
you see an IRQ storm from ACPI interrupts.

So IMO continue to monitor to see if putting it into the initramfs helped t=
he
problem afterall, but please leave the dynamic debugging for pinctrl-amd in
place on your kernel command line in case it comes back and we need to look=
 at
the timing of the error and pinctrl-amd loading.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
