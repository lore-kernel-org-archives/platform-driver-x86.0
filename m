From: Sean Young <sean@mess.org>
Subject: Re: [RFC 1/5] platform-drivers-x86: add support for Technologic
 Systems TS-5xxx detection
Date: Tue, 17 May 2011 13:37:19 +0100
Message-ID: <BANLkTikPxfq4hcSLB+xkk-oJAtouNxEoyA@mail.gmail.com>
References: <1304115712-5299-1-git-send-email-vivien.didelot@savoirfairelinux.com>
	<1304115712-5299-2-git-send-email-vivien.didelot@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:33028 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754247Ab1EQMhV convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 17 May 2011 08:37:21 -0400
In-Reply-To: <1304115712-5299-2-git-send-email-vivien.didelot@savoirfairelinux.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: linux-kernel@vger.kernel.org, Jonas Fonseca <jonas.fonseca@savoirfairelinux.com>, platform-driver-x86@vger.kernel.org

On 29 April 2011 23:21, Vivien Didelot
<vivien.didelot@savoirfairelinux.com> wrote:
> From: Jonas Fonseca <jonas.fonseca@savoirfairelinux.com>
>
>
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
> =A0Documentation/ts5xxx-sbcinfo.txt =A0 =A0 =A0| =A0 47 ++++++
> =A0MAINTAINERS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A06 +
> =A0drivers/platform/x86/Kconfig =A0 =A0 =A0 =A0 =A0| =A0 11 ++
> =A0drivers/platform/x86/Makefile =A0 =A0 =A0 =A0 | =A0 =A01 +
> =A0drivers/platform/x86/ts5xxx-sbcinfo.c | =A0254 +++++++++++++++++++=
++++++++++++++
> =A0include/linux/ts5xxx-sbcinfo.h =A0 =A0 =A0 =A0| =A0 42 ++++++
> =A06 files changed, 361 insertions(+), 0 deletions(-)
> =A0create mode 100644 Documentation/ts5xxx-sbcinfo.txt
> =A0create mode 100644 drivers/platform/x86/ts5xxx-sbcinfo.c
> =A0create mode 100644 include/linux/ts5xxx-sbcinfo.h

Please note that the 2MiB on board flash is not supported by your
platform driver, which is handled by drivers/mtd/maps/ts5500_flash.c. I
guess it would be best to either merge that file into
drivers/platform/x86/ts5xxx-sbcinfo.c or select CONFIG_MTD_TS5500 in th=
e
Kconfig.

In addition, the flash is used by the BIOS as RFD FTL, so possibly
CONFIG_RFD_FTL should be selected too.

Thanks,
Sean
