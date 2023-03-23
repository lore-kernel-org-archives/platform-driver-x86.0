Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CF4C74A5B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 23 Mar 2023 18:33:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbjCWSdu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 23 Mar 2023 14:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjCWSdt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Mar 2023 14:33:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C88210AA5
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Mar 2023 11:33:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E9CFC62871
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Mar 2023 18:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56E27C433A4
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Mar 2023 18:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679596427;
        bh=YT5NCR5apcv4CDztEWYbZ+MYmXZyuBOhbXmOjGRz3S0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YRTvfLyRHkXc143Ib+Um9RfXIJXilzGMq7FffTxWPQqcfr2JdmH1dwBGBANT6BZpm
         bLIXjsGWOURYdzHEHx9rnNyhLlXMyYeKKrQr1Ep+jIEqw0xLtug3l9rCtF0sA3ltKV
         R48VB52XEpL9g4yQAMjZfmuA2VbWd2h8dqDioeP+I0gV4GOTc/fcjKLtN13vyMScSo
         T6hl3mdwCYG0qIiwcA+6CQNbX98HmhQPvd2gP3cjHzGIPWLrR667Y3JJuKMnbYq1t9
         yjH0/4MTQi9c//vw7hYjYAX2SGuhSIpG6NxaWALE/M8+tnxtGt6IxlP0gf1yqjVdXL
         4myIpgQbDh67w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 473A0C43141; Thu, 23 Mar 2023 18:33:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 23 Mar 2023 18:33:44 +0000
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
Message-ID: <bug-204807-215701-NibSFWoU8M@https.bugzilla.kernel.org/>
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
 Attachment #303985|0                           |1
        is obsolete|                            |

--- Comment #318 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 304011
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304011&action=3Dedit
Asus WMI for nct6775 v6.2.7 base (2023.03.23)

Updated version of the patch with more boards.=20

Full list of boards:
https://github.com/asus-wmi-boards-sensors/asus-board-dsdt/blob/master/READ=
ME.md

(In reply to barfin from comment #314)
>=20
> sure
> https://gist.github.com/barfin/943c219a5a6bd8aa15778d8c80b2786c
Thank you, I dont see any suspicious conflicts, could you please try load
sensor module and check errors on load with lax.

(In reply to bruno from comment #316)
> Created attachment 304005 [details]
> dmidecode for ROG STRIX Z690-E GAMING WIFI
(In reply to Alejandro Gonz=C3=A1lez from comment #317)
> Created attachment 304010 [details]
> ASUS PRIME Z690-P ACPI table dump (acpidump -b)
Thank you, I will add boards to next upstream patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
