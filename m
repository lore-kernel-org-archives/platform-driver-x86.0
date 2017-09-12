From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v3] Add driver to force WMI Thunderbolt controller power
 status
Date: Tue, 12 Sep 2017 19:19:32 +0000
Message-ID: <b87be9373e9f4a1d8fc3b2bd36cb8801@ausx13mpc120.AMER.DELL.COM>
References: <1504884191-16528-1-git-send-email-mario.limonciello@dell.com>
 <20170911214458.GB128849@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa4.dell-outbound.iphmx.com ([68.232.149.214]:14344 "EHLO
        esa4.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750742AbdILTbp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Sep 2017 15:31:45 -0400
In-Reply-To: <20170911214458.GB128849@localhost.localdomain>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hughsient@gmail.com, yehezkelshb@gmail.com, mika.westerberg@linux.intel.com

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Monday, September 11, 2017 4:45 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.=
org;
> Richard Hughes <hughsient@gmail.com>; Yehezkel Bernat
> <yehezkelshb@gmail.com>; Mika Westerberg <mika.westerberg@linux.intel.com=
>
> Subject: Re: [PATCH v3] Add driver to force WMI Thunderbolt controller po=
wer
> status
>=20
> On Fri, Sep 08, 2017 at 10:23:11AM -0500, Mario Limonciello wrote:
> > Current implementations of Intel Thunderbolt controllers will go
> > into a low power mode when not in use.
> >
> > Many machines containing these controllers also have a GPIO wired up
> > that can force the controller awake.  This is offered via a ACPI-WMI
> > interface intended to be manipulated by a userspace utility.
> >
> > This mechanism is provided by Intel to OEMs to include in BIOS.
> > It uses an industry wide GUID that is populated in a separate _WDG
> > entry with no binary MOF.
> >
> > This interface allows software such as fwupd to wake up thunderbolt
> > controllers to query the firmware version or flash new firmware.
> >
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
>=20
> Queued for testing, thanks everyone.
>=20
> --
> Darren Hart
> VMware Open Source Technology Center

Darren,

Thanks.

FYI  to those that would like to test this, the associated userspace
code that is paired with this was just merged to fwupd master.
https://github.com/hughsie/fwupd/commit/8f17e1ccf4f68b3fb7015a41acc4cbb784c=
1f776

It's done in a way that if another GUID ever needs to be added for force-po=
wer
it will be no changes for userspace, and if another driver is introduced it=
 will
be minimal changes (what drivers the code matches on is hardcoded).

If you would like to experiment with it, instructions for building fwupd
are available here:
https://github.com/hughsie/fwupd/wiki/Compilation

If you find any problems, feel free to file an issue with fwupd on Github.

Thanks,
