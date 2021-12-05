Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA7EC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Dec 2021 16:13:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235821AbhLEQQv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Dec 2021 11:16:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234594AbhLEQQu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Dec 2021 11:16:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372E6C061714
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 08:13:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9E5E9B80ECC
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 16:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43967C341C4
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 16:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638720800;
        bh=r+bWTrIW0y3VZvAlAF6C2DZcIWL+En+5dM2bJVHAqJY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=EIvxTDc2hdSVlpfOLg86UFAbqGANkGQ7ixg8Qjt0zFDOnnyml0Kb6NimBcHbRL/3A
         V+rR1iIMRxtQGmVt0f3fyjAREiVwSq1/1W34mPtVIkWJ+khTYWRFgc3ubZ8unPDfb1
         x9QH8FLyJEtTZrrdRCmXempWYVlzowONep0H/ebrNMRT5j25gOj2Oq2Ow6qLqNXjsv
         2fEibe6DVIFXQnpkG5Q7XMZF/z37PVUJ9APykWov+NObPgws8L0AO4HR/rFgJNvrz1
         CD0UnuqlzmnvfJ0dZYAbkYZ9V6coUgDoTvVEnaXwEKltd5hA3Bn0vd/zPuOJ8LPtyC
         /oqf4VZEgEe+A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 36B0E611C1; Sun,  5 Dec 2021 16:13:20 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 05 Dec 2021 16:13:18 +0000
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
Message-ID: <bug-204807-215701-ShgqyjxQee@https.bugzilla.kernel.org/>
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

--- Comment #186 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to Mikhail from comment #185)
> (In reply to Denis Pauk from comment #181)
> > Created attachment 299887 [details]
> > Add X570-I mutex
> >=20
> > Could you check with updated patch?=20=20
>=20
> This patch is suitable for 5.16 rc3 right?
>=20
> Reversed (or previously applied) patch detected!  Assume -R? [n]=20
> Apply anyway? [n]=20
> 1 out of 1 hunk ignored -- saving rejects to file drivers/hwmon/Kconfig.r=
ej
> 73 out of 83 hunks FAILED -- saving rejects to file
> drivers/hwmon/nct6775.c.rej
> error: Bad exit status from /var/tmp/rpm-tmp.HxCCT9 (%prep)
>     Bad exit status from /var/tmp/rpm-tmp.HxCCT9 (%prep)

Patch is based on stable v5.15 kernel version. Could you check with v5.15
kernel version from kernel.org.

(In reply to Vladdrako from comment #184)
> No changes with the latest patch on old ASUS P8Z68-V LX. (sorry for post
> spamming, newbie here) Kernel 5.15.2 Manjaro.
> Attached DSDT dump and dmesg.
>=20
> [   11.103782] nct6775: Found NCT6776D/F or compatible chip at 0x2e:0x290
> [   11.103790] ACPI Warning: SystemIO range
> 0x0000000000000295-0x0000000000000296 conflicts with OpRegion
> 0x0000000000000290-0x0000000000000299 (\_GPE.HWRE) (20210730/utaddress-20=
4)

P8Z68-V is not in the list of supported boards, could you try add it to the
list (asus_wmi_info_table)?=20

If it does not help, could you attach dump of your bios? (acpidump -b -n DS=
DT).
I  assume that bios does not support WMI methods from that patch and need to
search fully different workaround.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
