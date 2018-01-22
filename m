From: Ivan Vecera <ivecera@redhat.com>
Subject: Re: [PATCH v2] platform/x86: mlx-platform: fix module aliases
Date: Mon, 22 Jan 2018 15:17:50 +0100
Message-ID: <c7478fd3-a77f-6ee3-674c-ef723f6cdc81@redhat.com>
References: <20180122101148.22135-1-ivecera@redhat.com>
 <AM4PR05MB333066D7C4F921EE90DAE360A2EC0@AM4PR05MB3330.eurprd05.prod.outlook.com>
 <CAHp75Vd2us0ytvkoAxUeo-gb8Y6siSV2mfDZZeQGYkGU5-8Hnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:44494 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750955AbeAVOSD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Jan 2018 09:18:03 -0500
In-Reply-To: <CAHp75Vd2us0ytvkoAxUeo-gb8Y6siSV2mfDZZeQGYkGU5-8Hnw@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Vadim Pasternak <vadimp@mellanox.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>

On 22.1.2018 12:48, Andy Shevchenko wrote:
> On Mon, Jan 22, 2018 at 12:23 PM, Vadim Pasternak <vadimp@mellanox.com> wrote:
> 
>>> +MODULE_DEVICE_TABLE(dmi, mlxplat_dmi_table);
>>
>> I am not sure about the location of MODULE_DEVICE_TABLE record.
>> Should it be placed at the end of the module or after mlxplat_dmi_table
>> declaration?
> 
> Yeah, it would be better.
> I dunno if Darren is going to ask for another version or fix this
> manually when apply.
> To be on the safer side, send a v3 with properly attached line as
> Vadim suggested.
> 
Will do.

Thanks,
I.
