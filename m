Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CA3C77B61
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Apr 2023 08:06:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233104AbjD0IGV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Apr 2023 04:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjD0IGU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Apr 2023 04:06:20 -0400
Received: from mout.web.de (mout.web.de [217.72.192.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9B92D65
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Apr 2023 01:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1682582769; i=julian.winkler1@web.de;
        bh=4ZpTu/chEBtSSu1PYcGkARxU3DEK4KYSWKhecH126/I=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Rs2E74cU6XHck9XdPTS+c4pGVroPkGSwRCAKTcIb8mPHPVNMHJzyIYgYyG0kDOJuS
         X9orTrb78g+PoZ7JImeOV+psd/i0w/GDcndI+9jypG46kTo6w5QSEq+Ja2QXxPKc4S
         YqNjtiEKnwORm3HXqXSNQitBwlL23LROwaEUTRMidej+BoMaBHtFg1iDLjxM2n07qB
         XEzFs6/t1boXoNzv3UK4ky4D2NUeT1GqlC45kFoHVR8+63O+YxlTUXq+w+q2WbyBMf
         lvI7/gli13lh56y/0nPITGPAaQkWVEsTKP2b9SaMlOZRFsnwAn9WTFKsW8VnJHwPHu
         e+N+aTRbcrCKQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [149.222.207.209] ([149.222.207.209]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Melax-1qSeRA1D1R-00aePe; Thu, 27
 Apr 2023 10:06:09 +0200
Message-ID: <046979a4-eade-00d8-c464-05b1df9633e6@web.de>
Date:   Thu, 27 Apr 2023 10:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] intel_scu_pcidrv: add back PCI id for Medfield
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20230416154932.6579-1-julian.winkler1@web.de>
 <6a2a97d9-140c-3e4f-aa12-c98f928f7481@redhat.com>
 <CAHp75VfFptZcJn7c_a2GLnSqJDXBwvUqWmu9Wb19a3VvwXJS5A@mail.gmail.com>
 <a52ab618-97ea-04ea-01e4-ecb673f45f09@web.de>
 <CAHp75VcGWo8YvHYOD19ECRDcF6D_yZB5oN24=aYgyFn5m8Kz=A@mail.gmail.com>
From:   Julian Winkler <julian.winkler1@web.de>
In-Reply-To: <CAHp75VcGWo8YvHYOD19ECRDcF6D_yZB5oN24=aYgyFn5m8Kz=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ewVLe35XSaYoJyFRyp6QZQQm57G35EovErpHfYrL+f7l5EyHaOm
 moJOL4FvcxUZE74l7TP6AoFxlQq5XUqMgcW4lYQe3j3jp6YKpq2de9SzyY60kwAXLP0YUMQ
 tmzk99IEHfMyWqFDNCvzFRjHxlvZzIX6cPuw3v9PepP97OA0/YkbielFWmEmIw0ShUQJjTv
 +ewrDN24EUa1ykSN17vmw==
UI-OutboundReport: notjunk:1;M01:P0:3bw05+UCcnA=;tSwzQljrefpSx9nCaah1GHU0JSQ
 1/YfAzA0HBsvONE5YHVDr4Z3FkznJhai+Jv60kRMd4fStSXwVsDKUeCYfOwA44habFLp65rUW
 cjrinNM9F7ZLOu4pxz0XTUqlxuRs/kVGYQgnOkQX4LiMgdfP1c1Gf3h4Bf/+VHCrfJ7P/fvo9
 OdFIGXAaMjV/5qFW4P2X48DDLZ+KfQr/aFkBF+9hYO+mR7RvzLTUccc0dFq9Inc/oUDATKWII
 EYZufsPnKEN7zgXdLqNu/Um2nAeGP8yMcp/fD9Bsv6BjAveq7VYnfmbzHUd4okPVa2SWqJO5S
 4YkBKSN5KvWRUFYcencHvsgRWhnnhYiD85uvwOXaU/9C3sw/riQXeOm+fqQy3lYsDwxhzNaH6
 AbwAX+/CHg1Y/i/u+NIlslxMEhhXv7f4XiYsCloFJQnjdJUUFrfryftvnK25/VOF8LQaTZK90
 gpOJpTzSHkLPUgzt6WX9iFvkwCiWbmxjk/rH8HWiw27y8Pi7vsNHLkt08l2M2NtDR4ktW60YM
 dYmnVhiVqdLZp6jBBl4tEiV6O5/goA0kiI3c6lWPSDfO9RJ80HFVlzOz/xUZegy/EWF+i/4YW
 qHsJcfZYnqu9yMFL/22ab8UpiOTofykO0/JjaedhA7GUvW14B5ZFnbXPmt8yzPuKSDO1FO+F5
 HdDWjVcaThrK0uTCH0d7Ih4uq0wkb1XbDvfuQK3P8zYwV7bygO3DCHnY96CHAbOLp3w1E/r4T
 Ks+4oeK7tJ9HKrrYJzjjfntO8GKHmI5QZNnwpxrmbjYfocP1X+7qjf5Ft525qheXJcXcM2S8Z
 6KkjvPoRlO2S9woQrBA1razk7xTVbqvXvgIWALEUWK8NE+4VCtPlY1QeqW0Qs//VkLmEVh8LV
 pNCx88XiAvzYeIEsq7lWuHIyDDUqQ5rgeAzNQFGOMZILZ2nhVnAZLcUQeBvCZciz+ZwE3nQAh
 QOplYQu93ZP+mzk5ehiakSFLd3k=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 25.04.23 21:02, Andy Shevchenko wrote:
> On Mon, Apr 17, 2023 at 4:02=E2=80=AFPM Julian Winkler <julian.winkler1@=
web.de> wrote:
>> On 17.04.23 12:16, Andy Shevchenko wrote:
>>> On Mon, Apr 17, 2023 at 1:11=E2=80=AFPM Hans de Goede <hdegoede@redhat=
.com> wrote:
>>>> On 4/16/23 17:49, Julian Winkler wrote:
>>>>> This id was removed in b47018a778c1a18cbc98b4a11936dec4f8c4bb7b, say=
ing it
>>>>> is only used on Moorestown, but apparently the same id is also used =
on
>>>>> Medfield.
>>>>>
>>>>> Tested on the Medfield based Motorola RAZR i smartphone.
>>>
>>> Wow! This is surprising.
>>> Can you tell more about your test environment? What is the Linux
>>> kernel version in use and what is the userspace (AOSP, Buildroot,
>>> Yocto, custom)? If custom, more details would be nice to hear.
>>
>> The test enviroment is postmarketOS. You can find more details on the
>> Wiki page
>> https://wiki.postmarketos.org/wiki/Motorola_RAZR_i_(XT890)_(motorola-sm=
i)
>>
>>>>> Signed-off-by: Julian Winkler <julian.winkler1@web.de>
>>>>
>>>> Hmm, so this is a former SFI platform, from your:
>>>> https://lore.kernel.org/all/20230223060107.23029-1-julian.winkler1@we=
b.de/
>>>>
>>>> patch I guess the plan is to use some custom bootloader
>>>> and then use x86 with devicetree support to replace SFI ?
>>>
>>> That would also be nice to hear in detail. With other Intel MID
>>> platforms the decision was made to pursue ACPI (and U-Boot, as an
>>> example) supports that for Intel Merrifield platform.
>>
>> I boot a 5.10 kernel, which still has SFI support, and from there I can
>> boot latest mainline kernel with petitboot, kexec and devicetree.
>
> Aha, but would it be possible to boot a U-Boot instead?

Having U-Boot support would be nice. But since I don't have a good way
to debug the boot procedure on my device and the 5.10 mainline kernel
just booted out of the box with working USB and eMMC drivers, it was a
much easier way to go.

>>>> Do you already have this working ?
>>>>
>>>> Sorry for all the questions for what is just a simple PCI-id
>>>> addition. I guess I'm worried this is just the tip of
>>>> the iceberg for getting medfield support back into
>>>> the kernel and I'm a bit worried about how much maintenance
>>>> work this will cause.
>>>>
>>>> E.g. also see commit e1da811218d2dc ("drm/gma500: Remove Medfield sup=
port")
>>>> which I guess you will want to see reverted too ?
>>>>
>>>> That is an example of a lot more code to bring back
>>>> then just a single PCI-id addition.
>>>>
>>>> Don't get me wrong I'm all for supporting older hw
>>>> if there are users who are interested in actively
>>>> maintaining support for it. I just want to get a feel
>>>> of the amount of work this is going to involve.
>>>>
>>>> Andy, Mika, any remarks ?
>>>
>>> I'm not against a patch if it helps existing users, but we need to
>>> understand first if it will be really helpful for upstream (taking
>>> into account 32-bit Intel MID support removal).
>>
>> My downstream kernel tree can be seen here:
>> https://gitlab.com/julianwi/linux-intel-medfield.
>
> Okay, I see that it doesn't have many patches, but it still has some
> code that won't be acceptable upstream. What I would suggest is to
> actually provide the ACPI tables rather than going Device Tree way.

The primary reason I chose to use devicetree was that the required
drivers already have devicetree bindings (maxtouch, max17042 and
wl1271). Also, I'm not really familiar with ACPI tables and don't know
if they are flexible enough for my purposes.

> Also note, that GPIO driver has to be integrated into gpio-pxa.c which
> is the historical parent IP of the Medfield case (it was a mistake to
> have a separate driver to begin with).
I have seen your the comment in 944dcbe84b8ab7efdfcc592b6905a797324da51c

> U-Boot would be ideal to have flashed there instead of so called
> bootstub (which is 4k or 8k blob to load kernel and initrd and pass
> the execution to it).

The bootstub is probably part of the "bos" partition, which also
includes the implementation of androids fastboot protocol, which I need
to reflash my device. Therefore I would rather not risk breaking it.

>> Indeed, I needed to
>> bring back some removed code to get the display working, but even
>> without display driver, old smartphones can be used as a server or
>> Raspberry Pi replacement.
>
> True.
>
> P.S. I'm on a long leave, but I can help you with the stuff to be
> upstreamed and tested, we still have a device available to test in our
> lab. Just see above.
>
