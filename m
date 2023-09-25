Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CAC4CE7A89
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Sep 2023 09:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbjIYJMb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Sep 2023 05:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232653AbjIYJMU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Sep 2023 05:12:20 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3070419C
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Sep 2023 02:12:14 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCDF6C433C7
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Sep 2023 09:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695633133;
        bh=mNAKzI6ERmLAV2NlEeyuetw70T9ppq6d5mLhpfE9mIo=;
        h=From:To:Subject:Date:From;
        b=Sv9Y7m34rJagB5HboECezWlLaV/KARCIVZurc+3E1V/zOI58wPe+IIhvoPN5taXI3
         w7rGEmgiEbJALoAmlymU99wb5Kgq6lhGYEvwzobydWPLybYhOZfEGbVqjGo12ZQz+N
         Eq9jArQ1bJViqyuglwOu1OlOVQraUQeMkAIF0HYpnQglgRDpCfDmK36XB05IQPCnre
         L5ks1qIj3QANOCld5LLv4d4lp9kJlLxRCwYMmGb6XWWcPOMttfg5ZAd+jPDFWU0XKE
         uoawI2SlzymT2kga1ZOQQH+715yqug8Ymx2uUBHziUh0v1QdjdIhlJWJIJVi8DHGVm
         QpSnPvXVUdAUw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 956E7C4332E; Mon, 25 Sep 2023 09:12:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217947] New: WARNING at drivers/acpi/platform_profile.c:74 in
 platform_profile_show()
Date:   Mon, 25 Sep 2023 09:12:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jirislaby@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217947-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217947

            Bug ID: 217947
           Summary: WARNING at drivers/acpi/platform_profile.c:74 in
                    platform_profile_show()
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: jirislaby@gmail.com
        Regression: No

Downstream report:
https://bugzilla.suse.com/show_bug.cgi?id=3D1215602

LKML link:
https://lore.kernel.org/all/047d3c51-0a9e-4c3e-beef-625a7aa4f3c3@kernel.org/

according to logs, since 6.3 (up to 6.5.4 now), I repeatedly see:
> WARNING: CPU: 14 PID: 962 at drivers/acpi/platform_profile.c:74
> platform_profile_show+0xb1/0x100 [platform_profile]
> Modules linked in: ccm michael_mic ...
> CPU: 14 PID: 962 Comm: power-profiles- Kdump: loaded Not tainted
> 6.5.4-6-default #1 openSUSE Tumbleweed (unreleased)
> dd37106c593be78644bb80e3c1534d801bf4cb36
> Hardware name: LENOVO 21CRS0K83K/21CRS0K83K, BIOS R22ET60W (1.30 ) 02/09/=
2023
> RIP: 0010:platform_profile_show+0xb1/0x100 [platform_profile]
> Code: d0 a8 ...
> RSP: 0018:ffff9c1ac0b97db0 EFLAGS: 00010296
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000000008fc35be0
> RDX: 0000000000000000 RSI: ffff9c1ac0b97db4 RDI: ffffffffc0a8b0a0
> RBP: ffff8955ca540000 R08: ffff895b9f1ed180 R09: ffff895559ea1bc0
> R10: 00000000031a400e R11: 000000000003f680 R12: ffff895b9f1ed180
> R13: ffff9c1ac0b97e50 R14: 0000000000000001 R15: ffff9c1ac0b97ee8
> FS:  00007f71b0e71900(0000) GS:ffff895b9f100000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fe402ea3400 CR3: 000000012004c000 CR4: 0000000000750ee0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  sysfs_kf_seq_show+0xab/0x100
>  seq_read_iter+0x123/0x480
>  vfs_read+0x1b8/0x300

It's:
WARN_ON((profile < 0) || (profile >=3D ARRAY_SIZE(profile_names))))

So I put there one more print:
dev_warn(dev, "profile=3D%d profile_get=3D%ps\n",
         profile, cur_profile->profile_get);

and I see:
: profile=3D-1883022368 profile_get=3Ddytc_profile_get [thinkpad_acpi]
: profile=3D-1510173440 profile_get=3Ddytc_profile_get [thinkpad_acpi]
: profile=3D-1510173440 profile_get=3Ddytc_profile_get [thinkpad_acpi]
: profile=3D-966231712 profile_get=3Ddytc_profile_get [thinkpad_acpi]
: profile=3D-1578420592 profile_get=3Ddytc_profile_get [thinkpad_acpi]
: profile=3D-1578420592 profile_get=3Ddytc_profile_get [thinkpad_acpi]
: profile=3D-1578420592 profile_get=3Ddytc_profile_get [thinkpad_acpi]

I wonder about dev passed to dytc_profile_get() having empty name (nothing
before colon above)? Is that expected?

Ah, convert_dytc_to_profile()'s retval is not checked in
dytc_profile_refresh(). Adding:
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10418,7 +10418,14 @@ static void dytc_profile_refresh(void)
                return;

        perfmode =3D (output >> DYTC_GET_MODE_BIT) & 0xF;
-       convert_dytc_to_profile(funcmode, perfmode, &profile);
+       err =3D convert_dytc_to_profile(funcmode, perfmode, &profile);
+       if (err) {
+               pr_warn("%s: mmc=3D%u psc=3D%u mmc_get=3D%u funcmode=3D%d o=
utput=3D0x%x
perfmode=3D%d\n",
+                          __func__, !!(dytc_capabilities & BIT(DYTC_FC_MMC=
)),
+                          !!(dytc_capabilities & BIT(DYTC_FC_PSC)),
+                          dytc_mmc_get_available, funcmode, output, perfmo=
de);
+               return;
+       }
        if (profile !=3D dytc_current_profile) {
                dytc_current_profile =3D profile;
                platform_profile_notify();

fixes the warning, of course.

The output is:
dytc_profile_refresh: mmc=3D0 psc=3D1 mmc_get=3D0 funcmode=3D0 output=3D0x1=
f001
perfmode=3D15

So using psc mode, it retrieves DYTC (0x1f001) as follows:
0x1.... -> VSTD=3D1 -> STD mode
0x.f... -> CICM=3D0xf, DYTC_GET_MODE_BIT(12) -> dunno what it is in STD
0x..0.. -> CICF=3D0x0, DYTC_GET_FUNCTION_BIT(8) -> DYTC_FUNCTION_STD
0x....1 -> GOOD

But convert_dytc_to_profile() doesn't handle this at all. Do I have a newer
DYTC interface? Or a broken one?
                Case (0x00)
                {
                    Local1 =3D 0x0100
                    Local1 |=3D 0x80000000
                    Local1 |=3D 0x00
                    Local1 |=3D 0x01
                }

I.e. version 8.0, it seems.

My DYTC for CMD_GET looks like:
   Case (0x02)
   {
       Local5 =3D VSTD /* \VSTD */
       Local5 |=3D (VCQL << 0x01)
       Local5 |=3D (VSTP << 0x04)
       Local5 |=3D (VADM << 0x07)
       Local5 |=3D (VTMS << 0x09)
       Local5 |=3D (VDLS << 0x0A)
       Local5 |=3D (VMSC << 0x0C)
       Local5 |=3D (VPSC << 0x0D)
       Local1 =3D (CICF << 0x08)
       If ((CICF =3D=3D 0x03))
       {
           CICM =3D SMYH /* \SMYH */
       }
       ElseIf ((CICF =3D=3D 0x0B))
       {
           CICM =3D SMMC /* \SMMC */
       }
       ElseIf ((CICF =3D=3D 0x0D))
       {
           CICM =3D SPSC /* \SPSC */
       }
       ElseIf ((CICF =3D=3D 0x0F))
       {
           CICM =3D SAMT /* \SAMT */
       }
       ElseIf ((CICF =3D=3D 0x07))
       {
           CICM =3D SADM /* \SADM */
       }
       Else
       {
           CICM =3D 0x0F
       }

       Local1 |=3D (CICM << 0x0C)
       Local1 |=3D (Local5 << 0x10)
       Local1 |=3D 0x01
   }

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
