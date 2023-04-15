Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C3DC7619A
	for <platform-driver-x86@archiver.kernel.org>; Sat, 15 Apr 2023 13:31:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjDONbp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 15 Apr 2023 09:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjDONbo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 15 Apr 2023 09:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9AD22115
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Apr 2023 06:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681565454;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NcvzNNael5RZ48MN+Rhic1gwvv1RpZsAbU5niqhRVqU=;
        b=S8s6E4q/JzETj230q73KIsyDC0CITXG3cyU/0Hx3CR/TsagL8NzrssJyt43Kfo2X8Abfpv
        LuY9/XoDffVSpBOiSQMzp6kofyG6vrQvKl6mlDxcGlQaieh0DqQ0Yfz22xnb7p+XyUOIOU
        2HLpD1wAcbMInSs7XYpSnQbHaoBmLnc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-Qt96yyZQMXOkFpmpXGefGw-1; Sat, 15 Apr 2023 09:30:52 -0400
X-MC-Unique: Qt96yyZQMXOkFpmpXGefGw-1
Received: by mail-ed1-f70.google.com with SMTP id k24-20020a508ad8000000b005068d942d3fso1310497edk.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Apr 2023 06:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681565451; x=1684157451;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NcvzNNael5RZ48MN+Rhic1gwvv1RpZsAbU5niqhRVqU=;
        b=Ybj8Rk0yagkhC6KAUnqRbD7rW/Y4PsDIKBF2Ddflu+8N/+PDrbN+dldwaCWBO9cbwm
         M/ifWYEEEMdTL9OS6Yp865CMZBhGwXT4uhwr879LfkjmZr3bkg3Qe/JjNXhLCln5xV2z
         OWe7a7qpB1RU5H4gOBaRT6xRI86/mX0LQ9z8afBPF3wh2chIT2smbuE/l3/YWlH0ZhJZ
         FS6CWcut2O/wqKw6aXyDhZWLt+i6U2OBVCShxaT7sqUkZ8gbR7KGE9WosjZYG6i24UHd
         04RxOi9ugyi6CIj6SI0bvc7O70BAwffZRXQxdN/UmrbWQtO9wl78BIS95ADAc6Yma3fZ
         X+zQ==
X-Gm-Message-State: AAQBX9fT39otKiSZ7qaPiA3R5GfFTbOe2ZXS7LdSzC60w8LfF34F9jgJ
        PYBl97xCy+/psg3WUDU4glwLEXMa+AQCrjGRpD5DzBTNg5uYWLIal1wN8ouDAIMgbnHTuGl0GSO
        hsnU8CCOyL3oiPSjOYD0K9wS9Dj4SFR5+wQ==
X-Received: by 2002:a17:906:544e:b0:92e:a1d8:bf1 with SMTP id d14-20020a170906544e00b0092ea1d80bf1mr2017007ejp.13.1681565451697;
        Sat, 15 Apr 2023 06:30:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZRUZIAWkx8m427CwzAdFZkWzx2pEe1/g3W9zMN/WqZOoqFCLvT/q2T/PrIt/hyhpT12XosAA==
X-Received: by 2002:a17:906:544e:b0:92e:a1d8:bf1 with SMTP id d14-20020a170906544e00b0092ea1d80bf1mr2016992ejp.13.1681565451366;
        Sat, 15 Apr 2023 06:30:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y14-20020a1709064b0e00b0094e60ac9678sm3765955eju.122.2023.04.15.06.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Apr 2023 06:30:50 -0700 (PDT)
Message-ID: <2739eb24-736f-6f59-70c5-d9975c354369@redhat.com>
Date:   Sat, 15 Apr 2023 15:30:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix Embedded Controller
 access on X380 Yoga
Content-Language: en-US, nl
To:     Liav Albani <liavalb@gmail.com>,
        Daniel Bertalan <dani@danielbertalan.dev>,
        Mark Gross <markgross@kernel.org>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
References: <20230414180034.63914-1-dani@danielbertalan.dev>
 <060c750b-f282-b1f4-2fcc-64fc3885f149@redhat.com>
 <a1229347-b5f3-8a1d-40a8-20beb863592a@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a1229347-b5f3-8a1d-40a8-20beb863592a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/15/23 15:24, Liav Albani wrote:
> 
> On 4/15/23 13:12, Hans de Goede wrote:
>> Hi,
>>
>> On 4/14/23 20:02, Daniel Bertalan wrote:
>>> On the X380 Yoga, the `ECRD` and `ECWR` ACPI objects cannot be used for
>>> accessing the Embedded Controller: instead of a method that reads from
>>> the EC's memory, `ECRD` is the name of a location in high memory. This
>>> meant that trying to call them would fail with the following message:
>>>
>>>   ACPI: \_SB.PCI0.LPCB.EC.ECRD: 1 arguments were passed to a non-method
>>>   ACPI object (RegionField)
>>>
>>> With this commit, it is now possible to access the EC and read
>>> temperature and fan speed information. Note that while writes to the
>>> HFSP register do go through (as indicated by subsequent reads showing
>>> the new value), the fan does not actually change its speed.
>>>
>>> Signed-off-by: Daniel Bertalan <dani@danielbertalan.dev>
>> Interestig, this looks like a pretty clean solution to me.
> 
> Daniel and I have looked in the DSDT ASL code and found a bunch of registers in high physical memory location (which is an ACPI OpRegion),
> and one of the registers had a bit called ECRD.
> However, there were many other registers that might be interesting as well, the problem is the short names in the ASL code (so we only see abbreviations essentially).
> 
> 
> While I do agree that adding this code is indeed a clean solution, if you (people that are dealing with Thinkpad laptops) know about cleaner way to access the embedded controller, I think it's preferable, because this way Daniel might be able to trigger the fan on that laptop so it will actually spin and will dissipate-out heat from the system, without the relying on the embedded controller to get into some sort of thermal state and then to trigger the fan.

Have you tried falling back to the ec_read() and ec_write() helpers
exported by the ACPI EC code ?

The "first_ec" pointer used by these functions is exported too,
so you could try modifying thinkpad_acpi to use ec_read() and
ec_write() as fallback when first_ec is set (and the quirk
added by this patch triggers).

Regards,

Hans



>> Mark Pearson, do you have any remarks on this ?
>>
>> Regards,
>>
>> Hans
>>
>>
>>> ---
>>>  drivers/platform/x86/thinkpad_acpi.c | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>>> index 7191ff2625b1..6fe82f805ea8 100644
>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>> @@ -11699,6 +11699,7 @@ static int __init thinkpad_acpi_module_init(void)
>>>  {
>>>  	const struct dmi_system_id *dmi_id;
>>>  	int ret, i;
>>> +	acpi_object_type obj_type;
>>>  
>>>  	tpacpi_lifecycle = TPACPI_LIFE_INIT;
>>>  
>>> @@ -11724,6 +11725,21 @@ static int __init thinkpad_acpi_module_init(void)
>>>  	TPACPI_ACPIHANDLE_INIT(ecrd);
>>>  	TPACPI_ACPIHANDLE_INIT(ecwr);
>>>  
>>> +	/*
>>> +	 * Quirk: in some models (e.g. X380 Yoga), an object named ECRD
>>> +	 * exists, but it is a register, not a method.
>>> +	 */
>>> +	if (ecrd_handle) {
>>> +		acpi_get_type(ecrd_handle, &obj_type);
>>> +		if (obj_type != ACPI_TYPE_METHOD)
>>> +			ecrd_handle = NULL;
>>> +	}
>>> +	if (ecwr_handle) {
>>> +		acpi_get_type(ecwr_handle, &obj_type);
>>> +		if (obj_type != ACPI_TYPE_METHOD)
>>> +			ecwr_handle = NULL;
>>> +	}
>>> +
>>>  	tpacpi_wq = create_singlethread_workqueue(TPACPI_WORKQUEUE_NAME);
>>>  	if (!tpacpi_wq) {
>>>  		thinkpad_acpi_module_exit();

