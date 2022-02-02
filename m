Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872C6C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Feb 2022 19:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbiBBTEg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Feb 2022 14:04:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbiBBTEf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Feb 2022 14:04:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FEA3C061714
        for <platform-driver-x86@vger.kernel.org>; Wed,  2 Feb 2022 11:04:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A6C0AB83251
        for <platform-driver-x86@vger.kernel.org>; Wed,  2 Feb 2022 19:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F65DC340F8
        for <platform-driver-x86@vger.kernel.org>; Wed,  2 Feb 2022 19:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643828672;
        bh=HCVfq4K3BiJ2BX4asNyq6aZEeKgrgNpEkzAPi+DauLI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LlADaxDQhfxyWERfeGKLCVPPSOXd1PW2RyprHfzmj9yFlDaac4GY38ar5d6F9QDZP
         1Gs8MdQHDgIUp7QeY8D7vdGwEt4KSoBCK/jwpvSK3QDBHAurGVzuH9jCNVEihew+dg
         dkqO0zIa8+00dXwkt+0RqkOUGQ7MSKNTWalvKvh1PBGkw8Pp9+fx8vqWu1ez/S2XCP
         6wr2GsYvTzPUaPYUbqur2DWFKFbO48IeugKqrH/dRztVBng5EFDTwSUsU7/gRhUts4
         ZntELfLnhtU6OHXxLe5miPBvHPZD6thPj4c+38ipG32H1Fzc/RO308fZHMnOdAbneD
         vR5AJ9QUP3v/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5FD35C05FD6; Wed,  2 Feb 2022 19:04:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Wed, 02 Feb 2022 19:04:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rodomar705@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199715-215701-4TOioQhEFT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199715-215701@https.bugzilla.kernel.org/>
References: <bug-199715-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D199715

--- Comment #65 from Marco (rodomar705@protonmail.com) ---
(In reply to Richard Neumann from comment #63)
> @Stuart
> I am no longer interested in getting my refactored version upstream.
> I tried to follow the upstream development of the driver by AMD to my best
> abilities, but I've not yet seen further development on "interesting" par=
ts,
> such as the accelerometer support for the newest-generation sensor hubs o=
r a
> lid switch driver. So yes, this is basically a dead effort.
> If I should have overlooked upstream commits regarding above features,
> please let me know. I'm still interested in incorporating those into my
> refactored driver version.

When I saw recently that you added lid switch support and I've got my hopes=
 up
in believing that at least that piece was fixed. Then I remembered that it
unfortunately doesn't work under Ryzen 4000+ devices. I thought that the is=
sue
was on asus_nb_wmi driver, but there is no data for the lid sensor, I've ju=
st
recently confirmed when I had a copy of Windows and removed the AMD UMDF Se=
nsor
driver. The automatic keyboard disabler was gone.

Essentially with the upstream kernel driver I have accelerometer data, but =
no
lid switch. With yours unfortunately I haven't both.

I don't really get why they can't release documentation on this device if t=
hey
do not want to support in Linux properly, frankly.

Hope that someone will be able to fix it,

Marco.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
