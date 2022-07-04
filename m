Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C501DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jul 2022 10:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232408AbiGDKMi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jul 2022 06:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231691AbiGDKMh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jul 2022 06:12:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC38CE26
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Jul 2022 03:12:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 78918B80861
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Jul 2022 10:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DCC3C341CE
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Jul 2022 10:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656929554;
        bh=R0tjktg5cFn/qCJobZKIftrbPXwonKfiuSnM6el09pk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=TkYvJxDKpTpWW6ZAxp4p4JlzTAZjES11+cda/xQ2MqATYIFBhCuXC1ow3jKVvaFgK
         Im59nkYwY9IN/OgjUC5h706P/CyUEV4LuXNLbc9lOzp/pnrYXqVFXqK88dvs8jCZjz
         ESpKVVDWTgCs/Eji7MPVIVWNTU3B1SPJHzQ78xFjTQOas575d2kSGEhs7nKbwMlMtf
         S+lCcZVeaPCS/k8YT0POG78fXjZxnP4mGqL3lMBN2MdfQ9MQK7CZ2nCyf507EPErPF
         48BsdBq64+BGAUkUnXJjR3ZcugbnZlsmP3MHeMKOiLF8yLQpcaMFEiif1OaO3qbb9T
         mD8Iq3rjpoxKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2DCEBC05FD2; Mon,  4 Jul 2022 10:12:34 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Mon, 04 Jul 2022 10:12:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214899-215701-l6w8yxIWJu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #45 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Created attachment 301330
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301330&action=3Dedit
[PATCH 2/2] ACPI: EC: fix ECDT probe ordering issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
