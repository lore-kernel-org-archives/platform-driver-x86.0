From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 0/3] Dell Airplane Mode Switch driver
Date: Wed, 6 May 2015 14:57:44 -0700
Message-ID: <20150506215744.GA22096@fury.dvhart.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1430301066-22870-1-git-send-email-pali.rohar@gmail.com>
 <201505031238.14772@pali>
 <CAJ=jquY=QG9j1ppYBbbp5WQTVHVfsUHr8NjX5fuH+4mMWeEkdQ@mail.gmail.com>
 <20150506113119.GH30910@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150506113119.GH30910@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, May 06, 2015 at 01:31:19PM +0200, Pali Roh=E1r wrote:
> Looks like everything is OK. Test3 is expected to not work correctly =
as
> driver is not loaded...
>=20
> On Wednesday 06 May 2015 17:11:08 Alex Hung wrote:
> > The test was updated @
> > https://docs.google.com/spreadsheets/d/1voffS6dNglwAExSGh3UmG__UAO2=
qfZ829CkJLPo06aI/edit?usp=3Dsharing.
> > Please check the tab "Dell-rbtnv2"
> >=20
> > Notes:
> > 1. The systems come and go and I can find some of original ones but=
 I
> > tests some others
> > 2. Test 3 was done by Test 2 + "rmmod dell-laptop". All were run wi=
th
> > all wireless devices are ON
> >=20
> > Summary:
> > From external behaves such as Desktop's viewpoint (Unity was used a=
nd
> > hope that's not surprising), the wireless devices are ON/OFF
> > correctly. Other details are listed in the report.

What am I to make of Sheet1:Row25 vs. Row27?
This appears to me that for the Inspiron 3542, Dell Wireless for 3.16 h=
as a
functional soft block, while there is no change for Dell RBNT.

Rows36 and 37... these are tellin gme that the ARBT method is broken on=
 this
machine?

> --=20
> Pali Roh=E1r
> pali.rohar@gmail.com
>=20
