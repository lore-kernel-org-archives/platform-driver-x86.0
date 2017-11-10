From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] platform/x86: pmc_atom: Fix parent clocks
Date: Fri, 10 Nov 2017 20:23:58 +0200
Message-ID: <1510338238.25007.149.camel@linux.intel.com>
References: <20171106141752.11827-1-andriy.shevchenko@linux.intel.com>
         <4e78970f-28b0-2357-b0ee-5bebc92856f1@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:59880 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751142AbdKJSYB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Nov 2017 13:24:01 -0500
In-Reply-To: <4e78970f-28b0-2357-b0ee-5bebc92856f1@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2017-11-06 at 10:59 -0600, Pierre-Louis Bossart wrote:
> 
> On 11/06/2017 08:17 AM, Andy Shevchenko wrote:
> > PLL or XTAL is a choice of parents. They are not dependent to
> > each other (direct citation):
> 
> On Baytrail the PLL takes the 25MHz xtal input and generates a 19.2
> MHZ 
> Mclk. they are related and completely dependent.
> 
> On Cherrytrail, the xtal is 19.2 MHz so there is no need for a PLL
> mode.
> 
> Not sure what you are trying to fix...


Okay, there are few issues with the PMC clock implementation.

Let's consider hardware part first.

While we are using the simplified clock tree representation here, as
shown below,

          .-----------.                .-----------------------.
  OSCIN   | XTAL      |                | PMC Platform Clock(s) |
  ------->|           |--------------->| Gate + MUX            |
          '-----------'                |                       |
              |                        |                       |
              |   .------------.       |                       |
              |   | LPPLL      |       |                       |
              '-->|            |------>|                       |
                  '------------'       |                       |
                                       '-----------------------'

in the reality it is a bit different (still simplified variant):

              .-----------.                .-----------------------.
  OSCIN       | XTAL      |                | PMC Platform Clock(s) |
  ----------->|           |--------------->| Gate + MUX            |
        |     '-----------'                |                       |
        |        |                         |                       |
        |        |    .----------------.   |                       |
        |        '--->| LPPLL          |   |                       |
        '------------>| (XTAL or OSCIN)|-->|                       |
                      '----------------'   |                       |
                                           '-----------------------'

It does not matter so much, except the thing how we choose clock source.

(...and we are moving toward software issues with clock framework...)

If XTAL and LPPLL output frequencies are the same, there is no
possibility to be sure which one is chosen right now (the order depends
on the clock framework implementation, which is obviously fragile).

On top of this ACPI tables for some boards provide PowerResource() with
mentioned clocks, where
  1) clock gating is handled when certain device is turning on or off;
  2) clock muxing.

Moreover, above two are done as independent operations, meaning that we
probably need to consider even more complex scheme for OS point of view:

 ---------      ----------
| CLK MUX | -> | CLK Gate |
 ---------      ----------

The issue is occurs in the AtomISP part, where the clock is chosen based
on source index using clk_set_rate().

The problem is, CLK framework doesn't allow in current scheme to choose
parent based on index (or I missed something), the frequency based
choice will not work on CHT where both sources have same frequency.

I have a patch which makes proper decision on BayTrail, but obviously
breaks CHT case.

With regard to this patch, indeed, partially it's wrong (there is a
relationship between XTAL and LPPLL), though LPPLL part is missed for
CHT and has to be added.

> 
> > 
> > 	The source of the frequencies can be XTAL or PLL, depending on
> > 	the configuration. Any of the two available frequencies can be
> > 	selected for each of the platform clocks.
> > 
> > According to datasheet on hand CherryTrail has them, though they
> > both
> > provide 19.2MHz frequency.
> > 


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
