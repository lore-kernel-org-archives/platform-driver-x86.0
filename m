Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181CFC001DC
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jul 2023 19:05:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbjGZTFJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jul 2023 15:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjGZTFI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jul 2023 15:05:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7D1EE7
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 12:05:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4853461C4F
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 19:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7771C433C7
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 19:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690398306;
        bh=gk1vFXd+E8VUGllkaOfLv4LKt9CgqZhGyfu0kAumKyw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cONo9tL1+U7kS4i320/UXy0TEgYNEMNwiyAKrAzhJpdh8RoyfDVsfOTBlyVbKuj2V
         piO3EFyvr3pEKcHfobOnk4/Db0Z4fhmXDix01ZSeMbveb7hQKfDmdmF4wCyOiHoWcH
         ge5h87yWRlSbv9wCMHSCSL5rbsPmFQ41Z9kAlZ51kw8vWSJCy5vsJkxWIIu4Ch3TEK
         sYooMLwNv2cv/CXROo0C7UVrkEKAPa2kR/FZ1aq7NuQwCGe+NhZ7iV0r+ZP6QhlpOn
         DZQ0/hG+5muTjf/osmwsYvMLBTE/j29dsQ6WdiK2e7E2LVlh6jHWGxjhz7c2pKLBNz
         ce6rUvRHlLMlw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 89229C4332E; Wed, 26 Jul 2023 19:05:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Wed, 26 Jul 2023 19:05:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217696-215701-wnXGmg6XqI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217696-215701@https.bugzilla.kernel.org/>
References: <bug-217696-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217696

--- Comment #23 from Artem S. Tashkinov (aros@gmx.com) ---
Please disregard unless you have spare time and kindness in your heart.

------------------------------------------------------------

It has just dawned on me that I had one more request as part of this bug re=
port
and that was getting my APU to the optimized power saving mode enabled by=20

ryzenadj --power-saving

which is also impossible with Secure Boot mode on Linux.

I raised the issue of reprogramming CPU registers for Intel systems 7 years=
 ago
on LKML because I was in the exact same situation and that is I needed dire=
ct
access to be able to contain my system temperatures, now 7 years later AMD
gives me the same grim and depressing response: "You want to use Linux with
secure boot? Enjoy much higher system temps, noisier fans and reduced fan
life".

Why does "open" Linux allow so much less freedom to tune my system than the
ostensibly closed OS? Under Windows with Secure Boot I have the full freedo=
m to
use RyzenAdj, ThrottleStop, ZenTimings, RyzenTuner, AMD's own Ryzen Master
(which does exactly that BTW) and a ton of other low level utilities to tune
and monitor my system.

Please do not take this personally but sometimes I just get extremely
frustrated with using Linux (been using it for over 25 years now). I'm not
demanding to implement hypothetical Vulkan 2.0 spec, I'm not asking somethi=
ng
outlandish. I'm asking to expose a feature you've got full control over and
which probably takes 100 lines of code to implement. Is it also about "trade
secrets"? You can perfectly hide it behind scary looking module options, ca=
n't
you?

E.g. i_am_ok_with_destroying_my_system_and_setting_my_house_on_fire=3D1

Laptops users have no say in what their OEMs/vendors push on them. I cannot=
 go
and ask HP to add these options to BIOS, it's just not possible. I will be
ignored completely.

Oddly enough smaller vendors have been adding memory tuning options to
barebones based on Ryzen APUs, e.g. Minisforum UM790 Pro 7940HS Mini PC. I
guess this is not going to happen ever with the likes of Dell, HP, ASUS,
Lenovo, Samsung, etc. Maybe with MSI.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
