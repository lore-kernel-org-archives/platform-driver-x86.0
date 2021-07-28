Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D08C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 18:10:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0085861050
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 18:10:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhG1SK6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Jul 2021 14:10:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:47858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229542AbhG1SK5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 14:10:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DF4766044F
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jul 2021 18:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627495855;
        bh=tTiIf5dEj426ZeXu4ZFV2cdhJqfqz4pSUqF67Sn7SII=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UKij7gtLfR2bNIQYLqwzh1dniY0cX7xxUHGRUPzGdMdZcMjxbFV5eC9HU/OJW6c0w
         4D63bbjq/OLqbupReaIUxM1xlErIWGkfNTLc3vmgcijW+xXt790XCanwWPjGXqn4ry
         VI8uQycJwiFver1+yf+I7ImF6gaYJr6wOJqwLKxMb2VndlMiRT7pRoVeDa9h9cWtWq
         NqsAYz29BtVQBbS9oBvx8SOiGUHsuYf/PwhOABhBhr/IR09zrbDzgN3ESoSFdspv+t
         +bZz02GJCwhyr5FcEFoWZT/WOgcgP7BcolVn0qazELE+kZUZKKLMQqw9QVUYBbGmle
         zKbkNvjIuOOfQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 209011] asus-wmi always reports tablet mode on a ZenBook
 UX390UAK
Date:   Wed, 28 Jul 2021 18:10:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: jwrdegoede@fedoraproject.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status assigned_to attachments.created
Message-ID: <bug-209011-215701-2jz7SrcDgO@https.bugzilla.kernel.org/>
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

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
           Assignee|drivers_platform_x86@kernel |jwrdegoede@fedoraproject.or
                   |-bugs.osdl.org              |g

--- Comment #14 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Created attachment 298093
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298093&action=3Dedit
[PATCH] platform/x86: Add and use a dual_accel_detect() helper

Ok, this patch should fix this for you (I've already tested the BOSC0200
dual-accel detection part on a similar device).

Please build a 5.13 kernel with this patch added and see if that fixes thin=
gs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
