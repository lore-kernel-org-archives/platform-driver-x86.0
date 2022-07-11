Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4356DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 19:55:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbiGKTzW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 15:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbiGKTzW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 15:55:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57044220CF
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 12:55:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2360DB811F0
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 19:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC778C341C8
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 19:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657569318;
        bh=OXAN2H3MCDONY6Ifk/oGZXDUnx7eqckjA8DeT/PpoVg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GF/Sz/rW/huWcLBdIRdBqR9anTTNuE7HnNffS8HjwtpjhZg9d+1uq3yF8VDs0q0Dt
         eJgWuM3IUQN7gL8oF8A0dsvLcrx0sB1JcE+GJqH68n7TlGExC1KNVnlvrJj9ENL55H
         EYeRQTIGD9iHCt8csw24/vre1ScncIG9U8NcYvboaRZh9nY2E2wpnaeQQqX/ZIE9U/
         0d7e5nII9E/mZg5rcJBbeL7S31YjWNlsMs0C0kqrPWA99tTE+I5MBc1uYG17FG1EyC
         zT3gdubRc9vkoGS3kdFjRDTaJDT0uJi+7h5tkKiyxVaiLzv4GhK3S5wIA7PHvizZYx
         ZFUSVnS4jGgsQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C016CCC13B0; Mon, 11 Jul 2022 19:55:18 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Mon, 11 Jul 2022 19:55:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Sound(ALSA)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: perex@perex.cz
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to
Message-ID: <bug-215993-215701-CctiCF5W5P@https.bugzilla.kernel.org/>
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

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Platform_x86                |Sound(ALSA)
           Assignee|drivers_platform_x86@kernel |perex@perex.cz
                   |-bugs.osdl.org              |

--- Comment #23 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
I see. So it seems the best approach is to wait what Cirrus will do.
I reassign this to the ALSA, because SPI issue has been fixed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
