Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED38BC76196
	for <platform-driver-x86@archiver.kernel.org>; Sat,  1 Apr 2023 13:40:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjDANkg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 1 Apr 2023 09:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjDANkf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 1 Apr 2023 09:40:35 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4F53191E8
        for <platform-driver-x86@vger.kernel.org>; Sat,  1 Apr 2023 06:40:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6D396B80B67
        for <platform-driver-x86@vger.kernel.org>; Sat,  1 Apr 2023 13:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1AEB9C433B4
        for <platform-driver-x86@vger.kernel.org>; Sat,  1 Apr 2023 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680356432;
        bh=iA6+0rXos8Nop/+LhzAeE3UUR7zEsqP+HqdHeQ3Rj7U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cpIhj95NDWcFktAmAO16lCRwWIL/kuW2I4nvANDKGA7Yoon5WKTedn8t+KW/os9iB
         4PeBu7fAAD6DKoFFKBrY8S/35suQ6lhIpn5hldFrI3NIyuQPBz/rNglXw71vX9epTV
         kYOji9CtqicZL3X0Xh8iWIEfzadGG6yXpDziyOIcnNXjbw1Aru3ymj7WWEnVcUGcaC
         PpBAdgoO3hqLNCPGgTkAQmNbVQ3nVfVJhJFa30+6KQlFmNOBByzlXd+btRG9HhzinX
         84FWQjbntho4gN0EkboyzL9BvGJGqAaRE1EPXAQ9jBvZ9rSnjoI6IhEiMjLIHEjDa9
         OOJhiTPVhlsEQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0BBD8C43144; Sat,  1 Apr 2023 13:40:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 01 Apr 2023 13:40:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mblancha@free.fr
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-V08NjTA19p@https.bugzilla.kernel.org/>
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

--- Comment #322 from Micka=C3=ABl Blanchard (mblancha@free.fr) ---
> (In reply to Micka=C3=ABl Blanchard from comment #320)
> > Hi,
> >=20
> > I wonder why the board B550M-K has disappeared from the final patch
> > integrated in the kernel sources. It's somewhat the same board as B550M=
-A,
> > which is included.
> > Moreover, it's in the list in comment #278:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D204807#c278
> >=20
> > An unfortunate omission? :)
> >=20
> > Thanks!
>=20
> Do you mean "PRIME B550M-K"? Both hwmon-next branch and patch have it in
> https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/
> tree/drivers/hwmon/nct6775-platform.c?h=3Dhwmon-
> next&id=3D8a863eb1b1162653d133856702e13560f3596b85#n1076
>=20
> Do you have some load issue with new patch?=20=20

Yes this is the board I'm talking about.
I'm currently running 6.1.21 and the board is not included here. So I still
have the load issue.
I haven't watched in the staging, I should have as indeed it's here. :)
So I guess I just have to wait the merge & backport in 6.1 branch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
