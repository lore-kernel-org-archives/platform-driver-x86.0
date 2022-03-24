Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A2BC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Mar 2022 03:58:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231992AbiCXD7w (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Mar 2022 23:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239978AbiCXD7t (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Mar 2022 23:59:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76CED7CB0E
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 20:58:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CB2A5B82227
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Mar 2022 03:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 525A0C340EE
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Mar 2022 03:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648094294;
        bh=h6VJQWIj+Q3XVqqj1WtKcnD3aoOKZAx4o9DXipwHC4k=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lNvzJ67TJNmMSOHUjadakN4QB1exHRUcFcRfdnE9Amjy1FNuMkmX+1oMgnnw/mQOy
         fCgPeMBuVpg2vgTjtH5fd2K23LROV0jD0tHFgCuvxFeIQu3ViRmVmxmXKaktBAx5MK
         w2HoPSNEQkGQHJsbMrUSiS1L4Y6ChyzgeHaeyVHqKH+2H8TS09hi5FZuMOPAlLo4aQ
         /nDeXTHOGVpnJVthfto+43o5gitbeecrHAvEbJxuc5ut7COte2R+xkftM4ptc/CtId
         TsbGz3GIgYNiQBt1hvz+KzrhOUf6vkm7/e3k4Ehwxfse4P5DrIjzDft/fKlkQZ728O
         3TzHo2wupfoQg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 42DB4C05FD5; Thu, 24 Mar 2022 03:58:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215724] acpi_bus_register_driver does not work on Alder Lake
Date:   Thu, 24 Mar 2022 03:58:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: xuemin.wu@dbh.dynabook.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: acpi_power-other@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution
Message-ID: <bug-215724-215701-becY7rgYoT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215724-215701@https.bugzilla.kernel.org/>
References: <bug-215724-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215724

xuemin (xuemin.wu@dbh.dynabook.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|CODE_FIX                    |DUPLICATE

--- Comment #1 from xuemin (xuemin.wu@dbh.dynabook.com) ---


*** This bug has been marked as a duplicate of bug 215730 ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
