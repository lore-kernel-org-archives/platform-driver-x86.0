Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B73C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Mar 2023 01:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjCFB6z (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Mar 2023 20:58:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjCFB6y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Mar 2023 20:58:54 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BCAE83FA
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Mar 2023 17:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1678067931; i=w_armin@gmx.de;
        bh=OU/2cH96HmQ8rgo3tJYbX9KP36lw3UwJRMVvIAjvrIg=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=W2itiJqMuQ9HmbzQRb0luZLo014OIYNVTvui/Y5HBjDtTvv1xFSi89HAEowxPdBtj
         +onSikzSssiYAdGe4BncfK1iwUAkXIVVzdM6+NnKkGvsLo4nT69daG/oaZZorheBrX
         BVa/NBVhtfxnyHFxPXgo9m8qvBcff3a2h2sVcMwQbG7OLT6j92ZM+hKiqHc7c4C1tw
         /kIEEBOtQugIaCkA0Hz5b0cWypQc3jSLgHYQ5olPGTp8gIJI7PNFhy2gg+jvjoU1Bl
         +umWRkCKPnEysBwbzHCOQqXkIjPnGU82TTBYzWpdMoRug2CiURvuXrpQQ/eurpTnTg
         tQNgRH3C9Nysw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQ5vW-1puwot1gNU-00M779; Mon, 06
 Mar 2023 02:58:51 +0100
Subject: Re: ideapad_laptop tablet mode toggle detection
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <CAG4kvq9US=-NjyXFMzJYu2zCJryJWtOc7FGZbrewpgCDjdAkbg@mail.gmail.com>
 <CAG4kvq9-qGFNRP29i4jDPL6RVLwGG86wdtTR1+VWZWu5krfv2A@mail.gmail.com>
 <044d2716-2490-6600-33e2-ecf50f65a6e9@gmail.com>
 <2267dadd-f1a9-e064-6f3f-e3aea459cf5a@gmx.de>
 <CAG4kvq84Lso0x62AuZgRttcQFdKXAHpWWKB4n0ZMTgb9CZ=NCw@mail.gmail.com>
 <e95a38c0-15e0-92e2-97c0-4d09219158f5@gmx.de>
 <CAG4kvq9QzoXcwTxTFzoQeQDnMEHfWCG4JmLgQ-sMn_WjX-mVJw@mail.gmail.com>
 <2181c5de-44d6-aebd-52ba-63d9fabd620c@gmx.de>
 <CAG4kvq_scrvvmZ3trVhkFTeT5NruAA7qYCohT90ih0sNirrWCw@mail.gmail.com>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <6a435c53-900d-f3d5-8463-5f07e06e413a@gmx.de>
Date:   Mon, 6 Mar 2023 02:58:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAG4kvq_scrvvmZ3trVhkFTeT5NruAA7qYCohT90ih0sNirrWCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:/uV95iZEDC2nkwaM/iAmr47h+ARJ0Mq+lqTqchZYKd+sx9KXy4U
 7sRWQbyDRPgzoCuVJbU6NndeLkntJwJV9fPyBvrk9G1G3k54lAfFXFNLQQaWzyYacSbYoiQ
 y+bdzDLWoI0lSi4nUDujQ1jfxFeeUSR2zC3D5v5uLCKhjY0NU443mWN5SDvGicM9ZSCVbeU
 d/L1wy7txMO+Ui0GCfvkQ==
UI-OutboundReport: notjunk:1;M01:P0:2JbQO4/NUP0=;wxIp2cIjnX9QVbMilLaOkYM25Ji
 YeklYTjXAEdWyiGazwKAgtdTrKOEkReIWLZJHSNWRozarCfmOuyd9xSVcQcujYxGfEei26o3o
 hgN6lQksy9ZFQ1s5JWGToaAXWLyNDd0dRdfCl/NDmMKYVD+jb18pdLhOn6fEUk7+j5EYBVcA6
 6iI6FhDfivKYr4CyIM4YjNDJqQQeNaGAEn6JJzMSjQNXGabIehXydlTO/OKe1feAX0rUOJP+n
 hbThyaveYPvdCO+2d5iAaj9F6xRSr3Fuf7s0gDjuy4D9iGlt8r3bMEHbY00pFe4sTztMTyrnR
 Zq7gFS6QBt0bURFrAAS360PJmv99etle6witkTi2IJda5VL31Et4VeG5Ka3xn1cxgOWzC9Nz6
 KrRwlPkWQ3C91TCgrZJUyE0Wob4KMtOoo4MRt5hZvBXP2hAxvGXQPjN7yAep3yGfcQ7de+His
 F1Upo5PviK05nDsNokBywEtsuvmUy2n98G7CisZ7YYaPuhF/Sb5Q0jC4yNo6dhtEHIxU54Yol
 FcnQWA5r69rXcmuOL4ZdxQDOp3IjfK8WIpylNqNb7V/U2280qyC4rBowujpHczBYjxxdYbLe8
 s5pU15LohFqQtH9WD6UDGIAjiKfh3iyyCuLtSIiS7EKBE5BrjEjCQ4x8VW3OgmP9pUIqjWokz
 kX56d60yN0DcE58BD43fQBnwvGo3XDXqnwPPlCPETlOkHArY/YuMs+YtVyUAFieOr2JOR80dr
 VWfnzY8ExGBBOwfUNu0DPQeCutMCHuPeFZglzhKnCFA+/4GEWxEYz4+Jn6sPmgKN4fZQikBsX
 YXlUX0zyUNDOzxKHJxzFqeii+LpS3kggGYRUncfzA4GOVO2OjTAnWTJxC7pdv+m0+D0+oFqa/
 jaQGeXj4vCRevsKwVcASh6yVbMwvsZlFo4tSMspGHJEwWAJ5rY7/trT33LMhO/oEfIXBvz0An
 KEIcMlQe4kV0hIXzl6HjkuMmHng=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am 06.03.23 um 02:41 schrieb Andrew Kallmeyer:

> On Sun, Mar 5, 2023 at 5:26=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote=
:
>> I was combing through the ACPI DSDT table inside the acpidump you provi=
ded,
>> and i found serveral PNP0C14 devices, which hold WMI methods, events an=
d data.
> Thanks so much for the help! This is my first time looking at an ACPI
> dump so I never would have found this.
>
>> Maybe you can write a wmi driver which handles both WMI objects, so tha=
t you can find out what the values
>> returned by GetUsageMode mean. With a bit of luck, you can use this to =
implement tablet mode toggle detection.
> I will look into this, this does look more like the proper way to do
> it so it can be put in the driver for everyone. I suppose that missing
> Notify device is just unrelated then? Does setting the memory mapped
> variable just automatically update these WMI devices? I was worried
> that the failed notification would make the WMI devices not work, just
> guessing based on the WM00 name.
>
> If you have any pointers on where to look to see the kernel functions
> involved in WMI that would be appreciated.

The modern WMI bus infrastructure introduced new methods for interacting w=
ith WMI devices, you can find
them in include/linux/wmi.h. The use of the older methods like wmi_evaluat=
e_method() is deprecated, since
those methods assume that each WMI GUID only appears exactly once in each =
device, and notifications can
be unreliable. The WMI bus infrastructure does not suffer from this proble=
ms.

Maybe you could also add the WMI GUIDs to allow_duplicates[] inside driver=
s/platform/x86/wmi.c, so that
the WMI core does not complain should Lenovo someday decide to use multipl=
e yoga mode sensors.

Regarding the missing WMI device: it could be that this device was used in=
 another model, and that the
firmware engineers forgot to properly remove it when they developed the fi=
rmware for your device.
In such a case a BIOS update might help.

Armin Wolf

>> BTW, what is the name of your notebook model?
> It is advertised as Lenovo Yoga 7i and the model number is Yoga 7 14IAL7
