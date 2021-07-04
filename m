Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFD9C07E95
	for <platform-driver-x86@archiver.kernel.org>; Sun,  4 Jul 2021 14:33:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D0EC613D8
	for <platform-driver-x86@archiver.kernel.org>; Sun,  4 Jul 2021 14:33:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbhGDOfp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 4 Jul 2021 10:35:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:33694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229557AbhGDOfo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 4 Jul 2021 10:35:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7A8C9613D8
        for <platform-driver-x86@vger.kernel.org>; Sun,  4 Jul 2021 14:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625409189;
        bh=X10yN4CrUYRLrDyFC+2okjjZIiDXQd0KTsM4voTMCro=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=H9OdQchgfeq2tSGhVH5q67u+u/8nHBy7uGi1fJ8cBEa+pmIo1i95xrMVKLNWUslxP
         VyLpwmI8R2zWvEcxe/pbenIzQY9jNsYwlixa6uT6HVPCAqOJerXWOHQXo/oiFYVzi9
         8o2nHzses8IXwF8E7sRxXJL0MqSbt+GZgc384dgfPTe7ZhVtqzZsOOYKERdpqAN0fh
         k0FxyDpEG/iQbauwhPixt79sCpZURdVRfMvVz0Om8Yw38rUtuYrucSwINqBKI0+zix
         2uqtTUeJGI48cZ0B4IhWTVN4cx+xJob6sSgifgGmFlu3TDB0vnjsQ2EPJUpjiyxBhs
         RyQORDNbILrLg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Sun, 04 Jul 2021 14:33:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: patacca@autistici.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213579-215701-Fqee6AuRWl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213579-215701@https.bugzilla.kernel.org/>
References: <bug-213579-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213579

--- Comment #7 from Riccardo Mori (patacca@autistici.org) ---
Created attachment 297749
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297749&action=3Dedit
/proc/interrupts

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
