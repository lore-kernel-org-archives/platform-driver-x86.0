Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CB3CDB47E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Oct 2023 14:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345481AbjJROhk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Oct 2023 10:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235354AbjJROh3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Oct 2023 10:37:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B52F1FCF
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Oct 2023 07:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697639698;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v09YadxFq3LwfS3e2/c2qcOqdDcibQsc7j7zjvmD+4M=;
        b=W0Shf7CoTrKMRsiVmr3bRuoc9nwPwKh4DmBGoWQdmO25+yThjxqyQjeL0NnKS/bCLpyB1x
        gFowC4VFE99jU25urg1Sqp59LQ3cB3LuTKz3grwdSASFpXEN1zj/jD5SEHPlb3Pz3CUEK/
        4R4fO8CEb6+tmZejMIi1qdwLzGxc9f0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675--NfREWtNPuqCVn2ZTg9vNg-1; Wed, 18 Oct 2023 10:34:57 -0400
X-MC-Unique: -NfREWtNPuqCVn2ZTg9vNg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9b822f5c156so511433366b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Oct 2023 07:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697639696; x=1698244496;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v09YadxFq3LwfS3e2/c2qcOqdDcibQsc7j7zjvmD+4M=;
        b=fi0t7/a+ZU5CfuRW2TvRmz3zf5XBkuUc6XfpS06nw63+Bbi6Qjy8QVjrPLukr7QcDy
         kA+k2z5TE0adYXCmoAhcdW90sIkw+LzyGzblbWVgo/CaRdfOI0IFLGQanOuD94sqrevV
         BlKprFl9CJ5hDwzrqnE9+rtgtGU23S/lzr6DOPnk0NU8GMKRWoJfpiWrTo+CsyMVKEyu
         6YwBubMosBaZlBOvW8qhANzr0gdzIStXiF/qVKURAAbjNWzP16jMERsGaEKfCEmQoOwL
         hTnFsPlusN3mqR4HKZyHvpUX+vPy9LsLNq4CzK0Hjy/oCfePYQO2x+Psjmw1PHpXtJPg
         P+Kw==
X-Gm-Message-State: AOJu0YwsPWEg9IzZeZq1xU9qp7JvT/Jjg8ADjkhW//2BYKgr48k6Vaya
        Vx3tHYPdJ15G2Q6Tfew2izmAPpPAmM6n4Kon3cPdXc37d/+EKlmhxvCYEFMJN7a/8ptnPwNaNQG
        UxQp+oJGQlV4E2lxPm6AFjVhQt8I3BvGLCw==
X-Received: by 2002:a17:907:94c1:b0:9be:4bb0:64f with SMTP id dn1-20020a17090794c100b009be4bb0064fmr3685981ejc.54.1697639695881;
        Wed, 18 Oct 2023 07:34:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx7J64uo4zbtF7CSik5pxKna+d8ZFIxnfSEzVzVXJ35sjuCt6iEovoPoehrOkPhuT4PR+U+A==
X-Received: by 2002:a17:907:94c1:b0:9be:4bb0:64f with SMTP id dn1-20020a17090794c100b009be4bb0064fmr3685970ejc.54.1697639695540;
        Wed, 18 Oct 2023 07:34:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id os20-20020a170906af7400b0099cc36c4681sm1805799ejb.157.2023.10.18.07.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 07:34:54 -0700 (PDT)
Message-ID: <52c170f7-92fe-b814-1587-ffba3c82ec43@redhat.com>
Date:   Wed, 18 Oct 2023 16:34:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/5] platform/x86: msi-ec: Add fw version and release date
 attributes
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Nikita Kravets <teackot@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
References: <20231010172037.611063-3-teackot@gmail.com>
 <20231010172037.611063-7-teackot@gmail.com>
 <974c5-8032-28e0-fd2f-9fbc9d413e4b@linux.intel.com>
 <c447f107-df52-92d1-fdd3-96b76860621e@redhat.com>
 <72d7f17d-25a6-dc6-453a-af553ae2349@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <72d7f17d-25a6-dc6-453a-af553ae2349@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/12/23 14:56, Ilpo Järvinen wrote:
> Hi Hans,
> 
> You missed the one question I had for you. I put it now conviniently at 
> the end of the quote block below...
> 
> On Thu, 12 Oct 2023, Hans de Goede wrote:
>>
>> Great to see that you are working on upstreaming more of the
>> out-of-tree msi-ec functionality. Thank you for working on this.
>>
>> On 10/11/23 14:41, Ilpo Järvinen wrote:
>>> On Tue, 10 Oct 2023, Nikita Kravets wrote:
>>>
>>>> Create a root attribute group and add the first platform device
>>>> attributes: firmware version and firmware release date. Firmware
>>>> version attribute uses an already present ec_get_firmware_version()
>>>> function. Both features are present on all supported laptops.
>>>>
>>>> Cc: Aakash Singh <mail@singhaakash.dev>
>>>> Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
>>>> Signed-off-by: Nikita Kravets <teackot@gmail.com>
>>>> ---
> 
>>>> +static ssize_t fw_release_date_show(struct device *device,
>>>> +				    struct device_attribute *attr, char *buf)
>>>> +{
>>>> +	u8 rdate[MSI_EC_FW_DATE_LENGTH + 1];
>>>> +	u8 rtime[MSI_EC_FW_TIME_LENGTH + 1];
>>>> +	int result;
>>>> +	int year, month, day, hour, minute, second;
>>>> +
>>>> +	memset(rdate, 0, MSI_EC_FW_DATE_LENGTH + 1);
>>>
>>> sizeof(*rdate) is safer so please use it.
>>>
>>>> +	result = ec_read_seq(MSI_EC_FW_DATE_ADDRESS,
>>>> +			     rdate,
>>>> +			     MSI_EC_FW_DATE_LENGTH);
>>>> +	if (result < 0)
>>>> +		return result;
>>>> +
>>>> +	result = sscanf(rdate, "%02d%02d%04d", &month, &day, &year);
>>>
>>> There fields would naturally be %u and unsigned but see the other comment 
>>> below before doing this change.
>>>
>>>> +	if (result != 3)
>>>> +		return -EINVAL;
>>>
>>> EINVAL should be returned if the input was invalid but here the data 
>>> itself is not okay so some other errno would be better.
>>>
>>>> +	memset(rtime, 0, MSI_EC_FW_TIME_LENGTH + 1);
>>>
>>> sizeof() like above.
>>>
>>>> +	result = ec_read_seq(MSI_EC_FW_TIME_ADDRESS,
>>>> +			     rtime,
>>>> +			     MSI_EC_FW_TIME_LENGTH);
>>>> +	if (result < 0)
>>>> +		return result;
>>>> +
>>>> +	result = sscanf(rtime, "%02d:%02d:%02d", &hour, &minute, &second);
>>>> +	if (result != 3)
>>>> +		return -EINVAL;
>>>
>>> Ditto.
>>>
>>>> +
>>>> +	return sysfs_emit(buf, "%04d/%02d/%02d %02d:%02d:%02d\n", year, month, day,
>>>> +			  hour, minute, second);
>>>
>>> It would be kind of nice to use %pt formatting here instead of custom
>>> datetime format, however, it would either require converting to time64_t 
>>> or using struct rtc_time. The latter would naturally have the right fields 
>>> but they're not unsigned so my comment above about %u is not going to work 
>>> well with it.
>>>
>>> I'm also a bit unsure whether it's appropriate to use that struct outside 
>>> of rtc realm. vsprintf.c seems to convert time64_t into rtc_time before 
>>> printing though.
>>>
>>> Hans, do you have any idea about the struct rtc_time?

I don't really have any good ideas how to handle this. I agree that
using %pt might be a good idea, but then as you say the data would first
need to be converted to a struct rtc_time. All in all I think it is
probably best to stick with the DIY formatting of the time.
But I've no objections to doing the rtc_time conversion if people
think that is cleaner / better.

Regards,

Hans


