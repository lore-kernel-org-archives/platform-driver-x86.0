Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52C0C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun, 15 May 2022 15:48:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237442AbiEOPsT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 15 May 2022 11:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbiEOPsQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 15 May 2022 11:48:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA451101DD
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 May 2022 08:48:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 54FAEB80D19
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 May 2022 15:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15940C341DF
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 May 2022 15:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652629692;
        bh=wrrUGtW9YpgGTO9vRaHw8mgwC2+4vMBB/K8UDOl+N6s=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CSclVSmSns035x4iCxtWrNHAwwxy5YlAtAWEvM7zP6wbHba/N2Aef8HyMWQB9tgG8
         NdxgVDs0VvLtJBSN/hh4TACZrbS5UFZAz03NAD7wdPj8G7PYmHEJzQrMpA/CTt6Has
         G3X8m97paT5/JiURdzYxWlTkGu5V/Qrw5aRR766Wxstj6+sZmNnJIFtkV43p6285/g
         lZnrXS0WYxOueZaGQ9opjjJu1R3xrk5N5lNSXETqmYed8jTnEvTJKRqpfrw0GYWNIG
         LeI64fzY13JNIaNCLNZUv4vVXqCN3BFG1kt2kM7/IIgmwhXh3KYXdG8FC6cGISSYZu
         Oaq2AtvyQY/cA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 06AB2C05FD5; Sun, 15 May 2022 15:48:12 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 15 May 2022 15:48:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: rob@janerob.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-pgIeYLE5Fa@https.bugzilla.kernel.org/>
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

Rob Miller (rob@janerob.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rob@janerob.com

--- Comment #239 from Rob Miller (rob@janerob.com) ---
Created attachment 300958
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300958&action=3Dedit
Asus Z170-DELUXE dump

Thank you for continued work, herewith details for another Asus Z170 board:

$ cat /sys/class/dmi/id/board_name
Z170-DELUXE

$ cat /proc/version
Linux version 5.17.7-051707-generic (kernel@gloin) (gcc (Ubuntu
11.3.0-1ubuntu1) 11.3.0, GNU ld (GNU Binutils for Ubuntu) 2.38) #2022051211=
46
SMP PREEMPT Thu May 12 13:20:51 UTC 2022

still needs `acpi_enforce_resources=3Dlax` for sensors to work

dmesg:
[    3.565498] nct6775: Found NCT6793D or compatible chip at 0x2e:0x290
[    3.566379] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\_GPE.HWM) (20211217/utaddress-204)
[    3.568047] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
