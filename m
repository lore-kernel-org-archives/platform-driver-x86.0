Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8ED2C0015E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jul 2023 09:37:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbjGZJhb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jul 2023 05:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231837AbjGZJhN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jul 2023 05:37:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09534209
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 02:36:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3E02861A1E
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 09:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4EBEC433C7
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 09:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690364172;
        bh=3x3KH1/SHr8i3nXljOhRpynx+KQl8OXF1pRIX2eGzgE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SZAcnM4PdyAa8rALzjko0WLC1gCbqrgd55pkYhJSbZNYghYzFZ2yn1Jpcj+IfH+QU
         HdjgDrFjpreEZBdi0ttmwJVV5nmIsRdGu16aEeIxISs3NInogkLJ1+MiLcOZ5vQ1Uh
         Q79XSvS4Z3SIAL7I1VhqvEiHYsehTBOb5UMraEGmXVNe+TaOr7Q+Fn5ssBMOfAoqg/
         yPXHMHh5GYhrgPSpmWE7Ci+85qNMovkmypfS0TWy/Witj05GttvyZ+qs+g7ySyGF2i
         PkPpgrgLgbBcjoJ5vLhazgTXBiwz6Rrv/503moNcXiGwX+e38IiVIonYDMYubRGlAP
         wlAKdCHCTpnDA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 83FCFC4332E; Wed, 26 Jul 2023 09:36:12 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Wed, 26 Jul 2023 09:36:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217696-215701-LBuHe2sICr@https.bugzilla.kernel.org/>
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

--- Comment #15 from Artem S. Tashkinov (aros@gmx.com) ---
OK, I'm now running the system with the patched amd-pmf driver.

I've no idea what the power profile daemon is.

Is there a /sys interface to alter power profiles?

There are over 1000 files in /sys named '*power*', I'm lost and not a lot
called "profile".

There's

/sys/firmware/acpi/platform_profile which now contains "balanced".

/sys/firmware/acpi/platform_profile_choices contains:

low_power balanced performance

OK, let's try "performance". Still stuck at 4.5GHz.

There's also /sys/firmware/acpi/pm_profile which has "2" in it. No idea what
that is.

P.S.

What's worst of all I cannot make my touchpad work.

With Fedora's kernel I get this:

input: ELAN07A8:00 04F3:31EC Mouse as
/devices/platform/AMDI0010:00/i2c-0/i2c-ELAN07A8:00/0018:04F3:31EC.0001/inp=
ut/input5
input: ELAN07A8:00 04F3:31EC Touchpad as
/devices/platform/AMDI0010:00/i2c-0/i2c-ELAN07A8:00/0018:04F3:31EC.0001/inp=
ut/input7
hid-generic 0018:04F3:31EC.0001: input,hidraw0: I2C HID v1.00 Mouse
[ELAN07A8:00 04F3:31EC] on i2c-ELAN07A8:00
input: ELAN07A8:00 04F3:31EC Mouse as
/devices/platform/AMDI0010:00/i2c-0/i2c-ELAN07A8:00/0018:04F3:31EC.0001/inp=
ut/input9
input: ELAN07A8:00 04F3:31EC Touchpad as
/devices/platform/AMDI0010:00/i2c-0/i2c-ELAN07A8:00/0018:04F3:31EC.0001/inp=
ut/input11
hid-multitouch 0018:04F3:31EC.0001: input,hidraw0: I2C HID v1.00 Mouse
[ELAN07A8:00 04F3:31EC] on i2c-ELAN07A8:00

With my custom compiled kernel I get none of these messages. I'm missing so=
me
kernel options obviously but I've no idea which.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
