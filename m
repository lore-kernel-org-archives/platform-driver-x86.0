Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C4D4C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 20 Mar 2022 20:02:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243854AbiCTUEQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 20 Mar 2022 16:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236833AbiCTUEQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 20 Mar 2022 16:04:16 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BBCE186F8B
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Mar 2022 13:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=sqJn2u3aJJYMdP0FnI8nyiQhw/n1oIA13AGVimaa/28=; b=o95GP3q0pkZmm0RLGocyDBtABB
        SB2YngG9NOpYLsd/uXRFSdUrlMJPzoYb7Nc8mOFlZXa7TnSFh1O3bEHfcfnI+0noa3In4EzjCIVpw
        5E6m4jzaO904aX1HorzSz2xm6F/aoSRw80Af1021RbvD6kSOCT+imQT9oy6JKQ4to+9G0D5Zkcaxu
        brz//e34cdRI7833epeN9QODJSqtWeAwPu+kBXtbtFA0FCo7aNCYwER6WsXa8vmi+k3q32gKgPH9D
        zXs2KvFAomHtF1wKirL/qvFOY1RblbwXwGyx0SNRvthfuverDXSNtyuvKeZLX28Kr2V1brK51z+uJ
        C2c/7wjg==;
Received: from [2601:1c0:6280:3f0::6c43]
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nW1lD-002tvV-Pn; Sun, 20 Mar 2022 20:02:48 +0000
Message-ID: <8dc33bd4-0877-cbe5-38b6-b827d2234299@infradead.org>
Date:   Sun, 20 Mar 2022 13:02:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Dell laptop touchpad disabling?
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com
Cc:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Stuart Hayes <stuart.w.hayes@gmail.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Perry Yuan <Perry.Yuan@dell.com>
References: <b9d9171d-1287-e5aa-46d2-2475817074ba@infradead.org>
 <d1192588-8993-5052-6018-7a2f8393cff9@redhat.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <d1192588-8993-5052-6018-7a2f8393cff9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 3/18/22 01:54, Hans de Goede wrote:
> <attempt 2, fat-fingered send>
> 
> Hi Randy,
> 
> On 3/18/22 01:32, Randy Dunlap wrote:
>> Hi all,
>>
>> I have a Dell Inspiron 15 5510 laptop. Of course, it has a touchpad
>> (which I think of as a nuisance pad).
>> I would like to be able to disable the touchpad easily.
>>
>> Are there any best practices or suggestions for how to do this?
>> (I am using xfce4 as the desktop environment if that matters.)
>>
>>
>> Sometimes the touchpad is discovered as a PS/2 Generic Mouse on
>> the i8042 AUX port, and sometimes it is discovered as this
>> touchpad: "DELL0B24:00 04F3:3147 Touchpad" on some I2C device:
>> "i2c-DELL0B24:00". (The different discoveries might have something
>> to do with my kernel configuration/builds, but I don't know that
>> for sure.)



BTW, it seems that Perry Yuan is no longer at Dell, so would someone
from Dell please update this entry in the MAINTAINERS file?


DELL WMI HARDWARE PRIVACY SUPPORT
M:	Perry Yuan <Perry.Yuan@dell.com>

Thanks.
