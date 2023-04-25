Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678B0C77B61
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Apr 2023 16:31:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbjDYQbk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Apr 2023 12:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234377AbjDYQbk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Apr 2023 12:31:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E0301444D
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 09:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682440256;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KkiBjG/U2iaSLLFqUrRMoqsUKvV+THkYT/zZJXbPjSQ=;
        b=A0ILexvMO09SYsisOQPBRJwSYZmr5SJX896W0DKEwUQnMHo5lRk0ebRKm4684bL5g1H5Ly
        0Ahz133xZv+Gt7IACY5SZNEO000sjWjSRDccTRsoYjKGSHp0K9HOtHBIE4G70bP0BHVVNU
        Dy3UQPg5/xpFN3yxiUxMdampR0raksM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-y-8suiRpPRmbTb8nQdRjxw-1; Tue, 25 Apr 2023 12:30:55 -0400
X-MC-Unique: y-8suiRpPRmbTb8nQdRjxw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94ec76d7a26so551743366b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 09:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682440253; x=1685032253;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KkiBjG/U2iaSLLFqUrRMoqsUKvV+THkYT/zZJXbPjSQ=;
        b=ICacvB0BNvA8s3VElOnZr1a/FV36kjA0JIbQOYjt0TOLc0nOdMbR7/vJrOuQUQYIZg
         ys4i6M1E1Bu4EVNF8MscIK3Svcb/MBbWMutWpVlbnaQZpGWxtfbGMZbSHPh4/4WiPySc
         NiG4VON1EDLfVY1I7SxC8KavAvckBZym88tUWl/DB/mKVYxuKBBteGekFej+TKyGqvQy
         tThfBNFejB9bYsrENkB0Cidg2SVNnQoU2gNdqyJgPxu6NvtySw954E693+8ZbLdlnXg5
         SdYTPFOsEgjFhFB8bqWpCRibClID8tujee6cyNySBjf0KfNi3uWU1jddqyZeWJK+3UBE
         mMfA==
X-Gm-Message-State: AAQBX9ebMome/hbc1vDoptWl6Z7FOahVRGnZWi4Akmmo5OCrk2EQKEK9
        InrOtkChkyfOqgfxCYAgRT+ibb3T5igBOWC6yLejMOQi7OD27EGB2WjEf01XwDbvW7+/ELV1ggD
        SmHNIRe1mdi/aC5Wa3SE2q35FcKFCNgvqBw==
X-Received: by 2002:a17:907:80c5:b0:94a:a887:c29f with SMTP id io5-20020a17090780c500b0094aa887c29fmr14393044ejc.68.1682440253105;
        Tue, 25 Apr 2023 09:30:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y5NoM7SoY7Gd84hixRqsCU49QlzpEGdn67Y4Iy5C05ojEIo3rR8k+JHUgIfz1utWhxBib3Yw==
X-Received: by 2002:a17:907:80c5:b0:94a:a887:c29f with SMTP id io5-20020a17090780c500b0094aa887c29fmr14393026ejc.68.1682440252805;
        Tue, 25 Apr 2023 09:30:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id s22-20020aa7cb16000000b00509e3053b66sm2169795edt.90.2023.04.25.09.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 09:30:52 -0700 (PDT)
Message-ID: <1b68caa2-3c4a-1f47-6409-5ebfd34e431f@redhat.com>
Date:   Tue, 25 Apr 2023 18:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/4] platform/x86: wmi: Add documentation
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>, Armin Wolf <W_Armin@gmx.de>,
        markgross@kernel.org
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230424222939.208137-1-W_Armin@gmx.de>
 <20230424222939.208137-4-W_Armin@gmx.de>
 <fd333355-8059-4d7d-7a7e-be67006ad3fc@infradead.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <fd333355-8059-4d7d-7a7e-be67006ad3fc@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

Armin thank you very mich for the WMI documentation work,
this is much appreciated!

On 4/25/23 05:07, Randy Dunlap wrote:
> Hi--
> 
> On 4/24/23 15:29, Armin Wolf wrote:
>> Add documentation for the WMI subsystem. The documentation describes
>> both the ACPI WMI interface and the driver API for interacting with
>> the WMI driver core. The information regarding the ACPI interface
>> was retrieved from the Ubuntu kernel references and the Windows driver
>> samples available on GitHub. The documentation is supposed to help
>> driver developers writing WMI drivers, as many modern machines designed
>> to run Windows provide an ACPI WMI interface.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>  Documentation/driver-api/index.rst   |  1 +
>>  Documentation/driver-api/wmi.rst     | 21 ++++++
>>  Documentation/subsystem-apis.rst     |  1 +
>>  Documentation/wmi/acpi-interface.rst | 96 ++++++++++++++++++++++++++++
>>  Documentation/wmi/index.rst          | 18 ++++++
>>  MAINTAINERS                          |  2 +
>>  6 files changed, 139 insertions(+)
>>  create mode 100644 Documentation/driver-api/wmi.rst
>>  create mode 100644 Documentation/wmi/acpi-interface.rst
>>  create mode 100644 Documentation/wmi/index.rst
>>
> 
>> diff --git a/Documentation/driver-api/wmi.rst b/Documentation/driver-api/wmi.rst
>> new file mode 100644
>> index 000000000000..6ca58c8249e5
>> --- /dev/null
>> +++ b/Documentation/driver-api/wmi.rst
>> @@ -0,0 +1,21 @@
>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +==============
>> +WMI Driver API
>> +==============
>> +
>> +The WMI driver core supports a more modern bus-based interface for interacting
>> +with WMI devices, and an older GUID-based interface. The latter interface is
>> +considered to be deprecated, so new WMI drivers should generally avoid it since
>> +it has some issues with multiple WMI devices and events sharing the same GUIDs
>> +and/or notification IDs. The modern bus-based interface instead maps each
>> +WMI device to a :c:type:`struct wmi_device <wmi_device>`, so it supports
>> +WMI devices sharing GUIDs and/or notification IDs. Drivers can then register
>> +a :c:type:`struct wmi_driver <wmi_driver>`, which will be bound to compatible
>> +WMI devices by the driver core.
>> +
>> +.. kernel-doc:: include/linux/wmi.h
>> +   :internal:
> 
> There are no kernel-doc comments in include/linux/wmi.h, so this
> causes a kernel-doc warning:
> 
> ../include/linux/wmi.h:1: warning: no structured comments found
> 
> Otherwise this all looks good.

So what is the plan here, is there something we can do to fix this
new warning and should I expect a v3?  Or shall I merge this as is ?

Regards,

Hans





> 
> 
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> 
> thanks.

