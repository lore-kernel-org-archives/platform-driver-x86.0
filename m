Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8323C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Jun 2022 03:03:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbiF0DDq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 26 Jun 2022 23:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbiF0DDp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Jun 2022 23:03:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D824455A8
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jun 2022 20:03:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 92F9BB80DF9
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 03:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 571D3C341CC
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 03:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656299020;
        bh=5pZ9ZiOLJ5/95Y4BbLZHunBoWDvptB3C3plapomfTDU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rWvcjCsW46J6+9x6lKjUZwDdYoH3+a7TdUfBb6KpweSZoFtGTti3NPSI/LwTfZjt1
         v5jt1+bDk9fEXpAxJy1P4AzqrRLZdbCMMiUPDY1NUpxsL8fihAem6yQgqUJhPD81eF
         UZMUDoO+aFOdpHlUDX9U0O9DqI7RUOEPxWlO+ssq/FORQKAWEctWunASn9km+0RPym
         ckpuJiWHrwsaY9abibYEII/LvIBy7BXeirW3Lk6rsiWLgSNBQC04gEUn5H2O0+BIj7
         xSHdBXh/rA6e3FhRERZD/FkIoGg/HilJww4hjW21OuPGBe+tSAacbjRle+9zQ1AWgY
         RWxBwhSFzoCVQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 42349C05FD2; Mon, 27 Jun 2022 03:03:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215651] Battery charge limit is reset on every boot on ASUS
 laptops
Date:   Mon, 27 Jun 2022 03:03:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rui.zhang@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc component assigned_to product
Message-ID: <bug-215651-215701-zwrY4Z9nE2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215651-215701@https.bugzilla.kernel.org/>
References: <bug-215651-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215651

Zhang Rui (rui.zhang@intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rui.zhang@intel.com
          Component|Power-Battery               |Platform_x86
           Assignee|acpi_power-battery@kernel-b |drivers_platform_x86@kernel
                   |ugs.osdl.org                |-bugs.osdl.org
            Product|ACPI                        |Drivers

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
