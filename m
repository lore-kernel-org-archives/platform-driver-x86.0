Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D598C05027
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Jan 2023 17:20:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233586AbjAWRUQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Jan 2023 12:20:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233595AbjAWRUQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Jan 2023 12:20:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD28E4C09
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 09:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674494332;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qN4hf3aFv7wrr9gbILBbar+Eeh+Sgm+dI/YqSVJuHQY=;
        b=MhfNFrFp70HuEsgRUqRs44sMnGkfPXDb6/5D6Dz9prZjAHtzvBp/qvbW2OcQb7yaAKP/jd
        NOHew0VXROuNnrDf1aVwPGOe7teaHcAjDJZP4cxNdGa8VUVxpx2Bke1QijeAMl6RsvzyFf
        uhD+3P1e/oDxY1I8troBQ20TdHoA8vI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-108-2wNvYs_eOPixy_NvuMALFg-1; Mon, 23 Jan 2023 12:18:50 -0500
X-MC-Unique: 2wNvYs_eOPixy_NvuMALFg-1
Received: by mail-ej1-f72.google.com with SMTP id qw29-20020a1709066a1d00b008725a1034caso8288316ejc.22
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 09:18:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qN4hf3aFv7wrr9gbILBbar+Eeh+Sgm+dI/YqSVJuHQY=;
        b=7LhiwmB8b7HKyh+wuEIS/PpY+8O+C7c60dx1P2d2NhBb8tlbAge6UKX6+JXFwaKZTD
         m5T3E6Ve09yz74bWU2zXHeMQUJJQG5kfTuN5XWM53RQX3jfgEFwXPmE2BfnqnkFnvmhQ
         KIDjWDF+JFawPxXztV2nAQI3RmYwyGqaPyrIQAygRLLKChUqQd0yPOf+0JcChjKNybCN
         8rPO79ZROi7K7QOUDAKEp3KPvnRZ9nSdTtFl/vzWsKpNZPXVNbxDht36WdOri1h4Njxt
         3uFy9sv7J/T7I4xq9WNC+04K/4Cw5jidArTtvaCBB9L8q1a5i9wGKGezSwNH7b2GwThU
         pfbw==
X-Gm-Message-State: AFqh2kpXhjZzSAZLwzp/J1GMqJVTVwJ2xGVqKEdJqNPLMYAh6hY0EObe
        ADc2iYn4lcd8oa6HmybNXsuAqD5ZT4R+ocfV+ryKt00c4maxn5szKYnD/kYs3HBriBRa2Gp4Ph9
        4TnLNvY9mbf7tbgsGqUq+Idu9hfZibJPKZQ==
X-Received: by 2002:a17:906:9f1c:b0:870:3c70:8c8d with SMTP id fy28-20020a1709069f1c00b008703c708c8dmr22212016ejc.17.1674494329728;
        Mon, 23 Jan 2023 09:18:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsvEkUpl1dTr80Cuo1CLYn4dkUfc2O9ILcDZpTe7hrdKgaVp+eXLdUaYCbFn5vGJzRegLMtxg==
X-Received: by 2002:a17:906:9f1c:b0:870:3c70:8c8d with SMTP id fy28-20020a1709069f1c00b008703c708c8dmr22211998ejc.17.1674494329458;
        Mon, 23 Jan 2023 09:18:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id he37-20020a1709073da500b0085e0882cd02sm17367961ejc.92.2023.01.23.09.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 09:18:48 -0800 (PST)
Message-ID: <653c46ac-9f8b-f545-3026-85def34ffac1@redhat.com>
Date:   Mon, 23 Jan 2023 18:18:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 1/5] Introduction of HP-BIOSCFG driver (1)
Content-Language: en-US, nl
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        Mark Pearson <mpearson@squebb.ca>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20221202173616.180108-1-jorge.lopez2@hp.com>
 <20221202173616.180108-2-jorge.lopez2@hp.com>
 <f797db3d-feaf-5c03-428e-595ec5f4e3a3@redhat.com>
 <CAOOmCE--Prhn0xbGgcJyUkwESO6nE-R4NVarY0nvzRmWTr+qnA@mail.gmail.com>
 <81f095db-4ca1-4baa-bee4-0ae52457e54b@app.fastmail.com>
 <CAOOmCE_bHLrq2Hd7RA9PYOdwJhgsJB-asgoadLiEC6D7NMOG1Q@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAOOmCE_bHLrq2Hd7RA9PYOdwJhgsJB-asgoadLiEC6D7NMOG1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/23/23 17:12, Jorge Lopez wrote:
> Hi Mark,
>=20
> On Fri, Jan 20, 2023 at 10:07 PM Mark Pearson <mpearson@squebb.ca> wrot=
e:
>>
>> Hi Jorge,
>>
>> On Fri, Jan 20, 2023, at 4:58 PM, Jorge Lopez wrote:
>>
>> Hi Hans,
>>
>> <snip>
>>
>>
>> Yes. The handling of auth-tokens/CMSL-payloads vs regular passwords
>> are similar with the exception of their size.
>> auth-tokens/CMSL-payloads are in the size larger than 64 bytes while
>> passwords are limited to 64 bytes.
>>>
>>> Except for the BEAM_PREFIX thing, which can be added to calculate_sec=
urity_buffer() /
>>> populate_security_buffer() too and in that case all 3 of the followin=
g should simply
>>> work, taking a boot-delay integer attribute as example:
>>>
>>> echo "password" > /sys/class/firmware-attributes/hp-bioscfg/"Setup Pa=
ssword"/current_password
>>> echo 5 > /sys/class/firmware-attributes/hp-bioscfg/attributes/boot-de=
lay/current_value
>>>
>>> echo "auth-token" > /sys/class/firmware-attributes/hp-bioscfg/"Setup =
Password"/current_password
>>> echo 5 > /sys/class/firmware-attributes/hp-bioscfg/attributes/boot-de=
lay/current_value
>>>
>>> cat csml-payload.file > /sys/class/firmware-attributes/hp-bioscfg/"Se=
tup Password"/current_password
>>> echo 5 > /sys/class/firmware-attributes/hp-bioscfg/attributes/boot-de=
lay/current_value
>>
>> Last two cases cannot be handled by passing auth-token/CMSL payloads
>> values to the current password due to their possible sizes.
>> Passwords are limited to 64 bytes in size while
>> auth-tokens/CFML-payloads are in the size larger than 64 bytes
>> Here are examples of CMSL flow for your records.  Most of generated
>> payloads are stored remotely and signed by customer to ensure the data=

>> integrity.   The full benefit of this process is better represented
>> when configuring Security settings in BIOS. (Sure Run, Sure Start,
>> Sure Recovery, etc)
>> .
>> 1. Customer generates a signed CMSL payload to set BIOS "USB Storage
>> Boot" value to "Enable"
>>
>> CMSL command:
>>
>> New-HPSureAdminBIOSSettingValuePayload -Name "USB Storage Boot" -Value=

>> "Enable" -SigningKeyFile sk.pfx -SigningKeyPassword test
>>
>> Generated payload:
>>
>> {"timestamp":"2022-09-26T16:01:22.7887948-05:00","purpose":"hp:sureadm=
in:biossetting","Data":[123,10,32,32,34,78,97,109,101,34,58,32,34,85,83,6=
6,32,83,116,111,114,97,103,101,32,66,111,111,116,34,44,10,32,32,34,86,97,=
108,117,101,34,58,32,34,69,110,97,98,108,101,34,44,10,32,32,34,65,117,116=
,104,83,116,114,105,110,103,34,58,32,34,60,66,69,65,77,47,62,65,83,65,65,=
68,65,65,65,73,120,77,121,89,119,72,47,47,47,47,47,47,47,47,47,47,47,47,4=
7,47,47,47,47,47,47,47,47,68,85,78,87,111,74,67,117,122,51,73,69,71,57,75=
,51,80,113,107,103,121,76,52,108,100,119,83,67,79,69,65,83,47,98,108,68,1=
22,111,116,47,105,77,43,86,103,122,90,77,69,116,43,48,75,87,75,78,103,119=
,89,99,86,102,121,97,70,56,99,104,102,57,85,47,86,82,106,51,52,122,112,53=
,111,43,85,112,97,119,97,116,106,50,74,103,115,97,105,104,113,54,90,53,84=
,48,101,49,114,56,78,80,109,69,105,119,103,113,118,77,51,108,97,86,83,98,=
116,101,66,112,80,81,88,119,102,66,56,101,105,112,119,120,104,121,67,68,6=
5,85,111,118,69,113,82,51,84,71,79,54,109,101,75,119,71,100,73,104,72,103=
,102,50,112,72,75,90,50,107,47,66,116,104,97,98,110,115,118,78,77,114,98,=
74,69,103,76,72,76,121,87,84,119,98,76,74,87,108,101,106,112,71,121,47,70=
,100,83,105,74,114,101,66,114,81,115,114,106,90,113,100,76,75,72,90,71,11=
7,108,52,70,108,43,117,47,72,102,107,48,119,121,81,69,106,121,97,99,51,52=
,57,105,90,55,97,104,49,72,56,50,85,97,50,49,55,109,74,51,88,56,87,113,80=
,111,50,86,72,65,85,57,71,102,47,113,107,97,85,101,75,76,84,97,75,87,101,=
121,122,116,68,109,105,68,98,115,114,47,86,51,51,106,114,101,67,88,65,65,=
109,120,68,76,73,73,66,103,83,88,79,82,82,117,98,80,53,113,80,78,69,53,67=
,76,120,104,119,61,61,34,10,125],"Meta1":null,"Meta2":null,"Meta3":null,"=
Meta4":null}
>>
>>
>> The application reads the CMSL payload and sends the command to the
>> driver.  The payload is translated to  [BIOS setting], [Value],
>> [Password || auth-token]
>>
>>
>> echo "USB Storage
>> Boot,Enable,<BEAM/>ASAADAAANZ9AYwH/////////////////////64bPg7ygUv4xano=
HIFrzME9mIsxeJh32fkhR7sgHpXdEHjetMXxNVhEK/twhhXhHS93kp9JpGhsr+J6AMKV2ldE9=
9iJHo6ul1IxJQuBSxBoN1mf49Mm/ROCNll+IhsAn4ow+xlDwKQn2EzKtQc2Wf1eC646KPcl+Z=
CtiFhvLzXZrGSXsB2hJy0+IzegUPzLY6jaN0lYyQMtQ0KpcyGnK6xZSKCKfotygWawWY8BD3o=
ewyrVLdKMGjrtX4HtHaeo5A9VVXVt89i7lZAmV3VkRtu70LEv240ue/SOhwrxGtydgNmtpV3d=
Sn/ancnY4ONbTxBRiw8cifObEiNOidYzhpQ=3D=3D"
>>> /sys/class/firmware-attributes/hp-bioscfg/attributes/Sure_Admin/setti=
ngs'
>>
>> As you can see, the auth-token  "<BEAN/>.....=3D=3D" portion varies in=

>> size depending on the signing certificate size used.
>>
>> A method that can be used to address your comments and allow the
>> driver to handle both auth-tokens and password using command
>>
>>        echo "auth-token" >
>> /sys/class/firmware-attributes/hp-bioscfg/"Setup
>> Password"/current_password
>>
>> is adding an modifier to indicate if the input is a password or auth-t=
oken
>>
>> For instance...  using [Token] modifier to identify the data is an
>> authentication token
>>
>>      echo "[token] auth-token" >
>> /sys/class/firmware-attributes/hp-bioscfg/"Setup
>> Password"/current_password
>>
>> If the modifier is missing, the driver will treat the data as a passwo=
rd.
>>
>> This new method will conform with the firmware class framework and
>> provide the flexibility needed for HP solution.
>>
>> Please advise.
>>
>> I don't know if this is helpful or not as I've not read your code in a=
ny detail and was just being nosy whilst skimming the mailing list posts =
- but I did similar for the Lenovo platforms recently.
>> In our case we added a 'signature' sysfs entry under authentication/Ad=
min that is used for what is (I think) the equivalent of 'auth-token' whe=
n certificate based authentication is enabled. We didn't try to re-use th=
e password entry.
>>
>> So if certificate authentication is enabled the user ends up doing:
>>     echo "crypto-string" > authentication/Admin/signature
>>     echo "value" > attribute/"setting"
>> and if password authentication is enabled
>>     echo "password" > authentication/Admin/password
>>     echo "value" > attribute/"setting"
>> and the thinklmi driver takes care of figuring out the rest to pass as=
 WMI calls to the BIOS (for us this is done at init time and is only chan=
ged by a reboot). Note for completeness - we have a signature and a save_=
signature....for reasons of BIOS (sigh).
>>
> Thank you for your suggestion.   Separating 'password' and signature
> is a better approach and easier to implement since most of the
> supporting code is already implemented.

Ok, using a separate signature file under authentication/Admin/signature
(or something similar) for this is fine with me.

Regards,

Hans



