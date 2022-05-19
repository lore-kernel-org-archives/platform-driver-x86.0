Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EA8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 May 2022 20:52:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241515AbiESUwH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 May 2022 16:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239388AbiESUwE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 May 2022 16:52:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7709558C
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 May 2022 13:52:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 69350B8288F
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 May 2022 20:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EC49C34114
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 May 2022 20:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652993520;
        bh=dLR1Fa8ellSWTcpuHUv7hJsBQYyLp6ZnM+XsP0x2AWQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jeytN9Zo7IWjpsYKUafWXRb7oZwIPIHWxmdJu0uveONLHu52H2xva9xIcJXhtFIPv
         OjFkgaUkyRbxUgOIgoLq8vLKj2HhJYyYoprstl+J3y+KhbWbtqA4P+jW2n61NGg1Wu
         WnwftrKUQ9EOxwPA50HzEe5kNM+ZFUylorFJPYOtlgebB0z0IR6i+NoiHV1/5P2hAU
         dNZI+nGLV5xXkzhj9T09vjJaOJYCXof7HOeQ4naWMGOsgzdLwpCmM3QraAQAewjUuU
         CTDzUUPmJyc2mHhskmHTrlYLTz+wq29xH4bcvh0CiH4AL3c4hTd1UB8UChdneppa41
         t1xnyZQ2w8HIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1E07CCC13B1; Thu, 19 May 2022 20:52:00 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 19 May 2022 20:51:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-MrGPcPoIAr@https.bugzilla.kernel.org/>
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

--- Comment #243 from Mikhail (mikhail.v.gavrilov@gmail.com) ---
(In reply to Denis Pauk from comment #242)
> Driver should be automatically loaded on next reboot after modules_instal=
l.=20

I expecting that default kernel package in my distro (Fedora Rawhide) alrea=
dy
have latest nct6775 driver. So didn't run make modules_install because it
unacceptable for a package based distribution (no one want that package bas=
ed
distro turns into Slackware).

> What do you have in dmesg after 'modprobe nct6775' or 'insmod
> <path>/nct6775.ko' ?

Modprobe looks good:
# modprobe nct6775

[   95.017206] nct6775: Using Asus WMI to access 0xc1 chip.
[   95.017239] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290

Driver is loading manually without any errors and sensors become show chips=
et
information.

But insmod unapplicable because in Fedora all modules is compressed:
# insmod
/usr/lib/modules/5.18.0-0.rc7.54.fc37.x86_64+debug/kernel/drivers/hwmon/nct=
6775.ko.xz=20
insmod: ERROR: could not insert module
/usr/lib/modules/5.18.0-0.rc7.54.fc37.x86_64+debug/kernel/drivers/hwmon/nct=
6775.ko.xz:
Unknown symbol in module

# depmod
/lib/modules/5.18.0-0.rc7.54.fc37.x86_64+debug/kernel/drivers/hwmon/nct6775=
.ko.xz=20
depmod: ERROR: Bad version passed
/lib/modules/5.18.0-0.rc7.54.fc37.x86_64+debug/kernel/drivers/hwmon/nct6775=
.ko.xz

# modinfo
/lib/modules/5.18.0-0.rc7.54.fc37.x86_64+debug/kernel/drivers/hwmon/nct6775=
.ko.xz=20
filename:=20=20=20=20=20=20
/lib/modules/5.18.0-0.rc7.54.fc37.x86_64+debug/kernel/drivers/hwmon/nct6775=
.ko.xz
license:        GPL
description:    Driver for NCT6775F and compatible chips
author:         Guenter Roeck <linux@roeck-us.net>
rhelversion:    9.99
depends:        hwmon-vid,wmi
retpoline:      Y
intree:         Y
name:           nct6775
vermagic:       5.18.0-0.rc7.54.fc37.x86_64+debug SMP preempt mod_unload=20
sig_id:         PKCS#7
signer:         Fedora kernel signing key
sig_key:        05:21:2C:F4:BE:27:02:E2:CE:C9:4F:8F:A6:94:3B:72:76:05:73:E1
sig_hashalgo:   sha256
signature:      A4:5D:3C:C7:5F:0F:4E:DE:D9:B5:D9:CC:8C:4A:FD:D5:9A:5A:53:F8:
                60:F8:AD:4D:93:26:31:6C:88:EF:FB:5C:96:34:FE:D1:FA:8A:15:5F:
                DE:8A:CA:02:1B:14:BB:FF:92:AE:F0:7E:98:61:8B:FD:BC:39:FA:5C:
                83:DD:1A:36:ED:E0:E7:C1:84:73:C7:1C:15:8E:50:8B:7A:10:CA:09:
                A2:CC:11:8E:D2:CF:63:94:56:A7:E4:C3:EC:19:0A:25:F6:19:B7:3C:
                1F:95:74:E6:C5:E0:B8:17:B3:C0:D0:3E:D7:93:F6:94:10:DB:17:BC:
                1D:DD:AF:EA:51:D6:A4:9B:83:F5:00:AF:96:EA:C0:E5:B2:E3:DA:97:
                5D:58:B9:6A:E5:8A:32:1A:EE:CD:17:04:6D:97:72:60:90:F2:B5:C4:
                DB:71:3A:45:FC:86:0E:1D:94:8F:98:5F:5C:C8:0E:48:99:7B:3E:BC:
                FA:07:01:2E:F8:45:E8:04:B0:A2:57:11:9B:B5:3A:C9:22:86:11:92:
                E2:5C:0D:91:7A:91:36:64:24:12:26:68:36:4F:AD:6F:C2:64:A7:DB:
                69:0E:D6:B5:A6:A2:21:BC:6F:4A:B1:6E:40:F4:33:15:8C:E4:CB:B0:
                09:B2:E7:8C:64:5A:67:30:50:05:A2:53:1D:7B:50:11:A1:25:67:5A:
                05:94:06:D7:74:D3:59:26:B0:B4:0E:72:9E:50:A7:68:E3:EC:0C:E4:
                75:26:20:33:77:0D:0A:C1:B7:29:98:D4:36:2E:E5:87:2F:9A:54:E5:
                51:13:A4:D0:A9:04:BC:48:DA:33:B7:33:08:F0:12:D9:55:03:E3:05:
                A4:0F:6A:6A:23:9D:92:A5:7E:72:BF:C3:73:FE:EF:4D:FD:2A:D2:4D:
                04:AE:77:EF:11:26:E4:AF:7F:16:8A:7B:0C:45:51:78:4B:2D:7B:3A:
                10:3D:E9:7E:19:45:8C:CA:74:A1:66:4B:EB:DC:F3:BC:DF:78:E8:EF:
                87:52:94:A6:C3:37:76:FB:3B:CE:1E:04:29:5C:AE:93:91:80:CC:57:
                8D:B5:63:E7:F8:6E:EC:5A:DE:62:56:E9:4B:18:50:20:58:A2:52:E0:
                F3:F5:DA:B2:28:9F:9C:8D:D7:FC:A8:90:67:BC:12:2D:E3:3C:57:02:
                3A:8D:B2:08:21:86:F6:D9:D2:BB:6C:39:A4:D8:B3:29:59:FC:24:00:
                64:C2:92:AA:1F:AA:33:43:9F:5F:1E:2E:95:0B:72:13:38:A2:DB:77:
                1F:00:86:78:D9:D2:AD:87:AA:9E:E4:6B:8D:80:8E:44:DC:EC:A8:92:
                02:86:3B:0F:0D:EA:4C:AD:A8:E4:50:0F
parm:           force_id:Override the detected device ID (ushort)
parm:           fan_debounce:Enable debouncing for fan RPM signal (ushort)


# uname -r
5.18.0-0.rc7.54.fc37.x86_64+debug

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
