Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B973EC433E6
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Feb 2021 09:08:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 747FE64E7A
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Feb 2021 09:08:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbhBHJIp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 8 Feb 2021 04:08:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31534 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231497AbhBHJGa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Feb 2021 04:06:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612775101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A3evLbIe2FU9BIUHah1B/gIbRgx1g2yvVc3nuQsMilU=;
        b=gn3j5uU0eaU5JQj3Jaqym6d0aKHTELTc4xByxPHGWmShhk4z6DV8De1gRArPLzpce3FS7R
        cKds/C/Zw69MYatjFZkHU6VkShgLLF6mDAefbbT0pXNLsiJOA9h2LzzgPRdgm8ITBgPN95
        CTiD+cetNi2/fVAbPh8O1XuQqZ8vfBM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-iyLik1SLNK2f3mK8TAyZHg-1; Mon, 08 Feb 2021 04:04:59 -0500
X-MC-Unique: iyLik1SLNK2f3mK8TAyZHg-1
Received: by mail-ed1-f69.google.com with SMTP id w23so12766448edr.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Feb 2021 01:04:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A3evLbIe2FU9BIUHah1B/gIbRgx1g2yvVc3nuQsMilU=;
        b=QGAdvY5r431kUNrF7GwCs7AI79AgYI4tFCiZNecF6Yc8lmd18Lc1Q6gSHCphD56Wa9
         2cLaUGy+QRUFueBh0SzuyeYkQP/9MgAtfbdHooc5q5X3rFN5q6AsPwwcp82RtAN+U/qd
         4zMiJ6HBnM/5yn1Zyee0hfTf2VvtbTrNvJCqNvri5vRff4jnA8jYnRd03XXyXwxhwcTU
         eGh6DVukWEEZpPDye5spvDaki1Tqcvsr71hCd3s9PPfWxD5MRs+8COFmm6sS7G6Cdxf5
         IvUKxjxL7t0qLhj4q1kjTw6eEbHUfJl8JGVRV9o4yNZkiiS5R3KqjmuhDSTzx9BK8V1+
         UE7g==
X-Gm-Message-State: AOAM532NpjGyV7k2JMYWxFQyjkvQ9yEZRYCpmdfeQ7vCMGqHk/ZvqNMO
        n3p786FhGCDTxTI/goyYdrOd6s07vrP4ZkhkRl4ql+yCxoaCc6n7PoBzHmSxItl7TxFTnE6kpWB
        2WkVu3QfNRQmq0tKUbwdPIRprUKQPYTu7AQ==
X-Received: by 2002:a17:906:cc5d:: with SMTP id mm29mr16419998ejb.183.1612775098617;
        Mon, 08 Feb 2021 01:04:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKr161OS2Pu2mdVk/i3seStbGM8cKN/HyQni9BDEqjdln4Ey8kwyoxRAt9vH/Je6bYnhv4NQ==
X-Received: by 2002:a17:906:cc5d:: with SMTP id mm29mr16419989ejb.183.1612775098482;
        Mon, 08 Feb 2021 01:04:58 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q13sm1762628ejy.20.2021.02.08.01.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Feb 2021 01:04:57 -0800 (PST)
Subject: Re: [External] Re: [PATCH] platform/x86: thinkpad_acpi: handle HKEY
 0x4012, 0x4013 events
To:     Nitin Joshi1 <njoshi1@lenovo.com>,
        Alexander Kobel <a-kobel@a-kobel.de>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <mpearson@lenovo.com>
References: <53abdd94-8df4-cc1c-84e9-221face6b07c@a-kobel.de>
 <9d133a27-751a-a436-d255-3dd4a7d411d8@redhat.com>
 <TY2PR03MB3645D33506D85E1EECD6DABA8C8F9@TY2PR03MB3645.apcprd03.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0e85bd26-bf2f-734c-1334-15ad591ec811@redhat.com>
Date:   Mon, 8 Feb 2021 10:04:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <TY2PR03MB3645D33506D85E1EECD6DABA8C8F9@TY2PR03MB3645.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Nitin, Alexander,

On 2/8/21 8:17 AM, Nitin Joshi1 wrote:
> Hello Hans,
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Monday, February 8, 2021 2:10 AM
>> To: Alexander Kobel <a-kobel@a-kobel.de>; platform-driver-
>> x86@vger.kernel.org; Mark Pearson <mpearson@lenovo.com>; Nitin Joshi1
>> <njoshi1@lenovo.com>
>> Subject: [External] Re: [PATCH] platform/x86: thinkpad_acpi: handle HKEY
>> 0x4012, 0x4013 events
>>
>> Hi,
>>
>> On 2/7/21 5:34 PM, Alexander Kobel wrote:
>>> Those events occur when a keyboard cover is attached to a ThinkPad
>>> Tablet device.  Typically, they are used to switch from normal to
>>> tablet mode in userspace; e.g., to offer touch keyboard choices when
>>> focus goes to a text box and no keyboard is attached, or to enable
>>> autorotation of the display according to the builtin orientation sensor.
>>
>> Thank you for your patch.
>>
>>> No attempt is taken to emit an EV_SW event for SW_TABLET_MODE; this is
>>> left to userspace.
>>
>> I don't understand this part, in order for userspace to respond to these events
>> the thinkpad_acpi driver needs to emit events for this; and emitting
>> SW_TABLET_MODE seems like it is the right thing to do.
>>
>> Why are you not doing this ?
>>
>> Note that it is important to only advertise SW_TABLET_MODE functionality on
>> devices where it actually works. Which might be challenging I guess...
>>
>> But we have contacts inside Lenovo now, so perhaps they can help.
>>
>> Mark, Nitin, is there a way for the thinkpad_acpi code to figure out if 0x4012 /
>> 0x4013 events will be send by a device?
> 
> It seems , these events are used for not only keyboard cover, but also other tablet options.
> In attached document, Interface type 4 (Graft type) is of ThinkPad X1 Tablet Series.

Great, Nitin thank you for the docs!

Nitin, one question below about version checks, it would be great if you can help with
this.

>> Also is there a way to get the current state of the keyboard-cover being
>> attached at boot or not ?
> It seems "GTOP" ASL method can be used to get current state.

Ack.

Alexander, so it looks like we need to do the following to support this properly:

1. At a new TP_HOTKEY_TABLET_USES_GTOP to the hotkey_tablet enum
2. At probe time in hotkey_init_tablet_mode add a new if / case with I guess
   the highest prio (so try before GMMS) which does:
   1. Call GTOP with parameter 0x0000, check return equals 0x0103 (or newer?)
      Nitin, how should the version check look like here, check that the
      upper byte == 0x01 and the lower byte >= 0x03 ?
   2. Call GTOP with parameter 0x0100, check return value equals 4
   3. Call GTOP with parameter 0x0200, set in_tablet_mode based on bit 0
      and bit 16. I think we should report SW_TABLET_MODE=1 when the thin-kbd
      is attached, but folded to the back
3. Make hotkey_get_tablet_mode support the new TP_HOTKEY_TABLET_USES_GTOP case and
   make it call GTOP with parameter 0x0200 and check bit 0 + bit 16
4. On the events which you identified call tpacpi_input_send_tabletsw()

And can you also check if there are events when folding the kbd behind the tablet?

Regards,

Hans



>>> So this patch is mainly to avoid warnings about unknown and unhandled
>>> events, which are now reported as:
>>>
>>> * Event 0x4012: attached keyboard cover
>>> * Event 0x4013: detached keyboard cover
>>>
>>> Tested as working on a ThinkPad X1 Tablet Gen 2, 20JCS00C00, and as
>>> non-interfering with a ThinkPad X1 Carbon 7th, 20QESABM02 (normal
>>> clamshell, so it does not have a keyboard cover).
>>>
>>> Signed-off-by: Alexander Kobel <a-kobel@a-kobel.de>
>>> ---
>>>  drivers/platform/x86/thinkpad_acpi.c | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c
>>> b/drivers/platform/x86/thinkpad_acpi.c
>>> index c404706379d9..fd5322b5bbbd 100644
>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>> @@ -174,6 +174,8 @@ enum tpacpi_hkey_event_t {
>>>                                                      or port replicator */
>>>         TP_HKEY_EV_HOTPLUG_UNDOCK       = 0x4011, /* undocked from
>> hotplug
>>>                                                      dock or port
>>> replicator */
>>> +       TP_HKEY_EV_KBD_COVER_ATTACH     = 0x4012, /* attached keyboard
>> cover */
>>> +       TP_HKEY_EV_KBD_COVER_DETACH     = 0x4013, /* detached keyboard
>> cover */
>>>
>>>         /* User-interface events */
>>>         TP_HKEY_EV_LID_CLOSE            = 0x5001, /* laptop lid closed */
>>> @@ -3989,6 +3991,12 @@ static bool hotkey_notify_dockevent(const u32
>> hkey,
>>>         case TP_HKEY_EV_HOTPLUG_UNDOCK: /* undocked from port
>> replicator */
>>>                 pr_info("undocked from hotplug port replicator\n");
>>>                 return true;
>>> +       case TP_HKEY_EV_KBD_COVER_ATTACH:
>>> +               pr_info("attached keyboard cover\n");
>>> +               return true;
>>> +       case TP_HKEY_EV_KBD_COVER_DETACH:
>>> +               pr_info("detached keyboard cover\n");
>>> +               return true;
>>>
>>>         default:
>>>                 return false;
>>> --
>>> 2.30.0
>>>
> 

