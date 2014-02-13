From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] x86, acpi: LLVMLinux: Remove nested functions from
 Thinkpad ACPI
Date: Thu, 13 Feb 2014 11:03:44 -0200
Message-ID: <20140213130343.GA25725@khazad-dum.debian.net>
References: <1392238726-18787-1-git-send-email-dl9pf@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:48066 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753910AbaBMNDw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 13 Feb 2014 08:03:52 -0500
Content-Disposition: inline
In-Reply-To: <1392238726-18787-1-git-send-email-dl9pf@gmx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dl9pf@gmx.de
Cc: Behan Webster <behanw@converseincode.com>, David Woodhouse <David.Woodhouse@intel.com>, Matthew Garrett <matthew.garrett@nebula.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 12 Feb 2014, dl9pf@gmx.de wrote:
> From: Behan Webster <behanw@converseincode.com>
> The only real change is passing in event_mask to the formerly nested =
functions.
> Otherwise it's just moving around function and macro code.
>=20
> This is the only place in the Linux kernel where nested functions are=
 still in
> use. Nested functions aren't part of the C standards, and complicate =
the
> generated code. Although the Linux Kernel has never set out to be ent=
irely C
> standard compliant, it is increasingly compliant to the standard whic=
h is
> supported by other compilers such as Clang. The LLVMLinux project is =
working on
> being able to compile the Linux kernel with Clang. The use of nested =
functions
> blocks this effort.
>=20
> Signed-off-by: Behan Webster <behanw@converseincode.com>
> Signed-off-by: Jan-Simon M=F6ller <dl9pf@gmx.de>
>=20
> CC: David Woodhouse <David.Woodhouse@intel.com>
> CC: Matthew Garrett <matthew.garrett@nebula.com>
> CC: ibm-acpi-devel@lists.sourceforge.net
> CC: platform-driver-x86@vger.kernel.org
> CC: linux-kernel@vger.kernel.org

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
