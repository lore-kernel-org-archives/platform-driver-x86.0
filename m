Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4843DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 14:10:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbiGKOKe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 10:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbiGKOKd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 10:10:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D162C61DB9
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 07:10:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6FF2A614F8
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 14:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCF9EC34115
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 14:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657548631;
        bh=mNr8ZXtps1mDdWNnWa23IWMoUMMyqAORQqL5IlPrzpQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GHoV8o3ibJIj1LGe6+92V+u+3lKOO95bG30u8GZdvI0o3qnt9cRY4UxcGBqEJZ4zQ
         +YQaOqK267jEoHqpL9iM0ndLjwue77icJ4FbO/ZtuTyqArbTMxECHKUTJZuiyWFTHn
         Ju0jZcqJ1tcPOSi0zoI7wf6coKkYrFe+TDNDW2wdU3NN1g5oRUUtuGB3EOu/YdpPIR
         5VxsWdeYeAE6C6ZEg3OGhzXcpHHLmOE3jrcY0jLgnH0EtzAVKi5IF6sygONwhWldw+
         g3GdIs+mrB6QY1Mkc2uPp07/g+k0/ia5XeGFol0qdaqWJCY/s+aAk5O/l6X/c289xR
         Gv6BT+ckwB0sQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B33ACC05FD6; Mon, 11 Jul 2022 14:10:31 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Mon, 11 Jul 2022 14:10:31 +0000
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
Message-ID: <bug-215993-215701-fQDWM1X3Of@https.bugzilla.kernel.org/>
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

--- Comment #19 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Andy Shevchenko from comment #17)
> (In reply to Supasak Sutha from comment #15)

> Okay, can you comment out these two lines:
> https://elixir.bootlin.com/linux/v5.19-rc4/source/sound/pci/hda/cs35l41_h=
da.
> c#L423
>=20
> (Note it should an incremental change to all others, as you have done that
> way already)

One more thing, you may need to replace

  cs35l41->index =3D id =3D=3D 0x40 ? 0 : 1;

by

  cs35l41->index =3D id;

https://elixir.bootlin.com/linux/v5.19-rc4/source/sound/pci/hda/cs35l41_hda=
.c#L462

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
