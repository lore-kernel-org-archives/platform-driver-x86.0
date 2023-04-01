Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823CDC76196
	for <platform-driver-x86@archiver.kernel.org>; Sat,  1 Apr 2023 12:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjDAMT6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 1 Apr 2023 08:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjDAMT5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 1 Apr 2023 08:19:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A412191F1
        for <platform-driver-x86@vger.kernel.org>; Sat,  1 Apr 2023 05:19:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C2CCF60E96
        for <platform-driver-x86@vger.kernel.org>; Sat,  1 Apr 2023 12:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29ACFC4339E
        for <platform-driver-x86@vger.kernel.org>; Sat,  1 Apr 2023 12:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680351595;
        bh=zGo1rVAH9t55p2E3r6RhbExf8Oj0hNxZCagNhaQ5p74=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=g3BssoQ+z2I5MRVPRBfhygJQwOhD2TldeAvvP1DBmrkps15sK4NtXIYzrlK2zeBY9
         mDg9X6ZPaHwDkcjDeeZdaBAwEc1Kt8WS+hStZ7V81bQlqn1lXxaUTUph6R9ZsYaH5j
         IihnbEy1apdKcAh5tPo38d79ndcGOWQMYFK4cjKhbh5kmIpN1lu44FuV/EUjJDIZKh
         5d0KV+XZl2/n1hjg/2lYCE6iF9wFIgA2Pc8JPxCYV0i39yF9FmzdTfCODSvg+LwsGB
         bv9u7TeUL+fvrrjv67PAuLmG1mkGV/ZCxCXozzseT0auB2FDZUn/9ukgOn9Pd+Ynzk
         8EZgg3z933ZEg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1C154C43144; Sat,  1 Apr 2023 12:19:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 01 Apr 2023 12:19:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mblancha@free.fr
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-xJhCM87AdP@https.bugzilla.kernel.org/>
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

Micka=C3=ABl Blanchard (mblancha@free.fr) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mblancha@free.fr

--- Comment #320 from Micka=C3=ABl Blanchard (mblancha@free.fr) ---
Hi,

I wonder why the board B550M-K has disappeared from the final patch integra=
ted
in the kernel sources. It's somewhat the same board as B550M-A, which is
included.
Moreover, it's in the list in comment #278:
https://bugzilla.kernel.org/show_bug.cgi?id=3D204807#c278

An unfortunate omission? :)

Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
