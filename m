From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Mark expected switch
 fall-throughs
Date: Wed, 1 May 2019 15:43:57 -0500
Message-ID: <e1199dfe-86fe-0e42-74c7-15adf0b54406@embeddedor.com>
References: <20190424181543.GA31200@embeddedor>
 <CAGXu5jKRO45m1TRDPA09sv0j+cZCC8e1w+oQty4YfOttKP3FYA@mail.gmail.com>
 <13ba6003-ff33-4e5b-b88e-ef93bc68dc48@www.fastmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <13ba6003-ff33-4e5b-b88e-ef93bc68dc48@www.fastmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: ibm-acpi@hmh.eng.br, Kees Cook <keescook@chromium.org>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org



On 4/24/19 7:55 PM, ibm-acpi@hmh.eng.br wrote:
> On Wed, Apr 24, 2019, at 16:05, Kees Cook wrote:
>> On Wed, Apr 24, 2019 at 11:15 AM Gustavo A. R. Silva
>> <gustavo@embeddedor.com> wrote:
>>>
>>> In preparation to enabling -Wimplicit-fallthrough, mark switch
>>> cases where we are expecting to fall through.
>>>
>>> This patch fixes the following warnings:
>>>

[..]

>>>
>>> Warning level 3 was used: -Wimplicit-fallthrough=3
>>>
>>> Notice that, in this particular case, the code comments are modified
>>> in accordance with what GCC is expecting to find.
>>>
>>> This patch is part of the ongoing efforts to enable
>>> -Wimplicit-fallthrough.
>>>
>>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>>
>> Reviewed-by: Kees Cook <keescook@chromium.org>
> 
> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> 

Thank you both, Kees and Henrique.

Friendly ping:

Who can take this?

Thanks
--
Gustavo
