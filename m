From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform:x86: add Intel P-Unit mailbox IPC driver
Date: Wed, 26 Aug 2015 00:36:20 -0700
Message-ID: <20150826073620.GA105700@vmdeb7>
References: <1440176659-83769-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56986 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753974AbbHZHgW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 26 Aug 2015 03:36:22 -0400
Content-Disposition: inline
In-Reply-To: <1440176659-83769-1-git-send-email-qipeng.zha@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: platform-driver-x86@vger.kernel.org, fei.yang@intel.com, huiquan.zhong@intel.com, jason.cj.chen@intel.com, qi.zheng@intel.com

On Sat, Aug 22, 2015 at 01:04:19AM +0800, Qipeng Zha wrote:
> This driver provides support for P-Unit mailbox IPC on Intel platform=
s.
> The heart of the P-Unit is the Foxton microcontroller and its firmwar=
e,
> which provide mailbox interface for power management usage.
>=20
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>

Hi Qipeng,

0-day/lkp raised a couple of issues please review that report.

I immediately hit a build failure:

$ make allmodconfig
$ make drivers/platform/x86/intel_punit_ipc.ko

  CC      drivers/platform/x86/intel_punit_ipc.o
In file included from drivers/platform/x86/intel_punit_ipc.c:20:0:
=2E/arch/x86/include/asm/intel_punit_ipc.h:87:16: error: expected =E2=80=
=98=3D=E2=80=99, =E2=80=98,=E2=80=99, =E2=80=98;=E2=80=99, =E2=80=98asm=
=E2=80=99 or =E2=80=98__attribute__=E2=80=99 before =E2=80=98int=E2=80=99
 static intline int intel_punit_ipc_simple_command(int cmd,
                ^
=2E/arch/x86/include/asm/intel_punit_ipc.h:89:1: error: expected identi=
fier or =E2=80=98(=E2=80=99 before =E2=80=98{=E2=80=99 token
 {
 ^
=2E/arch/x86/include/asm/intel_punit_ipc.h:95:1: error: expected identi=
fier or =E2=80=98(=E2=80=99 before =E2=80=98{=E2=80=99 token
 {
 ^
scripts/Makefile.build:258: recipe for target 'drivers/platform/x86/int=
el_punit_ipc.o' failed
make[1]: *** [drivers/platform/x86/intel_punit_ipc.o] Error 1
Makefile:1550: recipe for target 'drivers/platform/x86/intel_punit_ipc.=
ko' failed
make: *** [drivers/platform/x86/intel_punit_ipc.ko] Error 2

--=20
Darren Hart
Intel Open Source Technology Center
