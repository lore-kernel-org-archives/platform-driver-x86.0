Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B459C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Mar 2022 09:24:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237004AbiCWJ0D (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Mar 2022 05:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbiCWJ0C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Mar 2022 05:26:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DFF653E26
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 02:24:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 27C336177A
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 09:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CFC2C340E8
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 09:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648027472;
        bh=8tD/Ur4Oi9UHgMZRESIC+JHqXNOYxgbzvkzqaZFMMyI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WqylV/ml5RjS9qG037FfZq8JxPG9X7ExGOK0tbrWWG4mXqHc/u+UFucqC00BZbogD
         n3wHYb6A6vHB4jNa3FQk7DAvVChMExmXgBGDU73BTZK5kDaWrzCJxY8Zntgo0mpnTL
         zzs5X+ygvZWzpKXk//8fnZk0h8mNT+sezwf53GaruDzbZyTYRUxS6OZ5Dx3m5+RYFX
         NsUIoWl9hormXWR6QNcXG0Cug7TeGLaLk7rG9EkYOC+YkiHaHsB3BooEl20im/0n5M
         J8cNQLKbEW0B3GZyGtvxzt1ru1s1/RCKhQr4qQm3MCEQRM/CTezLUjQxfWs8sIBGKK
         YoCY6JwkwU3gw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 72286C05F98; Wed, 23 Mar 2022 09:24:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215730] acpi_bus_register_driver() does not work on Alder Lake
Date:   Wed, 23 Mar 2022 09:24:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: xuemin.wu@dbh.dynabook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215730-215701-22V4w53Cqt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215730-215701@https.bugzilla.kernel.org/>
References: <bug-215730-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215730

--- Comment #5 from xuemin (xuemin.wu@dbh.dynabook.com) ---
Created attachment 300608
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300608&action=3Dedit
acpidump.output.txt--after-updated-latest-BIOS

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
