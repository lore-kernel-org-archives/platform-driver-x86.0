From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 08/14] platform/x86: dell-smbios: Add a sysfs interface
 for SMBIOS tokens
Date: Thu, 5 Oct 2017 11:49:57 +0300
Message-ID: <CAHp75VdT5Dofm+O4cVfADhZu_PFB345-VNbc8os_c4qDaegB-w@mail.gmail.com>
References: <cover.1507156392.git.mario.limonciello@dell.com> <0af6d03ee32bd5c1529a38de008aa94c03331d7e.1507156392.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:50811 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751400AbdJEIt6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 04:49:58 -0400
In-Reply-To: <0af6d03ee32bd5c1529a38de008aa94c03331d7e.1507156392.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, mjg59@google.com, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>

On Thu, Oct 5, 2017 at 1:48 AM, Mario Limonciello
<mario.limonciello@dell.com> wrote:
> Currently userspace tools can access system tokens via the dcdbas
> kernel module and a SMI call that will cause the platform to execute
> SMM code.
>
> With a goal in mind of deprecating the dcdbas kernel module a different
> method for accessing these tokens from userspace needs to be created.
>
> This is intentionally marked to only be readable as root as it can
> contain sensitive information about the platform's configuration.
>
> MAINTAINERS was missing for this driver.  Add myself and Pali to
> maintainers list for it.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>

> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>

To be clear I just suggested the output format in ->show() callback.


-- 
With Best Regards,
Andy Shevchenko
