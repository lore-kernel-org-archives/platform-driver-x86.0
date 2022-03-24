Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7182DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Mar 2022 02:44:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233563AbiCXCps (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Mar 2022 22:45:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbiCXCpq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Mar 2022 22:45:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 157185D5D5
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 19:44:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A2D2E6197F
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Mar 2022 02:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0728FC340E9
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Mar 2022 02:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648089855;
        bh=6sHw3lUNTqLdQhuQ7Nv2DZHPdZab6B/60mEilKNTm08=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZblXvd8B1+Z6GpwX778O1HTM0xu5v3k5AWQJzPmD6ztBROuVHFUVU/Hfpy4YT0JDG
         Zdb3BnhW9f00MVEjWx0uPsUwxCaEkxPNGi8rZtXRtLDNBiJ+FRPg7Pc3losYuAyq6l
         pQhc57/NRTVdpqoy9G5HtIbiHuXvYetohlOkJ7ci0290eU6ZRH2C63QBP78OEVfjHy
         Wkcu0X3sgFt0QlQlNPOeAzSh54Kh+uuZx0yG1H4FBKKFFE08BC5XY6C070PohJE5uI
         NMJ4a2NVxMe+4/VArsoU7UPY3q8z1PDagC0CoqN7CYP2fS+2YfXyvQ+zGx3imoBBqa
         xoz7+EN/OkLew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D8EB6C05F98; Thu, 24 Mar 2022 02:44:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215730] acpi_bus_register_driver() does not work on Alder Lake
Date:   Thu, 24 Mar 2022 02:44:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: xuemin.wu@dbh.dynabook.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215730-215701-v5aeIncqya@https.bugzilla.kernel.org/>
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

xuemin (xuemin.wu@dbh.dynabook.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #10 from xuemin (xuemin.wu@dbh.dynabook.com) ---
Hi Garrett

Thank you very much for your advise.
I confirmed with the BIOS team of the laptop.
A new device Id has been added from Alder Lake platfrom:
 { "DNBK0001",0}

I added above device Id and the toshiba_acpi driver works on the laptop.

Thank you.

Best regards.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
