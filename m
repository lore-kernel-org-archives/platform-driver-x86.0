Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91161C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Nov 2021 06:51:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 795C361211
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Nov 2021 06:51:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhKDGyP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Nov 2021 02:54:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:33118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229994AbhKDGyP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Nov 2021 02:54:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C62AF6121E
        for <platform-driver-x86@vger.kernel.org>; Thu,  4 Nov 2021 06:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636008697;
        bh=z/2P8vICxymA5eyl2A6XDyOEFi7gJ4a2pfiyxdaiuZM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PdHcj8gc+VL53cjNE46Ly/QEaULrH4zrbP5qfwOpXXlk4yuttaDJDEarPg/qgahlO
         9ZZVLVtnjoCsjaw/EUw/r2Z4Bmqrkf4QoaF8fGv9bE+oJAMHATtXgPOue3TKAdZEx1
         QJEGrJ2WAiviu+67/VplmPDTTiwB3DvtxCRLuBjOvyx2k2JwlJbnTw/+H62pRxCLYn
         p//BXklTnVxUkWImzkk3d1E7EtE6DEw1upAmQzak+K0xjx/uH/rQZDrvMoNRcvGzJR
         o4JoY8p0oes4000fT8VXCFAzMpNxQiSmGQpbx9BBKdqdX/PbB/ZNBaxeXZyC6x+jaF
         n7mpEmxYW2jkA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 04 Nov 2021 06:51:36 +0000
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
Message-ID: <bug-204807-215701-Z9dmFsOVcp@https.bugzilla.kernel.org/>
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

--- Comment #147 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to Jarkko Korpi from comment #146)
> Please add also Asus z390 rog strix f-gaming.
>=20
> [    3.685656] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> [    3.685747] ACPI Warning: SystemIO range
> 0x0000000000000295-0x0000000000000296 conflicts with OpRegion
> 0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20190816/utaddress-20=
4)
> [    3.685750] ACPI: If an ACPI driver is available for this device, you
> should use it instead of the native driver

Have you tried to run
https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/lo=
g/?h=3Dhwmon-next
with added your board to list?

Could you also share exact name of board from /sys/class/dmi/id/board_name?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
