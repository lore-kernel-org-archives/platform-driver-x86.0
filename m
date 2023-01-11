Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D963C46467
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Jan 2023 21:36:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235657AbjAKVgJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Jan 2023 16:36:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235684AbjAKVgI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Jan 2023 16:36:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E22E13F45E
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 13:36:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8034F61E74
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 21:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E81ECC433D2
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 21:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673472966;
        bh=qv7NREV/n1DTOEhCWZgu6nB3gwz4geCUGvLe6JGHVhM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fGd9w9W1vYhKigPSfCK48dcnMQTpG9cHAG6EByIM+dDsvcILdS+z47cRC1A2VTOhI
         mf4hLpZxr2kOIARY1oqZF9VxmUML9+a0NxxLP4laB8LsMLLxKlaHc5Pk2tIGvEGjmo
         rSTo6L0eQalN/D4xB6jAtU69Bc8iYvuNOop1vZJu8HG2ijOkoYmibFQFJ6ZzcgkOz2
         MQzepI+spq0tFlLPmmLnxV+Bh8YrqPus5YkYe2NwLKL+yjXBJUx5FpKegA1C+zfzsk
         o9PP8k0fbsH6H5XZelSOGvSM81CZLob/JJBBpSmfUtaxWO8yehBmONwOUxN77ctByR
         1YuzTlUeJ1S+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CF145C43141; Wed, 11 Jan 2023 21:36:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date:   Wed, 11 Jan 2023 21:36:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216917-215701-Gzf60AvRdJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216917-215701@https.bugzilla.kernel.org/>
References: <bug-216917-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

--- Comment #3 from kolAflash (kolAflash@kolahilft.de) ---
Perfect guess!
Indeed 306df163069e is broken and it's predecessor is fine.
Reverting 306df163069e on v6.0.18 also made the problem disappear.

Last good:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3D306df163069e78160e7a534b892c5cd6fefdd537^

First bad:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3D306df163069e78160e7a534b892c5cd6fefdd537


Just wanted to say THANK YOU for all your help in the last couple of month!=
!!
Both of my Ryzen notebooks wouldn't work as great as they do without you and
Alex.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
