Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3EBC4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 26 Jul 2021 22:20:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC92E60F57
	for <platform-driver-x86@archiver.kernel.org>; Mon, 26 Jul 2021 22:20:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbhGZVje (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 26 Jul 2021 17:39:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:54764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231502AbhGZVje (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 26 Jul 2021 17:39:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 88F3260F6C
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Jul 2021 22:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627338002;
        bh=4tDoldxTt5sP1tNcCEaASqgauOpzfQeQaj5UI061wjU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=OhnupDU0GpCfqVwOqBnZGYklRzd4HXoPImwUVzrd3TjZQVaDdSBHLk2/7hYgpYX8E
         QhD6zEumaHg2sUYKvBNBIkf+EbImmyHo8IJ5lgLzIn7Gjggfa7VZ2lZsBuHNtm/Ll9
         Oog5Sx+mrG0Rf+l0R+irso2jgPZxh6cRXFhpNoc0FbRbNbUl4oA6IqEkGI7XOKa7bM
         r6kUkl2d/7AUvf91QaIasMvpruw6Skq/OHWA6VAcS2oV//CRGZv7g7pc/tJPym5Z5d
         42NY8uozApQdDqm929W0tNiS9Zbpu8QqDBClIVeYvqZoI1C5Cg/1AzTEe1sbs2792Z
         QQv/RuctVBGmw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 209011] asus-wmi always reports tablet mode on a ZenBook
 UX390UAK
Date:   Mon, 26 Jul 2021 22:20:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: julius@devpi.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209011-215701-BBlvgqme0r@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209011-215701@https.bugzilla.kernel.org/>
References: <bug-209011-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209011

Julius Lehmann (julius@devpi.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |julius@devpi.de

--- Comment #6 from Julius Lehmann (julius@devpi.de) ---
Not entirely sure if this is the correct place to post this, but the issue
described is still present on my device. Touchpad and keyboard are disabled=
 in
libinput. Using Archlinux 5.13.5-arch1 on Asus TP412UA. Output of libinput =
is
pretty much the same as in the first comment. With linux-lts (5.10) there i=
s no
SWITCH_TOGGLE device and keyboard/touchpad are working without issues.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
