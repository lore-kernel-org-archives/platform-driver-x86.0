Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8678C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:15:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79B40207B2
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:15:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbhAPUP1 convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 16 Jan 2021 15:15:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:47224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726201AbhAPUPZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 15:15:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 06B3B207B2
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 20:14:26 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Sat, 16 Jan 2021 20:14:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luya@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199715-215701-uipTsGtI87@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199715-215701@https.bugzilla.kernel.org/>
References: <bug-199715-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=199715

--- Comment #24 from Luya Tshimbalanga (luya@fedoraproject.org) ---
Testing the latest kernel 5.11.0-0.rc3.20210114git65f0d2414b70 snapshot with
amd_sfh module enabled:

lspci -knn
03:00.7 Non-VGA unclassified device [0000]: Advanced Micro Devices, Inc. [AMD]
Raven/Raven2/Renoir Sensor Fusion Hub [1022:15e4]
        Subsystem: Hewlett-Packard Company Device [103c:8497]
        Kernel driver in use: pcie_mp2_amd
        Kernel modules: amd_sfh

lsmod | grep amd
edac_mce_amd           90112  0
kvm_amd               380928  0
kvm                  2207744  1 kvm_amd
amdgpu              19922944  16
drm_ttm_helper         16384  1 amdgpu
ttm                   188416  2 amdgpu,drm_ttm_helper
iommu_v2               36864  1 amdgpu
gpu_sched              86016  1 amdgpu
i2c_algo_bit           28672  1 amdgpu
drm_kms_helper        638976  1 amdgpu
drm                  1359872  19
gpu_sched,drm_kms_helper,amdgpu,drm_ttm_helper,ttm
ccp                   274432  1 kvm_amd
amd_sfh                36864  0
pinctrl_amd            73728  1

modinfo amd_sfh
filename:      
/lib/modules/5.11.0-0.rc3.20210114git65f0d2414b70.125.amdsfh.fc33.x86_64/kernel/drivers/hid/amd-sfh-hid/amd_sfh.ko.xz
author:         Sandeep Singh <Sandeep.singh@amd.com>
author:         Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
license:        Dual BSD/GPL
description:    AMD(R) PCIe MP2 Communication Driver
rhelversion:    8.99
alias:          pci:v00001022d000015E4sv*sd*bc*sc*i*
depends:        
retpoline:      Y
intree:         Y
name:           amd_sfh
vermagic:       5.11.0-0.rc3.20210114git65f0d2414b70.125.amdsfh.fc33.x86_64 SMP
mod_unload 


monitor-sensors failed to detect sensor fusion

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
