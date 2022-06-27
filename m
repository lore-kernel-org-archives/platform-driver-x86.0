Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608D9C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Jun 2022 07:34:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbiF0Heb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Jun 2022 03:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231752AbiF0Heb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jun 2022 03:34:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DAE45FE1
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 00:34:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2A39B61369
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 07:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FB1EC341C8
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 07:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656315269;
        bh=IPGfv6BdDLkpqM/BssXDY0QJY/b25koVeEpH1/HlYg8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mDFCjvAoUmNY+soYp7UpmgTJN+NtJhbRU45UiyQCuUrxsRel0w7i7DMz3dGY5QYPQ
         O39l09MJ4i9Gujq+hKDdDehVGRUV4yqz370NAJKwFnubUvhVWsd7VJ5ai2RhQk3Qra
         s2SWZz+xpM4YAYqe69io0L+1FwIoiIe7xY/dUQ6XrSXpw1cOTf17Mf59lSavPa80Vt
         pv17WLSXnjrDaSKXoHrbLWStbzrsRVM18+/CZuXRSxxNOAZNFjTiZjzL/BJ51w0y4I
         sFbNPKuzgTsveZo/8nRFcDbkHpC+4tjN+gKWzgL6R93nGMlAfDbIefxPYVJcsPdMF2
         0YKpcYVTYXX5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 70DBCC05FD5; Mon, 27 Jun 2022 07:34:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215651] Battery charge limit is reset on every boot on ASUS
 laptops
Date:   Mon, 27 Jun 2022 07:34:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: matejm98mthw@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215651-215701-EBT6qlb6yl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215651-215701@https.bugzilla.kernel.org/>
References: <bug-215651-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215651

--- Comment #3 from Mthw (matejm98mthw@gmail.com) ---
(In reply to Mateusz from comment #2)
> This is not a bug, this is how the hardware works, you need some kind a
> program with does reapply that value at boot. They is no way for the kern=
el
> to make it persistent just because the hardware doesn't support persisted
> charger limit.
> Most users on ASUS laptops use asusctl for that:
> https://gitlab.com/asus-linux/asusctl it works on TUF laptops too and
> charger limit control should work on ZenBooks too, you only need to manua=
lly
> add asusd-alt service and enable it

So, if KDE Plasma has a feature that allows you to set a battery charge lim=
it,
it's up to them to re-set it on every boot, right?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
