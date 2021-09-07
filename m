Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E014FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Sep 2021 20:35:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B54146113A
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Sep 2021 20:35:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346228AbhIGUhF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Sep 2021 16:37:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:43830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242324AbhIGUhF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Sep 2021 16:37:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B4CA96113A
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Sep 2021 20:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631046958;
        bh=Gixn+4M7yC/riVimJRqiayoU0unduE0j8qLKvSVo8LY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Iaid5YPu78yLiMZlrSXm1O/HESUGbXkNqlSy0tG2+oIxhbMuc5/43zc/8F/bJ7Spy
         +JnaWDwwJqZJlibibjjsQp9XpJwlAZWHmZ5+T1dhsORePXikZboGUujPEyGbMJA/Td
         imG9FEHPh8xQSSajq7+q3H5N8GRfNu0O0Mk28iGULxGdDz8PS1agG4rG97Vcs1iGJ+
         pK+jG0VZaifMg+OHFP97COpPEoV3trvCempwORFleUqqGnzvXIQ+Ajg4XcSSuFAojO
         fcTXq1KFLW4m6DPZl+xtmM/G/3nKdqfDElkB5T+HAzB4boIotdCT5o1spnuKEFYmwj
         v8/DMjQo6qWsA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 07 Sep 2021 20:35:57 +0000
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
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-CiIRPb6B8I@https.bugzilla.kernel.org/>
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
 Attachment #298669|0                           |1
        is obsolete|                            |

--- Comment #93 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 298703
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298703&action=3Dedit
POC: Add support for access via Asus WMI to nct6775 use match_string

* Use match_string for filter boards
* use function pointers for superio

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
