Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5EC3C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 May 2022 15:10:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbiEYPKX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 May 2022 11:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbiEYPKW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 May 2022 11:10:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B04FAEE2C
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 May 2022 08:10:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1ED3F61A1B
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 May 2022 15:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81340C3411D
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 May 2022 15:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653491419;
        bh=FDKgaPG2dK3odw3OLYcSJ3wNpSg5D46TBxlLIxOBACo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FmCX3T3AnfJf2BxB6rACD7535+N3dDiIQLFL3r6eLOk1FE9chZiQc51GhT+hxq6GY
         duyx/0ulMPfhEenXwpNRZgBF7weamDf2ryHThhLgCa0qtlo4RJ34Nk4Z/cXzdIqljx
         wRcethRTd/k7GjesJybBVGLImrSmDg78ZFfLknJRY1WZY7l7fWZHadSs/mw87y0lr/
         EW+CBGval1UKH0ZTR74iEjwDoaaTdwp8mNkOBAixjCexKu2WemL7i01YIKhZLKQi43
         9Bdk775OmFawc3YxJsSx4+KWuPYWGq7acTstavth0KqXxRffxP2fzwJl6ZBNTHplAW
         NmzbUZYQTGbbw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 71B10CC13B5; Wed, 25 May 2022 15:10:19 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 25 May 2022 15:10:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: rob@janerob.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-Hm4tKkUnyM@https.bugzilla.kernel.org/>
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

--- Comment #246 from Rob Miller (rob@janerob.com) ---
(In reply to Denis Pauk from comment #240)
> Created attachment 300963 [details]
> Asus WMI for nct6775 v5.17 base (2022.05.15)
>=20
> (In reply to Rob Miller from comment #239)
> > Created attachment 300958 [details]
> > Asus Z170-DELUXE dump

> Unfortunately, your motherboard does not have any endpoints supported by
> upstreamed drivers.=20
>=20
> Could you please try with attached patch? It provides custom lock method
> that is unsupported by upstream driver.

Thank you for your continued efforts on this.

I installed the 5.18 base patch and was able to boot without the warning
messages.=20=20

The nct6775 module loaded without issue, but 'sensors' command did not show=
 all
the info for my device as it does booting the Ubuntu 5.15.0-33-generic kern=
el
with the 'acpi_enforce_resources=3Dlax' option.=20=20

nct675 reports: Found NCT6793D or compatible chip at 0x2e:0x290

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
