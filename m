Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1570AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 15:42:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbiGKPmF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbiGKPmA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 11:42:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9009D61B17
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 08:41:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 303FC60B9F
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 15:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89261C34115
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657554118;
        bh=suGUk4hPuSPEs0GAtFvU8tA13ix5c7rYD17tlkjPEJI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=R8Q8o3S2yCaAEr7EFkYlOVAyKGe50GWUy+1pziD62RcFbuDfi3c7u2aHU23WjIdBj
         mMUBBdjxzwSdre44QcBySuad1RUKwjFYsIxJc+kljhXx+yP+ygjEeGSF7q9lBwyZOe
         YdEc5/hlRCss+Ydbhpa+BO8Z3U/8xmiWTOPXTmeLPAhGOFnnYLkXkgYs4dPwEQoPzw
         hdXVV03cl80RCz4x6RnnO5pQdu2+lDAJZ2PHejLEnTd/nA/2xUm25zMR/1Se1Z207i
         CI2z/+qcs547xFCTWeG2hfy6YMQ2Z3xuv7HQ0F/JoD+XmuAkVU+kNjnTQ1Ajc6D9jd
         2fgZqYNMVir6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6A3A6C05FD6; Mon, 11 Jul 2022 15:41:58 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Mon, 11 Jul 2022 15:41:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215993-215701-oMLzt771cm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215993-215701@https.bugzilla.kernel.org/>
References: <bug-215993-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215993

--- Comment #21 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Supasak Sutha from comment #20)
> Actually I have been try this patch=20
>=20
> https://lore.kernel.org/all/20220703053225.2203-1-xw897002528@gmail.com/
>=20
> and get pass this line=20
>=20
> https://elixir.bootlin.com/linux/v5.19-rc4/source/sound/pci/hda/cs35l41_h=
da.
> c#L423
>=20
> but still got error (below).
>=20
> So, I revert that patch

I believe that patch is legit and it's okay to have it.

> and try yours (remove those 2 lines and replace
> cs35l41->index =3D id).

But you would still need the above change, because for SPI it's a chip sele=
ct 0
or 1, and not an address (which is 0x40 in i2c case).=20

> And still got same result which is:
>=20
> [15.94] cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: Failed waiting for
> OTP_BOOT_DONE: -110.
>=20
> from=20
>=20
> https://elixir.bootlin.com/linux/v5.19-rc4/source/sound/pci/hda/cs35l41_h=
da.
> c#L488

A-ha, this may give another clue. The GPIOs are addressed by index from _CRS
and it may be that the 0 is wrong (and actually it might be two different G=
PIOs
for reset of each of the codecs).

https://elixir.bootlin.com/linux/v5.19-rc4/source/sound/pci/hda/cs35l41_hda=
.c#L430

In this line, try to replace 0 by a) id or b) id + 1 and see if it helps
anyhow.

Ideally we need a PCB schematics of that laptop. With it at hand it will be=
 15
minutes work to understand GPIO mappings. Any possibility to get schematics?

> **
> And I also tried this quirk and not working.

That quirk is for a LED, I don't think it's anyhow critical right now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
