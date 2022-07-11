Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882E2C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 15:26:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbiGKP0D (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232316AbiGKPZ5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 11:25:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D63761B0F
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 08:25:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F06DD615BE
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 15:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F98AC34115
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 15:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657553155;
        bh=ohKf5FM7wmP6+mYKyMeBnZHesnQd+x9dDd1FMoVO/hI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Hqv8pPYOT8HgL8Zj8qIjROEqcE64HREKj3zI9CqptvtgQjFlGbcDPxl/MkHaYMTxt
         HM7PuWh9Q+m0k2ADKVtBU9bIcY2PbDGF/BkAR4+WsS4Q6fDCewwLH3365Lfa9sesdF
         8bCjIiaWUwoU4kYflbeOovEVcRHnCGb3jyIRVTJM7MsdQE3fRENgS4b9V5bbkGEK37
         IvthyBq0cTrupQkiymcTFefWbAGEG8ZNTC91GOUtrnlWwxxTpKs+fUPmMZNNa/mh40
         o5AaJNAkswNn5r8RP3f7+tpPhoUcry30PEm8Ncpc1dkO/+B/nyaIZkr/jChOsA0AvS
         XHrOys9eQhLPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3337DC05FD6; Mon, 11 Jul 2022 15:25:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Mon, 11 Jul 2022 15:25:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: blur.3rd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215993-215701-E9BNWl4tfc@https.bugzilla.kernel.org/>
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

--- Comment #20 from Supasak Sutha (blur.3rd@gmail.com) ---
Actually I have been try this patch=20

https://lore.kernel.org/all/20220703053225.2203-1-xw897002528@gmail.com/

and get pass this line=20

https://elixir.bootlin.com/linux/v5.19-rc4/source/sound/pci/hda/cs35l41_hda=
.c#L423

but still got error (below).

So, I revert that patch and try yours (remove those 2 lines and replace
cs35l41->index =3D id).

And still got same result which is:

[15.94] cs35l41-hda spi0-CSC3551:00-cs35l41-hda.1: Failed waiting for
OTP_BOOT_DONE: -110.

from=20

https://elixir.bootlin.com/linux/v5.19-rc4/source/sound/pci/hda/cs35l41_hda=
.c#L488


**
I also inspect the out put of this line.

https://elixir.bootlin.com/linux/v5.19-rc4/source/sound/pci/hda/cs35l41_hda=
.c#L320

and got -22, but seem the section "no_acpi_dsd" said it's normal.

**
And I also tried this quirk and not working.

SND_PCI_QUIRK(0x1043, 0x1e02, "Asus Zenbook UX3402ZA",
ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
