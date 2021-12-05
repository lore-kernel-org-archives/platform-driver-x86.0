Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9D8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Dec 2021 11:23:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233142AbhLEL0y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Dec 2021 06:26:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233086AbhLEL0x (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Dec 2021 06:26:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3AEC061714
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 03:23:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5EDA660FD0
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 11:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2E26C341C8
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 11:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638703404;
        bh=1dsmkMfDqAZD+TmX2C/Gd81oM7teXw5oftacHyOrH20=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=emS+zoHAZ4j/8Qdx76iloD96hXpRgezZEk+SCV2GDkptEoTjKEBEXsd9X4ZqAHp8I
         bCN+4Qyt/zyutotjNx7SdlCdyM4NYk/BKJkHBLNU9P/t7iP9ywRYcLS0hHw6bZRHQe
         T+etgsCE7PoiocS2NHCx2WkRi3S1Xj7Pd67bQ7dtP2RHKqVMYpyBJ8h6PHW5/BCVbl
         o2G797Hd/TsGqv13FGSnPCqNUfltqXBco0A7K0F8Bc1sRQZquWTVLlPlXj5fZaYYOP
         CfPAYn4jHeBDtvgA3/K9AwfmE1KSomp24B0T1/tlgHPxP+OM6/m67ycF2EGDJRFFIH
         BUIwPZcgmYExg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id A990E60FD8; Sun,  5 Dec 2021 11:23:24 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 05 Dec 2021 11:23:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204807-215701-Ysuo8KLoZY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #179 from Mikhail (mikhail.v.gavrilov@gmail.com) ---
Created attachment 299883
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299883&action=3Dedit
dsdt.dat (ROG STRIX X570-I GAMING)

> acpidump should create binary dump of DSDT section(dsdt.dat) of your boar=
d,
> could you attach it here?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
