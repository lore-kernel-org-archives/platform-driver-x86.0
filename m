From: <Mario_Limonciello@Dell.com>
Subject: RE: [PATCH v2 0/1] Add new driver for AlienFX control
Date: Thu, 20 Feb 2014 17:55:30 -0600
Message-ID: <DB6E482E89290547898851B8CC9D811001394F2BA2@AUSX7MCPS302.AMER.DELL.COM>
References: <1391639904-3815-1-git-send-email-mario_limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausc60ps301.us.dell.com ([143.166.148.206]:27445 "EHLO
	ausc60ps301.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753445AbaBTXzc convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 Feb 2014 18:55:32 -0500
In-Reply-To: <1391639904-3815-1-git-send-email-mario_limonciello@dell.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: matthew.garrett@nebula.com
Cc: platform-driver-x86@vger.kernel.org

The LED subsystem maintainer thinks these should fit fine using LED sub=
system, so I reverted back to my previous implementation.
Mario Limonciello (1):=20
=A0 Add WMI driver for controlling AlienFX on Alienware=20
=A0drivers/platform/x86/Kconfig=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 15 ++=20
=A0drivers/platform/x86/Makefile=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0 1 +=20
=A0drivers/platform/x86/alienware-wmi.c |=A0 375 ++++++++++++++++++++++=
++++++++++++=20
=A03 files changed, 391 insertions(+)=20
=A0create mode 100644 drivers/platform/x86/alienware-wmi.c=20
--=20
1.7.9.5=20

Matthew,

Any feedback on my revisions to this driver?  Some user space tools sur=
rounding it will be developed and we would like to lock down the interf=
ace.

Thanks,
