From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform:x86: add Intel Broxton PMC IPC driver
Date: Wed, 20 May 2015 11:28:53 +0200
Message-ID: <20150520092853.GC22037@vmdeb7>
References: <1431958130-75816-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49653 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751504AbbETJ3B (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 20 May 2015 05:29:01 -0400
Content-Disposition: inline
In-Reply-To: <1431958130-75816-1-git-send-email-qipeng.zha@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "qipeng.zha" <qipeng.zha@intel.com>
Cc: platform-driver-x86@vger.kernel.org, fei.yang@intel.com, huiquan.zhong@intel.com, jason.cj.chen@intel.com, qi.zheng@intel.com

On Mon, May 18, 2015 at 10:08:50PM +0800, qipeng.zha wrote:
> From: "qipeng.zha" <qipeng.zha@intel.com>
>=20
> This driver provides support for PMC control on Broxton platforms,
> PMC is ARC processor which defined some IPC commands for communicatio=
n
> with other entities running in IA
>=20
> Signed-off-by: qipeng.zha <qipeng.zha@intel.com>

Please run through checkpatch.pl and correct errors.

Compilation fails:

  CC [M]  drivers/platform/x86/intel_pmc_ipc.o
drivers/platform/x86/intel_pmc_ipc.c:214:5: error: redefinition of =E2=80=
=98intel_pmc_ipc_simple_command=E2=80=99
 int intel_pmc_ipc_simple_command(int cmd, int sub)
     ^
In file included from drivers/platform/x86/intel_pmc_ipc.c:32:0:
=2E/arch/x86/include/asm/intel_pmc_ipc.h:63:19: note: previous definiti=
on of =E2=80=98intel_pmc_ipc_simple_command=E2=80=99 was here
 static inline int intel_pmc_ipc_simple_command(int cmd, int sub)
                   ^
drivers/platform/x86/intel_pmc_ipc.c:242:5: error: redefinition of =E2=80=
=98intel_pmc_ipc_raw_cmd=E2=80=99
 int intel_pmc_ipc_raw_cmd(u32 cmd, u32 sub, u8 *in, u32 inlen, u32 *ou=
t,
     ^
In file included from drivers/platform/x86/intel_pmc_ipc.c:32:0:
=2E/arch/x86/include/asm/intel_pmc_ipc.h:68:19: note: previous definiti=
on of =E2=80=98intel_pmc_ipc_raw_cmd=E2=80=99 was here
 static inline int intel_pmc_ipc_raw_cmd(u32 cmd, u32 sub, u8 *in, u32 =
inlen,
                   ^
drivers/platform/x86/intel_pmc_ipc.c:286:5: error: redefinition of =E2=80=
=98intel_pmc_ipc_command=E2=80=99
 int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
     ^
In file included from drivers/platform/x86/intel_pmc_ipc.c:32:0:
=2E/arch/x86/include/asm/intel_pmc_ipc.h:74:19: note: previous definiti=
on of =E2=80=98intel_pmc_ipc_command=E2=80=99 was here
 static inline int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 =
inlen,
                   ^
scripts/Makefile.build:264: recipe for target 'drivers/platform/x86/int=
el_pmc_ipc.o' failed
make[1]: *** [drivers/platform/x86/intel_pmc_ipc.o] Error 1
Makefile:1552: recipe for target 'drivers/platform/x86/intel_pmc_ipc.ko=
' failed
make: *** [drivers/platform/x86/intel_pmc_ipc.ko] Error 2

--=20
Darren Hart
Intel Open Source Technology Center
