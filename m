Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F016C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 29 Sep 2021 05:47:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A24D611C7
	for <platform-driver-x86@archiver.kernel.org>; Wed, 29 Sep 2021 05:47:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244285AbhI2FtE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 29 Sep 2021 01:49:04 -0400
Received: from mout.gmx.net ([212.227.15.15]:39113 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243585AbhI2FtE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Sep 2021 01:49:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1632894430;
        bh=ajONYP06m0vWqfCRNgyIDZRp1gSqX9yT+XQhCzz/Q64=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=TrFRpdpYMerU1fFhZ2Z5dKuXWOdBLMAdF+Rzts97OGLxENw2EGFZMd703BHz++0+9
         VTHg6kq1nf+1Q0e2KQJcPVVlpdB3r+RNqjkTh2c91GUpvL3jAF/4SLHHsNLcqi6shZ
         DlQKHok2+8t7EQNuDzch643l3DRg57FsL6t+Z4GI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.135.7.100] ([87.123.183.88]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsYqv-1moDVF1Yol-00tyso; Wed, 29
 Sep 2021 07:47:10 +0200
Subject: Re: [PATCH 1/3] thinkpad_acpi: add support for force_discharge
To:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Nicol=c3=b2_Piazzalunga?= <nicolopiazzalunga@gmail.com>,
        Mark Pearson <markpearson@lenovo.com>,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        Sebastian Reichel <sre@kernel.org>
Cc:     jwrdegoede@fedoraproject.org, smclt30p@gmail.com
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
 <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
 <2ea2d9b7-4a15-6aea-1aff-4e1cb80a026f@lenovo.com>
 <ac508b49-7958-3afa-25cf-416d701034e3@gmail.com>
 <ba6698de-1700-fce9-6bca-12ee577ac09b@redhat.com>
From:   Thomas Koch <linrunner@gmx.net>
Message-ID: <943fa4fb-273a-0a36-4919-26c05ae4a534@gmx.net>
Date:   Wed, 29 Sep 2021 07:47:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ba6698de-1700-fce9-6bca-12ee577ac09b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2J2zXW8a0V5nFqsFObuO7cK7xSoXP2ojq9Jmz/BmunYUjrph5Mp
 XNbCO0gG1VeKBcd5wjra1xfzdQVwA0mpnQLdZqeE/zrArngrLoWdl/LNCuol4bf1aa7ISmQ
 IbLaOf7SjQHGJY8EzJHKsnTw3+E2OmwnrtuPN93QPylG+UtjFDficn3gJ3UM8JjAEN/4HS8
 PBY01akJznU5xDLlJb9EA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/ZscDuHHkoI=:PsVDHBAWmSWuCFdCKIePsx
 hVqaK0JbjSdT3so+kxX4cQvNahtYlBHJ71NUod9Lv7vMPx+L8waBdbHJGH9ooQK57xJmSsgUG
 jjUuc9qGUG4kF8lXMX5pM8Eks6/eZKas6fQUxlGOVaqXWUFYMfJ2LLLeXvCe4kxHidkCQi+mg
 wpM17obotcwBCfKEClk27TGqok741/66ch921hKXaCfBvSw8CcXDdeQPMG++bByz00KlxUAnF
 V86MArmCp2+G3huzcBC5BQSkxZwC6f/CGCWhlxzRHM4LLMcYkFqJgKnHcsWwmt7cQ/BPrL+0S
 t6FmZf0NwGv+hCzdtpmoXiF2rJe8e0xBBn7rzlkEH+jBaydjUSr73eHEv/6W35o2eQHOZoUdq
 pZO5tZFF2gShj2Cg7KH+nTmpBHJTpb8JWYCrne+cr/9kYqKMtZCxKZ4n2zzXq9E12oT88XqHb
 vkG5j0oQdLr4kbFe7kqvonQ3xp47RAp9EAzbkNHYNTHgitPbhYNELsUeW7ORIzNk2cQY2TUnk
 l5uVHXG9hnOQF0J8+QCB3oPZQpslYadwj2YFQO6UedKVjP2uau/AdMlJrbrzIjYIlEDYjVQhp
 mvKbzG7YJMc4FVttirotFXRe8xZaXhYJCY7hvOj+BTQJBfrSgtim5/Z+Gw1ElFM+pnT3t7P/9
 ypVZoPAo1u0OKHlfWbd7xddLv49uSPpt/S6lLMZ2IDdujPuggo2XSPaxcMA3kdxEPZ4uil/UT
 JBKnoZzE0oT4jQRWxxm/7QbZJOVH/hmaPOIOs7JqG7Wkf9wwgB1+KwdaHw7tWclSWRvcasqDz
 1EUPcxUTYDcBO6ub0xesuyizzF3Arj/SY5aD/rU2LxTzi8DGQDLbnc6839j6hzJOaQarwM2yE
 d3OEAbM+PK++Oy4xz4TExRZNZ0swReskQaYslTEhlfsvbn3l9Z+lvWliBvAWOT7o/FPo0jE78
 lumxxQ00pTeaWJ68no/Thqz4zpyyjCTNhnB83tVE1Yxn/2yvNNY9sC+Ebh1GyI5dP123PjLkd
 BLAdkbVUd02GAXkVSzFoIT0m2AoPAG63uqKZ62+6tzuAy3kjukfj3NPWYhN4VhOWiILGdE9x7
 o3VCtqk4BmtgAk=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 27.09.21 17:12, Hans de Goede wrote:
> Hi Nicol=C3=B2,
>
> On 9/27/21 5:00 PM, Nicol=C3=B2 Piazzalunga wrote:
>> Hi,
>>
>> On 9/27/21 3:59 PM, Mark Pearson wrote:
>>> Do let me know if there are some important use cases for these so I ca=
n go back to the FW team and discuss supporting them properly.
>>
>> The important use cases are force discharge and inhibit charge.
>> These at present are dealt with using tpacpi-bat, which relies on (out =
of tree) acpi_call.
>> See also your previous reply.
>
> I can see how those can be useful in certain circumstances.
>
> I can also understand how Lenovo does not want these to be
> available by default everywhere.
>
> I think a good compromise would be to add a bool module option
> which defaults to false to enable these.

 From the user perspective, I don't agree that this is a good
compromise. Users simply want to recalibrate their battery. Having to
set the module option beforehand is an unnecessary hurdle imho.

Of course a module option again leads to support overhead in "user
space". Then tlp-stat -b would have to inform the user that
force_discharge is unfortunately not available, but he should try to set
the module option. What would that be good for?

While I respect Mark's official opinion, I would like to counter with my
experience from 10 years of TLP development and support:

The calls for force_discharge work unmodified since the 2012 ThinkPads
(T420/X220) on all models that also support charge thresholds.

They also work reliably, otherwise the issue tracker at tpacpi-bat and
TLP would be full of user issues.

inhibit_charge is probably used rather rarely, at least no TLP user has
asked for it.

@Mark: what is Lenovo's position on the calls for charge thresholds
already included in thinkpad_acpi? Are they also internal?

>
> Assuming Mark is ok with that, this is still blocked on agreeing
> on standard power_supply class property names for these 2 features.
>
> Can you perhaps write a (RFC) patch adding proposed standardized
> attributes for this to:
>
> Documentation/ABI/testing/sysfs-class-power
>
> As well as to the enum power_supply_property {}
> enum in: include/linux/power_supply.h
>
> And to the power_supply_attrs[] array in
> drivers/power/supply/power_supply_sysfs.c
>
> ?
>
> And then send that the Sebastian Reichel with the linux-pm
> and platform-driver-x86 lists in the Cc?
>
> Regards,
>
> Hans
>

=2D-

Freundliche Gr=C3=BC=C3=9Fe / Kind regards,

Thomas Koch



Mail : linrunner@gmx.net

Web  : https://linrunner.de/tlp
