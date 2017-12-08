From: <Mario.Limonciello@dell.com>
Subject: Multiple MOF GUID's
Date: Fri, 8 Dec 2017 19:30:42 +0000
Message-ID: <2c96ee1da98c41a1b8f905f00f2f5544@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa6.dell-outbound.iphmx.com ([68.232.149.229]:28811 "EHLO
        esa6.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753030AbdLHTao (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Dec 2017 14:30:44 -0500
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: luto@amacapital.net

Andy,

I was looking at a system that will have many more WMI methods, and realizi=
ng that I can't=20
view the bmof for the extra methods.  This is because of b0e863029 which wi=
ll show a warning
when multiple of the same WMI GUID's are found. =20
The same GUID 05901221-D566-11D1-B2F0-00A0C9062910 is used to describe each=
 one of them.

I think the symlinks in sysfs will break if the warning is just removed.

So what should we do about this?  I think they should both be accessible fr=
om the bmof driver from
userspace.


Thanks,
