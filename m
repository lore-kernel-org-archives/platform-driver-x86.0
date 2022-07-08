Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57494C43334
	for <platform-driver-x86@archiver.kernel.org>; Fri,  8 Jul 2022 21:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbiGHV6h (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 8 Jul 2022 17:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbiGHV6e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Jul 2022 17:58:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E14A11C30
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 14:58:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 97F5061851
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 21:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04234C341C0
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 21:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657317513;
        bh=PjIBDvPeyDNG0KsT8bBccMWiwQ+Kmk9/xlUxfUY1PHQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=EoblCL5/o5QU36UhCnrgzyq1jAC7f5UbmEuyMW/zZeayUv8weh5K6wAHWEr0uoKR8
         OQHAN+XRjkm2PJXjDEDkXwxyS6f42TDvO7h1PcPvHdMSya10Uu1KussKUjOzwQLAzu
         WPTLgn3BxMKOAXLg1trxHPkMT9udlDUcuyyYtASqaJJ+NUXAqH9x0sVgpukIl1DbFe
         04llhLgg2x7zq0zQSyG9faZK7Eg7MQ3kEhYNz0LDGGXU0v3Ptzq4Trrgg6MqAlMPLR
         S8kjfP2gqPQxIhfJ8Hy75Rp/pclRqzPYobxQoO/iu87FTyM4blNqPFOSO0UCWYFrId
         /e0Ka7blB3qTg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D90D2C05FD6; Fri,  8 Jul 2022 21:58:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Fri, 08 Jul 2022 21:58:32 +0000
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
Message-ID: <bug-215993-215701-gwHfIbkpSP@https.bugzilla.kernel.org/>
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

--- Comment #12 from Supasak Sutha (blur.3rd@gmail.com) ---
Couldn't get this line to work.=20

dev_info(dev, "%s <--> %s\n", acpi_dev_name(ACPI_COMPANION(dev->parent)),
acpi_dev_name(data));

I don't see any output of this line, tried with dev_err and dev_warn also
nothing.=20
May be it's not reach that function. or I miss something?=20

P.S. Thanks for v5.19-rc5 link, I will have a look.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
