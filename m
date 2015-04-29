From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [PATCH v2 1/3] platform: x86: dell-rbtn: Dell Airplane Mode Switch driver
Date: Wed, 29 Apr 2015 20:11:38 +0200
Message-ID: <1486772.Mzcn6U37zk@xps13>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com> <1960842.uafsuQ5JOF@xps13> <20150429180018.GQ24346@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150429180018.GQ24346@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Hung <alex.hung@canonical.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wednesday 29 April 2015 20:00:18 Pali Roh=E1r wrote:
> On Wednesday 29 April 2015 19:54:43 Gabriele Mazzotta wrote:
> > On Wednesday 29 April 2015 18:28:40 Pali Roh=E1r wrote:
> > > On Wednesday 29 April 2015 15:57:58 Gabriele Mazzotta wrote:
> > > > On Wednesday 29 April 2015 15:08:40 Pali Roh=E1r wrote:
> > > > > On Wednesday 29 April 2015 12:30:32 Gabriele Mazzotta wrote:
> > > > > > On Wednesday 29 April 2015 11:51:04 Pali Roh=E1r wrote:
> > > > > > > This is an ACPI driver for Dell laptops which receive HW =
switch events.
> > > > > > > It exports rfkill device dell-rbtn which provide correct =
hard rfkill state.
> > > > > > >=20
> > > > > > > Alex Hung added code for supporting Dell laptops which ha=
ve toggle button
> > > > > > > instead HW slider switch. On these laptops toggle button =
event is reported
> > > > > > > by new input device (instead rfkill) as they do not have =
hw radio switch.
> > > > > > >=20
> > > > > > > It looks like those are two different functions (rfkill, =
input device), but
> > > > > > > Dell BIOS exports them via same ACPI device and uses same=
 ACPI functions.
> > > > > > > So code is in one kernel driver.
> > > > > >=20
> > > > > > I made a patch some time ago that I've just adapted. It all=
ows to
> > > > > > prefer RBTN_SLIDER over RBTN_TOGGLE. The main reason why I'=
d like to
> > > > > > have the hardware switch is that the BIOS doesn't alter the=
 soft state
> > > > > > of the devices. This comes in handy when the function key c=
ontrols
> > > > > > multiple radio devices.
> > > > > >=20
> > > > >=20
> > > > > Now I'm thinking... is't this bug in wifi kernel driver (whic=
h exports
> > > > > phy rfkill)? Or problem somewhere else (userspace or kernel)?
> > > >=20
> > > > What is the presumed bug you are referring to? The fact that th=
e soft state
> > > > doesn't change?
> > >=20
> > > Can you remind me whats the problem on your laptop?
> >=20
> > CRBT returns 0 (so RBTN_TOGGLE), but by default my laptop acts as i=
f
> > it returned 2 or 3, so we have to call ARBT.
> >=20
> > As said before, there's no way to know when a platform whose CRBT
> > method returns 0 or 1 also has the hardware switch, so to be sure t=
hat
> > all the platforms have working function keys, some of them (such as
> > mine) have to give up on the hardware switch.
>=20
> Ok, and what happens when you load this v2 version? What stopped work=
ing
> on your laptop?
>=20
> Alex, can you help? Code for toggle laptop version is originally your=
s.

When I press the Fn key, a _Qxx EC method is executed. The code path
of this method depends on a variable set by ARBT.

When you call ARBT with 1 as argument, the variable is set to 1 and the
_Qxx method does nothing but sending a notification (0x80) to RBTN
whenever the function key is pressed.

When you call ARBT with 0 as argument, the variable is set to 0 and
the _Qxx method both sends 0x80 to RBTN _and_ toggle the state of the
radio devices whenever the function key is pressed.

So in the end nothing _really_ breaks.
