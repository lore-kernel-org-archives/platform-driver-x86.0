Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7036C77B73
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Apr 2023 07:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbjD0Hg0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Apr 2023 03:36:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242942AbjD0HgZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Apr 2023 03:36:25 -0400
Received: from mout.web.de (mout.web.de [212.227.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4643919AC
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Apr 2023 00:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
        t=1682580971; i=julian.winkler1@web.de;
        bh=nNnru1XxGO9ppFi+pKmDwEq3pB+TieckV0u3xv7DUwY=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=LWQnQlr/3vi5Xiu4v5Te73dI9lei0mw6Ab+vHmSBFQUbOKpnLmGTw0ou4JE6IEmP/
         2XnBwpRr18f2QGkgwJsTeuugmYS0xHfmLLULyvTYWhBHwW2zIKbU5IHAu3cTCsQxrI
         kGb01bLykbp62raFjZLItF98ikBiNOyI1aSoasAkVtLzHBHVH/EZrWDFy6uEo5C5+J
         3NHWoPQzVmtfIg8Pxhy7qNFRm6sybup5v2P0GFvyzl+UykhTRwsvdZ2crW911AH9Yc
         OiJIdhZghXjli9ov8i4LglcO5iq80AV92mrn/AGq1K2NePVpki45kzvdTG2xritHdp
         TtpvHlXV8YDpA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [149.222.207.209] ([149.222.207.209]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MEUW8-1q2Ncn3Do2-00GDJQ; Thu, 27
 Apr 2023 09:36:11 +0200
Message-ID: <dfa6be11-14e9-bb5c-a678-e1a1ab181a67@web.de>
Date:   Thu, 27 Apr 2023 09:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] intel_scu_pcidrv: add back PCI id for Medfield
To:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20230416154932.6579-1-julian.winkler1@web.de>
 <6a2a97d9-140c-3e4f-aa12-c98f928f7481@redhat.com>
 <CAHp75VfFptZcJn7c_a2GLnSqJDXBwvUqWmu9Wb19a3VvwXJS5A@mail.gmail.com>
 <a52ab618-97ea-04ea-01e4-ecb673f45f09@web.de>
 <51f19f59-b1ad-b813-afb9-cf0b58fef322@redhat.com>
Content-Language: en-US
From:   Julian Winkler <julian.winkler1@web.de>
In-Reply-To: <51f19f59-b1ad-b813-afb9-cf0b58fef322@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8y0gXNYqJ3SPtsCEmJgSeKWz0hutfxJzp8ljGvZZF1icTzCbDjF
 RoZ6OsJgUMQwUaFQBePADrBZsiWipIUPUUFZpGhF/p6oE+KG3HN9sMT9Iq0ZscfTDmElUGW
 Lce2DeA1fDwcdLYi/b9aUYFrBM95cf1QWXLwh1qmUT39aS2xAezwj69PBOmFI+/baWZxMDD
 SVC8S5XGvF07SnOxJyi6A==
UI-OutboundReport: notjunk:1;M01:P0:/VjIFTLHSLE=;pX5P3jw9tW7YsSvM4KzmkJ00fO5
 Y+M52vezLRXKnR3dPx1vGVsZ/Raf3rZiwwm7t7w1zHRD8jnQYVgHP3e83RMKshXCHQeqV2fHh
 gAIAp6uUbriTnv7Sv7DDUja585OaJZNkLGD5OsSvSOQClw0KVBJUpNI6sWrpfA1aDXhEWaHYA
 xsAnHv2YP0rWIBsXZ4ghQvyLlvwjs7VQDYRNsseocJD8ZK05+yT0L36VVaGts/xBz4UYr8/WA
 wR2Ou9H89xOTneaerXYQb5kqeyqfJFU27DM49B80OgDi5d4mVQOygSlU6DtdzlP3Vpkk2Ud9h
 hWhXXhUQSdj6+TcoFOCquxHeMLS0y5T0wfodUmnA0Yi63EYNMLWkxoXItdFDS0Ms894A6HTir
 /OtUmtFAN8NE1HsnAFZlmAKbHwoFdaKXFQT3MqPRasj7siIZBgTmfBDRsFIGjgWGrY4e1R9/7
 90kJhbuo7fKBDe8T7Ksw/JOu/6fi+YEJ47+v4Kj12IWfielgRINn6LedS/0Ejv4Ediz9bdOuP
 pmNhSVQ5zlB7bMndjcijY6Szj0+227fnDw8FYuCTfgKwP1o1ECHnKYOVsM47PWeLRM7IUF+mX
 jPjNnZ1BWc8DP1EifLEwWnors/25yuCMpuWCKuR7cEhZ3FPcBtDWdAPEYmFhgGD2EoDqQRaFh
 PwP5aUfgLYnvaZk4CZSOM4Cv0w5xqP6/qvxmplxqfSOH22NDrpVdYcSBQu71k0fH/HMXdLoFC
 76FXkgstM+5uefqi0QKuA5bDcU4w4IjBVTiQXKMoY0DcOD3F626Qt+yZSeEEgg2XsytV798ug
 6SUJ07+zOYJpLbVn8nLVO8osmQl1FCwbX7CZSLUSWzfQkO0YtAJry7p4e3rHD1VxxwvB583ZV
 rAjGpknR8lVh2Ez5paCagM5lkVFIKRh2FdqzLPajXH8PtjafBLwmo4tXAWAryz2FdGOgmKH5m
 WzU9tow3WJdRnOk69/bYxU40WvM=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 25.04.23 11:03, Hans de Goede wrote:
> Hi,
>
> On 4/17/23 15:02, Julian Winkler wrote:
>> On 17.04.23 12:16, Andy Shevchenko wrote:
>>> On Mon, Apr 17, 2023 at 1:11=E2=80=AFPM Hans de Goede <hdegoede@redhat=
.com> wrote:
>>>> +Cc Andy, Mika,
>>>
>>> Thanks for Cc'ing me.
>>>
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
> Nice, so AFAICT the old 5.10 kernel is hidden/abstracted away in pettit
> boot and the user just sees a bootloader-binary + mainline kernels.
>
> Interesting approach :)
>
>
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
> Ok, the amount of patches there does not look to bad. Although there
> are some patches which will need some work before they can be mainlined
> (e.g. the IRQ handling patches).
>
> So what is the long term end goal here. Do you want to get everything
> supported in mainline (sounds feasible to me), or are you just trying
> to reduce your delta to mainline so rebasing is easier ?

Actually I don't have a clear plan. I just thought I would start
submitting some of the trivial patches and see how far it goes. Sadly I
don't have always time to work on this project.

> I guess that for either goal you will want this patch merged and
> it is just a single line, so I'll go and merge this patch now.
>
> If you want to get as much in mainline as possible, I think it would
> be good to try and get the gma500 changes merged. That seems to be
> the biggest change when talking about lines of code. So if you get
> that in place then for discussions surrounding further patches you
> can say that your branch for this is just a couple of 100-s of lines
> code away from mainline and you would like to get those last 100-s
> of lines in mainline :)

I think the gma500 medfield code would need some more cleanups before
being suitable for mainline. It currently includes its own MIPI-DSI
implementation instead of using the available infrastructure in recent
kernel versions.

> Regards,
>
> Hans

Regards,
Julian
