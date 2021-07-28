Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0BDC4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 12:35:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEA8C60F9E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 12:35:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234966AbhG1MfY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Jul 2021 08:35:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:40708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234683AbhG1MfX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 08:35:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D3C9F60FA0
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jul 2021 12:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627475721;
        bh=AQv/2Z08XGNojt79i+NTR9DBkKjRdLfBwI1gFZxUWzY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XgP7hktP+dK3AzNn6ThCZM/MMF+EDXFplw16B4E12nQ4I7q4CLnfgCvorRoQYNr8C
         vOtpwI4h9t0BdgiJEPM8O5zZuKOZLRE4pfRxaR5Wsfl5DEvmx1Sy9EVEZEe2Os4yOj
         wOUVw4scBauWnlErR5Kh/+RoNAvcA1aRDX447g+3aIBp9TTTGYmh5d2yfx2GqHY4Qz
         Rkjnc/vIGa83z6lvBMoJFRtN/6M/b/k/RkWV7dZosX96tbVd79pQQFaH8YSzF3WTF4
         HrZLUwRn5c04gybAbgJiHSGM4NpFjEu6s4yeU+dGnzxumASsjb+EonTm56CBwRH6ih
         NNcmUAXISkaiA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 209011] asus-wmi always reports tablet mode on a ZenBook
 UX390UAK
Date:   Wed, 28 Jul 2021 12:35:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: julius@devpi.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209011-215701-qxuDihYycW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209011-215701@https.bugzilla.kernel.org/>
References: <bug-209011-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209011

--- Comment #10 from Julius Lehmann (julius@devpi.de) ---
Thank you so much for your reply, it was another device after all.=20
Very important detail!

I should add that in 5.10 the device wasn't even added, so this seems to be
originating from something different. Anyway, the DEVICE_ADDED is for an "I=
ntel
Virtual Switch".

Added the dmesg output and acpidump as attachments.

% ls-bus-iio
total 0
lrwxrwxrwx 1 root root 0 Jul 28 14:10 iio:device0 ->
../../../devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-4/i2c-BOSC020=
0:00/iio:device0
lrwxrwxrwx 1 root root 0 Jul 28 14:10 iio:device1 ->
../../../devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-4/i2c-BOSC020=
0:base/iio:device1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
