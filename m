Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CCBC433E9
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Mar 2021 09:36:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53A6864FD6
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Mar 2021 09:36:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbhCEJgT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Mar 2021 04:36:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26212 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229642AbhCEJgJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Mar 2021 04:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614936968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wl+ur6xZb2ysOrxHoCAyeiFXr3lurz0SjliSPo+ZsWI=;
        b=a6tOfTsCb8xSQrkpJqW+Sdtv3xoAWxqcIcWQylMYSVKDIoe9+oh4Lm9aYPthxFwmQjJUOf
        2HepnC6iK69twccb9GUm+hp2DQVskAgWdOBel46FGbH0/oMb0OzK5NJy3G+pUPqb8zhWEL
        Myiu+0TkCVcUQiP0b39/sM+RhxsXwcw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-vmAYOLsVOha794LszYg9-w-1; Fri, 05 Mar 2021 04:36:06 -0500
X-MC-Unique: vmAYOLsVOha794LszYg9-w-1
Received: by mail-ej1-f72.google.com with SMTP id jo6so605333ejb.13
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Mar 2021 01:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wl+ur6xZb2ysOrxHoCAyeiFXr3lurz0SjliSPo+ZsWI=;
        b=UzJtMq8wSe/TTr3oTXh0WvcsOE2GsRv2q+hOqU6iTtVnes7P5vLHXKLT1bAZ+cYTDp
         ZTEheYeLM3X/PNtWM4bCddNSnWuUNGxG6FRzkHiFzkeQt3fMwnfYJxMg9fqLjCE/V8wq
         MJaRxtIr1wjApCFPkp+8D8HLcsHolXrNrf6zFGeceQoTgHsrAUKqp1YNufgq0TRyaIXD
         AgiTZRgjgsdcdp63LwxgJd4WlneTiaoOn8MGbZ8gvCKuGA6+Nm5Um4rbjHaTCwwYcVVv
         jKWGIL1mKCPtfZQR34XJhglhFOPsfqT8gsQec2bU/B54CFMdW6fQniJiEXjFkSyJYgBl
         xMAg==
X-Gm-Message-State: AOAM531OEohE2W4n9HCdCRBjIMt1EW6RfJI5IlnfBYCzwXed1ZbFcyX0
        TMqaMDXZZKAaLFAPGobB3e8hNnSHyG57F1JAwXA+5s1RWWxFEojtnWZfIC6loiKI98oMnjwPw1V
        UftUqjX3oINWUayByKdTa0xe1/qCbrNq3IyBkpBHAsvOU/JOw1SbWESUM+IruydSuWubajotSEZ
        FpqPCOcRP9Wg==
X-Received: by 2002:a17:907:36e:: with SMTP id rs14mr1463848ejb.42.1614936965467;
        Fri, 05 Mar 2021 01:36:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUjaHOAX1Kx2dykoYWx4DBKFGAudG7DZRzRNLEU4brwzJHt7B5Vnt/NLRMhxvMc6gv9KGmmA==
X-Received: by 2002:a17:907:36e:: with SMTP id rs14mr1463829ejb.42.1614936965104;
        Fri, 05 Mar 2021 01:36:05 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id de17sm1176921ejc.16.2021.03.05.01.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 01:36:04 -0800 (PST)
Subject: Re: [PATCH] WMI: asus: Reduce G14 and G15 match to min product name
To:     Luke Jones <luke@ljones.dev>
References: <20210227102010.65429-1-luke@ljones.dev>
 <94e01965-1511-c687-1c20-fe1f01041ac3@redhat.com>
 <GNOHPQ.KYXM8SR2TF8L@ljones.dev>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6bb6843e-f166-a1cc-f1ac-419a46c71622@redhat.com>
Date:   Fri, 5 Mar 2021 10:36:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <GNOHPQ.KYXM8SR2TF8L@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

<note adding the pdx86 list back to the Cc>

Hi Luke,

On 3/5/21 10:21 AM, Luke Jones wrote:
> Hello Hans,
> 
> Many thanks for taking the time to review this and provide some
> knowledge.
> 
> Most of what has come about in this patch is through direct user
> with a fairly large community I maintain on Discord centered
> around a utility I wrote to make ROG laptop users lives a bit
> better - https://gitlab.com/asus-linux. The community has been
> beneficial to getting some realtime testing done, shortening
> time.
> 
> In the case of the 2021 Ryzen laptops I'm pleased you asked
> questions. I asked the single G15 laptop owner we have to
> check functionality and yes, we don't need that code.
> It appears there were some crossed wires in conversations.
> 
> I will amend the patch keeping the glob style got 2020 G14
> and G15 as we do have concrete anecdotal evidence that all
> *those* models, and some un-added ones need the quirk.

If possible I would like to see some more research done on
those 2020 models too.

Specifically it would be good to get the following info:

1. Output of "ls /sys/class/backlight" with "acpi_backlight=video"
on the kernel commandline.

2. Testing of *all* the present backlight devices with "acpi_backlight=video"
on the kernel commandline. The user can test this by doing:

cd /sys/class/backlight/$backlight-name
cat max_brightness
echo $value-between-0-and-max_brightness > brightness
echo $another-value-between-0-and-max_brightness > brightness
etc.

And then see if the brightness of the screen actually changes.

3. Output of "ls /sys/class/backlight" with "acpi_backlight=native"
on the kernel commandline.

4. Testing of *all* the present backlight devices with "acpi_backlight=native"
on the kernel commandline (see 2.)

5. Output of "ls /sys/class/backlight" with "acpi_backlight=vendor"
on the kernel commandline.

6. Testing of *all* the present backlight devices with "acpi_backlight=vendor"
on the kernel commandline (see 2.)


My hope/expectation is that acpi_backlight=video will also work,
because as said using acpi_backlight=vendor is somewhat weird for
2020 / 2021 laptop models.  Also typically the acpi-video backlight
interface will have a larger max_brightness giving finer grained
(more steps) brightness control.

Regards,

Hans



> On Thu, Mar 4, 2021 at 15:35, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi,
>>
>> On 2/27/21 11:20 AM, Luke D Jones wrote:
>>>  This patch reduces the product match for GA401 series laptops to
>>>  the minimum string required.
>>>
>>>  The GA401 series of laptops has a lengthy list of product
>>>  variations in the 2020 series and the 2021 series refresh
>>>  is using the same base product ID of GA401.
>>>
>>>  The same is also true for the GA502 series, and the new GA503
>>>  series which is added in this patch as a variant of the G15.
>>
>> Thank you for your patch.
>>
>> I msut say that I find it very strange that 2021 series laptops need
>> to use the Asus vendor specific WMI interface for backlight control.
>>
>> I see that the GA401 GA502 and GA503 models are all models with
>> AMD 4000/5000 series CPUs + Nvidia 2060 series GPUs.
>> So I guess it may be possible that this is the right thing
>> to do, and I do realize that we are already doing this for the
>> listed models. But it seems weird.
>>
>> Modern laptops almost always use the native backlight control
>> build into the drm/kms driver. And in some special cases
>> (hybrid GPU setups) they might use the good old ACPI-video
>> interface. But using vendor specific interfaces sounds very
>> wrong to me. That is something which was typically done on
>> pre Windows XP era hardware.
>>
>> Have you tried passing acpi_backlight=video on the kernel commandline?
>>
>> What is the output of ls /sys/class/backlight before and after this
>> patch?
>>
>> What is the output of ls /sys/class/backlight when using
>> acpi_backlight=video on the kernel commandline?
>>
>> If the ls output shows multiple interfaces have you tried using all
>> listed interfaces directly from sysfs / the commandline ?
>>
>> (perhaps userspace is picking the wrong interface in the case there
>> are multiple interfaces?)
>>
>> Note what you are doing now is the equivalent of passing
>> acpi_backlight=vendor, which again is a weird thing to do on
>> recent / new hardware.
>>
>> Also your commit message seems to lack a lot of details like:
>>
>> 1. Do you own an effected or multiple affected models yourself on
>> which you tested this?
>>
>> 2. Was this tested by others on other models of these series?
>>
>> 3. I assume this was discussed with others in some mailinglist /
>> forum discussion please provide links to this discussion.
>>
>> 4. Has this been tested with with both the nouveau and the
>> nvidia binary driver or only with the nvidia binary driver ?
>>
>> 5. What were the symptoms / problems noticed before making this change
>> and how do things work after making the change?
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>
>>>
>>>  Signed-off-by: Luke D Jones <luke@ljones.dev>
>>>  ---
>>>   drivers/platform/x86/asus-nb-wmi.c | 57 ++++--------------------------
>>>   1 file changed, 6 insertions(+), 51 deletions(-)
>>>
>>>  diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
>>>  index d41d7ad14be0..f4db67c3eba2 100644
>>>  --- a/drivers/platform/x86/asus-nb-wmi.c
>>>  +++ b/drivers/platform/x86/asus-nb-wmi.c
>>>  @@ -427,73 +427,28 @@ static const struct dmi_system_id asus_quirks[] = {
>>>       },
>>>       {
>>>           .callback = dmi_matched,
>>>  -        .ident = "ASUSTeK COMPUTER INC. GA401IH",
>>>  +        .ident = "ASUSTeK COMPUTER INC. GA401",
>>>           .matches = {
>>>               DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>  -            DMI_MATCH(DMI_PRODUCT_NAME, "GA401IH"),
>>>  +            DMI_MATCH(DMI_PRODUCT_NAME, "GA401"),
>>>           },
>>>           .driver_data = &quirk_asus_vendor_backlight,
>>>       },
>>>       {
>>>           .callback = dmi_matched,
>>>  -        .ident = "ASUSTeK COMPUTER INC. GA401II",
>>>  +        .ident = "ASUSTeK COMPUTER INC. GA502",
>>>           .matches = {
>>>               DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>  -            DMI_MATCH(DMI_PRODUCT_NAME, "GA401II"),
>>>  +            DMI_MATCH(DMI_PRODUCT_NAME, "GA502"),
>>>           },
>>>           .driver_data = &quirk_asus_vendor_backlight,
>>>       },
>>>       {
>>>           .callback = dmi_matched,
>>>  -        .ident = "ASUSTeK COMPUTER INC. GA401IU",
>>>  +        .ident = "ASUSTeK COMPUTER INC. GA503",
>>>           .matches = {
>>>               DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>  -            DMI_MATCH(DMI_PRODUCT_NAME, "GA401IU"),
>>>  -        },
>>>  -        .driver_data = &quirk_asus_vendor_backlight,
>>>  -    },
>>>  -    {
>>>  -        .callback = dmi_matched,
>>>  -        .ident = "ASUSTeK COMPUTER INC. GA401IV",
>>>  -        .matches = {
>>>  -            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>  -            DMI_MATCH(DMI_PRODUCT_NAME, "GA401IV"),
>>>  -        },
>>>  -        .driver_data = &quirk_asus_vendor_backlight,
>>>  -    },
>>>  -    {
>>>  -        .callback = dmi_matched,
>>>  -        .ident = "ASUSTeK COMPUTER INC. GA401IVC",
>>>  -        .matches = {
>>>  -            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>  -            DMI_MATCH(DMI_PRODUCT_NAME, "GA401IVC"),
>>>  -        },
>>>  -        .driver_data = &quirk_asus_vendor_backlight,
>>>  -    },
>>>  -        {
>>>  -        .callback = dmi_matched,
>>>  -        .ident = "ASUSTeK COMPUTER INC. GA502II",
>>>  -        .matches = {
>>>  -            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>  -            DMI_MATCH(DMI_PRODUCT_NAME, "GA502II"),
>>>  -        },
>>>  -        .driver_data = &quirk_asus_vendor_backlight,
>>>  -    },
>>>  -    {
>>>  -        .callback = dmi_matched,
>>>  -        .ident = "ASUSTeK COMPUTER INC. GA502IU",
>>>  -        .matches = {
>>>  -            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>  -            DMI_MATCH(DMI_PRODUCT_NAME, "GA502IU"),
>>>  -        },
>>>  -        .driver_data = &quirk_asus_vendor_backlight,
>>>  -    },
>>>  -    {
>>>  -        .callback = dmi_matched,
>>>  -        .ident = "ASUSTeK COMPUTER INC. GA502IV",
>>>  -        .matches = {
>>>  -            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>  -            DMI_MATCH(DMI_PRODUCT_NAME, "GA502IV"),
>>>  +            DMI_MATCH(DMI_PRODUCT_NAME, "GA503"),
>>>           },
>>>           .driver_data = &quirk_asus_vendor_backlight,
>>>       },
>>>
>>
> 
> 

