Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79292C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Jun 2022 19:48:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240752AbiF0TsE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Jun 2022 15:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240811AbiF0TsC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jun 2022 15:48:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA3B1B7A6
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 12:48:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 69A7C61562
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 19:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D27E7C34115
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 19:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656359279;
        bh=9ITFzbvolHjVFtb/TEnJQqj27EbSkUpXXkDW9dEj07I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IpoS3r4x6LgmIutjmN9hp9TyGg6RuSbMQhxh5ufK/crSBttIzU7v9CFw3mbc/gQ1k
         AEdZBul1a1Re7tPnMzmqfuOEqGg9HI9gbNdmDinq/5GHnqRT9u0U/t2NFh8iS/Nl//
         06v1PVCC+fnOFgfKGwPROKuO4wDqKzr35paZTR/fKw4emrjNbAdXe2/0KEfF66p8pD
         +U238V8VfqhMaoBSLGqioQh+Bcu2X/F7EyB7CbrjGrQS9L9B7Kst3JwBhn3Z1u6Ft6
         mtxnwottkoVPdCuYhB9Ihefo01GgP9THTwsr6DpEzNGT7KYLUbuBCpS/H/A9cfelZK
         K7Jz3dH0wjCXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A9809C05FD6; Mon, 27 Jun 2022 19:47:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216176] ideapad-laptop doesn't expose rapid charge
Date:   Mon, 27 Jun 2022 19:47:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tinozzo123@tutanota.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216176-215701-vrvFSou6Ab@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216176-215701@https.bugzilla.kernel.org/>
References: <bug-216176-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216176

--- Comment #4 from tinozzo123@tutanota.com ---
My take on where it should be exposed.

Something related to the battery, which are charge thresholds, are supporte=
d in
multiple laptop brands (Lenovo ThinkPad, ASUS, System76...) and are thus are
exposed in the battery power supply device
(/sys/class/power_supply/BAT0/charge_control_{start,end}_threshold)

conservation_mode is basically an equivalent with a fixed value (60%) that =
is
exclusive to IdeaPads, and it's exposed in the platform device
(/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode).

I guess that my the verdict is that, because rapid charging is supported on
multiple laptop series (both ThinkPads and IdeaPads, which use different
drivers, and maybe there are more brands, though I couldn't find anything on
Google), so it should be exposed in the battery power supply device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
