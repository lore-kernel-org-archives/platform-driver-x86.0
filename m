From: Darren Hart <dvhart@infradead.org>
Subject: Re: [RFC 07/24] x86/thinkpad_acpi: Use arch_nvram_ops methods
 instead of nvram_read_byte() and nvram_write_byte()
Date: Wed, 3 Jun 2015 22:14:11 -0700
Message-ID: <20150604051411.GB31158@fury.dvhart.com>
References: <20150531010132.289674310@telegraphics.com.au>
 <20150531010134.129479218@telegraphics.com.au>
 <20150531041114.GA30431@khazad-dum.debian.net>
 <alpine.LNX.2.00.1505311605420.23528@nippy.intranet>
 <20150531143422.GA12337@khazad-dum.debian.net>
 <1433239768.902135.284523153.1200C3E3@webmail.messagingengine.com>
 <20150603033401.GB49670@vmdeb7>
 <1433327833.2629421.285594817.4B21A0BD@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1433327833.2629421.285594817.4B21A0BD@webmail.messagingengine.com>
Sender: linux-m68k-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Finn Thain <fthain@telegraphics.com.au>, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 03, 2015 at 07:37:13AM -0300, Henrique de Moraes Holschuh wrote:
> On Wed, Jun 3, 2015, at 00:34, Darren Hart wrote:
> > On Tue, Jun 02, 2015 at 07:09:28AM -0300, Henrique de Moraes Holschuh
> > wrote:
> > > Test results were sent to me privately, and they are correct, so...
> > 
> > Finn, unless there is some compelling reason not to - like they are MBs
> > worth of
> > data, please submit these to the list in the future so we have them for
> > reference.
> 
> After I told him which exact bitmask to use on a T43 to test
> hotkey_source_mask, his test results can be summarized as "I could see
> no difference in behavior", which is *exactly* what I expected to
> happen.
> 
> If anything went wrong with the thinkpad-acpi NVRAM code, you'd notice a
> very large change in behavior (typical: hotkeys don't work, less
> typical: random hotkey keypresses, hotkey press bursts, low responsivity
> of hotkeys).

Perfect, thanks for the update so we have it recorded here on the list.

-- 
Darren Hart
Intel Open Source Technology Center
