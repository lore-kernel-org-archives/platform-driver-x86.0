Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB8EC433DB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Jan 2021 22:27:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 591E4230FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Jan 2021 22:27:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730351AbhASW0x convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 19 Jan 2021 17:26:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:51344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729236AbhASW0l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Jan 2021 17:26:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4F27F23121
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Jan 2021 22:26:00 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Tue, 19 Jan 2021 22:25:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mail@richard-neumann.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199715-215701-waGMFEIV6n@https.bugzilla.kernel.org/>
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

--- Comment #48 from Richard Neumann (mail@richard-neumann.de) ---
$ cat /sys/class/dmi/id/product_name
HP ENVY x360 Convertible 13-ag0xxx

$ for file in /sys/bus/iio/devices/iio\:device0/in_anglvel_*; do echo
"$(basename "${file}"): $(cat "${file}")"; done
in_anglvel_hysteresis: 1.270000
in_anglvel_offset: 0
in_anglvel_sampling_frequency: 12.500000
in_anglvel_scale: 0.000174532
in_anglvel_x_raw: 0
in_anglvel_y_raw: 0
in_anglvel_z_raw: 0

$ for file in /sys/bus/iio/devices/iio\:device1/in_magn_*; do echo "$(basename
"${file}"): $(cat "${file}")"; done
in_magn_hysteresis: 1.270000
in_magn_offset: 0
in_magn_sampling_frequency: 12.500000
in_magn_scale: 0.000001000
in_magn_x_raw: 40
in_magn_y_raw: -14
in_magn_z_raw: -16

$ for file in /sys/bus/iio/devices/iio\:device2/in_accel_*; do echo "$(basename
"${file}"): $(cat "${file}")"; done
in_accel_hysteresis: 1.270000
in_accel_offset: 0
in_accel_sampling_frequency: 12.500000
in_accel_scale: 0.098066500
in_accel_x_raw: 0
in_accel_y_raw: -9
in_accel_z_raw: -5

$ for file in /sys/bus/iio/devices/iio\:device3/in_i*; do echo "$(basename
"${file}"): $(cat "${file}")"; done
cat: '/sys/bus/iio/devices/iio:device3/in_illuminance_hysteresis': Invalid
argument
in_illuminance_hysteresis: 
in_illuminance_offset: 0
in_illuminance_raw: 0
in_illuminance_sampling_frequency: 12.500000
in_illuminance_scale: 0.100000000
in_intensity_both_raw: 0
cat: '/sys/bus/iio/devices/iio:device3/in_intensity_hysteresis': Invalid
argument
in_intensity_hysteresis: 
in_intensity_offset: 0
in_intensity_sampling_frequency: 12.500000
in_intensity_scale: 0.100000000

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
