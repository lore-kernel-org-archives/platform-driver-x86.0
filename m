From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: platform/x86/thinkpad_acpi: Adjustments for four function
 implementations
Date: Fri, 22 Dec 2017 23:40:33 -0200
Message-ID: <20171223014033.jx7fzu7uzjfbzyca@khazad-dum.debian.net>
References: <81459d11-693a-eb51-9173-9c189677f422@users.sourceforge.net>
 <CAHp75Vckgw1Eqao_vsq0n8RuYJRP2JZWJz6-MxZ6Wwb8eAEVgA@mail.gmail.com>
 <ea910da9-ca59-b895-b071-35d9c5cbd112@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:40807 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1756729AbdLWBkh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Dec 2017 20:40:37 -0500
Content-Disposition: inline
In-Reply-To: <ea910da9-ca59-b895-b071-35d9c5cbd112@users.sourceforge.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, 19 Dec 2017, SF Markus Elfring wrote:
> >>   Delete an error message for a failed memory allocation in three functions
> > 
> > This one is questionable since it prints error messages at ->init() stage.
> > I would rather not touch this.
> 
> Do you find the Linux allocation failure report insufficient in this case?

Leave those pr_ messages alone, please, unless they are really causing
some sort of issue (which?).

> >>   Improve a size determination in tpacpi_new_rfkill()
> > 
> > Doesn't make any sense right now. One style over the other.
> > Nothing gets better or worth at this point.
> 
> Would you like to care for a bit more compliance with information
> from the section “14) Allocating memory” in the document “coding-style.rst”?

No, unless the change is actually fixing something, or gives us a
down-to-earth, *real* advantage of some sort.  In which case, the commit
message better do a rather good job of explaining it.

Doing it just for "compliance" with a doc isn't nearly good enough
reason.

-- 
  Henrique Holschuh
