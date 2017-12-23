From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 0/2] platform/x86/thinkpad_acpi: Adjustments for four
 function implementations
Date: Fri, 22 Dec 2017 23:29:17 -0200
Message-ID: <20171223012917.vbe6mvz4yltiyws3@khazad-dum.debian.net>
References: <81459d11-693a-eb51-9173-9c189677f422@users.sourceforge.net>
 <CAHp75Vckgw1Eqao_vsq0n8RuYJRP2JZWJz6-MxZ6Wwb8eAEVgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Vckgw1Eqao_vsq0n8RuYJRP2JZWJz6-MxZ6Wwb8eAEVgA@mail.gmail.com>
Sender: kernel-janitors-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 19 Dec 2017, Andy Shevchenko wrote:
> On Mon, Dec 18, 2017 at 11:26 PM, SF Markus Elfring
> <elfring@users.sourceforge.net> wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Mon, 18 Dec 2017 22:23:45 +0100
> >
> > Two update suggestions were taken into account
> > from static source code analysis.
> >
> > Markus Elfring (2):
> >   Delete an error message for a failed memory allocation in three functions
> 
> This one is questionable since it prints error messages at ->init() stage.
> I would rather not touch this.
> 
> >   Improve a size determination in tpacpi_new_rfkill()
> 
> Doesn't make any sense right now. One style over the other.
> Nothing gets better or worth at this point.
> 
> Sorry, but NAK for both.

Agreed.  NAK from me as well.

-- 
  Henrique Holschuh
