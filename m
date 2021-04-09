Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E543BC433ED
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Apr 2021 18:33:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC91061105
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Apr 2021 18:33:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234307AbhDISeA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 9 Apr 2021 14:34:00 -0400
Received: from mout.gmx.net ([212.227.17.21]:47079 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234133AbhDISd7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Apr 2021 14:33:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1617993205;
        bh=vubNQZq27/wvPEMiBJ3ILc3gLh3KKXNv6EfCSlpq5KU=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=gx7/BH67twrRJpbmi25CVvqVgS1WSFc0Dv2f1JxWX3WGZz5wRBc7NcF0SJl4yvVuO
         JPbMasd7tciQ5xxw5/2XuTHl6UCSMReyrRW05bV1BEMFKnTPkCUt9/xDFXmNw8DA5T
         7OttMVFG9lvrGWjp2x5jYJEH7hdYsFFvzrmkq2G4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.135.7.100] ([89.245.204.201]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3KPq-1leFYE43zm-010JTe; Fri, 09
 Apr 2021 20:33:25 +0200
Subject: Re: [PATCH 1/3] thinkpad_acpi: add support for force_discharge
To:     Sebastian Reichel <sre@kernel.org>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        "jwrdegoede@fedoraproject.org" <jwrdegoede@fedoraproject.org>,
        "smclt30p@gmail.com" <smclt30p@gmail.com>
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
 <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
 <3anWBvkrPqTNQyfx2ZwDaLZKXtw5PMwTTdcgGNt0FaACUSsrkb5PaoqVKxLpxXU-4NcVZ9AqDQLs2VMOmvS-KfxHRmOSQiZlMjyvH282mdQ=@protonmail.com>
 <20210408135102.6r2przibgngaavkp@earth.universe>
From:   Thomas Koch <linrunner@gmx.net>
Message-ID: <39c3436a-a08d-9530-3215-854148215312@gmx.net>
Date:   Fri, 9 Apr 2021 20:33:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210408135102.6r2przibgngaavkp@earth.universe>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+UiLWJewlDAN0uCTAhpXBU/1WF/kVMdkfaO2Fgr2mty3Yo1zAjP
 0zmenblURQnSiQSNvb3hrz2kdNTZgqzpmV3e6l+BLstLT9l8VA+birMRyKuRUbFFk03UDsw
 RUlna8nK7rGHV7GY6D+B6hHkkjdHHyDCHYKlFmNzBhIT8362TF11HD9iZEzJif9xJjEW+1b
 3CNar68+ZptknXX8BAhfQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/EZNRKJXbcY=:IOFat8jFbAqOtNUCzIbKte
 zlqo3w9eaghQsQUUHc2rASIOrC5GIERkDMDbCGs/SVy7jbpTAdlbiTE9m27UKSvjbKpMdAjNd
 njjrgan+xd9gTZWYXxE9zuB87yxzE/Hl1VTY8MxxpWf+bMzOWwI5A4J0t3iR7moYe85c2KuCt
 P07Loz8B7G3Wbpt7H1Q7Kq/TsVhGT+wuSomMkd6e1ZXhOAb8XZdC7l+dAEVLL8dzuMJ8xNWIv
 C6YUlH9a/KJcCA7tXboFOtNeoy3sqj26SadlfUko3v09gQ3dGk6UgXz8DIsUsh4rOapqem71v
 OpztkEk0gwDgywgXT4wA8i8skxZt652XTjXoZo6q/ue/uR0vL2NaueBpq9h4hFTmFPKU5Od9K
 PLTkPX+Uofs3HkAsCY8oAWArNJjSD65MvP6ED5XiuoK10HqQ9VJQ2NQ+V6zONOQBhwHN+fUjh
 n+cUv+ThLqjEej5R7bSNNvhyFy7o8oUVTRVZznHX5z0wTDE18U9ls6k4gchsxf8gH3uQMkzLJ
 utKPv6vfsklJ5zq2ANsje3NMtLfXrJROC3nMELsLotyMCiM5pvDrnww55ccQh80/MLk56rmaf
 K+bR3v8u54rwgGmx5ysekTKXurWg1X8Yh/FL0t1mtH5vb17jatwRWZ+088S9aQ7mQ9zcW4PMH
 LpsEhmY7nnJHw7tzKCqLHaWIzAinFrNgHPMC8LBissTYJyWCIxY3aa4KyHNpkQDaIXk/BDVsa
 alICJDvYGHO4Y019jP1ObNm64LiehM2N98X4FJSexni4cA/q5XsaJCW2hF5PbkyagT8GJsmOK
 BH2yuZB5rq3iUrSA9KMWXq/Gr5atUtVQU3LPPdutojo/KXB6qn7nuW2NCElX5AA3Uk+Oq32/u
 h2vRjjTPIjg6J0vahuY93BNiXvjJG7PtNaSJCNrHxIGGdyBlA1QDDdOGKKsh4184n6OkyYfN7
 lYIS5im2WtjLHStpbSwowf5kaUeYyLLin5+R0O+zqbonQryGYpFmNH1/XaZbgE10BaUJ1O+QD
 nj4lQ7nAixxcDWz66sgWXzJWDpZzoblyiFMalBo19i8E2v6/Gas9glFqb8a3e+CvQy3E+xf6b
 +yiojKXMsMc5uDiBL5eq0ul2lU+HtvfGA9Z6ZJMKvGQocMOXB38qcrUdaJYM14Yr3SnwPne06
 nTU61LiP3JdeuGAySDmr/0u49MuH2C/jx2DSExK/AN0s25MqIB1e4VxZmt1EVOBQLXqcA=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 08.04.21 15:51, Sebastian Reichel wrote:

> IIUIC you have 'force_discharge', which basically means the system
> is running from battery power despite an AC adapter being connected
> and 'inhibit_discharge', which inhibits charging, so system does not
> charge battery when AC is connected, but uses AC to supply itself
> (so battery is idle)?
>
> We already have this kind of features on embedded systems (which
> often provide all kind of charger details). Those drivers solve
> this by having a writable 'status' property in the charger device:
>
> What:           /sys/class/power_supply/<supply_name>/status
> Date:           May 2007
> Contact:        linux-pm@vger.kernel.org
> Description:
>                  Represents the charging status of the battery. Normally=
 this
>                  is read-only reporting although for some supplies this =
can be
>                  used to enable/disable charging to the battery.
>
>                  Access: Read, Write
>
>                  Valid values:
>                                "Unknown", "Charging", "Discharging",
>                                "Not charging", "Full"
>
> If I do not miss anything writing "Discharging" is the same as forced
> discharge and "Not Charging" (AKA Idle) is the same as your inhibit feat=
ure.

There are ThinkPads with two batteries (BAT0, BAT1) and the hardware
allows to select which one to discharge. An approach through
/sys/class/power_supply/AC/status won't cover this.

=2D-
Freundliche Gr=C3=BC=C3=9Fe / Kind regards,
Thomas Koch

Mail : linrunner@gmx.net
Web  : https://linrunner.de/tlp
