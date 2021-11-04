Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05AFC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Nov 2021 14:34:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94723604D2
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Nov 2021 14:34:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhKDOgz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Nov 2021 10:36:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:52668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230509AbhKDOgw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Nov 2021 10:36:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C5F6061247
        for <platform-driver-x86@vger.kernel.org>; Thu,  4 Nov 2021 14:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636036454;
        bh=cZV2jXQl+WHioA/fo9PUvuf4gIgOIG8aKOf/AQzZ36Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=STqUVX6X5pgOkPVfgPSwBPva+ICyDb25stq3JfBGalWNTilnz4096PAELgSdVUV4q
         7p1O3t07N3pvYHv92qrcVnB7xnfJ/7MlI2gOHj4Q6F9i9Vb6CmxUPzXcqtyJ3XjwlL
         Lnmsgb28HdXpl8iMz5P71olPrJchJMAKL6S+AWU2ZTX6w7iZVJW9yL8T31vyDtuwjs
         w9D1UTLjdSpYcwsAkHMycdR6u70xXd0+c93QP+FeoguCc39iwPQcmpPHqIEG8VKJWJ
         KrRUS4R21XeOgmmDl7A5Y4lmjALP57cVsZM8Is18BTI67qa2NpHh1HXH3aG4jibInP
         svzZzwvCY+5pg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 04 Nov 2021 14:34:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: temp82@luukku.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-k7DAuxseU3@https.bugzilla.kernel.org/>
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

--- Comment #148 from Jarkko Korpi (temp82@luukku.com) ---
 cat /sys/class/dmi/id/board_name=20
ROG STRIX Z390-F GAMING

no I haven'y tried the patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
