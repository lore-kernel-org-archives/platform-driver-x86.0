Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62BBFA3743
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Nov 2022 11:48:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbiKALsM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Nov 2022 07:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbiKALrz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Nov 2022 07:47:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8A541B9FF
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Nov 2022 04:40:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7325160B2D
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Nov 2022 11:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7ABAC433D6
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Nov 2022 11:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667302832;
        bh=JTPYsyTTon96iRf5ZUuGhnkyeJyRPyW+L9sSB9GmjxM=;
        h=From:To:Subject:Date:From;
        b=cwzE8MgvvsxdvSSOQ6C35IT/pcmfgp8j3Eif0ngrENbJmh9oKA97rsZZbpJGeYvWi
         eCiAhEMXuQNNus/HM/MLpoWRUTL3hUv18GLMY6FLGsUfo4NXTKj0ragfbhupFdxqGu
         LjGtWB52B7tB4ZnYeDoydTf7WniNe99z1FZmtf/PKBq94B08bR6aeC98+V2qFxGL9g
         lN+sMmqaBb+TMBKbPY0M1/McFr3OBIJ0hWJJD/iNudmKo8h9teqze2nc2VCEshB74f
         LKV98FMtEnz5Sxwe8S68AfFcCzwby++zCc680z7wV6MiDPnTX22zHPrEnDz+YSrinO
         1NX2ra+k1QUfg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A48B3C433E6; Tue,  1 Nov 2022 11:40:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216647] New: first hibernate to disk fails on HP EliteBook 845
 G8
Date:   Tue, 01 Nov 2022 11:40:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216647-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216647

            Bug ID: 216647
           Summary: first hibernate to disk fails on HP EliteBook 845 G8
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.0.6
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: kolAflash@kolahilft.de
        Regression: No

Created attachment 303115
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303115&action=3Dedit
dmesg log (kernel.org 6.0.6)

On my HP EliteBook 845 G8 the first hibernate to disk after a fresh boot of=
ten
fails.

See attached dmesg log at position 141.752276.
The second hibernate to disk at position 161.315363 is successful.



=3D System =3D

Model: HP EliteBook 845 G8 (notebook)
CPU+GPU: Ryzen 5650U incl. Radeon GPU
Kernel: 6.0.6 compiled from kernel.org
OS: openSUSE-15.4
Memory: 64 GB
SWAP: 64 GB in a file: /swap

Partitions:
NAME                MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINTS
nvme0n1             259:0    0  1,8T  0 disk=20=20
=E2=94=9C=E2=94=80nvme0n1p1         259:1    0  512M  0 part  /boot/efi
=E2=94=9C=E2=94=80nvme0n1p2         259:2    0   16M  0 part=20=20
=E2=94=9C=E2=94=80nvme0n1p3         259:3    0    2G  0 part  /boot
=E2=94=94=E2=94=80nvme0n1p4         259:4    0  1,8T  0 part=20=20
  =E2=94=94=E2=94=80nvme0n1p4_crypt 254:0    0  1,8T  0 crypt /
(nvme0n1p2 is a "BIOS boot" partition)



Maybe related:
Bug 216516 - s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Bug 216574 - Hybrid System Suspend broken HP EliteBook 845 G8 (a.k.a. Hybrid
Sleep / s2both) (s2idle Notebook)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
