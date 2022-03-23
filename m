Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8A8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Mar 2022 09:31:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbiCWJcq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Mar 2022 05:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233726AbiCWJco (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Mar 2022 05:32:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E51F75223
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 02:31:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C4158B81E66
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 09:31:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E644C340F3
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 09:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648027872;
        bh=x73UXj1BU/I+TQk1LFbeRmqUil1KSLzs23B7QxucqVg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=a1veV/BOd+BYWFm+SvEV+BGddWUeELWkLGZ+MslcjK3R1t/1teTg5IlxczTgEBKgt
         DMw0uDEtHOP+VfsaWB3PBFcouQ4+rrztFbbW/NZpF6pIKNCcVRkJ2oH8ULzOrSFw5l
         qDVIMQo24pcf6aLEGo3/1it3FmUJzxxsdZuHIVpYo9+isDBbx2BNnhC1R015cKYddu
         F57tEpD5lSAiK6Sn3hA5yUwMZoCZgHof6Cl3soy6Y4xoB6EcfNBdkgZxj4i723V5Gz
         C+mg3viJIj0rwmUdyQTb6Ho0JH1fyKH/XE9PEYBvI/9ueKfDK15aT6oMMwfxFCzZ9g
         1Qp2U2HJWRjVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3BD72C05F98; Wed, 23 Mar 2022 09:31:12 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215730] acpi_bus_register_driver() does not work on Alder Lake
Date:   Wed, 23 Mar 2022 09:31:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: xuemin.wu@dbh.dynabook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215730-215701-LrpKAIDo3e@https.bugzilla.kernel.org/>
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

--- Comment #6 from xuemin (xuemin.wu@dbh.dynabook.com) ---
Hi Garrett

Thank you.


Which ACPI table related? which device id?
Would you tell some details about it?=20=20
I checked the device on Windows, seems the functions are working without
problems.
(Windows uses the same ACPI tables/interfaces from BIOS too)

I have updated the latest BIOS for the device. but no luck to the problem.
I attached again the new acpidump out after updating the latest BIOS.=20
Would your check if still the same issue ( devices id related?)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
