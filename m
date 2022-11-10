Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A24C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Nov 2022 14:45:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbiKJOpT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Nov 2022 09:45:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbiKJOpS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Nov 2022 09:45:18 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EFD145A06
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 06:45:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AA3E4B8221B
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 14:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D865C433B5
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 14:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668091514;
        bh=gWr0GC9yE8fv7orrftDOM7Nxk+0XZR8e/IDa4LIb23k=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PNFO4Wd7oZHFyfSvy4bIVxHxvTqJzoSBL+fKLx5YXrBS9DyGtV3YgPEY8KqHJ1f9i
         VwNBM+pjnrdjDEknOTj74l1qmk59zY8hV71bREZfTnJX17y6I4+33vkufXvva8494L
         s9UowY3GvnDkq4ThI4680qk+b/s4HRmItEJd8z+Me4dzAsqUDoRI0EvwHro7Up5D3N
         +7bCvEPBRQ31ErZYU01KXYPQ9aQivkbT9dAgCllKO2vYv5gwgN4b4YRqGguSdMB17a
         zWwBXFhP7QGZAc5J0ddUSKgybG0SD+BnQFCBEIN9Hf9ks+Sosv/Q23VL5WSHd0+Qf/
         XOUMJ0t0Acsng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3034FC433EA; Thu, 10 Nov 2022 14:45:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 10 Nov 2022 14:45:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mundanedefoliation@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-BpZ1nh7sjH@https.bugzilla.kernel.org/>
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

yutesdb (mundanedefoliation@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mundanedefoliation@gmail.co
                   |                            |m

--- Comment #268 from yutesdb (mundanedefoliation@gmail.com) ---
can add support TUF GAMING B550M-PLUS WIFI II?

I tried add parameter acpi_enforce_resources=3Dlax, it works.

# dmidecode 3.4
Handle 0x0002, DMI type 2, 15 bytes
Base Board Information
        Manufacturer: ASUSTeK COMPUTER INC.
        Product Name: TUF GAMING B550M-PLUS WIFI II
        Version: Rev X.0x
        Serial Number: 220909970904631
        Asset Tag: Default string
        Features:
                Board is a hosting board
                Board is replaceable
        Location In Chassis: Default string
        Chassis Handle: 0x0003
        Type: Motherboard
        Contained Object Handles: 0


cat /sys/class/dmi/id/board_name
TUF GAMING B550M-PLUS WIFI II

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
