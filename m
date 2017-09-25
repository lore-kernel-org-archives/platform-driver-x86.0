From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 11/12] platform/x86: dell-wmi-smbios: introduce character
 device for userspace
Date: Mon, 25 Sep 2017 19:58:03 +0300
Message-ID: <CAHp75Vewet4v-kwiEGd82XicaLv_XbNt6o6q+CVqYCUFnUg+oQ@mail.gmail.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <a7829a31691da18e4d28e0760645ca2a3f302b66.1505999739.git.mario.limonciello@dell.com>
 <20170925163150.GM22190@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:35547 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753950AbdIYQ6F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Sep 2017 12:58:05 -0400
In-Reply-To: <20170925163150.GM22190@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>, "dvhart@infradead.org" <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, quasisec@google.com

On Mon, Sep 25, 2017 at 7:31 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> On Thursday 21 September 2017 08:57:16 Mario Limonciello wrote:
>> This userspace character device will be used to perform SMBIOS calls
>> from any applications sending a properly formatted 4k calling interface
>> buffer.
>>
>> This character device is intended to deprecate the dcdbas kernel module
>> and the interface that it provides to userspace.
>>
>> It's important for the driver to provide a R/W ioctl to ensure that
>> two competing userspace processes don't race to provide or read each
>> others data.

>> +What:                /dev/wmi-dell-wmi-smbios
>
> What about just /dev/dell-smbios? IOCTL provided here is just SMBIOS
> related and I think userspace does not have to care if it is via WMI or
> direct SMM mode... Important is that it provides character device for
> SMBIOS API and not how it is implemented.
>
> Anyway, Darren, Andy, do we have some convention for naming platform
> character devices?

For me, looking to this case, seems better to expose a folder like
/dev/smbios/
with actual vendor device nodes inside like
/dev/smbios/dell

Darren?

P.S. Interestingly I wasn't in Cc list for this series at all.

--=20
With Best Regards,
Andy Shevchenko
