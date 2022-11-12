Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BA8C433FE
	for <platform-driver-x86@archiver.kernel.org>; Sat, 12 Nov 2022 20:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbiKLUrv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 12 Nov 2022 15:47:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbiKLUru (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 12 Nov 2022 15:47:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DFF1054C
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Nov 2022 12:47:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CCDE6B80B28
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Nov 2022 20:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 671D8C43164
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Nov 2022 20:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668286066;
        bh=FozVkLCQus5WYbCtDsyXpObveB3LHmg5ALu2jbqIciM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Sb0KF/8RU8Ny3rRyQMXvCnp3L9fvMnC9nxT87bcz+nImezOKqYh1IR7pM5geDwGdQ
         HsokhOWojPxz/wXyWpp2u0OYg8tcLRaCHrwn2JeJ8bozp5dzzQqJ12al+TEmZdCXDM
         KUqVuHFDV6br6YeL+PcNxG5ayvlLv3x9A82y2NCGvZeJc/xaERXTz83PY8VWaddZCT
         Iu7t2lPR/quhvWpdVjmoMJ6Ml3YZNzZovxFZxHd7k55kyVtleqvY+JvKbJ9Ds/hGaj
         Ze0G5rX3CDq3zOjxtrETkscTQqAslpWKPvwSSwdJUTsDrxO2HFU2fbPGX8jzbfY+KS
         msJiOFH+4+F/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 59D11C433E6; Sat, 12 Nov 2022 20:47:46 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 12 Nov 2022 20:47:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-NGOYIGhn3s@https.bugzilla.kernel.org/>
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

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #303126|0                           |1
        is obsolete|                            |

--- Comment #269 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 303161
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303161&action=3Dedit
Asus WMI for nct6775 v6.0 base (2022.11.12)

(In reply to yutesdb from comment #268)
> can add support TUF GAMING B550M-PLUS WIFI II?
>=20
> I tried add parameter acpi_enforce_resources=3Dlax, it works.

Could you please now?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
