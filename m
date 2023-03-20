Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D493C6FD1C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 23:12:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbjCTXMd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 19:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbjCTXMc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 19:12:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C4D1ABFA
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 16:12:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BA2C5B8119B
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 23:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AED5C43336
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 23:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679353948;
        bh=Y9tJb8GFUkF1DYDEQ+FolHkxbz26Ru+x7G9bsTUNgII=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BWlr5w1Y8d1ELgJ7Njx00XXUvUNYbTRi/jDr/TYAYR/EpNhUy3YVveHP8uzxcBOT5
         K6tPREQyJruVFIddWwFRaUbyKokWOtzes5IxzoU0lM2t02wQZWFPW0yoJY4MVUEuLD
         A7uoJS3ImoL1YZiGZVttrQeiY7GINwtUJZhvh039fWDMSRDRXYSePQd3YPZTnq/wOE
         LbsyODHQ+NfTxhH8UVjEufJFNgYampQXR4txXncIsxYyUCRgjcQDqDbAPdLSQp/2f0
         3Za3XsvwfloVb30SO2j63ZWlGQhAgHCqT0yRr83CQUO7fQkcjudsPqPi0DazDpaN3+
         9GJ94Y+m4GhGQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6C7B6C43141; Mon, 20 Mar 2023 23:12:28 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 20 Mar 2023 23:12:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: barfin@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-3lDtfrXrg9@https.bugzilla.kernel.org/>
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

--- Comment #314 from barfin@protonmail.com ---
(In reply to Denis Pauk from comment #308)
> Created attachment 303968 [details]
> Asus WMI for nct6775 v6.2 base (2023.03.16)
>=20
> Clean up previous patch, add more boards.
>=20
> (In reply to barfin from comment #305)
> >=20
> > here's all the outputs, the file that have "_lax" at the end were captu=
red
> > when acpi_enforce_resources=3Dlax was used
> > https://drive.proton.me/urls/8S727K80A4#MdPfNfkyxSbq
>=20
> Could you please check messages in dmesg without lax about resource
> conflicts?

sure
https://gist.github.com/barfin/943c219a5a6bd8aa15778d8c80b2786c

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
