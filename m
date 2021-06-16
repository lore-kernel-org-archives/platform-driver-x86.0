Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CDAC48BE6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 15:42:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E1DF60FEE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 15:42:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235129AbhFPPo6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Jun 2021 11:44:58 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:37345 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235587AbhFPPnR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Jun 2021 11:43:17 -0400
Received: from [192.168.1.155] ([95.115.35.150]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MFbFW-1m56OC2sQg-00HAdX; Wed, 16 Jun 2021 17:41:06 +0200
Subject: Re: [PATCH] platform/x86: add support for Acer Predator LEDs
To:     leo60228 <leo@60228.dev>, hdegoede@redhat.com,
        platform-driver-x86@vger.kernel.org
References: <20210615221931.18148-1-leo@60228.dev>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <1eb70fdd-03d8-153e-e218-6f3de47c7610@metux.net>
Date:   Wed, 16 Jun 2021 17:41:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210615221931.18148-1-leo@60228.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/6UeiIAfkiF2rp6iNgprVNtPcLjiQdqlQdA6HEZFMy+lqosnDuz
 /DcnQNAZ5OBL6P6GP7KpBzTjHwEA0Z87x98V/Ci/x7yGJ7QPmUr5lXP8gYIqG7ypnTxkH6N
 JNi6yUKI7d2G+o3fkyaq5kSRh6U+RZPiCptKyupRkdHLSPOLpCjomDJNm7ZWbGaQMCHOUoU
 nXiidMno4w+WRhw4+8I1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UPMx5UfUDts=:OhRXt+1z5hXK0pLTC7LUwp
 V3XzLGXTDI+ADz1pJ60wpPLAMep+ESBUpoeCr1zrEeMSPaGhqEJiNbeLmSlhC3U7l7aD2Ng/4
 Wil+s/YGBcgE4TdCCVgGNjxy8fnwfA2POqAxWan457ujDzi3EmCO6XZob1AAhawtrMooa5ynP
 PbyugLXmZ6uXzj5dj+T91sVWmJaWac0oPnWg+PY935Kf8nUsYiqvawFHKVJDTZHJ/uyMnMmfE
 PrftXatkNHeMJIL2vcgPMia2XeeKPnX4nG120YezgaPkEeJWc3NWS15PzJ3nnPZHI21ADSgS6
 LCWdYJpqm896mIVTAAWtZfNH1cp5zkum1/ooID2XOkRmPbhIK8n5o3nBhzOpvgX9gdk5q5Ykp
 uWWv+xJiAvPyb6fleDMG5r8/TEvtiThwyxKH8flHG5idt8Ry/Cn9z3uxJEMH6g6rk+MqXgpx4
 tPKADQDVQL6naNWt/vtoS0LdHDdyPm7oze2mqa3iBKLzmcnyuHeqidVWzyOXk7Rrt6UBPnlEo
 EtYcB0qv9NZKv9VJuMRkLQ=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 16.06.21 00:19, leo60228 wrote:

Hi,

> The Acer Predator Helios 500's keyboard has four zones of RGB LEDs.
> 
> This driver allows them to be controlled from Linux.

have you checked whether these LEDs are behind a GPIO controller 
(possibly in the SoC itself), that's potentially used for other things,
too ?

If that's the case, we might run into trouble when one's implementing
an gpio driver and using it with generic drivers (eg. buttons).

I've haven't got a data sheet for the i9-11900 yet, but I'm quite sure
it does have gpios and suspect they're used for those things, as well
as extra keys, etc. This is a usual approach for such mainboards.

You can get a better idea by looking at the acpi methods - look out for
some other methods accessing very nearby registers.

Oh, and have you checked whether there're also some gpio definitions
in the acpi tables ? It's relatively new but some vendors already using
it.


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
