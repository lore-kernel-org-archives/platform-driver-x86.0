Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E2AC6FD1C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 21:17:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjCTVRs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 17:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjCTVRr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 17:17:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A193C36
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 14:17:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0E587B810FB
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 21:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AACD2C433AF
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 21:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679347063;
        bh=7iIU2uD6komBT3McnsLfobeSa91pyIqsIVbQLYKmOaA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aH+NDf+2KYqW8a+NCOQHVR/+gNEtOI1gkgh9Pt0fe78CQ+KK9CmftiBnX5mKZh+SS
         rrTJJ7E8E0/lAEmB3D5Dh2B+gqMJpMyz1hm/4zb0ufxKAzeyW52kkz6jTVCpkkff1s
         WceD1tqpZcDTthEDPhFqOGcUXVD8EpBHJZCp64ptInkttr97dLEPyhtik5a1uF6hpv
         chlNk2FgHXbMm701gv07Gs682eLDiCQm2lsyZrAzSkUeXYs5EHrFiUxDDcXIB/tMr4
         C6vxFQDcbboMEAn3WcdraYe5tE8na9XY3wEtY3tVCi3k6ayZj3FxsWO8dAXATgXLdP
         eM0D9AD/I7TcA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9D582C43143; Mon, 20 Mar 2023 21:17:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 20 Mar 2023 21:17:41 +0000
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
Message-ID: <bug-204807-215701-tkSOJFA3Lu@https.bugzilla.kernel.org/>
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
 Attachment #303973|0                           |1
        is obsolete|                            |

--- Comment #313 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 303985
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303985&action=3Dedit
Asus WMI for nct6775 v6.2.7 base (2023.03.20)

Added additional boards based on data from
https://github.com/linuxhw/ACPI/tree/master/Desktop/ASUSTek%20Computer

(In reply to renedis from comment #312)
> Please also add:
>=20
> cat /sys/class/dmi/id/board_name
> Pro H610T D4
>=20
>=20
> It's the same board (and uses the same chip) as the H410T but with a newer
> 1700 socket.
>=20
> Thanks again!
Thank you!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
