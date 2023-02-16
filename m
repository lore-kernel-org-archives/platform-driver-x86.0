Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A17C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Feb 2023 10:44:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbjBPKoV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Feb 2023 05:44:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbjBPKoU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Feb 2023 05:44:20 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82175222FB
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 02:43:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7CCC961F89
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 10:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC04CC43323
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 10:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676544203;
        bh=njQRJ0FhzQWfUHZQpPk92J3RUeqHGYbgPYpmK/HekKU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=B639S3yGZIoTpaCTo48eki1S/syHEAZjvZ3tEYKRdb/7uhMAAYtIpb4xZN/oqBxZm
         ugsZx/GXShZIZS93zle8kqhAR5feUOQv2oo/eh72jGL4j+zzErbYy0wUcLsV+daI4h
         J5+uhCV/wDgvPYaoALfl59UEvbqmDmVmCwqIpveB0JXUHEO4t8/y9aaRKmJ7Nag1aY
         LWW3vl/sDXLHXajh1BeoEHcgJRNFiH3s2LGGKYdptY/jqa4xzxvBq6FYyGbcDsVTqZ
         /p8IRsfLl5COiqvr7Qptp1jbRle1y6LrTKtRNLfdxjP4K006H9aX4m+K1LhNeAGAfH
         7VuntgUlVZcIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C87B2C43142; Thu, 16 Feb 2023 10:43:23 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 16 Feb 2023 10:43:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: forum1@m.pekholm.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-IzvpdbkMOt@https.bugzilla.kernel.org/>
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

--- Comment #293 from P=C3=A4r Ekholm (forum1@m.pekholm.org) ---
Is this stable on a 5.19 kernel? Having a TUF GAMING X570-PLUS board and ha=
sn't
tried the patch before. Now I was getting the Ubuntu HWE kernel 5.19 for Ja=
mmy.
Can I run lm-sensors and having the sensors running without trouble?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
