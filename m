Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F2CC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 Jan 2022 11:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbiADLKT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 Jan 2022 06:10:19 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:58172 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiADLKT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Jan 2022 06:10:19 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 13190B811BB
        for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jan 2022 11:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCBF5C36AEB
        for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jan 2022 11:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641294616;
        bh=OaNnIyRvfnL52kXnXphoVjACVdETaQgCs6GctqlE5o0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=suIh7MCKNq/x+UJrAyQulgjB2H1Ayvmg6H//2C08sRKS6Uc2JUFQVc2YuJjqeJGeD
         8arn87qq/y9cQf4XlnkTENiezGyUB+I1irTSo3rwS7RDFEiDNVxJR882V0/KlXNa34
         C4UBtrONjdTY+a+ryrL4RJNIZWI4nqGOtNu4rN980Wsa/NkSPSZ9K7URmd9tfH/GMc
         qozbDzwyCkJBqkcUOEesiwh3eCHN1Hpp4yNDolpe6AvqlLozn4zQxTjY7yRi6yYPm0
         G51q/qCMYCR1ewQQ1ztc1GPHCWP92Co5Ft4o6IpaXrxuIj6GOYrdCm1yKtIjSX4lvI
         qWKyxm+6dn/SA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AC9A8C05FDC; Tue,  4 Jan 2022 11:10:16 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 192831] acer_wmi spamming logs with iio-sensor-prox Could not
 open input accel Operation not permitted
Date:   Tue, 04 Jan 2022 11:10:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INSUFFICIENT_DATA
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-192831-215701-eRFK2aKwYE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-192831-215701@https.bugzilla.kernel.org/>
References: <bug-192831-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D192831

--- Comment #3 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Andy Shevchenko from comment #2)

> Note v4.10 is LTS, so if the bug is still there in the latest stable vers=
ion
> of it, but there is no such bug in the latest vanilla, try to bisect the =
fix
> commit and then you may require to backport it.

Oops, v4.9 and v4.14 are, v4.10 is not LTS (v5.10 is), sorry for the wrong
message above. It means if you are okay to switch either to vanilla or what=
ever
LTS kernel, which you want to have working it's fine. But in any case you n=
eed
to retest with latest vanilla first.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
