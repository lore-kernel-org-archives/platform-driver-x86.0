Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950E8C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Dec 2022 15:51:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbiLUPvK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Dec 2022 10:51:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiLUPvJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Dec 2022 10:51:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC31192AC
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 07:51:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 574D1617D0
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 15:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B12C8C433F0
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 15:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671637866;
        bh=fJ21D/fzCHm2cy0/4zl7eiTMMcRohOIjbP7Xmm+RrMA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Eq9o94RP10Yq2Jg8J7/5zlytkNK1YgyiPQtvW8afcl7M2pG3vRJEQK1IdSO7R4oQ2
         gunw2Ks4Nq7Szx4a2VqY4nRgNpKof2EaXxjnCPR8+X27BWO6GQOjhMwrByASe9/wOJ
         eAMSgT9Jj+iSThWYrwL2it2VcDUy8WuK9PI8vDhWVMB0SR2qbaK94+lBBXAjyu98XB
         gA9ogV3kSiEg6Y7GBXF7T8iIgrZ5Izy8tb+7UWTrt8m5A02eVxF2JfDGw4/7eQ0W+I
         97uThBAFJ8YltLt1vUd0EPGq5HuOU6DPFbDbbYFKvHvez2ZzLnvMs6QW4k7sfpUiht
         N7ZGmAvNUBT2A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 93172C43142; Wed, 21 Dec 2022 15:51:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Wed, 21 Dec 2022 15:51:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andretiagob@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216824-215701-rtdb4LHV9a@https.bugzilla.kernel.org/>
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

--- Comment #14 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
(In reply to Hans de Goede from comment #13)
> Good to hear that the hotkeys work now.
>=20
> As for the mic/speaker mute LEDs, those are tricky. They can be either
> attached to the embedded-controller and then we would need support to
> register them under /sys/class/leds with their default triggers setup
> correctly, after which the kernel's HDA code shoould control them for us.
>=20
> Or they may be directly connected to some GPIOs on the HDA part of the ma=
in
> SoC or on the codec.
>=20
> And the Fn-lock LED typically just works automatically (controller by the
> EC) if you toggle the Fn-lock by pressing Fn + escape?  Although sometimes
> it too needs to be controller in software.
>=20
> Figuring out the LEDs really requires someone with significant hw-enablem=
ent
> experience to actually have the laptop in their hands and then they will
> hopefully be able to figure things out.
>=20
> I have submitted the fixes for the hotkeys upstream here:
> https://github.com/systemd/systemd/pull/25824

Yeah if i FN + Escape tu led turns on :)

Well, what mattered was the hotkeys themselves and they are working now!

Thank you Hans!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
