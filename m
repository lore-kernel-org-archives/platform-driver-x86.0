Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0152EC61D97
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Nov 2023 12:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343932AbjKVMC7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Nov 2023 07:02:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343917AbjKVMC6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Nov 2023 07:02:58 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 446C791
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Nov 2023 04:02:55 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4151C433CC
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Nov 2023 12:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700654574;
        bh=beEJbyiefj3rhCxASaWpTq0qQ13OeOwB2I2PsTBfNQs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=q3oV31tuHkvlj42lU+YRVYTPptEsA9hRhjwcCeU94VCPJ9yuoaFtleb0KmPCTG5lJ
         uwVxcaATXbFivcB7qP2SMBTszWHAUz3e3bectyW12+F0bN4Jced6yQ4ZbAVPrOIPmG
         enodo8hJm0nCASFI6iVtlsl9plNYGMRAWjMFv5ssQVBharpo675W94t7G/LHE7TItT
         lfRiRt3y3Pg753Odnz6Ieb8Gzq466jCZo2XEtvgStfSY933x3DRxeLXimUHDC9uLx+
         uaY2M2jUm5zc0lOxjG7xBBQpGoAAlCyx5ugEavnDjVDSw6v5kX9rDJi4+66/Y6vDe4
         G9UVJJnmXTjhw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CEC31C53BD5; Wed, 22 Nov 2023 12:02:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 203191] The fan speed reports to 65535, despite the fan is
 stopped
Date:   Wed, 22 Nov 2023 12:02:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: antony.gelberg@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203191-215701-knCu768C0k@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203191-215701@https.bugzilla.kernel.org/>
References: <bug-203191-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D203191

antony.gelberg@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |antony.gelberg@gmail.com

--- Comment #16 from antony.gelberg@gmail.com ---
Did anyone get anywhere with this? Suffering as well, P14s gen 2, Ubuntu 22=
.04
LTS, kernel 5.14.0-1048-oem, latest BIOS N34ET57W (1.57).

Not using thinkfan, laptop has always been pretty reliable for the last cou=
ple
of years; this is a recent-ish problem for me, having to reboot every few h=
ours
is painful.

Am considering a warranty repair but will be inconvenient to be without lap=
top
and unsure if it is a hardware problem.

Has anyone noticed anything in the system logs at all? I added a fan speed
indicator in my XFCE panel to check (usually when I'm like hmm, the laptop =
is
running slowly then I look at the fan speed and it's 65535).

Also, often, I'll hear the fan struggling to start running like brr brr, th=
en
sometimes it runs normally (2000-4000 RPM on average) but most times it's 6=
5535
and a heating CPU.

Also, when I reboot, I get the BIOS Fan Error screen and the laptop powers =
off.
Then I power it back on and things run normally for x hours.

The bug is in NEEDINFO but what info is needed?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
