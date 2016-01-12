From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Tue, 12 Jan 2016 15:56:07 -0200
Message-ID: <1452621367.403228.490087522.151796A7@webmail.messagingengine.com>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20160111190411.GE10643@malice.jf.intel.com>
 <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
 <201601112103.01145@pali> <20160111211228.GA4171@sig21.net>
 <1452614830.376787.489968026.5FAEDB86@webmail.messagingengine.com>
 <20160112163514.GA24900@sig21.net>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160112163514.GA24900@sig21.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Johannes Stezenbach <js@sig21.net>
Cc: =?ISO-8859-1?Q?Pali=20Roh=E1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Pavel Machek <pavel@ucw.cz>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 12, 2016, at 14:35, Johannes Stezenbach wrote:
> On Tue, Jan 12, 2016 at 02:07:10PM -0200, Henrique de Moraes Holschuh
> wrote:
> > Is the ACPI AML for fn+space readable enough, or is it trapping directly
> > into SMM?  Because if it interacts with the traditional higher-level
> > ACPI AML we already use to talk to the thinklight (and now to the
> > backlight), it should be relatively easy to fix the driver to better
> > support the x230.
> 
> I have no clue about ACPI, do you have some hints
> how to get the info you want?  I found this:
> 
>   sudo acpidump > acpidata.dat
>   acpixtract -sSSDT acpidata.dat
>   acpixtract -sDSDT acpidata.dat
>   iasl -d DSDT.dat SSDT*.dat
> 
>   ..and then look at the .dsl files that contain the AML assembler. 
> 
> But what to look out for?

Well, you should familiarize yourself with ACPI AML a bit. Then, look
for the ACPI methods that thinkpad-acpi (and the patch to add backlight
support) calls, and try to work out how they work in your thinkpad.

Typical thinkpad firmware behavior is to sometimes have a lower level
implementation, a higher level ACPI API that the O.S. is supposed to
call (and which will call into the lower level implementation, or to the
work itself).

We want to stick to the higher level API, as it is more stable.  Use of
lower-level APIs or direct EC access must be whitelist-restricted.

> PS: failed to mention my x230 kernel was still 4.2.x in case it matters

It doesn't.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
