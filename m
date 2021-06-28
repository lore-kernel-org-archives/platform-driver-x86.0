Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AE1C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 15:25:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DE6161457
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 15:25:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236276AbhF1P2Q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 11:28:16 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:36041 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234092AbhF1P0P (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 11:26:15 -0400
Received: from [192.168.1.155] ([77.9.21.236]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M89P3-1ltmVF43TX-005LqE; Mon, 28 Jun 2021 17:23:39 +0200
Subject: Re: [PATCH 0/1] [x86] BIOS SAR Driver for M.2 Intel Modems
To:     "Shravan, S" <s.shravan@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Cc:     "An, Sudhakar" <sudhakar.an@intel.com>
References: <20210428032224.8299-1-s.shravan@intel.com>
 <ab991a6d-e973-9e16-8e8c-382c27f41368@redhat.com>
 <375f3643-de21-3c71-3041-86d9b54f5d3c@redhat.com>
 <MWHPR11MB14558B1E81705599C74239E5E3089@MWHPR11MB1455.namprd11.prod.outlook.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <d3ccbd96-7e6b-8fdf-3185-247a73964104@metux.net>
Date:   Mon, 28 Jun 2021 17:23:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB14558B1E81705599C74239E5E3089@MWHPR11MB1455.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:o3rY02SKFuvYg8XJTyaLCwKmVRM9C7LdzQ7tVVEyJBwQPeQ90iH
 HHlR509yVk/2rFNbIWwchrz2jdvNynOTgSecKFfe0U+AkTjKGItu9/9UX2WPThKRk6zbFgf
 GCUESWne3hfFLHxYU3sI/dm72V0XXzWVJBI2+l/Ceiom5H2HdJdxkbZqGUg4mO3+/YUPT/c
 YdY1Q3eJwr9dObCQe6QEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3wHD9BmeEPc=:rAaOHDKS0Z++9doqAszMeM
 3Ii1qSuaET8Bx1pV24EHKMPOBG34YJkT5ocOTqYCvwfS6NCcE4oiXvJsbOlUjIeggZloeHdoX
 MIgke7f3YQJ0+Ou+zpPa+NmmzhDiIt9ejxIny7mii95HY+ae4I+P8kQq/6KH1n8vg2Tvg9N0J
 G8SXBWU7TFF8H0caDNeZ0jZqEaj+gDQCD4ljbW5Nm4n+SlPgMB08b+unRQzI/j0W0Ddq8bRFp
 tr6Yhc+qzTTjKJLfyplTN8ewiYWoqyGB4gXOHr+acYRq9Mi/GXGlibz9moSw/38Dp37A45oKh
 iTaRLvm/SW2KpuxrcrNb0itVUzgmN1f625cwR/AdLEILjYUM94ejSVDzYE+qorlY6xg9C5/cc
 /LBDS+PYNGfXBn8i5I+wb1UsXG7UMORJ2zxT0JzW59uDmaQMqjlliDJiSsi/Z9a29+FvNnVyC
 8NorFg2wAHwXUO1iAJjTFUYrcKvZQqp2tlURWrLP1unDUKROoaq1HgKe9/mvn2HhCnoEuOiIf
 utvDvPMFB02DAhkPvA+sOc=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 23.06.21 16:12, Shravan, S wrote:

Hi,

>>> 1. Listening to some sensors, which readings may impact the maximum
>>> amount of tx power which the modem may use. What kind of sensors are these ?
>>> Currently chrome-os based devices are using iio for proximity sensors,
>>> with specific labels added to each sensor to tell userspace that they
>>> indicate a human is close to one of the antennas:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com
>>> mit/Documentation/ABI/testing/sysfs-bus-iio?id=6505dfab33c519368e54ae7
>>> f3ea1bf4d9916fdc5
>>>
>>> Would it be possible to use this standardized userspace interface for
>>> your use case ?
> 
> [Shravan] Proximity sensors can work in scenarios where there is no other sources of information which can alter the sar handling.
> OEMs have given feedback that the device mode (tablet mode/laptop mode/clamshell etc) also play a part in SAR handling. Hence this
> has to be aggregated with the proximity sensor information. Also such an aggregation is specific to given host platform. As a consequence,
> this is best realized within an entity like embedded controller available on the host platform. This new driver exposes such aggregated SAR
> parameters that needs to be configured on specific RF device.

Since this is totally hardware specific and doesn't even tell us which
radio interface this is about - why do we have to have this incomplete
stuff in acpi and the kernel in the first place ? As things are right
now, this can be completely done in userspace, including the tables.

It would be different if acpi tables could give us some precise and 
generic hardware description, so we could handle this in a generic
way and userland wouldn't even have to care about it.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
