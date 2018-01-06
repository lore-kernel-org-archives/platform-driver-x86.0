From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: platform/x86/thinkpad_acpi: Adjustments for four function
 implementations
Date: Sat, 6 Jan 2018 09:55:31 +0100
Message-ID: <edb7173f-c732-6934-9690-7831b3f993d8@users.sourceforge.net>
References: <81459d11-693a-eb51-9173-9c189677f422@users.sourceforge.net>
 <CAHp75Vckgw1Eqao_vsq0n8RuYJRP2JZWJz6-MxZ6Wwb8eAEVgA@mail.gmail.com>
 <ea910da9-ca59-b895-b071-35d9c5cbd112@users.sourceforge.net>
 <20171223014033.jx7fzu7uzjfbzyca@khazad-dum.debian.net>
 <80ae8328-5851-01b0-cb31-474f7baf1686@users.sourceforge.net>
 <20180103001034.GC24794@fury>
 <9ea2c1c7-a07d-19c3-a2dc-0c69352d9558@users.sourceforge.net>
 <20180106012634.GB5260@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.14]:64526 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752633AbeAFI4H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 6 Jan 2018 03:56:07 -0500
In-Reply-To: <20180106012634.GB5260@fury>
Content-Language: en-GB
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> If this was code that affected all systems, the impact would be greater
> - and it would be much easier to test.

I can follow such a view to some degree.
Would you dare to test the deletion of questionable error messages
more with any other software components?


> As it applies only to Thinkpad systems,

Are these models still popular enough in any areas?


> far fewer total systems are affected, and it is much harder to
> test/verify.

Do you care for the suggested transformation patterns (in principle)?


> If you feel that is the wrong call,

It seems that the usual indication was expressed for change resistance.


> you will need to present convincing evidence to Henrique that
> this is worth the risk.

Which risks have you got in mind for this small adjustment?


> … - or that it would be worth the effort.

Can a bit of “software fine-tuning” become useful also here?

Regards,
Markus
