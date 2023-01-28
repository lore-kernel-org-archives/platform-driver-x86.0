Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B500C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Sat, 28 Jan 2023 17:52:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbjA1Rwf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 28 Jan 2023 12:52:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231350AbjA1Rwe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 28 Jan 2023 12:52:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C987C222E2
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Jan 2023 09:52:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 73ECBB80B8E
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Jan 2023 17:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29685C433A0
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Jan 2023 17:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674928351;
        bh=LoVRQbkCOMsBQVVkMNVkR/zaAAyVGD+39dS0sT9I8nA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Gf3erlkEO0YPQvYS4CCvnTBDmCBk54scEoaK1GNjIYjGt+Xf4DvnEhNf7FkLMlZUG
         O0g83zWDzpi3b5hTdd0/KT+7mbUNnyD1qEwQckKaAY2914ucdsUVwZNUH2gV/IqDmb
         ZD4XXgSNuKeT3b2tTBfETjHBiExEaZnEOi2CmskA8Mb8GFLAHMTvTK5/s1RCyC4BPs
         qc4TkXTHqPYpz2peFvRoVfxsNglu2se07S5Bs/U/v2ujlMEMY0zjultDOoO46UUwDz
         ttqdCcKSbNCil9yDSx4/sczE5VgqoPB/4w28fJ3RBbJnLbhaMLPHMUsYY8oXBA3LZc
         2xg8eQeyq6HDw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0BDBCC43145; Sat, 28 Jan 2023 17:52:31 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 28 Jan 2023 17:52:27 +0000
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
Message-ID: <bug-204807-215701-7Qk7Kdoew5@https.bugzilla.kernel.org/>
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
 Attachment #303655|0                           |1
        is obsolete|                            |

--- Comment #288 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 303660
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303660&action=3Dedit
Asus WMI for nct6775 v6.1 base (2023.01.28)

(In reply to Robert Kling from comment #287)
> Created attachment 303659 [details]
> dsdt.dat Z170 PRO GAMING/AURA
>=20
> Hello, would it be possible to add support for Asus Z170 PRO GAMING/AURA?
>=20
> cat /sys/class/dmi/id/board_name:
> Z170 PRO GAMING/AURA

Could you please check now? There will be used mutex lock for access to
sensors.=20

Note, i have also checked such boards and it will be without support in any
currently known way as no mutex used inside access methods:
* Z170I PRO GAMING
* B150I PRO GAMING/WIFI/AURA
* B150I PRO GAMING/AURA=20
* Z97-PRO GAMER (no definition like nct6775 sensor)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
