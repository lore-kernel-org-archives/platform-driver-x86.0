Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34BCC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 11 Sep 2021 00:12:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76A376120A
	for <platform-driver-x86@archiver.kernel.org>; Sat, 11 Sep 2021 00:12:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234936AbhIKANi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Sep 2021 20:13:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:49084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233946AbhIKANi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Sep 2021 20:13:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A6B7D61244
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Sep 2021 00:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631319146;
        bh=tVpc/vu/PVGN7Ti9K0GmEmFQSh477Ji94XYmqsT/Hos=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FZvQIC+Ed/qjZ1Qh8ZeTQhk9CeGhQd9taMatQenVrau5WrZSNko25GFOz1KBVZutx
         7zRB5glvpP095n6p6Z6/zi1Zv+sZfxFQ+TDJ4SaEvMnYuZ8540rM/Ji7uQEM4P1xru
         mUviWWkGiTcT7Qo0MjVT2U+3QjqvZ21juxb5yhWNIzsRnjCF1s1dbebsJjA+PdO3M+
         byJl/DDLK7wzMHTVEvCenT9JHI7YFFhQZKY84nnuRwbWGhXwHu568052kIBhJJKH/L
         Axeasw4X0ZKZPoiXN8TMgb0Y95sG4f0gFFKsBLwEHvz3vLgUm5kj4GGqViZHMkFsb/
         gJWH8rpu/h5wA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 11 Sep 2021 00:12:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sahan.h.fernando@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-VZ1gauf0fw@https.bugzilla.kernel.org/>
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

Sahan Fernando (sahan.h.fernando@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sahan.h.fernando@gmail.com

--- Comment #101 from Sahan Fernando (sahan.h.fernando@gmail.com) ---
```
$ sudo dmidecode   | grep -i B550
        Product Name: ROG STRIX B550-F GAMING
$
```

The patch worked for me after adding my board name, could you please also a=
dd
"ROG STRIX B550-F GAMING"?

Thank you for working on this patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
