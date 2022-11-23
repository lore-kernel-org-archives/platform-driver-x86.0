Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4F2C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Nov 2022 21:28:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235400AbiKWV2B (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Nov 2022 16:28:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235295AbiKWV17 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Nov 2022 16:27:59 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE8861525
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Nov 2022 13:27:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ED19661F55
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Nov 2022 21:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58BF6C43149
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Nov 2022 21:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669238877;
        bh=wRFVKfgkPZGd3Eqjog3Nt17MQx4oo7ahvtd3o9vK358=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MUqLnxD/Z4FLfBjmvmMci1j/xtJa4hHdCpxvwjgaW5AUeiWh6RuKmL8Eu98O3SAxe
         /6l1vlc9Nvg1M6Uo4draQcXxiCjsLzDiobXXUqhhpjZeMHImhv7ajFAemDWW4Cz3Dp
         NFFPNQhpRVt6M3tvPmAmHPVT+TfT+/pCacsMwDvBnjlyJ57TBOajmtpu5Al/FBHnbW
         cWO7M5Z+1QC/dgDkA4zZ6bteHn8ThNCQkr9jhKsb9iUzXYV4DJDqcwSukfBGnAJj0o
         RrYlRLcf6/4S+FuG1rkVcu5RP4MyKU525qqTPr9w1HAuUeBTRz2Lv8y222ervccOEA
         SnoJNuWDg/3ew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4B393C433E7; Wed, 23 Nov 2022 21:27:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 23 Nov 2022 21:27:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-4U0Thgemv5@https.bugzilla.kernel.org/>
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

--- Comment #272 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to Slawomir Stepien from comment #271)
> Created attachment 303265 [details]
> Add support for ROG STRIX B660-I GAMING WIFI
>=20
> This adds support for ROG STRIX B660-I GAMING WIFI into the "Asus WMI for
> nct6775 v6.0 base (2022.11.12)" patch.

Thank you! I will add your code to the next patch version.

Just for recheck, could you please share error place on init when you added
your board to asus_acpi_boards(x670 generation methods) or
asus_wmi_boards(b550/x570 generation methods)? Are both of methods of access
failed?=20

I have hoped B660 boards have same access method as x670 boards at least :-(

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
