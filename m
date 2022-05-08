Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFBDC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  8 May 2022 09:59:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiEHKDE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 8 May 2022 06:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiEHKDD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 8 May 2022 06:03:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C00455A5
        for <platform-driver-x86@vger.kernel.org>; Sun,  8 May 2022 02:59:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 06BDAB80D70
        for <platform-driver-x86@vger.kernel.org>; Sun,  8 May 2022 09:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD7B7C385BB
        for <platform-driver-x86@vger.kernel.org>; Sun,  8 May 2022 09:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652003951;
        bh=HQL5SeorM11Sk4VdX3H3R6uzXGlFFiLbkDpihly9klQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=EdOhw+fkaK/QQpxjiQ1JAAeVuD+Aol7y11qfJiZk2rHJMdnbVkIaSE1jXvmCjWKTN
         s3pTtzusF9+G2wbQab1X7hJ7KN6sKttB9Y0la+oyJlq3zeX1QeIyA5SogsMxEj14lO
         02JJzSnwzWcekxhtiBRc+GRLSDa7xtHeFGaF7wa+XmcqnRzbZ3pd8zzB35j5ccBMe8
         Vcu+2+5YK3xXSXxCOSvFGl5qiCjbH8MI8ca5Uq7x64sRZs0USMtbLhGgPH2CmdjC+v
         lcyuRhnZeyoNCr9VnctSeT4SP02khdfZ9NWBj8CUX/3HJurruIIPoU0QUGid9rUdZo
         hdIR5II8cQ0Kw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9E6A1C05FF5; Sun,  8 May 2022 09:59:11 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 08 May 2022 09:59:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: renedis@hotmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204807-215701-5TLjl9GbG1@https.bugzilla.kernel.org/>
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

--- Comment #236 from renedis (renedis@hotmail.com) ---
Created attachment 300905
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300905&action=3Dedit
acpidump -b -n DSDT for H410T

(In reply to Denis Pauk from comment #232)
> (In reply to renedis from comment #228)
> > Thanks all for the effort en support. please also add:
> >=20
> > cat /sys/class/dmi/id/board_name
> > PRO H410T
>=20
> Could you please share dsdt dump? (acpidump -b -n DSDT)

Sorry for the late reply.
There you go, see attached file.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
