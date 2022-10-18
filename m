Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7686C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 Oct 2022 20:31:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbiJRUbq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 18 Oct 2022 16:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiJRUbp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Oct 2022 16:31:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763754C2D4
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Oct 2022 13:31:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 104B56170E
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Oct 2022 20:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 745B7C4347C
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Oct 2022 20:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666125103;
        bh=XRSsi4GKDWi12v/CoCutjVCPiiEtpeCd75cvNiedL68=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hhYhxUfCu6tJNqJ4KUjm+pNkjsFspX8Xs72jIEWB+auzSfejPpLDl9GLVSVx+buHL
         ARNONRQNCh+ltN0mjSXo6lRgao21a+duAEkBQaiNChxg5TEhnvg/20IJcCiUIgOvjl
         2/3yBHAp0KiJtqsfQ5U5cV5XKej0npM1mdjeP6RM6IuAw5kB9heMD+odAtHnxi7S2S
         3miLffntyyJ57vmUFOFNckdqoemjaZ1moeWzpdxLdK8wfuLp62Dehb7MamP1veRlrd
         DyIUmzWgXKorRU01Q/SrNQ9NYQz6wieW0HayybqYb1zInwbzqotoah6dhCl3SQt+le
         BeBNFzkCjlisw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 63BDBC433EA; Tue, 18 Oct 2022 20:31:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 18 Oct 2022 20:31:41 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-yowK0rNizv@https.bugzilla.kernel.org/>
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

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #303000|0                           |1
        is obsolete|                            |

--- Comment #262 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 303031
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303031&action=3Dedit
Asus WMI for nct6775 v5.20 base (2022.10.18)

(In reply to Jure Repinc from comment #261)
> Created attachment 303020 [details]
> Asus P8H67 DSDT
>=20
> Is Asus P8H67 also a MB that could have support added?

P8H67 does not have support of WMI interfaces that currently used for ASUS
boards in kernel. Also it looks like access to nct6775 is not guarded by any
mutex locks in code section with sensors registers region. (It can be really
dangerous to use=20
 registers directly)

I have added use lock from different section that also used in other bioses=
 as
lock. Could you please check?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
