Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019BBC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun, 10 Oct 2021 10:12:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D288C61100
	for <platform-driver-x86@archiver.kernel.org>; Sun, 10 Oct 2021 10:12:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbhJJKOi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 10 Oct 2021 06:14:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:48298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231244AbhJJKOh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Oct 2021 06:14:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9E0B161100
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Oct 2021 10:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633860759;
        bh=wQhWuC5Ig4w7O1kWuqM2lY8TqS+lZ+lrKb+jYmupcWA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jexTG2DJu1L4kIp0HFNQJ7cuDVuXwJ2eDJVKeWqKtD19nUEGLq1TvDCqFwpoAcqe8
         JPJ2+BK3DiYOJTES+QmnqsNvacHgSZkK2hvNfbjupEHNpfV2anr+xM8yd5F6ZqXLpT
         lWR4LeOISJeSDYHgx98x93eyn3MRMUmzC0XlvHc6e/HENEnOQ1z50noW9LlQOKfGv8
         MAuSWntmUJWuFMTJe9nmRyVJRMtBdbumSy3Eadp0uBdtd8jJ8P/t+iYKH4CZuCpMFW
         08jPh8sDLzihePKv4Bc8bx5Vl9aOxdoY5DcuzA7LU7BZym4n/2snAV0uGWAvTOu1X9
         PwhGjL1i3cfIQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 10 Oct 2021 10:12:38 +0000
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
Message-ID: <bug-204807-215701-QtYIvn5Df0@https.bugzilla.kernel.org/>
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
 Attachment #299111|0                           |1
        is obsolete|                            |

--- Comment #139 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 299159
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299159&action=3Dedit
Add support for access via Asus WMI (2021.10.10)

Rebased over
https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/lo=
g/?h=3Dhwmon-next

Sent to LKML(without unchecked i2c logic): https://lkml.org/lkml/2021/10/10=
/65

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
