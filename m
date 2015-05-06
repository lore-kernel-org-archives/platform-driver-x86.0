From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 0/5] toshiba_acpi: Driver cleanup
Date: Wed, 6 May 2015 15:45:47 -0700
Message-ID: <20150506224547.GC22096@fury.dvhart.com>
References: <1430759758-4026-1-git-send-email-coproscefalo@gmail.com>
 <20150506060035.GB7523@vmdeb7>
 <CAGdLNWGxZ59RHuvqkjuXnMQELyh7BLsgO=NQi2U4-c9a+vRHxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48592 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751294AbbEFWps (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 May 2015 18:45:48 -0400
Content-Disposition: inline
In-Reply-To: <CAGdLNWGxZ59RHuvqkjuXnMQELyh7BLsgO=NQi2U4-c9a+vRHxw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, May 06, 2015 at 09:08:52AM -0600, Azael Avalos wrote:
> Hi Darren,
>=20
> 2015-05-06 0:00 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> > On Mon, May 04, 2015 at 11:15:53AM -0600, Azael Avalos wrote:
> >> These patches cleanup the driver from some no longer needed
> >> functions, renames hci_{read, write}1 functions, some comment
> >> blocks were changed, unneeded error checks removed and the driver
> >> version was bumped to 0.22.
> >>
> >> Changes since v1:
> >> - Added two new patches to the series, one containing error check
> >>   removals and another bumping the driver version.
> >>
> >> Darren:
> >> Sorry for this, I totally forgot to include the patch to remove
> >> the function error check :-(
> >> Now this patchset is complete now :-)
> >>
> >
> > So I'm a little confused :-) I have staged the patches locally as f=
ollows
> > (newest first):
> >
> > <top>
> > f6ea7d1 toshiba_acpi: Bump driver version to 0.22
> > dd8b682 toshiba_acpi: Remove TOS_FAILURE check from some functions
> > 60d9349 toshiba_acpi: Cleanup blank lines after comment blocks
> > c62377a toshiba_acpi: Rename hci_{read, write}1 functions
> > cbed7e3 toshiba_acpi: Remove no longer needed hci_{read, write}2 fu=
nctions
> > 8f163a9 toshiba_acpi: Remove bluetooth rfkill code
> > 0a4c28f toshiba_bluetooth: Change BT status message to debug
> > 3ad2df6 toshiba_bluetooth: Adapt *_enable, *_notify and *_resume fu=
nctions to rfkill
> > 9eb4797 toshiba_bluetooth: Add RFKill handler functions
> > 1ae8cb3 toshiba_bluetooth: Add a container struct named toshiba_blu=
etooth_dev
> > ...
> >
> > Is this what you had in mind?
>=20
> The BT code removal from toshiba_acpi should come first, then the rfk=
ill
> to the toshiba_bluetooth driver, then all the rest :-)
>=20

OK, please have a look at:

http://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git/sh=
ortlog/refs/heads/toshiba

This should everything I have pending from you. Please review and let m=
e know if
anything is missing. This will all got toward 4.2. Sorry about the mess=
=2E

  CC [M]  drivers/platform/x86/toshiba_bluetooth.o
In file included from include/linux/printk.h:275:0,
                 from include/linux/kernel.h:13,
                 from drivers/platform/x86/toshiba_bluetooth.c:17:
drivers/platform/x86/toshiba_bluetooth.c: In function =E2=80=98toshiba_=
bluetooth_sync_status=E2=80=99:
include/linux/dynamic_debug.h:64:16: warning: format =E2=80=98%llu=E2=80=
=99 expects argument of type =E2=80=98long long unsigned int=E2=80=99, =
but argument 3 has type =E2=80=98int=E2=80=99 [-Wformat=3D]
  static struct _ddebug  __aligned(8)   \
                ^
include/linux/dynamic_debug.h:76:2: note: in expansion of macro =E2=80=98=
DEFINE_DYNAMIC_DEBUG_METADATA=E2=80=99
  DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);  \
  ^
include/linux/printk.h:281:2: note: in expansion of macro =E2=80=98dyna=
mic_pr_debug=E2=80=99
  dynamic_pr_debug(fmt, ##__VA_ARGS__)
  ^
drivers/platform/x86/toshiba_bluetooth.c:158:2: note: in expansion of m=
acro =E2=80=98pr_debug=E2=80=99
  pr_debug("Bluetooth status %llu killswitch %d plugged %d powered %d\n=
",
  ^

Resolved with:

$ git diff
diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platfor=
m/x86/toshiba_bluetooth.c
index 220645a..c5e4508 100644
--- a/drivers/platform/x86/toshiba_bluetooth.c
+++ b/drivers/platform/x86/toshiba_bluetooth.c
@@ -155,7 +155,7 @@ static int toshiba_bluetooth_sync_status(struct tos=
hiba_bluetooth_dev *bt_dev)
        bt_dev->plugged =3D (status & BT_PLUGGED_MASK) ? true : false;
        bt_dev->powered =3D (status & BT_POWER_MASK) ? true : false;
=20
-       pr_debug("Bluetooth status %llu killswitch %d plugged %d powere=
d %d\n",
+       pr_debug("Bluetooth status %d killswitch %d plugged %d powered =
%d\n",
                 status, bt_dev->killswitch, bt_dev->plugged, bt_dev->p=
owered);
=20
        return 0;

If this is the change you would make, just ack this here and I'll roll =
it in -
I don't think I can handle another round of this series ;-)

--=20
Darren Hart
Intel Open Source Technology Center
