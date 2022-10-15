Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2488CC4332F
	for <platform-driver-x86@archiver.kernel.org>; Sat, 15 Oct 2022 01:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbiJOB1G (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Oct 2022 21:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbiJOB1F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Oct 2022 21:27:05 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7A3691A3
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 18:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1665797211;
        bh=Dz7flPzBgd85xPEcsLsRGIzphAUxcinDzgS4t2FOSJA=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=U9Us6Df6RnnM5FOswvFo21J06UNb074InyXKkQdBb5jP/Yvv93XebTQNR0I7sU2+g
         UhIJ/OYvCKJDOHBdwZOfg415se50iSaZZVRDP9RO1ZjQhag8tMDIa0xgSYzGj42Ws2
         Xp5bpWraK9ggmehk8fx1OFDPPHS9uCDStPCmxH9E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCbEf-1os4nw0tU3-009jUL; Sat, 15
 Oct 2022 03:26:51 +0200
Subject: Re: Upstreaming Lenovo tablet switch driver
To:     Lorenz Brun <lorenz@brun.one>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>
References: <WCKRJR.J6HLBHK1X1TT3@brun.one>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <7896b326-22d1-c80b-9fa5-cc0f31d980ef@gmx.de>
Date:   Sat, 15 Oct 2022 03:26:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <WCKRJR.J6HLBHK1X1TT3@brun.one>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:55BQTYbKt2U2P6R7Mt962+CCcLvLQW8gDOO7JbixvojscXM9vzq
 rQCUYONhHiBFTxSn+qrRtnS/d7oXGqxeTfvQzMsDBjQDuwgKmhl7NTBp5GczTyC/+VOJYvE
 4c7lXusxBiu116rpbQwyM6h+8Si2eZXhyWzpNX392nCyLSO1IPO5o0c+D82mykjI4fcBcct
 9Y7wo/O5J6nttg5kqeASQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GQHoMnu83HI=:B0QjM/znsZISLMlidn0xwD
 oBMGNWEhNeB0Tavtn3+ih3BqAF8TnJPBRi9gOu/Eh4p/bDLPc9VxaBEhtRKWe2q7fK9NHo6LB
 J24AQt2qhB6bRbsvp1ZG8hGp3SuZz1ypZMMeLT0b9WzsBHFa0dLMvd+mlw6Ryt9f2eXW/gpIE
 pkTlOeEQ2WuFguK2bAnUqFMQZlcBfOmh/iSecjflFaGO0x8UpR/Rx67t0YaGIAzemmO12E/tD
 rah5UWAuNbyvJjS1wHUpn3CT06EAzc//AmoP6NcQQYioVHWDLJzzx8gm2gjrzXQo5AOkmpk4j
 116svLFiI8xtYvYVN0h4x1LI0/1Mn/Cu9DSWmrCKKrTtljDU1gw4wc9Ai8lQV74hKYWcUkPE+
 hwMcpzyqzvFcx5+Ofvwl0QX6lN3TeMJTPdLuOY4pr2u6BYg8HSqYFASf8c43GjgJU1vAMMYUW
 cnlB81fkeFvVRdmYerj2k6VnA3SWUdQiGZnN5yEvrmln607/z+2wgWQFEuEJijinebg/UtpbF
 X5eHnKe4IuNwtTfnbKSliZhJ8ke89uQmCI1+hqb7NP9olnuDwSn9OevUvqFZlGqBH82rf1acB
 UiUg3DicHO/N45qjQV7ULtDnem0/LV3oZSibnOX+ppSOMqeCUWtDvLFvlCQiR+rCE8jbrePai
 69/1vhuhfq7sCLlCXgeA7v2Qudm4H3iOU7DeRYVMTwAXYhXWLlb27DzPrZ3wsUHGcEkdUdjGh
 C0aV+ACS2J+lX7w1I5IYl3BvDngcYrdeV/Mb5FVgTabNnUr7lBGiJ+hnaPrCXJ/n4NRO20Nz8
 QPksOdn0aUDJpcIRZDLlKGMteJMEXDa2mRnLN2cksHTuM9RDA0xWb9671t/MUI/nF9lbt2H6o
 KXQ5SsZzcvpZLjSr0vNpNo577Is2fQx31oOMJU/RTkF2JVbel1RvSU4wf9x4Kpz4P8XsKvgc5
 nJ+6ag0mCzTYa/uXo1U4L6K75GNNpKctOWPmBC5DCaEb82GCkUh6uEfeTeHjtCQJzqaktRYdZ
 WdANf6IDwuaN74L2K65Md58r+zZmiTv6uYI+7za2qLOGE/VSlK40de84+IvrrTL8S8iPXmjGd
 NnxvJKIByGgHk3zd0zDz1EertR6w3maZvDmQfdVAfTc527mhIq0L11MyQdtuD7xrK/mrz2kr1
 aw6LmW23lX8GCegJiGj4KpuAs73IAXmY1s9QYWP9WG+SvV38YOMlyM1mx0yq1ddx26KdlV0Ff
 jUy3kd42Hf1nFDrsMmEt/yUyM+CZZcnyYN7HpZyNaN8FLYb8F2Zkq9D9wRIBbHCMlbRHidbpF
 QXkMUYvkFvcClQGgYYLoHKNso6afBdT3acglAwi/c0KmDgAlnfgfMo5mrn7kbabvVKze2qxP4
 Wj+IHTFf/IYZTrrXMn/LDlJrpTZtjBFqbQ9P8uuyIcIZzNvzjnhFTekSUM8UoI1v+KMBkhglw
 +nelivrB3Jpx0cZj2Wn6ojxnjuHKja3Fv6nglced4NAgyvqMuYWtc6fklwY7I2FwWbRGc/FMI
 DeRuJAW2irKR/vmUXvNarewCPY1WuqHnMvnCKZVHmL8ZD
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am 15.10.22 um 00:12 schrieb Lorenz Brun:

> Hi x86 platform list,
>
> I'm considering contributing support for the usage mode/tablet mode
> switch for some Lenovo laptops (including the popular IdeaPad Flex
> series).
> There is already an out-of-tree driver at
> https://github.com/lukas-w/yoga-usage-mode which works well,
> but I'd like to get this support upstream.
>
> I have a few questions regarding the best approach:
> 1. There is the ideapad-laptop module already which deals with a bunch
> of functionality related to these laptops, but not the mode switch. Do
> you prefer a separate driver or should the functionality be added to
> ideapad-laptop?
> 2. The existing out-of-tree driver uses a WMI interface to access mode
> information. Should I work on the WMI layer or should I figure out
> which EC registers to use to get the functionality independently? If
> yes, how do we want to identify support for this type of mode switch?
>
> Regards,
> Lorenz
>
>
Hi,

1) In my opinion, the ideapad-laptop driver uses a totally different inter=
face than the out of tree driver, so it would make sense to create a separ=
ate driver.
2) You should stick to the WMI interface. The vendor could change the inte=
rnal EC registers at any time, which would drastically limit the portabili=
ty and
reliability of the driver in question. Also, there exists a whole WMI subs=
ystem inside the linux kernel, which for example supports automatic discov=
ery of
WMI devices, etc.

Looking at the out-of-tree driver in question, it seems that it does not f=
ully utilize the WMI subsystem. If you want to upstream it, i suggest a re=
write
to fix this. Since the driver is quite small, it should be relatively easy=
. Optionally, you could also add support for LENOVO_GSENSOR_DATA, since it=
 also
has some interesting methods. However, the scope of the driver is complete=
ly up to you.

There are already some WMI-based drivers inside the kernel, maybe they can=
 serve as an inspiration?

Armin Wolf

