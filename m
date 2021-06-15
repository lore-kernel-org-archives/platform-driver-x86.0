Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CF7C48BE5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Jun 2021 18:01:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8CB860FDC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Jun 2021 18:01:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhFOSDo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Jun 2021 14:03:44 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:38427 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbhFOSDo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Jun 2021 14:03:44 -0400
Received: from [192.168.1.155] ([95.115.9.120]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N7zNt-1lGDV530bL-0154jn; Tue, 15 Jun 2021 20:01:28 +0200
Subject: Re: [PATCH 0/1] [x86] BIOS SAR Driver for M.2 Intel Modems
To:     "Shravan, S" <s.shravan@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "An, Sudhakar" <sudhakar.an@intel.com>
References: <20210428032224.8299-1-s.shravan@intel.com>
 <CAHp75Vfq6B0=q0dsQPTP_A8sdPh9tepBooa7cW=KJYX78ekWtw@mail.gmail.com>
 <MWHPR11MB1455D055108F1DBEA6EB9285E3319@MWHPR11MB1455.namprd11.prod.outlook.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <c7c3d395-826b-fc34-b396-a9c7631d981b@metux.net>
Date:   Tue, 15 Jun 2021 20:01:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB1455D055108F1DBEA6EB9285E3319@MWHPR11MB1455.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+e1cnc8uqFI4TUPXWcsAOI3qMkQwBXDY5ye0Vn7v7l7Zee4UUa9
 iFF+DPGizBBpOt2JUCBFvBuBSSf69UsXxSGROLrUbRxB+aL548AT1cpAkFLtv8uYldr531v
 1Yal37/aQOI6yJpVn+Ewwuk/yfNw9b8R/wQlYw5ZsKvSlxc2lFGOAabR7Q1N+DADi6XmzIK
 6Ndrkhxg31Mp1KSy1D3bQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lNbonGCCEDI=:1vLTcbMJI8lo2ENL3UKOZs
 35G0mM2PYRCmtR3j7SvDHhV3QR5AWGKpjBG6iHna/krgBUOn6/gZlXmkL6n0mEG2HeykPOvrK
 LYMmT+hxkh97K+AzIIG7XzQz5KLNW6Z5GrMiQTl65dpt0/j8w471/y0N+VjT+Pu6C8pOh60F1
 A5nWcC7Et8hfR8nMxaiTKGK2c9PkzkSP6pcdkERh/3e6RKAvj2MpJELrMtPBhgRdLQYBtEmTO
 DmzGfuUEfQ8hdR+lBQVsSG24ZRPMvtC5fxlnePqWuVoMSby8HyUuwXdcxO0Zf5mFLfeWzj6cB
 5WRAG0/84S3u3ze2wsRfkSExo4KJrD4ekkbj0kQk+7KzCqr0VON2CXVvWdvBCRZ9+YkAl463K
 bnSEZ2zNdSGddlOmeWv5zUuOs6xBZmSA+sGnswkAJA8TGYy/o33bytrCOaT//MgsPbZV17xhA
 iTkyQuxbKhmq5sV7aIFbijxh/eQL57RLZTCtmAJ+Ty+X2wd6K8kRwPOmXDxvJU1kUdSGGoj5k
 M+if/DVDthCzPKutR/3kco=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 14.06.21 13:48, Shravan, S wrote:

Hi,

> Why is it not a part of some generic subsystem under wireless network subsystem?
> 
> -- This driver is instantiated only when the BIOS on given host exposes ACPI node corresponding to the BIOS SAR. This depends on support of the BIOS SAR feature by given OEM.
> -- It is agnostic of the wireless technology like WWAN, WiFi and BT. Hence, it is not made specific to any given wireless network subsystem.
> 
> Please do let me know if you need more information.

the problems I see here:

1. the device uapi is very vendor specific
2. its unclear for which air interface is the data really retrieved ?
3. unclear how userland this should really handle in a generic way
    --> how does it know which device to tune ?
4. does it really need to be (non-portable) ioctls ?


by the way, who hat that funny idea putting such information into acpi
in such a weird way ?


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
