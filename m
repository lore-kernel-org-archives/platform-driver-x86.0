Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C82C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Nov 2022 10:08:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbiKUKIR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Nov 2022 05:08:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbiKUKIF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Nov 2022 05:08:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EE40A3173
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Nov 2022 02:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669025224;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2XC2mgxzF4UolaPNbOyncDYm/ktaa6626CTG7qDtEnE=;
        b=DIzDZgYyCgn2j/wEsYEaSoXwaIeNm3v+AVIEIuOkH9CqPYfL9nGjIqGDf9vCsdDbMJFFAo
        psJI/6rUrHgEVPaSannlnSw3m+3Vw1TapmzSkRJqLpxXe8QDShAfHz5tOZeXl4NFIeoqeq
        BIy4GL1Ntw4PF6hXqXT4ZnhI7Wvx4QE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-182-DwrKE31WOKe75u9-RvPIEw-1; Mon, 21 Nov 2022 05:07:02 -0500
X-MC-Unique: DwrKE31WOKe75u9-RvPIEw-1
Received: by mail-ed1-f71.google.com with SMTP id y2-20020a056402440200b00469c41d5367so451436eda.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Nov 2022 02:07:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XC2mgxzF4UolaPNbOyncDYm/ktaa6626CTG7qDtEnE=;
        b=G+h1UXBkCGj184DBilZMsw7LSNk58MGrffkBUzK0TXoSD0K03OA60V7o+6bHrTO4aJ
         2jsk4gBQ+O1k2wzy84KQomFPJ0dG/sJwoovFruA8gn4bgg9ShY2sTkk7vMRiIDWXNO4g
         CSY2anc/xffr+gXeoUAd10nwjit7N0Ql0H8xCgPXz5Mqf5wxqelkIQxhWCYhTuBXlIdn
         U5oiEd5V6YSff0DkXVJmSEJcfwKVnzt/OsKiRvrhVDlHLvsQ/oSL4VNy5gRakfrK+Wxb
         uUml8rZsjjfs0soD55ERl91PLcfdK7gILBpQz/0kWLYhmPfw79K2mTwTVwEvYGotu5tQ
         9v8A==
X-Gm-Message-State: ANoB5pm43pFYhibmBJ/FAEkZOb98JfsQrat9WubiPbmQ3TzGnNZZhQT+
        0loWHmKIp4rCmzJVrUswqdmCdy5zu8Ca5/oM1eHAcgDaL+59LV1AO3IZgw5HnzN8pz6h4HScozw
        /gbpovNFHoHB6SBNtGVgA9Zt1aokVBUu/Rg==
X-Received: by 2002:a17:906:f843:b0:78d:b819:e0e7 with SMTP id ks3-20020a170906f84300b0078db819e0e7mr594200ejb.83.1669025221522;
        Mon, 21 Nov 2022 02:07:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf40gVsOtW+Jeo4QqivMMpV67IzQz/NmE8cUWDNlnp+czjs28L9hl8rqHlgZ5T4K9AkjN/fJ4A==
X-Received: by 2002:a17:906:f843:b0:78d:b819:e0e7 with SMTP id ks3-20020a170906f84300b0078db819e0e7mr594190ejb.83.1669025221280;
        Mon, 21 Nov 2022 02:07:01 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id hf12-20020a1709072c4c00b007ae38d837c5sm4876568ejc.174.2022.11.21.02.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:07:00 -0800 (PST)
Message-ID: <ba2ca2d1-d422-552a-ece8-ae9488b93307@redhat.com>
Date:   Mon, 21 Nov 2022 11:06:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 3/6] platform/x86: ideapad-laptop: Only toggle ps2 aux
 port on/off on select models
Content-Language: en-US
To:     =?UTF-8?B?0JzQsNC60YHQuNC8?= <maxtram95@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        GOESSEL Guillaume <g_goessel@outlook.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Manyi Li <limanyi@uniontech.com>,
        =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>,
        Philipp Jungkamp <p.jungkamp@gmx.net>,
        Arnav Rawat <arnavr3@illinois.edu>,
        Kelly Anderson <kelly@xilka.com>, Meng Dong <whenov@gmail.com>,
        Felix Eckhofer <felix@eckhofer.com>,
        Ike Panhc <ike.pan@canonical.com>,
        platform-driver-x86@vger.kernel.org
References: <20221117110244.67811-1-hdegoede@redhat.com>
 <20221117110244.67811-4-hdegoede@redhat.com>
 <CAKErNvq42Cs8SK=3K0+X=aSJfx=njyLqW4cobjt0xaZZk1yeqg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAKErNvq42Cs8SK=3K0+X=aSJfx=njyLqW4cobjt0xaZZk1yeqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Максим,

On 11/20/22 16:29, Максим wrote:
> On Thu, 17 Nov 2022 at 13:03, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Recently there have been multiple patches to disable the ideapad-laptop's
>> touchpad control code, because it is causing issues on various laptops:
>>
>> Commit d69cd7eea93e ("platform/x86: ideapad-laptop: Disable touchpad_switch for ELAN0634")
>> Commit a231224a601c ("platform/x86: ideapad-laptop: Disable touchpad_switch")
>>
>> The turning on/off of the ps2 aux port was added specifically for
>> the IdeaPad Z570, where the EC does toggle the touchpad on/off LED and
>> toggles the value returned by reading VPCCMD_R_TOUCHPAD, but it does not
>> actually turn on/off the touchpad.
>>
>> The ideapad-laptop code really should not be messing with the i8042
>> controller on all devices just for this special case.
>>
>> Add a new ctrl_ps2_aux_port flag set based on a DMI based allow-list
>> for devices which need this workaround, populating it with just
>> the Ideapad Z570 for now.
>>
>> This also adds a module parameter so that this behavior can easily
>> be enabled on other models which may need it.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> On Z570:
> 
> Tested-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Thank you for testing!

> A few notes for Z570:
> 
> 1. Touchpad toggle still works properly after this series of patches.
> 
> 2. My laptop's EC reenables the touchpad on boot and on resume, and
> this behavior still works after this series.
> 
> 3. Patch 2 stops sending "spurious" key press events on resume, which
> actually make sense on my laptop, when the touchpad is reenabled on
> resume. Maybe we should send a key press, but only if the state
> changed? (However, for some reason I don't see the OSD for this even
> before this series.)

I'm not sure if sending the key-press and thus showing the OSd makes
sense in resume even if the state did change. The OSD typically is
used to confirm an action by the user. If the touchpad is always
re-enabled after resume then the user will get uses to that quick enough
and showing an OSD for this will just be a distraction IMHO.

> 4. The sysfs attribute for touchpad doesn't exist on my laptop, but it
> would still make sense if we made it read only. Right now there is a
> module parameter to force enable this sysfs attribute, but it's
> created as read-write, and writes are no-op.

Hmm, since the sysfs attr is normally not there at all (now) and
since the module option help text says:
"This may not work on all models."

I think that having writing to the sysfs file succeed but not do anything
is not really a problem.

I guess we could change the sysfs attr visibility to 444 on models
with priv->features.ctrl_ps2_aux_port set, but that seems making
the code unnecessarily complicated given that the sysfs attr is hidden
by default now anyways.

Regards,

Hans




> 
>> ---
>>  drivers/platform/x86/ideapad-laptop.c | 29 ++++++++++++++++++++++++++-
>>  1 file changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
>> index eb0b1ec32c13..1d86fb988d56 100644
>> --- a/drivers/platform/x86/ideapad-laptop.c
>> +++ b/drivers/platform/x86/ideapad-laptop.c
>> @@ -143,6 +143,7 @@ struct ideapad_private {
>>                 bool hw_rfkill_switch     : 1;
>>                 bool kbd_bl               : 1;
>>                 bool touchpad_ctrl_via_ec : 1;
>> +               bool ctrl_ps2_aux_port    : 1;
>>                 bool usb_charging         : 1;
>>         } features;
>>         struct {
>> @@ -174,6 +175,12 @@ MODULE_PARM_DESC(set_fn_lock_led,
>>         "Enable driver based updates of the fn-lock LED on fn-lock changes. "
>>         "If you need this please report this to: platform-driver-x86@vger.kernel.org");
>>
>> +static bool ctrl_ps2_aux_port;
>> +module_param(ctrl_ps2_aux_port, bool, 0444);
>> +MODULE_PARM_DESC(ctrl_ps2_aux_port,
>> +       "Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off toggle. "
>> +       "If you need this please report this to: platform-driver-x86@vger.kernel.org");
>> +
>>  /*
>>   * shared data
>>   */
>> @@ -1507,7 +1514,8 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
>>          * touchpad off and on. We send KEY_TOUCHPAD_OFF and
>>          * KEY_TOUCHPAD_ON to not to get out of sync with LED
>>          */
>> -       i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
>> +       if (priv->features.ctrl_ps2_aux_port)
>> +               i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
>>
>>         if (send_events) {
>>                 ideapad_input_report(priv, value ? 67 : 66);
>> @@ -1615,6 +1623,23 @@ static const struct dmi_system_id hw_rfkill_list[] = {
>>         {}
>>  };
>>
>> +/*
>> + * On some models the EC toggles the touchpad muted LED on touchpad toggle
>> + * hotkey presses, but the EC does not actually disable the touchpad itself.
>> + * On these models the driver needs to explicitly enable/disable the i8042
>> + * (PS/2) aux port.
>> + */
>> +static const struct dmi_system_id ctrl_ps2_aux_port_list[] = {
>> +       {
>> +       /* Lenovo Ideapad Z570 */
>> +       .matches = {
>> +               DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> +               DMI_MATCH(DMI_PRODUCT_VERSION, "Ideapad Z570"),
>> +               },
>> +       },
>> +       {}
>> +};
>> +
>>  static const struct dmi_system_id no_touchpad_switch_list[] = {
>>         {
>>         .ident = "Lenovo Yoga 3 Pro 1370",
>> @@ -1642,6 +1667,8 @@ static void ideapad_check_features(struct ideapad_private *priv)
>>                 set_fn_lock_led || dmi_check_system(set_fn_lock_led_list);
>>         priv->features.hw_rfkill_switch =
>>                 hw_rfkill_switch || dmi_check_system(hw_rfkill_list);
>> +       priv->features.ctrl_ps2_aux_port =
>> +               ctrl_ps2_aux_port || dmi_check_system(ctrl_ps2_aux_port_list);
>>
>>         /* Most ideapads with ELAN0634 touchpad don't use EC touchpad switch */
>>         if (acpi_dev_present("ELAN0634", NULL, -1))
>> --
>> 2.38.1
>>
> 

