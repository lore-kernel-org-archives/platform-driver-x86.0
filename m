Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8E8C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Dec 2022 15:37:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbiLUPhO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Dec 2022 10:37:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234758AbiLUPge (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Dec 2022 10:36:34 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A1025C66
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 07:33:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BC9F4617EB
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 15:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 288A2C433F0
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 15:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671636837;
        bh=IqksrHhFhoudTBDzY4DR6P92SrvmKFVOXX8cfCRrRIU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=G1MxLLIyv34Oq6tYKnMXovvv7Im0ws/3aHu2tW/evwKL9ArurCFWzotE2T6sCJq1z
         oFv/iRdQutigZhDzJIj4/ZfWQ/+1Tn7+dpRmGHJwz+X1HQhSBAI9iSlU8sWaWDK7fi
         p8hJJsU7AkNfqK7CXYW6R8F9BXR1KcS54mCquGpzXFREHjEczfNKd/fS6wh7x02mf+
         RitLQ8OR6eQhn8R/pkgDeG5YRI7dWmqQxnwttLVrUmeZUHI8OvJ3ESL8QnHyVfqfeg
         O6nIOZ5FacHDwcljj5yR01ZugopZxnWWXgjfstJCereu1nhvP1RzU/VWF+Kirvg/L6
         o8hsX9xE9/voA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 09A0DC43142; Wed, 21 Dec 2022 15:33:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Wed, 21 Dec 2022 15:33:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216824-215701-xMhFNl6NpT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216824-215701@https.bugzilla.kernel.org/>
References: <bug-216824-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216824

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #13 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Good to hear that the hotkeys work now.

As for the mic/speaker mute LEDs, those are tricky. They can be either atta=
ched
to the embedded-controller and then we would need support to register them
under /sys/class/leds with their default triggers setup correctly, after wh=
ich
the kernel's HDA code shoould control them for us.

Or they may be directly connected to some GPIOs on the HDA part of the main=
 SoC
or on the codec.

And the Fn-lock LED typically just works automatically (controller by the E=
C)
if you toggle the Fn-lock by pressing Fn + escape?  Although sometimes it t=
oo
needs to be controller in software.

Figuring out the LEDs really requires someone with significant hw-enablement
experience to actually have the laptop in their hands and then they will
hopefully be able to figure things out.

I have submitted the fixes for the hotkeys upstream here:
https://github.com/systemd/systemd/pull/25824

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
