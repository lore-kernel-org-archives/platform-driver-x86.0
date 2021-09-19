Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_ABUSE_SURBL,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35F5C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Sep 2021 05:50:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8021611C8
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Sep 2021 05:50:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231752AbhISFv5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 19 Sep 2021 01:51:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:45514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231738AbhISFv5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Sep 2021 01:51:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0D51B61283
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Sep 2021 05:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632030632;
        bh=v7KKC6+smhBlLp2CioCRnpbO4UCXyIrToT8h4bx0juU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YJbXGwW6Tkv7uA4tU1jipPScHavKzbkWdyV5ZtdrsBGTlUGV+KvDWTcilrulaS2Op
         IjCGPb+WYUGqEWTsknCuwCTY8dzVfqY0GBx2pEKuIGdfW6TCSalUqm9Gs/+uGGvDdw
         FvbKUM6ZJrVnBAmDfECqAsdW3Q+Y68y7UQatmWYiTck7Ktgkn/s8Dsr4q2kMKyWhIj
         iqlpKjU6ItwdAZz2aOmZjIvVAIDoaKfKH68wh0VA0qeiULykHONYPhZlVw6bR/krFt
         nQVlv1W35oG/jy90FXZxRyhYcJ/iZNrR4sOYH7HXrK+ysbl3u7EX2pAbCb7ZStj5Yj
         uSCPr3Kuzl1kw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 19 Sep 2021 05:50:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sefoci9222@rerunway.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-czzlhqvZh1@https.bugzilla.kernel.org/>
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

matt-testalltheway (sefoci9222@rerunway.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sefoci9222@rerunway.com

--- Comment #117 from matt-testalltheway (sefoci9222@rerunway.com) ---
(In reply to Denis Pauk from comment #114)
> Patch series are applied by Guenter Roeck.
> https://lkml.org/lkml/2021/9/17/1079
>=20
> Thank you everyone!

guess i was a bit late to the party and "ROG STRIX X570-F GAMING" did not g=
et
added (as per comment 112).. but hey thanks for this patch :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
