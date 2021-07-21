Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDB5C07E9B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 09:26:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCC3260231
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 09:26:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235729AbhGUIpm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Jul 2021 04:45:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:58016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237168AbhGUIcu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 04:32:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8681061175
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 09:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626858807;
        bh=2XH7DXIEQdUg17AELnB/WitY/3kHLhoNrW3X9kaJ5f0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ESOT9GleE6Tv9vUq/MCg5MQ/PcCYnMVLq8oL3YD7FijYjRv1M4vv0hQjXTORf7gxB
         7hfB1egaEzbq4XE/AE+BCPli+g/hXpCX3/IXy1nGK2goBjVHlc7x5nT5227TCup0Y5
         2nVPSWxZxl1XPmBvMRHqJGSt2/upUos+Khd6Ex7fQdlJ9tVvx1A4Dn4BTDD7lj+QFe
         0b3G/wIJh+74zpFGiVhRZlNR0KjhcT3+S7OD+wszdOu3MeGN7Znxrm5GpbwqBhhgZq
         tU0xXqSMvW8khEeHLax45BuA3uxdhO+f6NB1CRiW6upJ7uOKpqBDQwNkQ+fL5L6WM6
         BQ9ulR9Y6Kx7g==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 09:13:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: patacca@autistici.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-SEehP0GXFS@https.bugzilla.kernel.org/>
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

--- Comment #14 from Riccardo Mori (patacca@autistici.org) ---
This isn't an issue related only to Clevo laptop though, see the dmesg logs=
 for
this MSI with AMI BIOS https://linux-hardware.org/?probe=3D3f205f2881

I can also confirm that it works on Windows, can we get at least a workarou=
nd?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
