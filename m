Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C49C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Jun 2022 14:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235473AbiF0Ovi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Jun 2022 10:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235118AbiF0Ovi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jun 2022 10:51:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6706C13F83
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 07:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656341496;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+NVcgilbKBqY/bcaybUy4vi+pTuKcdSC1jfrGNIdKbM=;
        b=HEkcCOxSJ0swzUnr9HxiWJ7GRA6Y1dkuONhwSd35/22Zf/mNxLdIULODL8N3OF6uQbLc+9
        M8+rG7NteaAaT6oHxQ+7cQvXEk6yzasIG+JaZNIxboivvfl5pvFi2Sozz/5CVpWb4eJKNC
        WG3ju1ZgkWxX2RplkekIpnGoSBpmVKc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-GbB7qPgXP8OES44I_Vzblw-1; Mon, 27 Jun 2022 10:51:35 -0400
X-MC-Unique: GbB7qPgXP8OES44I_Vzblw-1
Received: by mail-ed1-f69.google.com with SMTP id v16-20020a056402349000b00435a1c942a9so7394678edc.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 07:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+NVcgilbKBqY/bcaybUy4vi+pTuKcdSC1jfrGNIdKbM=;
        b=Nv1u8VLSPG9eCUAnrxpv0QlmFepeqigyLeP19GXO5FpjDOTET6FfboIeJHrgjGvcTH
         a3qYBn5qN8LEuKtRzV1B9uOrz1Lgvh6Q6LozBW4BA+XdWejgsb4gAq26voeyW5lhmsqk
         MOs+BrO++6wHVlbhv3IrnD6idiAIyCen3t32FnVPWw4zuxP40VzvQM9DvIjAfjsGdXcL
         kvJ1PekAvmrDHcy5Nyryw/LghtsQEVMk26DkqOxzEL4KCWZrS26T26aMoqyEk3jI5qGS
         vZ7gpo/YF8tePoDRXOInpz1M2USrbHaXJxm51bFMPdbdixZVBZPPB9WCaXmoj/I4kyqK
         oZtg==
X-Gm-Message-State: AJIora8XJQ5dONb0eVTnpRdWYrtvMRXOvy2kbhvW9U1Rb6Fs9EMPPMje
        +tM+bQVomVHEeZWg6qWGyt8owCdfz+xwdsORQ5v7T91WwHctI0nrGAuBWTLbnPtgjSiBf0uFfqy
        G8jn31JZdfhPiRJOVMfIEi8yGk11Ccryx2g==
X-Received: by 2002:a17:907:3f29:b0:722:e5b0:ebe7 with SMTP id hq41-20020a1709073f2900b00722e5b0ebe7mr12953815ejc.335.1656341493812;
        Mon, 27 Jun 2022 07:51:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vhuklMR3U191ZWBS+1Cg2fDzYs+12Tvjk5yq4lP9S1x7WYMkyOxzS6kJ1VRX7/bbqWTe2GKg==
X-Received: by 2002:a17:907:3f29:b0:722:e5b0:ebe7 with SMTP id hq41-20020a1709073f2900b00722e5b0ebe7mr12953806ejc.335.1656341493635;
        Mon, 27 Jun 2022 07:51:33 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id m14-20020aa7c2ce000000b0042dc9aafbfbsm7605075edp.39.2022.06.27.07.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 07:51:33 -0700 (PDT)
Message-ID: <f2ff2436-6811-af90-0f1c-215d695cba75@redhat.com>
Date:   Mon, 27 Jun 2022 16:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [External] Re: [PATCH] platform/x86: thinkpad_acpi: do not use
 PSC mode on Intel platforms
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20220622181329.63505-1-markpearson@lenovo.com>
 <e134b37f-6618-d3ad-7de7-3b376c30a16c@redhat.com>
 <e954a0b5-3601-9da9-3cd6-0d9b06df0d27@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e954a0b5-3601-9da9-3cd6-0d9b06df0d27@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/27/22 16:43, Mark Pearson wrote:
> 
> Hi Hans
> 
> On 6/27/22 03:52, Hans de Goede wrote:
>> Hi,
>>
>> On 6/22/22 20:13, Mark Pearson wrote:
>>> PSC platform profile mode is only supported on Linux for AMD platforms.
>>>
>>> Some older Intel platforms (e.g T490) are advertising it's capability
>>> as Windows uses it - but on Linux we should only be using MMC profile
>>> for Intel systems.
>>>
>>> Add a check to prevent it being enabled incorrectly.
>>>
>>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>>> ---
>>>  drivers/platform/x86/thinkpad_acpi.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>>> index e6cb4a14cdd4..be194be43663 100644
>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>> @@ -10548,6 +10548,11 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>>>  				dytc_mmc_get_available = true;
>>>  		}
>>>  	} else if (output & BIT(DYTC_FC_PSC)) { /* PSC MODE */
>>
>> After your recent patch series this now reads:
>>
>>         } else if (dytc_capabilities & BIT(DYTC_FC_PSC)) { /* PSC MODE */
>>
>> Please rebase on pdx86/for-next and send a new version.
> Ack - will do.
> 
>>
>>
>>
>>> +		/* Support for this only works on AMD platforms */
>>> +		if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD) {
>>> +			dbg_printk(TPACPI_DBG_INIT, "PSC not support on Intel platforms\n");
>>> +			return -ENODEV;
>>> +		}
>>
>> So I assume that e.g. the T490 does advertise MMC capability so
>> this path is not actually hit there ?
> No - they don't have MMC so this path is hit.
> 
>>
>> IOW this is just a sanity check. Or is this path being hit on actual
>> hw? The reason I'm asking is because if the path is being hit on actual
>> hw then the patch should go to my fixes branch too.
>>
> This is being hit on a few of the Intel platforms of that generation. It
> seems they don't have MMC mode support, but do have PSC mode - but that
> only works on Windows for Intel (needs driver changes we don't have).

Ok, once I have a new version of this, I'll add it to my fixes branch then.

Regards,

Hans

