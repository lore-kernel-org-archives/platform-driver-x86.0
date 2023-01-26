Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD71C54EAA
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Jan 2023 20:38:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232831AbjAZUiC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 26 Jan 2023 15:38:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232821AbjAZUiA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Jan 2023 15:38:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4523D103
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Jan 2023 12:37:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A944AB81EB7
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Jan 2023 20:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56FCDC433A0
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Jan 2023 20:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674765477;
        bh=LV38/a3I7qdsHz4hEbtfhnNfxySJXEuUiYBFVYoNkuo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=odtVyib0SVN7lPV9UI2vucbjRvSpQdjmIbRodbFEqWjd6TK2ZEAe7fCPWqYgcopz7
         3+BMDc5sE4OscogAKrGHzPMkRU32gMa+FCj/yGuFGqL6ByPZkZPnL1URD/TUt0gLO8
         oEpFI125GZ5bT+V6Ou68ADSsVsqR5UzHiXfVncrJum6yFCyK11L0UPGutrZ6RwGytG
         o/FXTafLSLV2GyD98Ak+eNMLojnNyIqcY7Dq5+MFYaUmERK+17lWZy/Cg6hMR8Y6ZB
         SARC15SumNCrXkKB6nuFYv72YGzvXl2fkb1WCb71dCAcgLP1FCAKphF3axlzpw979x
         e+wqjP0fkFSig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4610DC43143; Thu, 26 Jan 2023 20:37:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 26 Jan 2023 20:37:54 +0000
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
Message-ID: <bug-204807-215701-99TvtPLP2S@https.bugzilla.kernel.org/>
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
 Attachment #303610|0                           |1
        is obsolete|                            |

--- Comment #285 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 303655
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303655&action=3Dedit
Asus WMI for nct6775 v6.1 base (2023.01.26)

(In reply to Nikita Koval from comment #284)
> I have the same or related issue with Asus Pro WS W680-ACE IPMI motherboa=
rd.
> The following dmesg output is produced when I'm trying to "modprobe nct67=
75"
> and lm_sensors do not show any PWM fan/temp values from this chip:

Could you try with such path? Difference with previous patch is your board
added to asus_msi_boards. ASUS EC controller endpoint looks not implemented=
 for
you board and only nct6775 is required for show sensors data.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
