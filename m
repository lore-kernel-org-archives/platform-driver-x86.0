Return-Path: <SRS0=t3ea=EM=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAACC2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Nov 2020 16:33:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B95FF2151B
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Nov 2020 16:33:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgKFQdM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Nov 2020 11:33:12 -0500
Received: from mail1.bemta23.messagelabs.com ([67.219.246.112]:59897 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726867AbgKFQdM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Nov 2020 11:33:12 -0500
Received: from [100.112.4.31] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-c.us-east-1.aws.symcld.net id 7F/DB-40322-1CA75AF5; Fri, 06 Nov 2020 16:33:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjleJIrShJLcpLzFFi42JJl3vFrnuwamm
  8wYVjMhYvJxxmtJg04z+zxcuVN9ks3hyfzmTxuWMyi8XqPS+YHdg8ds66y+6xeYWWx7yTgR7v
  911l8/i8SS6ANYo1My8pvyKBNWPf068sBa1cFS+e/WBqYNzB0cXIxSEk8J9R4vnOY2xdjJxAz
  nNGielbuUBsYQFHiU2z57CBFIkILGOU6PixhBUkwSyQILHrzFkmiIZtjBKdR81AbDYBbYktW3
  6BDeIVsJW4f3M7C4jNIqAicWNbN1ivqEC4RMeNHUwQNYISJ2c+Aarh4OAUCJQ4/SwGYryFxMz
  55xkhbHGJW0/mM0HY8hLb385hBrElBBQkjr0+yARhJ0gse3mHeQKj4CwkU2chGTULyahZSEYt
  YGRZxWiaVJSZnlGSm5iZo2toYKBraGika6JrbKKXWKWbrFdarJuaWFyia6iXWF6sV1yZm5yTo
  peXWrKJERg9KQUsSjsYm9980DvEKMnBpCTK+9ZhabwQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd
  4TFUA5waLU9NSKtMwcYCTDpCU4eJREeJMrgdK8xQWJucWZ6RCpU4yKUuK8eSB9AiCJjNI8uDZ
  Y8rjEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZiXE2QKT2ZeCdz0V0CLmYAW8/ksAVlckoiQ
  kmpg8s4wdpZ3l5yz4ZJI/aKtP393pYZNar01vbeP+6BrR1zS91/Tz2dtFqtcr7Un58KqzEUes
  m0K5QpmvCVVW5W9Z3x2+7CzZ1qN1dFnVgzsU7b+Fpdq47Eq0LLdKyA/KZXhtpWOicDqmu1TRO
  KelB/2nnlLXfrj15jVj9UyDvk/7Aw5nBRWLzb/4tzT3Ft+Pz+npX1x8YH8230HBNk6G4O4gxT
  dnWPjt8+w+qJ15/Hj2Tqe/8rapqncv+ZUwHkuZNI6Aw/1mROEZdf+2n7iWaoNS6HgArs3Uf43
  tBddTfbJ/snE6zkj02Hq7Fcmex7n7TKveflS6H/Bhuzrxg2LXx2LENf/KqTBxqruYXd7ygxhJ
  ZbijERDLeai4kQASmCegpkDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-10.tower-416.messagelabs.com!1604680383!80172!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21436 invoked from network); 6 Nov 2020 16:33:05 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-10.tower-416.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Nov 2020 16:33:05 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 613E677A2CE6DC89554E;
        Sat,  7 Nov 2020 00:33:01 +0800 (CST)
Received: from localhost.localdomain (10.46.60.237) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Fri, 6 Nov 2020
 08:32:58 -0800
Subject: Re: [External] Re: [PATCH] drivers/x86: add thinkpad-wmi
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
CC:     Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20170904082110.30925-1-corentin.chary@gmail.com>
 <20171021064102.15166-1-corentin.chary@gmail.com>
 <CAHp75VeJyXHZZ=ZeYQtbica1QC-=xZEaqWFv1KSvnJ=1UXTvGg@mail.gmail.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <6200cbb6-7b66-c3a1-fa59-5472b0599f63@lenovo.com>
Date:   Fri, 6 Nov 2020 11:32:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VeJyXHZZ=ZeYQtbica1QC-=xZEaqWFv1KSvnJ=1UXTvGg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.60.237]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Andy,

On 05/11/2020 11:44, Andy Shevchenko wrote:
> Just a heads up. Hans and Mark took maintenance for PDx86 and they may
> look at this contribution.
> 
> It seems full discussion is available [1] on lore. So, I removed the
> rest of the message.
> 
> [1]: https://lore.kernel.org/lkml/20170904082110.30925-1-corentin.chary@gmail.com/
> 
> On Sat, Oct 21, 2017 at 9:41 AM Corentin Chary <corentin.chary@gmail.com> wrote:
>>
>> This driver has been available on
>> https://github.com/iksaif/thinkpad-wmi for
>> a few year and is already deployed on large
>> fleets of thinkpad laptops.
>>
>> The WMI interface is documented here:
>> http://download.lenovo.com/ibmdl/pub/pc/pccbbs/thinkcentre_pdf/hrdeploy_en.pdf
>>
>> It mostly focused on changing BIOS/Firmware settings.
> 
As a note for anybody interested in this topic - we've been working on 
an updated version:
https://github.com/lenovo/thinklmi

We do plan to contribute this upstream, but after initial review it was 
determined that our approach of using an ioctl was not going to be 
accepted. We also need to integrate with the new sysfs 
firmware-attributes class that has been implemented. That work is ongoing :)

Once we've updated we'll be looking at contributing this to the 
community properly.

Thanks
Mark
