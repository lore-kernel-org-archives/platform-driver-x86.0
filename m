Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A30C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Oct 2021 10:44:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7D6C61108
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Oct 2021 10:44:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236018AbhJLKqw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Oct 2021 06:46:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:51370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236002AbhJLKqw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Oct 2021 06:46:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D94AF6112D
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Oct 2021 10:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634035490;
        bh=GMePyel8KfaYqqmvyBelXm9YHWBoGTojQBa4lF2Wp3c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JwTzZkHL94Grizi6OVb27VLo4Ol2gBMKRbzb6hPHnJ+xlNvUTx52ZfMvrIPLvkL/g
         SgQT53eB+rtfVXYmwUtN7tzrFFkEDtCKgwIvx/64IxjEWpodRU6rCGLmAzsJ8hoJLK
         e0CSCjlk9NrxMRCa1nhPKaXVwON5807aprLHjCifGEg020WP+3kOvCWUN+QtuRK04u
         ShhFFtxlaeH1P/SvWB748iv1GIwhfyR7D1P8tupfq67GBZb7i2gymSnU4hHpsPdmMd
         dCmqtBIU8PXn2aZGI/g4A9MUgYv2Q2iJVkbRHgqAksjx2DuonIqNUcNAcgPg9F5p+1
         hP1E1DrHtiq1w==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Tue, 12 Oct 2021 10:44:49 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-199715-215701-C7GWTGOA16@https.bugzilla.kernel.org/>
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

Marco (rodomar705@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rodomar705@protonmail.com

--- Comment #60 from Marco (rodomar705@protonmail.com) ---
(In reply to kernelbugzilla from comment #59)
> FYI, I unsuccessfully tested both the upstream driver and Richard's versi=
on
> on a Renoir device (Ryzen 3 4300U on a Asus Vivobook Flip 14 TM420IA). An
> accelerometer device is detected, but it returns no data.
>=20
> Apparently, both drivers are missing a report descriptor for the newer
> Renoir hardware.
>=20
> Reference: https://github.com/conqp/amd-sfh-hid-dkms/issues/1 (thanks
> Richard for the prompt reply there)

On the exact same device, but with a 4500U as of 5.14.11, I do get
accelerometer data.=20

The issues with sensors however is that I do not have an event for the lid =
flip
on this device in order to disable automatically keyboard and trackpad in
tablet mode and no way to use an apparently present ALS for automatic
brightness (I'm not sure even if this device has one, but I've seen quite a=
 lot
of reference to a Capella Micro cm32181 in the DSDT under i2c, and the kern=
el
even load the mentioned driver. No iio data anywhere, though).=20

If the position of the hinges are derived from two accelerometers (one in t=
he
base, the other in the display) I would like to write an implementation aro=
und
that, but the sensor reports only the one in the display panel and nothing
else, so that's really not useful anyway.

However at least I can use display rotation with that.

I really hope that AMD will provide documentation around that or at least w=
ill
properly support his sensor hub to Ryzen 4/5 devices themselves.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
