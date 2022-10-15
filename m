Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D15C4332F
	for <platform-driver-x86@archiver.kernel.org>; Sat, 15 Oct 2022 22:26:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbiJOWZ7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 15 Oct 2022 18:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiJOWZ6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 15 Oct 2022 18:25:58 -0400
Received: from mx.dolansoft.org (s2.dolansoft.org [212.51.146.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFF983FD5E
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Oct 2022 15:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=brun.one;
        s=s1; h=MIME-Version:References:In-Reply-To:Message-Id:To:Subject:From:Date:
        From:To:CC:Subject:Date:Message-ID:Reply-To;
        bh=y+GixJEsqXbpoQFZO4l6EJxpC2s81EVeJoJjCa721JM=; b=C8AfHd/+Fzj3UBW6K2VCecLNJ8
        krK92XZDrvvjq50kSIo7JFJw2CSqOyYmnyX3MPsKG6IjLHWEJh3/2W4l/LmTx4skLD3FfycpodLOO
        BX0SlFtcCQl7sZZtT/h9XZWIwYgwuc2YnZDqK9boR6RaVlSdEOnzI2fZBSWa2eZDBUcQ+6s75Js7h
        SuhOfRz6qpxUz08+gVLYN+6W+oc/dZODMR3vrwNRaoz/RgudifwDmTOvZujpe3v+fVMPHqZtN4u+s
        8bGV2bSwKwffr1I+82/H1ut3Jik9i6jEDf1KEL6DdgOi7Usfkw0S7/9QJKqKpBKxB7yu2socX6sLX
        Ka+erULw==;
Received: from [212.51.153.89] (helo=[192.168.12.54])
        by mx.dolansoft.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <lorenz@dolansoft.org>)
        id 1ojpbO-0001AC-18;
        Sat, 15 Oct 2022 22:25:54 +0000
Date:   Sun, 16 Oct 2022 00:25:48 +0200
From:   Lorenz Brun <lorenz@brun.one>
Subject: Re: Upstreaming Lenovo tablet switch driver
To:     Armin Wolf <W_Armin@gmx.de>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>
Message-Id: <0NFTJR.N3ZFSHV6AM7A2@brun.one>
In-Reply-To: <7896b326-22d1-c80b-9fa5-cc0f31d980ef@gmx.de>
References: <WCKRJR.J6HLBHK1X1TT3@brun.one>
        <7896b326-22d1-c80b-9fa5-cc0f31d980ef@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: lorenz@dolansoft.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Armin,

Thanks for your input. While looking at new WMI drivers which I could 
use as a reference, I stumbled upon 
https://patchwork.kernel.org/project/platform-driver-x86/patch/20221004214332.35934-1-soyer@irl.hu/ 
which was sent last week and implements a driver for the same WMI 
interface. So I guess there is not much left for me to implement here, 
I'll just follow that patch.

Regards,
Lorenz

On Sat, Oct 15 2022 at 03:26:50 +02:00:00, Armin Wolf <W_Armin@gmx.de> 
wrote:
> Am 15.10.22 um 00:12 schrieb Lorenz Brun:
> 
>> Hi x86 platform list,
>> 
>> I'm considering contributing support for the usage mode/tablet mode
>> switch for some Lenovo laptops (including the popular IdeaPad Flex
>> series).
>> There is already an out-of-tree driver at
>> https://github.com/lukas-w/yoga-usage-mode which works well,
>> but I'd like to get this support upstream.
>> 
>> I have a few questions regarding the best approach:
>> 1. There is the ideapad-laptop module already which deals with a 
>> bunch
>> of functionality related to these laptops, but not the mode switch. 
>> Do
>> you prefer a separate driver or should the functionality be added to
>> ideapad-laptop?
>> 2. The existing out-of-tree driver uses a WMI interface to access 
>> mode
>> information. Should I work on the WMI layer or should I figure out
>> which EC registers to use to get the functionality independently? If
>> yes, how do we want to identify support for this type of mode switch?
>> 
>> Regards,
>> Lorenz
>> 
>> 
> Hi,
> 
> 1) In my opinion, the ideapad-laptop driver uses a totally different 
> interface than the out of tree driver, so it would make sense to 
> create a separate driver.
> 2) You should stick to the WMI interface. The vendor could change the 
> internal EC registers at any time, which would drastically limit the 
> portability and
> reliability of the driver in question. Also, there exists a whole WMI 
> subsystem inside the linux kernel, which for example supports 
> automatic discovery of
> WMI devices, etc.
> 
> Looking at the out-of-tree driver in question, it seems that it does 
> not fully utilize the WMI subsystem. If you want to upstream it, i 
> suggest a rewrite
> to fix this. Since the driver is quite small, it should be relatively 
> easy. Optionally, you could also add support for LENOVO_GSENSOR_DATA, 
> since it also
> has some interesting methods. However, the scope of the driver is 
> completely up to you.
> 
> There are already some WMI-based drivers inside the kernel, maybe 
> they can serve as an inspiration?
> 
> Armin Wolf
> 


