From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 06/12] platform/x86: dell-wmi-smbios: Add a sysfs
 interface for SMBIOS tokens
Date: Mon, 25 Sep 2017 20:04:21 +0300
Message-ID: <CAHp75Vd-mwn5O696XM7_F5-HMc2iztxibqQA0D4vOrMQO+WQRg@mail.gmail.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <1342f21a4f2c9af86d3033a9af9d9a4d05d27106.1505999739.git.mario.limonciello@dell.com>
 <20170925162333.GL22190@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:38067 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934032AbdIYREW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Sep 2017 13:04:22 -0400
In-Reply-To: <20170925162333.GL22190@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>, "dvhart@infradead.org" <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, quasisec@google.com

On Mon, Sep 25, 2017 at 7:23 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> On Thursday 21 September 2017 08:57:11 Mario Limonciello wrote:
>> Currently userspace tools can access system tokens via the dcdbas
>> kernel module and a SMI call that will cause the platform to execute
>> SMM code.
>>
>> With a goal in mind of deprecating the dcdbas kernel module a different
>> method for accessing these tokens from userspace needs to be created.
>>
>> This is intentionally marked to only be readable as root as it can
>> contain sensitive information about the platform's configuration.
>
> Darren, Andy, any comments? I'm not quite sure if such API is suitable
> for long term in kernel.

I would try to avoid sysfs interfaces for some particular devices.
Besides we are creating a character device. Would it be suitable there?

> Basically tokens are list of tuples <id, location, value> with
> possibility to active them, right?
>
> Does not kernel have some better API for it?

I think the best what kernel may provide is a CSV-like format with or
without title line and different delimiter (TAB/space/etc).

>
> Also, keep in mind security aspect of tokens. They represent e.g. boot
> order priority or enable/disable some machine peripheral.

For IOCTLs we may use capabilities.
In sysfs case we may zero output based on capabilities or some other factor=
s.

--=20
With Best Regards,
Andy Shevchenko
