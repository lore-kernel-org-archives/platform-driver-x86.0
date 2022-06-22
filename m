Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD41EC43334
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Jun 2022 09:46:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbiFVJqW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Jun 2022 05:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbiFVJqV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jun 2022 05:46:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63491E8E
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 02:46:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2684CB81D3F
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 09:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3AAAC34114
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 09:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655891177;
        bh=udHEg5fZo26OCo5QVvt0jLxX+TmGv98N8HSnxqQ00kk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iORuiHiLWS5oBMyKw/tMceU5ZRzvewxifA083qQbNMa/LaUpkyPJXT0FOT2KbHXSo
         9tzV1gLxWZTzS25u+yOz98nGCzbt74hqXyI9pr1YBW3EgwKlsAg9qbBJ8F3GawoHRq
         bHOcfXq+Bk9Eb+TejEXPscTJQjfw9GEtlh7YuotZ7f0DcWTafHnrbui1K080h5NYFq
         +tU5jD5e0Z9bXyASGgqk+GycBkJDhDjWgegfpexYQD1fgLWdx7gifrxucVKUAmV5hv
         v1g9TXQO4KhRMurijVP9Fw8dVBEuxxtP6SGd+qaiEeGUR55nPTGafw+EOPfE7TdDqY
         LUDvS0eiee8Tw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 926FEC05FF5; Wed, 22 Jun 2022 09:46:17 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213297] ideapad-laptop: DYTC interface not found, several
 functionalities missing
Date:   Wed, 22 Jun 2022 09:46:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lortegap@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213297-215701-HsauXWAJdg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213297-215701@https.bugzilla.kernel.org/>
References: <bug-213297-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213297

--- Comment #9 from Luis O (lortegap@protonmail.com) ---
1. indeed, that kernel module will make testing much easier for other people
2. please write the patch, and I'll test it. I'm on fedora 36 if that helps.

thank you!

Sent from Proton Mail mobile

-------- Original Message --------
On Jun 22, 2022, 3:51 AM, wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D213297 Hans de Goede
> (jwrdegoede@fedoraproject.org) changed: What |Removed |Added
> -------------------------------------------------------------------------=
---
> CC| |jwrdegoede@fedoraproject.or | |g --- Comment #8 from Hans de Goede
> (jwrdegoede@fedoraproject.org) --- (In reply to Luis O from comment #7) >=
 I
> came across this issue, and I checked the ideapad-acpi source code and fo=
r >
> some reason it now allows DYTC version 4, but only for 1 laptop model. >
> https://github.com/torvalds/linux/blob/ >
> ca1fdab7fd27eb069df1384b2850dcd0c2bebe8d/drivers/platform/x86/ideapad-lap=
top.
> > c#L871 Right, this is done because we don't know if DYTC version 4 will
> work on all models. The ideapad platform-profile code was based on the
> ThinkPad code contibuted by Lenovo and that was for version 5. So for now=
 we
> only allow using v4 on tested devices. What would be good is to add a mod=
ule
> parameter to allow using the platform-profile code on v4 devices for easi=
er
> testing. If you can submit a patch to do that that would be great. Or if
> you're not into writing kernel patches, I can write such a patch and then=
 you
> can test it on your model. Note this will require you to build your own
> kernel from source. And if the testing of the patch also shows that your
> model works correctly, then your model can also be added to the list of
> devices on which using v4 DYTC support is allowed (and eventually if that
> list becomes quite big we may choose to enable this by default). -- You m=
ay
> reply to this email to add a comment. You are receiving this mail because:
> You are on the CC list for the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
