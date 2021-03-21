Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2F8C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 15:42:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36BC561929
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 15:42:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbhCUPmB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 11:42:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:58946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230115AbhCUPle (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 11:41:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2A88261929
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Mar 2021 15:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616341294;
        bh=CAXBUOdscW3xmBaEv31YlCYFmbZA4LUInJ0hF+7G7s8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=N9GXyNJKhUk6irVPQK2S/zET9u7uncKuVQ0E3Kfa7Ax9Ig6kBoAinwQVDtId6qK2y
         nsl5a+Z4aqOh+bpcdtjFqLZBmsjr8HEXDiA+LQT1V6jSqPCjOA/UzPqmLKaICPzqaA
         tQQqPgczzKHSfDR38ovAsPl0FkPhV7vgrmScmNBO1ZHvQ9sXpqZQHvSWEgc2rjpQ+d
         tQtXVQBPNAo34OaMnc3B1k3fp2ku9ZWe6/8CWjyP5jhlVf6qJVDU+E0vmGEXBs1ga4
         7VrYMSx18uWlYOricZMQPDUNNVjsPvwT8iUJg5Iss/XgsM32dfFmh2z+o2L7NY0YgK
         6W7acVMTpItiw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 210457] Fan sporadically maxed on wake-up due to unavailable
 sensor temperature
Date:   Sun, 21 Mar 2021 15:41:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: s-cvhajmmblfsofmpsh@thorsten-wissmann.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210457-215701-rdKtlVgHA8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210457-215701@https.bugzilla.kernel.org/>
References: <bug-210457-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210457

Thorsten (s-cvhajmmblfsofmpsh@thorsten-wissmann.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |s-cvhajmmblfsofmpsh@thorste
                   |                            |n-wissmann.de

--- Comment #5 from Thorsten (s-cvhajmmblfsofmpsh@thorsten-wissmann.de) ---
I have the same issue on X1 Carbon 5th generation (i.e. lacking of temp1 ma=
kes
the fan run in max speed) and the bug still exists in 5.11.7.arch1-1. Going
back to the lts-kernel (5.10.24-1) makes temp1 appear.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
