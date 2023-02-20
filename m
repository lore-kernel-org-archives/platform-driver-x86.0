Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03492C636CC
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Feb 2023 09:07:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbjBTJHd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Feb 2023 04:07:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbjBTJHc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Feb 2023 04:07:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DC7198
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Feb 2023 01:07:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9961F60D2F
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Feb 2023 09:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2A28C4339B
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Feb 2023 09:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676884051;
        bh=Y+fB2flBUacjr3ZDEPajoBxhHXobBg2VrS23pWrP6Qo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LgGZDq19+HuHqOgWGL14Ei0t1Tsd4Nt0HuMUh6LqtPyTxoz6ttUKKhQDehbYL9+ft
         lDfWlbybbiFk2PNb8T692Uu/N/AseKAE++d4bxLV+aoNyweW3ccy1smnYd6VWEmk4n
         IVvMPkvK1nfrysPxVnmacmqyQ5UNy2Vnh1uoCObzrNgbSCoWR5iffTR5SoUgoMkxJ/
         hl23eGGB8dEs8UJQEvpPnD/ROOAvkAKKdEAMOk1mL6RO5UcB7Uwye7nzKiqdOvcusB
         4SqAtlmnTlfiXEy4/p2ERLUIO6ro+8Yuv3KuqtTxHXsWY/WSGWh/xBsl1jrRzvWUBS
         I8MT7UBAh0Pcg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D3625C43141; Mon, 20 Feb 2023 09:07:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217057] Asus high CPU temperature / low fan speed
Date:   Mon, 20 Feb 2023 09:07:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jdelvare@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc component assigned_to
Message-ID: <bug-217057-215701-5RtRCsc5tC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217057-215701@https.bugzilla.kernel.org/>
References: <bug-217057-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217057

Jean Delvare (jdelvare@suse.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |corentin.chary@gmail.com
          Component|Hardware Monitoring         |Platform_x86
           Assignee|jdelvare@suse.de            |drivers_platform_x86@kernel
                   |                            |-bugs.osdl.org

--- Comment #4 from Jean Delvare (jdelvare@suse.de) ---
Moving to a more appropriate component. This is not related to hardware
monitoring but to thermal management, and most likely the only way to handle
this is in a dedicated x86 platform driver (or possibly fixes to the asus-w=
mi
driver).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
