From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/1] Use checkpatch.pl to make thinkpad_acpi.c error free:
 octal permissions
Date: Wed, 15 Nov 2017 13:02:52 +0200
Message-ID: <CAHp75Vd6Ryo4mqO7h6E10fnzp_tF+mtx70RqsSuVnUVhhzZOyw@mail.gmail.com>
References: <1510701276.9469.19.camel@k3saltt0>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:48001 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752289AbdKOLCx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Nov 2017 06:02:53 -0500
In-Reply-To: <1510701276.9469.19.camel@k3saltt0>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Simranjit Singh <simranjit.singh@corebaby.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Nov 15, 2017 at 1:14 AM, Simranjit Singh
<simranjit.singh@corebaby.org> wrote:
> From: Simranjit Singh <simranjit.singh@corebaby.org>
>
> Using the checkpatch.pl script, there were 8 errors in thinkpad_acpi.c. I fixed them by changing permissions to octal,
> and by adding parenthesis.
> On the current tree, if you use checkpatch.pl, thinkpad_acpi.c will have 8 errors. With my changes, there are 0 errors.
> However, I have added 3 new warnings.
> I'm very new to kernel development, so if I messed up somewhere, please do tell me.
>
> Changed binary permissions to octal in accordance with checkpatch.pl in thinkpad_acpi.c

Besides comments you got already, keep in mind that patch numbering
starts from 1, 0 is a special dedicated value for cover letter which
you apparently miss.
Of course, in case of this "series" you are not supposed to make it as a series.

And one more time, it's a contributor's responsibility to test (*)
changes before sending _by default _.

*) sometimes compilation test is enough, though most of the times the
real run would be required.

As per change 0 to 0444 for the cases you did, you obviously didn't
read the code and thus may not understand the ABI of this module.

So, obvious NAK for this patch.

-- 
With Best Regards,
Andy Shevchenko
