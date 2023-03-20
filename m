Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEEDC7618D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 09:49:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbjCTJtr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 05:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbjCTJtp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 05:49:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF5CC2D40
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 02:49:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4CC0E612D0
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 09:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC8DEC433A4
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 09:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679305782;
        bh=+XGtkrta3nHK6JV7heSMfr091wLVpIPSpKOhhFkxWcw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gGFvQvob27FrOumypOPKopAUjYYV2ZrG+czym3mDWQCrwrUEvvBTIT6kkn0JPXV5E
         VYwnOF/kmWtCMBNcQTiiri1BVJjrWd822//47Py6OBj6oD4x0H+F9nWrsTPZY3PNCK
         cNVeO348SA0Il6VTNDH1/PMP5Ph2sz1/59XBta2LB+brlFLlMKrxQginsh0ZopHDLG
         09l0WhS+UcS3KdEOZKgvkGZZuAsLX8IWAwtzCWI0lrPaRgL6CsY79TBWW4MOSx8Iuk
         4lSwiG/B7umFBzZrZDVimOzqgW1iUE6cSyKMrElGYqbbvaCgXmRWCsquWJFUzw9dtI
         LoSbpBpVrSlkA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9E6D3C43141; Mon, 20 Mar 2023 09:49:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 20 Mar 2023 09:49:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: renedis@hotmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-xAHkSqk7Bx@https.bugzilla.kernel.org/>
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

--- Comment #312 from renedis (renedis@hotmail.com) ---
Please also add:

cat /sys/class/dmi/id/board_name
Pro H610T D4


It's the same board (and uses the same chip) as the H410T but with a newer =
1700
socket.

Thanks again!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
