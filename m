Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D8EC48BE6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 17:23:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25C2E613DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 17:23:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhFPRZG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Jun 2021 13:25:06 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:43261 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbhFPRZG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Jun 2021 13:25:06 -0400
Received: from [192.168.1.155] ([95.115.35.150]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mr8vG-1lYCvR2OUY-00oJ7k; Wed, 16 Jun 2021 19:22:55 +0200
Subject: Re: [PATCH] platform/x86: add support for Acer Predator LEDs
To:     leo60228 <leo@60228.dev>, hdegoede@redhat.com,
        platform-driver-x86@vger.kernel.org
References: <20210615221931.18148-1-leo@60228.dev>
 <1eb70fdd-03d8-153e-e218-6f3de47c7610@metux.net>
 <9f70238c-baa8-9335-5003-66b9e745e749@60228.dev>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <cde716b4-450a-1639-5994-aabef643105e@metux.net>
Date:   Wed, 16 Jun 2021 19:22:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <9f70238c-baa8-9335-5003-66b9e745e749@60228.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fAtUufuo1LYcGKEX01o9bJkYSyMG34UoOn74SyDcJYguP9BwgH/
 0gc0X/njDfYL2HMS7Zm4okWivN5vZr6Fj4W5qub78go5ARJ0zn9/eTgODr2xGSL5qIllSh+
 6BbCdlOCJJ62Mh6hggQTU2Kaj8hNyx3ddgcsD89cdY7hI2v496k0dyDdBMYrcHhrnDEHTxG
 3oHXmShIu8e1SJz0nsEWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xuA8K0RfCRs=:9J0sE6dVgzeGYelYHj91P9
 BDy9AkzIVILTXQ2jq/WpMstssaONSYkHF1X+xJCZHG5cs1IsgB9mPOfIKPuNawt9+xvkmwGsb
 oUP+9mfQz+r5LilMPBC4sPlvW737dRAISul0eGiHtMpM4gaVd065vADvsb1F93PK+kp7ATNKC
 i7xgYYJOchJZXeVMKsrgZyBsHsCJrJ0Mm9R54wAoUKHpDZeA2UQSxfumwNJx4cMust7/awQ+3
 UO7gtUGddSSOjziPvUroVAn1Eyi7WUO2OJQCe0YuWHpOKBqxAyjCsZg4LJlSXp0uw9hNHV4iz
 DplgBXxgFquC0moQEbA+LK4eKoSW9jmGkEz3SkqHCorkPjfoOg0nf3aXDEp3Rp/qmJtbS+sl9
 qFf07LyrVtHqFb0Ks5U0jUDonVC8WiwunrbEMM5C/W30sR4ywjlBg9gzdAT1MTsBDCR+26Wjq
 p/3tv/sOX5EmSfP7+1dAQFcnwYuVR7Z2jnBhRcT2LsMfOeMTMkKBqqsCa2WQw/W7PcdTKmje3
 5TDwyY1ose76JNRV0DC5AU=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 16.06.21 18:06, leo60228 wrote:>> have you checked whether these LEDs 
are behind a GPIO controller
 >> (possibly in the SoC itself), that's potentially used for other things,
 >> too ?
 >
 > They seem to be connected to the embedded controller
 > (\_SB.PCI0.LPC0.EC0.GGSI). I'm having trouble finding documentation on
 > that, though.
Can you tell what this acpi code is doing ?
Talking to the EC ?

 >> Oh, and have you checked whether there're also some gpio definitions
 >> in the acpi tables ? It's relatively new but some vendors already using
 >> it.
 >
 > There's one, but that's it. I'd expect more than one pin to be necessary
 > here.
hmm, have you tried playing around w/ that pin ?


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
