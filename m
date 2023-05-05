Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CBDC77B7C
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 May 2023 01:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbjEEBky (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 May 2023 21:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjEEBkw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 May 2023 21:40:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E93124B8
        for <platform-driver-x86@vger.kernel.org>; Thu,  4 May 2023 18:40:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F39D863ACD
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 May 2023 01:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54DECC4339C
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 May 2023 01:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683250849;
        bh=eaqz7X5bOuvWX/WUilq8J65OOdI3J+OJ0ljwN6xU4f8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cympA+OH7gpmG1N768Miyw+ztIAo6jm6aYr7UvgaDuV50L6eu05+QnSnndyKAF4sz
         c8zzrtaVDvTEWknwPFWql9cdpGHcbPuyNP3AKs4cMX0KWpQFyJdWJKqPda4WMAEZIW
         cZEDdRVECO5zGCx9C6MFMyTvUYZsUCSgmD8bsaorekT9vPO7w+zvObaPWJINol8ERP
         eive5+SrV6PrNiPNH5CHdxpdep6BVzpwZH9EbAWuTMoi2qx+g7NWmMFTm12h35OZxT
         nbk0Ft7f1CJvF24KXNDGLS8VTYk12MGxSGeuavSpttuJnorvRqEph79QGonIYXMi6J
         lAWO9Y+XSYDsg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 46B29C43145; Fri,  5 May 2023 01:40:49 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 05 May 2023 01:40:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jeroen@beerstra.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-WcayNwg9b2@https.bugzilla.kernel.org/>
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

--- Comment #326 from Jeroen Beerstra (jeroen@beerstra.org) ---
Any news on 6.3 which has been released? Cannot move as of yet because zfs =
is
not ready for 6.3 also :) Just curious, before I moved my main storage arra=
y to
zfs I did boot with 6.3 and noticed my fans and temp sensors were gone agai=
n ;)
I do appreaciate your efforts though, we depend on people like you to get o=
ur
precious new hardware supported on Linux .... if only companies like Asus w=
ould
look beyond M$ Windows.

Then again, we would have the same bloatware on our beloved Linux too :D

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
