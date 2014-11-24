From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 1/3] platform: x86: dell-rbtn: Dell Airplane Mode Switch
 driver
Date: Mon, 24 Nov 2014 21:50:26 +0000
Message-ID: <20141124215026.GA14361@srcf.ucam.org>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1416755361-17357-2-git-send-email-pali.rohar@gmail.com>
 <20141124200905.GB3459@srcf.ucam.org>
 <201411242155.48087@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201411242155.48087@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 24, 2014 at 09:55:47PM +0100, Pali Roh=E1r wrote:

> This is complicated. HW switch controls all radio devices and you=20
> do not know which are present in specified running machine. Also=20
> list of devices which HW switch controls can be edited in BIOS=20
> (on some machines). So what to do? We only know that it controls=20
> some devices...

Typically there'll be a firmware method that provides a mask of the=20
controlled devices. Do you have the ACPI tables for a device that=20
implements this? Registering an rfkill interface that claims to only=20
control wifi but which also kills other devices is likely to confuse=20
userspace - it would probably be better to avoid registering the rfkill=
=20
interface at all in that case.

--=20
Matthew Garrett | mjg59@srcf.ucam.org
