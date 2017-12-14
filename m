From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-smo8800: Possible unnecessary 'out of
 memory' message
Date: Thu, 14 Dec 2017 20:02:45 +0200
Message-ID: <CAHp75VctF44XLjphF9Q23vnDdkGP5Vm70=perP5nms_WGzZMcw@mail.gmail.com>
References: <20171213082354.23273-1-dhaval.shah@softnautics.com> <20171213083053.mywa4bgv56daxud6@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:45357 "EHLO
        mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753698AbdLNSCq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Dec 2017 13:02:46 -0500
In-Reply-To: <20171213083053.mywa4bgv56daxud6@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Dhaval Shah <dhaval.shah@softnautics.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Dec 13, 2017 at 10:30 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wr=
ote:
> On Wednesday 13 December 2017 13:53:54 Dhaval Shah wrote:
>> Removed Possible unnecessary 'out of memory' message checkpatch warnings=
.
>> Issue found by checkpatch.

>> -             dev_err(&device->dev, "failed to allocate device data\n");
>
> Hi! Any particular reason for removing error message?

If you look into drivers/base/dd.c (real_probe() function IIRC) it
issues a warning when probe fails with error code.
So, basically all error messages in ->probe() are redundant (except
maybe those that prints more than error message itself).

--=20
With Best Regards,
Andy Shevchenko
