Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEC6C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 May 2022 13:07:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233558AbiESNHR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 May 2022 09:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbiESNHQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 May 2022 09:07:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CBCD6CA89
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 May 2022 06:07:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E21C761723
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 May 2022 13:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5299FC385AA
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 May 2022 13:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652965634;
        bh=UdTdDBSb9hhpLNBK3B/J4A1rQ7r033NmYM3G49GpPoo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RF49Um/UhQeVSP6kriJ+5VDD0+h41nQFOp04rntdVmsj/1KAVa3sr1C/L7+gERhhB
         +/hV4jm7KOr9jqtWadR0nch5ZuQ4V+DDNkPpf1iF2aZSyP1ifhiqbi0Z9go80sO+Cr
         M7P8rJRHMv04nxLw7YAil6G98lBFw2jnEUPBi0pylwlnOjjq8lSt2pHHyN1vnoFZRr
         OVMH91pUrDaH6NdNgRb0PqRlw2zKkFab3gOIQ3SybTGvXOK+L8yU/c+TuJfer0Ze4p
         PHrqGbOeZSTIWSJny9LpvUMDn9G3C5dd8Euh9bIjcrMrc/xY4QtqOL07a1i8F5pDX1
         1mc+5uYxvscuQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 41591CC13B4; Thu, 19 May 2022 13:07:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 19 May 2022 13:07:12 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-WV2DcwkcxR@https.bugzilla.kernel.org/>
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

--- Comment #241 from Mikhail (mikhail.v.gavrilov@gmail.com) ---
Denis, please answer the question.
The driver `nct6775` I should manually loaded after each boot? Or it should=
 be
loaded automatically?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
