Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD4FC001DF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Jul 2023 13:41:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbjGYNlL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Jul 2023 09:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231283AbjGYNlJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Jul 2023 09:41:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E197B1
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jul 2023 06:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690292428;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+vN5VgnES6aJN/zRZfc/R88UaBAUK6LKuO2qlLI6vE0=;
        b=cZlmn8us6OCGRZsN8PncwgWglm2huCYHb1thImKHpB9DzEMYsBNJ2btV7PlzPFUMU9NL7X
        XbjFs6VckGWK9YqVY/j/FWb1gIcARyv4yjDj+CvHIS3DZJi+wKl+to3YzpaBib5FKpQHSz
        /uBCVnGekAlZqLt4BfZGaImKWll5rxo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-Je8M4dSFPU-XpU68jP7Dgw-1; Tue, 25 Jul 2023 09:40:27 -0400
X-MC-Unique: Je8M4dSFPU-XpU68jP7Dgw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-98e1085308eso288682666b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jul 2023 06:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690292426; x=1690897226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vN5VgnES6aJN/zRZfc/R88UaBAUK6LKuO2qlLI6vE0=;
        b=Nh8xEDmIrFHlBiyfVnNUXa3k+bnH4erSevGWEseBR03spskygSaJOnrQJSAa/tuVwi
         30sdx9RV6jqaAOOK17QQQINBNZWEuayvCndlnnIEwe5NpUV/c+6IvuxE3XsmtH1Xvzs+
         6M0SBnR+D3e1Tw0yVU2g7y1cPEeQx2VBS1DRPxj2LryacIuwoqBChv8oqfCscpDZfn/O
         RDANt6k/8PYaDRWGffPP9+RZFlsJoRL6CrokEl/SLa6u10hUd7QSYSCHhVXsd3hQ5dit
         0Y4sND6z7eyLy7wnDzrgwSUfWUTSAb3Na/+aDxea08vbEr5EAaOQ6r2Wu8s+btMDFCjN
         V27A==
X-Gm-Message-State: ABy/qLaojs5BEWxLODTWfjOK14PQQ96EMH2Fl+nDJJmR3iK5hgw7KKxt
        AwfqR06cOjBLvlu2oOuWl5xmhDxBRr/7DtVdLLZurEX5YIUlBb+9JkgDlMLo+P0hQHdToZfhJk1
        DCLXWyxzUWZyZVDmRp/bJm4Z6iRnIeiuN7Q==
X-Received: by 2002:a17:907:7744:b0:994:1805:1fad with SMTP id kx4-20020a170907774400b0099418051fadmr2193049ejc.10.1690292425802;
        Tue, 25 Jul 2023 06:40:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFtbzlZLexGwKjS4X65Dmvd7vxDxLZt93fk9vFyNUrxm857NRb6PT1zQB6VrqqbNyID5ATynQ==
X-Received: by 2002:a17:907:7744:b0:994:1805:1fad with SMTP id kx4-20020a170907774400b0099418051fadmr2193033ejc.10.1690292425486;
        Tue, 25 Jul 2023 06:40:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a5-20020a170906274500b009932337747esm8179316ejd.86.2023.07.25.06.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 06:40:24 -0700 (PDT)
Message-ID: <d25f3a2c-79cf-f490-9962-1b18c127ce92@redhat.com>
Date:   Tue, 25 Jul 2023 15:40:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH V3] platform/x86: asus-wmi: Fix setting RGB mode on some
 TUF laptops
Content-Language: en-US, nl
To:     Luke Jones <luke@ljones.dev>,
        Kristian Angelov <kristiana2000@abv.bg>
Cc:     platform-driver-x86@vger.kernel.org
References: <ZLlS7o6UdTUBkyqa@wyvern.localdomain>
 <C694YR.K5DWX6WG90S31@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <C694YR.K5DWX6WG90S31@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/21/23 00:30, Luke Jones wrote:
> Looks good to me.
> 
> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> 
> On Thu, Jul 20 2023 at 18:29:50 +03:00:00, Kristian Angelov <kristiana2000@abv.bg> wrote:
>> This patch fixes setting the cmd values to 0xb3 and 0xb4.
>> This is necessary on some TUF laptops in order to set the RGB mode.
>>
>> Closes: https://lore.kernel.org/platform-driver-x86/443078148.491022.1677576298133@nm83.abv.bg
>> Signed-off-by: Kristian Angelov <kristiana2000@abv.bg>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




>> ---
>>  V1 -> V2. Make setting 0xb3 and 0xb4 the default logic
>>  V2 -> V3. Defualt to -EINVAL to match the rest of asus-wmi.
>>
>>  drivers/platform/x86/asus-wmi.c | 14 ++++++++++++--
>>  1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 1038dfdcdd32..8bef66a2f0ce 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -738,13 +738,23 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
>>                   struct device_attribute *attr,
>>                   const char *buf, size_t count)
>>  {
>> -    u32 cmd, mode, r, g,  b,  speed;
>> +    u32 cmd, mode, r, g, b, speed;
>>      int err;
>>
>>      if (sscanf(buf, "%d %d %d %d %d %d", &cmd, &mode, &r, &g, &b, &speed) != 6)
>>          return -EINVAL;
>>
>> -    cmd = !!cmd;
>> +    /* B3 is set and B4 is save to BIOS */
>> +    switch (cmd) {
>> +    case 0:
>> +        cmd = 0xb3;
>> +        break;
>> +    case 1:
>> +        cmd = 0xb4;
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>>
>>      /* These are the known usable modes across all TUF/ROG */
>>      if (mode >= 12 || mode == 9)
>> -- 
>> 2.40.0
>>
> 
> 

