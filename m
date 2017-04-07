From: <Mario.Limonciello@dell.com>
Subject: dell-laptop and separate AC timeouts on some Dell systems
Date: Fri, 7 Apr 2017 19:33:53 +0000
Message-ID: <ac73b849a1de43b28ea87f92f4f95c1c@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa3.dell-outbound.iphmx.com ([68.232.153.94]:59202 "EHLO
        esa3.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S934248AbdDGTeP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Apr 2017 15:34:15 -0400
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: pali.rohar@gmail.com
Cc: platform-driver-x86@vger.kernel.org

Pali,

For some time there have been folks reporting some issues where keyboard ba=
cklight setting is failing on various Dell systems (https://github.com/dell=
/libsmbios/issues/3).  I've been circling around internally to find out wha=
t's going on.
This affects a number of systems from the last year or so.

What is happening is that some platforms support an alternate keyboard time=
out while on AC.  The old "timeout" value is treated as just a battery time=
out and the separate value is the AC timeout.
Unfortunately if the AC timeout is /not/ set in the timeout setting/update =
request, this will fail.

As a result I prototyped a few changes for this at the libsmbios branch her=
e: https://github.com/dell/libsmbios/commits/fix-g8-keyboard-backlight
It's not yet requested for merging because I still don't know why the reque=
st to supported features returns "Always On" still (that shouldn't be suppo=
rted).

As far as I can tell this doesn't really map well to how the keyboard backl=
ight driver in the kernel works today, so I wanted to raise this to you to =
discuss what the best way to handle it is.
One of these systems can be detected by the presence of the token 0x451.  W=
hen that is found, the additional timeout unit and value should be sent wit=
h the requests.

Can you let me know your thoughts?

Thanks,
