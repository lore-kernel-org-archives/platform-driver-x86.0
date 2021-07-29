Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D7CC4338F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Jul 2021 18:37:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC5C161076
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Jul 2021 18:37:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbhG2Shq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Jul 2021 14:37:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:43702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229620AbhG2Shq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Jul 2021 14:37:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BCA5960FE7
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Jul 2021 18:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627583862;
        bh=p2X0SyQorJPRwlR3KTUVDmCkWkUtMASd4/XUPqUulgY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iXTsEY7vyOjGGumqKapp+Dsd6l3Sq7pxNggXM22Evv+5Hx49AjYglw2mLBVwJNBMy
         gs9B5Fs8pCn5TcLjFnc2fVb41u60o3eqo/LnHDSTNKI9anM9CDsUoZSkM+KyluIWhC
         +H++53NxckSSeQOPvUcWXgnMzZk6t5Nbke60Uj6VaZy9iG/evMRrGW/guLxN86MqvE
         RiPetGBdSwNLcBalPSVkESl7EgzxiX4K29zk67v82U9WsYNobhdQOGP9ttfXIpLujL
         RDh2niSsQWBgimG4XqUCXCf+RmXy0qHTATZZYVQMJ3XCOcXV5OLzAxa/yh5MwcBnDa
         k15hPQ0ZdS1GA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 29 Jul 2021 18:37:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mail@bernhard-seibold.de
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-EYXFLklBIi@https.bugzilla.kernel.org/>
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

--- Comment #79 from Bernhard Seibold (mail@bernhard-seibold.de) ---
(In reply to Gregory Duhamel from comment #78)
> Is there any chance this patch reach upstream ? Thanks a lot Guys !

I submitted the patch, but it was rejected and I don't intend to continue
working on it, sorry.

https://www.spinics.net/lists/linux-hwmon/msg11260.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
