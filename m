Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC178C6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Mar 2023 22:40:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbjCOWkZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Mar 2023 18:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232132AbjCOWkY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Mar 2023 18:40:24 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F22032B615
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Mar 2023 15:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1678919981; i=w_armin@gmx.de;
        bh=z/ZYg3V66zmImSou/dgJuLOV6WrEQKEqUSbk/cPE9oc=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
        b=MWqBTgjHD5IVa6ldlgPH7dU7g+7rJiei9aZT49DEJ7VYDUB5PvoyGf92Y4o+5kv55
         co6Uy/eDPFDgU15SrJVi3/FXCFeVTfF2jIFjgL8662D2BJDdYjV1oDEKU5AlI95MYK
         /gnMTy6Vg0Ehzbvr1HnlB3Ta95xDilMXCX6DSknP7W/6OEIOnGgyps2sJfaLqn3CTJ
         aSMAv9sRRjH9f/kzwD1LfxBk5Deh/8+0cURKywegCmhF8KHSJ+Ub7L+0zju2i62vCp
         NSlj8/h2UpjRz6mk/C+UD4e6uqAnVp3+HCIQ5MD7ES2EKvbTLoH8pX3GGkFSewAOnk
         X53jJ92Cm+aNQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MybKf-1qSd4S0yvV-00yxim; Wed, 15
 Mar 2023 23:39:41 +0100
Subject: Re: [PATCH 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
From:   Armin Wolf <W_Armin@gmx.de>
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, hdegoede@redhat.com,
        soyer@irl.hu
References: <20221004214332.35934-1-soyer@irl.hu>
 <20230310041726.217447-1-kallmeyeras@gmail.com>
 <20230310041726.217447-3-kallmeyeras@gmail.com>
 <91a25bfc-080d-b0e4-46cd-159bbf1346e8@gmx.de>
 <CAG4kvq8GMcw_ytss+e3y9nsaOAk9+m+TSnSBwcqdhqEOUJg_dQ@mail.gmail.com>
 <6592fd8f-f5fa-6144-e8eb-a9e701246ad7@gmx.de>
Message-ID: <ac9eb4b8-e4b8-c648-c322-c143631102ba@gmx.de>
Date:   Wed, 15 Mar 2023 23:39:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6592fd8f-f5fa-6144-e8eb-a9e701246ad7@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:rkq8MVfo5cWLsvHfrvAahmOHUYG1owHiUSuwpnv/L5ZPxU8U6IS
 zdGRS60f+/ubKkjG9B3tVWhm5BUY1ajyLOBjVSTMsNvxwbAy7bqEkxuLhtTvDTr/2l9yj81
 7mkntDv5/wcBm+CGkdkUDqxbj++7zEOrFpVjcvcCKPtAm+SLQ5n9KYgjRJj2LPxqrGdEtIo
 E1KtUVDOxHPRpQ1el5z2A==
UI-OutboundReport: notjunk:1;M01:P0:00uF+vKBFEE=;gowzJ+C7FnhCKoC0A7Z5++EJPsZ
 /AUNC9cLrLQ1zGXbQEjcWGiRR0NB1KZOOmlpgpPt4O/bPagD7tcfz0qQPZ23MoJIKmT0GtYzc
 yF0bGv8mNt9JAMhjeBpWNrc04+pQBPj5CG085KEtm5FiEOh6c8EOTzl55vIL45VC3xcc3AHS/
 Qhi1X3LN1n9UWjEyKQwjPRgVrEeIS0uFviaFNVu3rqMcN/3NM3voCXnjeawfap8Xc15F5mA74
 CeJWaxIEuKxtSt6cbH0sTm1DBCqYD9COFI32Eonb5cOj0od5pM1H/94uC7cP/bNd9EK2ymrcI
 uHZn/6y7m+RL0Jt92jg0yauo+5VuFRIJheICFnFkWehPDw2CgOs+mJBd17Ypzn69I0vIYYBA+
 cxPPLqrJYbBi9af2wSF+oOPCmCwvZmPn/qnbCAXSBZYllSZ/2Dc/35rhLvCPo/Qa4ruWSXPe7
 TZH4tcNLrQJbS9W6kort3H46q07+SQHpBaIwPA/kYYbVl5DD5nY6tY0ZFywFQQKMw3onCEF7s
 y8YI4tJ4BhwJbkobRukZJaZWqAhmT27TRl4c0dxJPiegOq/ADJoey4/nod+UHcNgRTEb4wgEY
 PIBuI9fxK9NMsiU4eTv/bTepU0GR/BbMYGJAgLMOWZUNToFz9Z+zltk5oqk+dKCAxkR3YA2yp
 hRzndU7ue4hM8aQ8+KmK32FMA5Wk5j+/6TyfCAeLpeidwOqgcCS7B5dmyQdS4SPtNX1iNbgi/
 wMyGmUB0CwJCg0P8B9aZz3WkIhQP5rIsX0XzdVRDUIbb5Mqt2iqKEMN8mwRv8fNNQI75c56sR
 In/yqGKXgYWd1dmcFaho54jwEojiD4+TiIqtCgTjAigG87okivig/lQ3v3p8LP4/R1Fj7uOvf
 GNQHof9E7e4bZ8BalgKeb3RO+lguaFi6eBVkLedGQEInFqfxfPjo0sCqGwpdmSY41i+es7at8
 FaT3XkicFsY0FgTWbEXOQjoLCns=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am 15.03.23 um 23:33 schrieb Armin Wolf:

> Am 15.03.23 um 04:37 schrieb Andrew Kallmeyer:
>
>> On Fri, Mar 10, 2023 at 2:28=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wro=
te:
>>> Hi,
>>>
>>> according to the embedded MOF data, the method id for retrieving the
>>> mode data
>>> is 0x1, not 0xAB.
>> Thanks! I can see from your earlier email in the other thread that
>> this is right. Strangely, when I tested 0xAB had almost exactly the
>> same behavior as 0x01. I think you're right though, I have updated my
>> local copy to 0x01.
>
> Hi,
>
> the reason for this is that most hardware vendors will omit any input
> checks
> if they think they are unnecessary. The WMI interface on my Dell noteboo=
k
> does the same, sadly.
>
>> I have also fixed the missing cleanup calls and
>>
>>> Using wmi_evaluate_method() is deprecated as WMI GUIDs are not
>>> guaranteed to be
>>> unique for a given machine. I think both WMI GUIDs should be handled
>>> by separate
>>> drivers, and the driver for the event GUID uses a notifier call
>>> chain to inform
>>> the driver for the data GUID that the usage mode changed, which then
>>> handles the
>>> input device stuff.
>>>
>>> This way the driver does not rely on deprecated WMI APIs, and
>>> everything would
>>> still work should Lenovo decide to duplicate some WMI GUIDs.
>> After reading many times, I believe I understand this and can figure
>> out the implementation. How should I attribute the commits? Should
>> this be a 3rd patch in a v2 patch series with myself as the author? Or
>> should these drivers be introduced in one commit without the
>> intermediate single driver that uses the deprecated API?
>
> I thing the new driver(s) should be introduced in one commit. I am not
> sure about the
> new author of the commit. If the original driver was significantly
> altered, then AFAIK
> you should be the new author. Still, the original author should at
> least be mentioned
> with a "Co-developed by" tag. You can then omit your "Co-developed by"
> tag.
>
> As a site note, i recommend to use the get_maintainer.pl scripts under
> scripts/ to find
> any additional maintainers which should be CC-ed. Since your patch
> series touches the
> ideapad-laptop driver, its maintainer (Ike Panhc
> <ike.pan@canonical.com>) should also be
> notified about this patch series.
>
I forgot to mention that your patches have to title, please add one for th=
e next revision.

Armin Wolf

>> Also have I correctly set Gergo as the commit author for this PATCH
>> 2/2 email like Hans said to? I wasn't sure if I had it right and I
>> could fix it in the v2 series.
>>
> You are still the author of the second patch. Also you should not send
> a patch series as
> a reply to any previous emails.
>
>>> acpi_dev_put() is missing.
>> Thanks! Not sure why I thought it was okay to delete lenovo_ymc_remove
>> but I have added that back in with the input_unregister_device call.
>>
>>> Maybe it would be beneficial to allow userspace to get the current
>>> usage mode without having
>>> to wait for an WMI event. This way, userspace could still react to
>>> situations like the device
>>> already being in tablet mode when this driver is loaded.
>> I'm not following how to implement this, not familiar enough with WMI.
>> Could you explain more?
>
> I meant that your driver should, after (!) setting up the input device
> and event handling, call
> sparse_keymap_report_event() with the code obtained from
> wmidev_evaluate_method() so that userspace knows about the initial state
> of the input device. You might also CC linux-input@vger.kernel.org for
> the next patch series, so that the input driver maintainers can also
> review your patch series.
>
>>> If the drivers handling the event and data GUIDs are fine with being
>>> instantiated multiple
>>> times, then adding the WMI GUIDs to the allow_duplicates[] list in
>>> drivers/platform/x86/wmi.c
>>> will allow the WMI driver core to handle duplicated event and data
>>> GUIDs.
>> Is there an easy way to test if it's fine to run multiple copies?
>> Currently testing by compiling the module with an inlined
>> ideapad-laptop.h out of the kernel tree and using the insmod command
>> to load it.
>
> Drivers can be instantiated multiple times, and each time their probe
> callback is invoked,
> and many older WMI drivers cannot do this, so the allowlist exists.
> The section "State Container" in
> Documentation/driver-api/driver-model/design-patterns.rst
> explains how to write drivers which can be instantiated multiple times.
>
> If your driver is not a singleton, i.e. it can safely be instantiated
> multiple times, then
> you can add its WMI GUID to the allowlist.
>
