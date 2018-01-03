From: Joe Perches <joe@perches.com>
Subject: Re: platform/x86/thinkpad_acpi: Adjustments for four function
 implementations
Date: Tue, 02 Jan 2018 16:49:43 -0800
Message-ID: <1514940583.31497.4.camel@perches.com>
References: <81459d11-693a-eb51-9173-9c189677f422@users.sourceforge.net>
         <CAHp75Vckgw1Eqao_vsq0n8RuYJRP2JZWJz6-MxZ6Wwb8eAEVgA@mail.gmail.com>
         <ea910da9-ca59-b895-b071-35d9c5cbd112@users.sourceforge.net>
         <20171223014033.jx7fzu7uzjfbzyca@khazad-dum.debian.net>
         <80ae8328-5851-01b0-cb31-474f7baf1686@users.sourceforge.net>
         <20180103001034.GC24794@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtprelay0021.hostedemail.com ([216.40.44.21]:57792 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750960AbeACAtr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Jan 2018 19:49:47 -0500
In-Reply-To: <20180103001034.GC24794@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, 2018-01-02 at 16:10 -0800, Darren Hart wrote:
> > > Leave those pr_ messages alone, please,
[]
> Andy and Henrique raised a few reasons why these patches should not be
> accepted:
> 
> 1. This is init code (so any space savings is short lived)

Not exactly true.

The object code itself is short lived, but the
string constant of the format is not as it is
placed in const and not discarded.
