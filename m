Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C31C07548
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Nov 2023 08:45:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234687AbjKOIp6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Nov 2023 03:45:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234651AbjKOIp5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Nov 2023 03:45:57 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D18110E
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Nov 2023 00:45:54 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF9CEC433C8
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Nov 2023 08:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700037953;
        bh=Xfaao9T9X1/6OxbMInKFLNeyt04BaKuHO+sZH7uzUZg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZLqESVemzGtbRVH7gM48WWzm+85FRPW3HQV5rqp3yce8r/Lvgod2lHcwvSndkGg5w
         tXv5O8WsOUFfCmf07CMCRwQucoLkqfPMJuBY/8QSJVBh6r6siiy7oik7ahEGgcF000
         BlmCqTkztZDMvAHlMq8qBjIqYAnowe4+PSQ6JC3U2ki9wzAXhrtVm9shh3ZPsoRPwO
         dK4JWWczXpYf2sF0SBAUMlO0TN4xTCK2EbdwDsDo+PzGArJnzOkvfyfORz0pfE/vff
         fTcO9zxW/DgxCFL24wIo3ClFv6wLawlgPtmyvXRcLKJgFiB5NgrjeAPm6Q7fA2Uv4q
         9/zMHjSe+iLiQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C1264C4332E; Wed, 15 Nov 2023 08:45:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218143] platform/x86/intel/pmc: regression found in commit
 804951203aa541ad6720c9726c173d18aeb3ab6b
Date:   Wed, 15 Nov 2023 08:45:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jahutchinson99@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218143-215701-J0X71azty4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218143-215701@https.bugzilla.kernel.org/>
References: <bug-218143-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218143

--- Comment #2 from James (jahutchinson99@googlemail.com) ---
Hi David,

I've been testing your patch for removing GBE LTR ignore and it works perfe=
ctly
on my Intel NUC 8i3BEH.

The CPU on NUC 8i3BEH is as follows:

$ lscpu

Architecture:            x86_64
  CPU op-mode(s):        32-bit, 64-bit
  Address sizes:         39 bits physical, 48 bits virtual
  Byte Order:            Little Endian
CPU(s):                  4
  On-line CPU(s) list:   0-3
Vendor ID:               GenuineIntel
  Model name:            Intel(R) Core(TM) i3-8109U CPU @ 3.00GHz
    CPU family:          6
    Model:               142
    Thread(s) per core:  2
    Core(s) per socket:  2
    Socket(s):           1
    Stepping:            10
    CPU(s) scaling MHz:  100%
    CPU max MHz:         3000.0000
    CPU min MHz:         400.0000
    BogoMIPS:            6000.00
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr p=
ge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall =
nx
pdpe1gb rdtscp lm con
                         stant_tsc art arch_perfmon pebs bts rep_good nopl
xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl =
vmx
est tm2 ssse3 sdbg fma
                         cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe pop=
cnt
tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch
cpuid_fault epb pti ssbd ib
                         rs ibpb stibp tpr_shadow flexpriority ept vpid ept=
_ad
fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap
clflushopt intel_pt xsave
                         opt xsavec xgetbv1 xsaves dtherm arat pln pts hwp
hwp_notify hwp_act_window hwp_epp vnmi md_clear flush_l1d arch_capabilities
Virtualization features:
  Virtualization:        VT-x
Caches (sum of all):
  L1d:                   64 KiB (2 instances)
  L1i:                   64 KiB (2 instances)
  L2:                    512 KiB (2 instances)
  L3:                    4 MiB (1 instance)
NUMA:
  NUMA node(s):          1
  NUMA node0 CPU(s):     0-3
Vulnerabilities:
  Gather data sampling:  Mitigation; Microcode
  Itlb multihit:         KVM: Mitigation: VMX disabled
  L1tf:                  Mitigation; PTE Inversion; VMX conditional cache
flushes, SMT vulnerable
  Mds:                   Mitigation; Clear CPU buffers; SMT vulnerable
  Meltdown:              Mitigation; PTI
  Mmio stale data:       Mitigation; Clear CPU buffers; SMT vulnerable
  Retbleed:              Mitigation; IBRS
  Spec rstack overflow:  Not affected
  Spec store bypass:     Mitigation; Speculative Store Bypass disabled via
prctl
  Spectre v1:            Mitigation; usercopy/swapgs barriers and __user
pointer sanitization
  Spectre v2:            Mitigation; IBRS, IBPB conditional, STIBP conditio=
nal,
RSB filling, PBRSB-eIBRS Not affected
  Srbds:                 Mitigation; Microcode
  Tsx async abort:       Not affected

Do let me know if there's anything else you need me to test/verify.

Regards,
James.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
