Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8B6C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Mar 2022 19:10:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238380AbiCWTLv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Mar 2022 15:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232772AbiCWTLu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Mar 2022 15:11:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11DAF3AA52
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 12:10:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A41746156E
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 19:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07FC3C340EE
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 19:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648062620;
        bh=XU74ughpIppzb/PVDsEi+OUc1tq9tN/GBI6iUzE9pt8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=k3k4PmQVWZw5U+WkupZKjpC/8aQ98H0RCuq+5WMHArLKBLD48+SM/P8MWsT/omZOu
         RGmFYKrCa1aTJMIa3cDBdyIoCv9sM4g40OjlZ1vKOixvYvDRKcZ3FUdUG4G1qA9PUt
         tVGBLO1yrkW/c9RPazZBGBOJ5lqDmvIjL531FZQbGxSPoR9hJbOLKvO4PAt05Pi8ra
         vg8m7nhISRo6wBPdGbC1zm6+5fq/mVNICRo1NHzpv2saqNIVY6u5sIqnkVwcwGPp8u
         Ou7YbsItiwWLeqGtUDrvnmPTGShJ2ZUZQdt4MkdBeh42EddfxFFdSop2JV+gqwJz3L
         droOInUowrAtA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DD1F9C05F98; Wed, 23 Mar 2022 19:10:19 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215730] acpi_bus_register_driver() does not work on Alder Lake
Date:   Wed, 23 Mar 2022 19:10:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mjg59-kernel@srcf.ucam.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215730-215701-cl8Byn4vRw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215730-215701@https.bugzilla.kernel.org/>
References: <bug-215730-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215730

--- Comment #9 from Matthew Garrett (mjg59-kernel@srcf.ucam.org) ---
Your laptop does not implement the ACPI interfaces that this driver needs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
