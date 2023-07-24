Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B441C001DF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Jul 2023 18:54:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjGXSyi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Jul 2023 14:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjGXSyg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Jul 2023 14:54:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EBF510E2
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2023 11:54:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 90A4661373
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2023 18:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE43BC433C9
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jul 2023 18:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690224874;
        bh=20j2SXzegaNRhu+kzKzZGQRxhYE1xCt0/69KIG2Kkd4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FlACNYEdChdDAKlptfdmVwir9+2L3mqJHjDpbNV8N0gU9eq/1vjlBK57YkFs81t6i
         0olF/LT58EGDqjr4s01ksc5bVIN7EBvemIUMC9ylrgvicYGRocdQ6blLriG4grOiVj
         YV4V1LRzhqQhcksg3XPYQHfBhIg80GfA9CNuNeJKqSblNlW4SYQJSWl4+8kH3pcjIF
         jPmKcENefvVon0uccO3pXn6/J/X8IkpB5c8ndq8PXBmyNCUJtjA3SXj2ozBADC6icL
         4qz9cSOFoeUzysx3voqBm0Xhqq/NU5P/Qk5ar7KsIeK4NKjHSmKrVpeoWiPw7S45go
         SDoTMv7HfVEcw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AD475C4332E; Mon, 24 Jul 2023 18:54:34 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Mon, 24 Jul 2023 18:54:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217696-215701-gpH7WLfNMj@https.bugzilla.kernel.org/>
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

--- Comment #12 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> I've no problems with frequency scaling. Also it looks like the OP uses
> amd-pstate and I use acpi-cpufreq since amd-pstate is not enabled by defa=
ult.
> Under the specific AMD driver idle power consumption without RyzenAdj rem=
ains
> very equally high.

amd-pstate vs acpi-cpufreq is actually irrelevant for the issue at hand.  F=
rom
your debug log I believe the issue is that for your machine a component out=
side
of the Linux kernel is supposed to influence power targets.  It's either th=
e EC
or something that runs in the APU's TEE environment.

More on this later in my response.

> Is the second patch queued for 6.5? I wouldn't want to compile the kernel
> just yet but I can check Fedora's 6.5-rc3.

No it's not in 6.5 right now.  Hans is OOO, but I expect will be queued for=
 a
future 6.5-rc when he returns.

> Could you explain the nature of the second patch? From its description I
> understood nothing at all.

In Linux the static power slider (SPS) is exported from amd-pmf as an ACPI
platform profile.  Power-profiles daemon uses this to let you pick "Power
saver", "balanced" or "performance" modes.

Until that patch SPS is only exported if targets are adjustable directly via
PMF driver.  But your system advertises that power slider changes should no=
tify
the SBIOS because your system doesn't adjust targets via the PMF driver.

> Does it fix (improve) very high idle power consumption? Why is it needed?=
 I
> don't think it'll help me break through the frequency wall my laptop's
> firmware is imposing on me.

I don't have visibility into your EC code, but if it's by EC the patch will=
 fix
it when you pick "power saver" or "performance" in power profiles daemon.

If the EC doesn't do it, it will probably require some code that we'll be
releasing later for some other PMF features.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
