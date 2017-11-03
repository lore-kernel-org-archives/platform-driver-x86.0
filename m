From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 2/4] platform/x86: topstar-laptop: change to generic module
Date: Fri, 3 Nov 2017 14:43:47 +0200
Message-ID: <CAHp75VcudfHAvAWqW67F0wfVO31vbdNjnpNmivyG5cqt0+tpbA@mail.gmail.com>
References: <cover.1509229280.git.gdouezangrard@gmail.com> <1e1492d958ec60dcd3b61d3269f0aa72cc9cc93e.1509229280.git.gdouezangrard@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f171.google.com ([209.85.220.171]:50187 "EHLO
        mail-qk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755802AbdKCMns (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2017 08:43:48 -0400
In-Reply-To: <1e1492d958ec60dcd3b61d3269f0aa72cc9cc93e.1509229280.git.gdouezangrard@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Guillaume_Dou=C3=A9zan=2DGrard?= <gdouezangrard@gmail.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Oct 29, 2017 at 1:51 AM, Guillaume Dou=C3=A9zan-Grard
<gdouezangrard@gmail.com> wrote:

I can't take it without commit message.

Basically it reverts the commit 15165594da65 ("topstar-laptop: convert
to module_acpi_driver()")

So, can you just try git revert and explain in a commit message "why
do we need it"?

--=20
With Best Regards,
Andy Shevchenko
