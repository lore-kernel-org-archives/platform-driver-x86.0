Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F2CC7618B
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Mar 2023 12:40:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbjCQMko (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Mar 2023 08:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbjCQMkk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Mar 2023 08:40:40 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9285F49F5
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Mar 2023 05:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1679056755; i=w_armin@gmx.de;
        bh=vr2qw5eGMHOa9F94l09N6ctZ1GcJr7UZeJrIVAa2KTI=;
        h=X-UI-Sender-Class:From:Subject:To:Cc:References:Date:In-Reply-To;
        b=IEmy1pjgYx2jg+GDqlYIha7stm828DwNJFV8Kk/cdCsrulS8+86jy2ATP0kc2zjzh
         yvD7rAwZvJY094ht4YraD7yF6ntlt6Dm/Ff4d9aFljTEoy0H0nKUk/KlcZnECSqplQ
         GLLnQ3ir0AIyakNztrcBr1gKAzisOsypG0kooDrgOHmV7Z+z1ATohyu3Jggi9zvvgs
         UgQjQciYXMHMIiRejCSCWgyaG7yeM3ThIPPIhesT4r+ficPI+/vFdMpaJJ74VMVfLT
         BnafB84HYxGKfAT5jBThR6FN2Qcur8EQ/A+TIXEulMkUye0BnUwbm3EVouuD5G4kUM
         l0sWFfbKAeW+Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.44.72] ([185.238.219.83]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnJlW-1qKDPK3f0O-00jG1o; Fri, 17
 Mar 2023 13:39:15 +0100
From:   Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
To:     Hans de Goede <hdegoede@redhat.com>,
        Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, soyer@irl.hu
References: <20221004214332.35934-1-soyer@irl.hu>
 <20230310041726.217447-1-kallmeyeras@gmail.com>
 <20230310041726.217447-3-kallmeyeras@gmail.com>
 <91a25bfc-080d-b0e4-46cd-159bbf1346e8@gmx.de>
 <CAG4kvq8GMcw_ytss+e3y9nsaOAk9+m+TSnSBwcqdhqEOUJg_dQ@mail.gmail.com>
 <6592fd8f-f5fa-6144-e8eb-a9e701246ad7@gmx.de>
 <d00fbe99-6c82-ddfc-4e12-3dcb01eda0a6@redhat.com>
Message-ID: <9b51d06c-d7b4-3886-4476-1c37f9400c62@gmx.de>
Date:   Fri, 17 Mar 2023 13:39:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d00fbe99-6c82-ddfc-4e12-3dcb01eda0a6@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:NkqgPpHyx9xS2yL5ZcSTjuni5j6I6ahiq4rrdZOoceOcvDmD2WN
 uuhP1xChiqL1RLO9eLbWytVxVK/STygN/cMR/FdCIPiv3izA6QKxQ/6oZp7DPTZbHlawyiY
 B/8TaNK/B32gjItFwXhbLT5KxLJnn88UY0IRAL2BL8Rl3OzZOqXE2RNnNqL8GTqilFGmh0Y
 x8KaZVwc4e8zLVAsNcNgw==
UI-OutboundReport: notjunk:1;M01:P0:XzHSf31lHf4=;wUsPLpKmkvC85wzpcx+bOVeiy+A
 4FCGFBsmoQatmEfNaFwPuxc++zTSfTZ8oGRiPwg6ojanlHtF2eZrBxpRp9rMxQ8aEWJ4dEVoN
 xZk6+2GdwmQvZz2tOANfQg7xnNmHxgUW6Pr3/l67g8RmY2/wnB6VmZs5HD/smJa93CrWalYme
 HxZ4wWBdsY1RCydfT5jr5STxgNJFdVOhk9wD4ZCJC5MlQWYVP2lqoqrMBPePRnxZ75thCpUh2
 WK12BW/BtufTj6IF2BmWD1Ln4e6965+PVKt3Pt0zfoAvGaIB7INT1QP0SbNtvXsHFHqhYOWfb
 UdclNx6cT4KPI3uF5ojg+YLPm20GXdNgCl99ShcazfoWoDotCD4DbchAJ2m5bYe1Oerw0zHPf
 67CT4VT5ZAjIh2jVzUDZT/BniLp7rAuD9lceweQqeNnQ6bwANgQlhcqdLZ+JHMQLiZKH+w86H
 mqPielG6YsCLuSVO/FPHcd70xvBLgUDnF3YBbdhZx9q6sd/+zUgn5l0GH5k3UGJ6dMlQhSyjk
 V1x7N68dSWLtXX6sSkevKMNTN7pxwD+YW7bQncBkXlIl9Wr83eiCPJMapE0Oaxz78U9E2mjzj
 iXg6fSCSjREep8vuxWPZpJJiJxU0vMMHRkEba2+7Qx9GUE/KduUckzJkWg1lyiD0i+oY4C4p2
 rYXgvdiQF3K1LxSCDjlgyVixe7c7N9ozoIHQRSrTPae5l63pUtvjwMb2xCSS8m9M4tKsKrMpq
 C89ruF3WCgxK1b05XNeOJljV2oCBvjgQKxxLmJJrg2ZAR6iwOvyL14QeYE7TelLzhQLnFVgHC
 iWK19auf5f+YzvMlJ56HZw15PQXdt0xsYvRDZH5BR4W3ZEU0Z7x4nRz9KY/pRvg8/XWfueIGX
 qHS29pqBnVD+Ib3YT9NstQ1iXjnvaYXm53prDreNRhLUt00BLMJrl883FzTDSfL0R3Ifjsxg5
 Pzgc9eC/MFh8QPeHAwheBEDw/IX8yJbsur3BDQbxZDcBGeXG
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am 16.03.23 um 10:00 schrieb Hans de Goede:

> Hi,
>
> Sorry for being a bit late with replying.
>
> Andrew, thank you for your work on this, at a quick glance it looks grea=
t.
>
> Armin, thank you for your help / input on this.
>
> On 3/15/23 23:33, Armin Wolf wrote:
>> Am 15.03.23 um 04:37 schrieb Andrew Kallmeyer:
>>
>>> On Fri, Mar 10, 2023 at 2:28=E2=80=AFAM Armin Wolf<W_Armin@gmx.de>  wr=
ote:
>>>> Hi,
>>>>
>>>> according to the embedded MOF data, the method id for retrieving the =
mode data
>>>> is 0x1, not 0xAB.
>>> Thanks! I can see from your earlier email in the other thread that
>>> this is right. Strangely, when I tested 0xAB had almost exactly the
>>> same behavior as 0x01. I think you're right though, I have updated my
>>> local copy to 0x01.
>> Hi,
>>
>> the reason for this is that most hardware vendors will omit any input c=
hecks
>> if they think they are unnecessary. The WMI interface on my Dell notebo=
ok
>> does the same, sadly.
> Ack.
>
>
>>> I have also fixed the missing cleanup calls and
>>>
>>>> Using wmi_evaluate_method() is deprecated as WMI GUIDs are not guaran=
teed to be
>>>> unique for a given machine. I think both WMI GUIDs should be handled =
by separate
>>>> drivers, and the driver for the event GUID uses a notifier call chain=
 to inform
>>>> the driver for the data GUID that the usage mode changed, which then =
handles the
>>>> input device stuff.
>>>>
>>>> This way the driver does not rely on deprecated WMI APIs, and everyth=
ing would
>>>> still work should Lenovo decide to duplicate some WMI GUIDs.
> Jumping into the discussion a bit late here, but I disagree with this, u=
sing wmi_evaluate_method() here is fine. The chances of there ever being 2=
 instances of the LENOVO_YMC_QUERY_GUID are very small and we can deal wit=
h that if it ever happens.
>
> So I really so no need to make the code needlessly complicated with 2 su=
b-drivers which then notify each other. Let keep things KISS and keep this=
 as is, so for the next version only change
> the method_id from 0xab to 0x01.

I think that using wmi_evaluate_method() is deprecated and we should try t=
o minimize its usage whenever possible. As for the handling of the WMI GUI=
Ds, i believe that
just using the first matching WMI device is not a stable solution. We simp=
ly do not know if Lenovo considers both WMI GUIDs singletons or not. This =
means they could
for example decide to have multiple independent data sources for tablet mo=
de events. The chances for this are indeed small, but it will still create=
 a problem for users
using such machines. By having two drivers and maybe a global notifier cal=
l chain, we would enable the driver to handle such "unlikely situations" c=
orrectly.

This would also allow the driver to work on machines missing the WMI event=
 GUID. In such a case, userspace could then just poll the data WMI GUID fo=
r input, but
this is just an idea.

>>> After reading many times, I believe I understand this and can figure
>>> out the implementation. How should I attribute the commits? Should
>>> this be a 3rd patch in a v2 patch series with myself as the author? Or
>>> should these drivers be introduced in one commit without the
>>> intermediate single driver that uses the deprecated API?
>> I thing the new driver(s) should be introduced in one commit. I am not =
sure about the
>> new author of the commit. If the original driver was significantly alte=
red, then AFAIK
>> you should be the new author. Still, the original author should at leas=
t be mentioned
>> with a "Co-developed by" tag. You can then omit your "Co-developed by" =
tag.
> Ack to introducing the new driver in 1 commit. Since compared to this ve=
rsion only the method_id is going to make change t make it makes sense to =
keep Gergo as author and Andrew as Co-developed-by .
>
>> As a site note, i recommend to use the get_maintainer.pl scripts under =
scripts/ to find
>> any additional maintainers which should be CC-ed. Since your patch seri=
es touches the
>> ideapad-laptop driver, its maintainer (Ike Panhc<ike.pan@canonical.com>=
) should also be
>> notified about this patch series.
>>
>>> Also have I correctly set Gergo as the commit author for this PATCH
>>> 2/2 email like Hans said to? I wasn't sure if I had it right and I
>>> could fix it in the v2 series.
>>>
>> You are still the author of the second patch. Also you should not send =
a patch series as
>> a reply to any previous emails.
>>
>>>> acpi_dev_put() is missing.
>>> Thanks! Not sure why I thought it was okay to delete lenovo_ymc_remove
>>> but I have added that back in with the input_unregister_device call.
>>>
>>>> Maybe it would be beneficial to allow userspace to get the current us=
age mode without having
>>>> to wait for an WMI event. This way, userspace could still react to si=
tuations like the device
>>>> already being in tablet mode when this driver is loaded.
>>> I'm not following how to implement this, not familiar enough with WMI.
>>> Could you explain more?
>> I meant that your driver should, after (!) setting up the input device =
and event handling, call
>> sparse_keymap_report_event() with the code obtained from
>> wmidev_evaluate_method() so that userspace knows about the initial stat=
e
>> of the input device. You might also CClinux-input@vger.kernel.org  for
>> the next patch series, so that the input driver maintainers can also
>> review your patch series.
> Ack, reporting the initial state would be a good addition. To keep the a=
uthorship clear I think this can be added as a follow-up 3/3 patch in the =
next version.
>
> I realize this contradicts a bit with my previous lets introduce the dri=
ver in 1 commit thing, but in this case I think this makes the most sense.
>
>>>> If the drivers handling the event and data GUIDs are fine with being =
instantiated multiple
>>>> times, then adding the WMI GUIDs to the allow_duplicates[] list in dr=
ivers/platform/x86/wmi.c
>>>> will allow the WMI driver core to handle duplicated event and data GU=
IDs.
>>> Is there an easy way to test if it's fine to run multiple copies?
>>> Currently testing by compiling the module with an inlined
>>> ideapad-laptop.h out of the kernel tree and using the insmod command
>>> to load it.
>> Drivers can be instantiated multiple times, and each time their probe c=
allback is invoked,
>> and many older WMI drivers cannot do this, so the allowlist exists.
>> The section "State Container" in Documentation/driver-api/driver-model/=
design-patterns.rst
>> explains how to write drivers which can be instantiated multiple times.
>>
>> If your driver is not a singleton, i.e. it can safely be instantiated m=
ultiple times, then
>> you can add its WMI GUID to the allowlist.
> I'm not sure about adding this to the allowlist, using the new API is go=
od (and nice and clean) but this is still expected to be a singleton.

The allowlist is dealing with drivers not jet converted to the WMI bus mod=
el. The allowlist should ideally disappear once the conversion has been
completed, something which would become difficult if WMI drivers would con=
tinue to rely on the older GUID singleton behavior which is not compliant
with the ACPI WMI spec AFAIK. If we know that our WMI GUID is a singleton =
(which we do not), then we should handle this inside our driver, not insid=
e
the WMI probing code.

> Regards,
>
> Hans
>
