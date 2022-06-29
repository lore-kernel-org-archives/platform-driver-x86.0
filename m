Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EB1C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 29 Jun 2022 19:49:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbiF2Tth (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 29 Jun 2022 15:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbiF2Ttc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Jun 2022 15:49:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7481C3E5F7
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jun 2022 12:49:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E6A50620AA
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jun 2022 19:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D061C341C8
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jun 2022 19:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656532162;
        bh=/5JxEy30OKXt66YzQmGjCwEyO7kk8Pan6jOKNWvr9S4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=OiRSh2MXygFNy0ZKFziqPwWHgRMzTkveyqUwA5VZsHckc3J8McOIFBWkqfcx3S/4I
         lAAekkLAj13TqTpNW7NERvfuSvBCcS9rzNACODnVk2MJsfmwbEAfqIKSue5gF/cyqX
         T1pxGRCPf30U9M6+SUUnl3NBuJ0XkI5z6bB9Z+SgAV2pZAWZ2P2BINcvYoOM2l0IFH
         VHQkmXa7xfkaYrfM103J/417LZZCbhZrSbudOG0EfFAWf9+7AKS9AHwepuzDJT9bN1
         eNlEmWRkIA2T0Yn22k81zx6iZbAz3ZhfKywtXzoza0M7X4FMHu2l9eFmtVfdqSuLDK
         Hc3tdW/jos1tQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2FFB4C05FD2; Wed, 29 Jun 2022 19:49:22 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216176] ideapad-laptop doesn't expose rapid charge
Date:   Wed, 29 Jun 2022 19:49:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216176-215701-c6qC65kdFy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216176-215701@https.bugzilla.kernel.org/>
References: <bug-216176-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216176

--- Comment #5 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
I agree that this should be a new userspace API under:
/sys/class/power_supply/<BAT-name>/<some-sysfs-attribute>

The best way to go about this is to first propose a new uAPI for this in the
form of a patch to:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/ABI/testing/sysfs-class-power

I think the best thing to do here is to add this as a 4th option to the
/sys/class/power_supply/<supply_name>/charge_behaviour attribute:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/ABI/testing/sysfs-class-power#n462

All the modes there are exclusive (so only mode can be active at a time) an=
d I
think it would make sense to add a fast-charge option for this "rapid-charg=
e"
mode.

Note for the driver patch that there are some helpers for implementing the
charge_behaviour attribute:

ssize_t power_supply_charge_behaviour_show(struct device *dev,
                                           unsigned int available_behaviour=
s,
                                           enum power_supply_charge_behavio=
ur
behaviour,
                                           char *buf);

int power_supply_charge_behaviour_parse(unsigned int available_behaviours,
const char *buf);

Notice the "unsigned int available_behaviours" this is a bit mask of suppor=
ted
modes from the enum power_supply_charge_behaviour.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
