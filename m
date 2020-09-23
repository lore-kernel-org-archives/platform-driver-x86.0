Return-Path: <SRS0=GDfv=DA=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB09EC2D0A8
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Sep 2020 18:41:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A848208B6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Sep 2020 18:41:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LHWMb6zL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgIWSls (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Sep 2020 14:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbgIWSlr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Sep 2020 14:41:47 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A522AC0613CE;
        Wed, 23 Sep 2020 11:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=iMjlhbOGV5L2ljtLni91GYUVVvFV7DW0WaNEN/WZeiQ=; b=LHWMb6zLD8EZxE3V1b7jJdUa40
        /HG/CGunxCc24zT9ngmZsgMUYfTOeYRWCHcN89bN6RmcVigzNUp7l28P3ji1CYUP/Eaa0auk/jBDO
        1/qWkKZMq9Lxy1G8Gz4aKoLxwVDxIp36h7SxVj/rrqm1mD1TalUPnrEAh1LMLbqRydKkplXA7cjym
        Zr3rxS9UQei517W6eRx6CUoebRRzBgM+uKORR0izJ4WyGnfnIRBMagemUBA1ggLJyPjKwNJstKf3n
        fmIgoGnFdAhS8JpHrS59HBtdbM+WSqskBqtFNQIXUoETtYiGj8ydXXBzvktQ3lUKkkEb0WJ8A4M9N
        wjvLZUrA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kL9hx-0003jd-87; Wed, 23 Sep 2020 18:41:37 +0000
Subject: Re: [PATCH v4] Introduce support for Systems Management Driver over
 WMI for Dell Systems
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        Divya Bharathi <divya27392@gmail.com>,
        "dvhart@infradead.org" <dvhart@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "Bharathi, Divya" <Divya.Bharathi@Dell.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        mark gross <mgross@linux.intel.com>,
        "Ksr, Prasanth" <Prasanth.Ksr@dell.com>
References: <20200923113015.110980-1-divya.bharathi@dell.com>
 <9b015765-de6f-3b2a-8804-e23864eb8806@infradead.org>
 <DM6PR19MB2636C149F84D46718774E7D2FA380@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <23df654d-e7ce-dcc8-df81-1d4cdb62f001@infradead.org>
Date:   Wed, 23 Sep 2020 11:41:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB2636C149F84D46718774E7D2FA380@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 9/23/20 11:39 AM, Limonciello, Mario wrote:
>> -----Original Message-----
>> From: Randy Dunlap <rdunlap@infradead.org>
>> Sent: Wednesday, September 23, 2020 12:12
>> To: Divya Bharathi; dvhart@infradead.org
>> Cc: LKML; platform-driver-x86@vger.kernel.org; Bharathi, Divya; Hans de Goede;
>> Andy Shevchenko; mark gross; Limonciello, Mario; Ksr, Prasanth
>> Subject: Re: [PATCH v4] Introduce support for Systems Management Driver over
>> WMI for Dell Systems
>>
>>
>> [EXTERNAL EMAIL]
>>
>> Hi,
>>
>> On 9/23/20 4:30 AM, Divya Bharathi wrote:
>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>>> index 40219bba6801..4fd7a3f0a904 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -430,6 +430,18 @@ config DELL_WMI
>>>  	  To compile this driver as a module, choose M here: the module will
>>>  	  be called dell-wmi.
>>>
>>> +config DELL_WMI_SYSMAN
>>> +	tristate "Dell WMI Systems management WMI driver"
>>
>> Could you drop one of those "WMI" strings or are both of them needed?
>>
> 
> Thanks, that's a good suggestion.  How about instead:
> 
> "Dell WMI based Systems management driver"

        WMI-based

OK. Thanks.

-- 
~Randy

