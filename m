From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 1/3] platform: x86: dell-rbtn: Dell Airplane Mode
 Switch driver
Date: Wed, 29 Apr 2015 15:08:40 +0200
Message-ID: <20150429130840.GI24346@pali>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1430301066-22870-1-git-send-email-pali.rohar@gmail.com>
 <1430301066-22870-2-git-send-email-pali.rohar@gmail.com>
 <37641224.OJKZVtGCPV@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <37641224.OJKZVtGCPV@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Hung <alex.hung@canonical.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wednesday 29 April 2015 12:30:32 Gabriele Mazzotta wrote:
> On Wednesday 29 April 2015 11:51:04 Pali Roh=C3=A1r wrote:
> > This is an ACPI driver for Dell laptops which receive HW switch eve=
nts.
> > It exports rfkill device dell-rbtn which provide correct hard rfkil=
l state.
> >=20
> > Alex Hung added code for supporting Dell laptops which have toggle =
button
> > instead HW slider switch. On these laptops toggle button event is r=
eported
> > by new input device (instead rfkill) as they do not have hw radio s=
witch.
> >=20
> > It looks like those are two different functions (rfkill, input devi=
ce), but
> > Dell BIOS exports them via same ACPI device and uses same ACPI func=
tions.
> > So code is in one kernel driver.
>=20
> I made a patch some time ago that I've just adapted. It allows to
> prefer RBTN_SLIDER over RBTN_TOGGLE. The main reason why I'd like to
> have the hardware switch is that the BIOS doesn't alter the soft stat=
e
> of the devices. This comes in handy when the function key controls
> multiple radio devices.
>=20

Now I'm thinking... is't this bug in wifi kernel driver (which exports
phy rfkill)? Or problem somewhere else (userspace or kernel)?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
