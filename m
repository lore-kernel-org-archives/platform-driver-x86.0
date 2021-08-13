Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E883C432BE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 13 Aug 2021 08:57:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD7C66103E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 13 Aug 2021 08:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239456AbhHMI5n (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 13 Aug 2021 04:57:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34029 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239291AbhHMI5n (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Aug 2021 04:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628845036;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3VbsmRaq7EGjkb/0ThGUSw3Ax8cq2aZJXDmazgyH05I=;
        b=R9D2P6xcJZh0nfKchivSzbGt6Od/SJjVZNu2PNakvGl6u3a5rn8Xm/W/35jp7oHbMpLXs4
        oppcAjjQtFzp3tNkewLyvQsHhoSqNOzJzCEchk/qPmh9i9U2CJR1PQgd96AsX+SqViVeE9
        FnRLHK2u3oGKPL+RnU9YBjKzrahqEQA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-u0saWS5uOHGL8UT_aV0aXA-1; Fri, 13 Aug 2021 04:57:15 -0400
X-MC-Unique: u0saWS5uOHGL8UT_aV0aXA-1
Received: by mail-ed1-f69.google.com with SMTP id u4-20020a50eac40000b02903bddc52675eso4543080edp.4
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Aug 2021 01:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3VbsmRaq7EGjkb/0ThGUSw3Ax8cq2aZJXDmazgyH05I=;
        b=EtjDCNAJCLabCzjGMlk2Wb/uB2E9b7EIV/vIbi63bQdmvZuZYR1/F6MPQjzCngbOzx
         3pApX8r4WdFJcHueaU0+hDhI870Br4WLhiHu6NYDr1g4nOH5UzQLNZH4XCO9qBNqnV+/
         6nIqtL5bfkQQpxxQzQNVFQMgMTVM018xbRkZsieWVb2tZHFfbHjnA4Cdr+WjXxN0+mAV
         Ad4KvuK/iHKq7EUEOvsLr4ig8taxAhc5hSpTa4LPIQ1sm3QKs3jR11q9ou1EmgSXkqo9
         LtLWJzSHej1QruYYT20flqbZgLg8jk11jB3rUSM8oHor4HWjVJ8gD6ZMnn3UIr79Jc9v
         eblw==
X-Gm-Message-State: AOAM532TS7agAHbxj+p+DsdS+xxm1ahFz/aSSF3KSIDC3oafoRBx5JHj
        e/eheD/Dv8k2eb3pUVm/8NefGEVrc7ALAEGqdTP/kNmsT6evf70TFnfG4VZZpW9l7czoOIW8lrZ
        0THTaUz9SHUZtnfpQ8fVY2elldc+IIz6XL3tZrVokc2F9WkmGhUE+qV97XCqdAK5RurlZGx1ZMe
        kZHAtGm4EeEw==
X-Received: by 2002:a17:906:c1d0:: with SMTP id bw16mr1461156ejb.146.1628845033594;
        Fri, 13 Aug 2021 01:57:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw25Ak63aWJsicK0ZKq0MwaPy9aMFXI6i2ZZsN25gyoVeMHq9sDj4NsYXFdZnB0Q+PCtlRyxw==
X-Received: by 2002:a17:906:c1d0:: with SMTP id bw16mr1461144ejb.146.1628845033406;
        Fri, 13 Aug 2021 01:57:13 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s20sm339512eji.116.2021.08.13.01.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 01:57:13 -0700 (PDT)
Subject: Re: [PATCH] asus-wmi: Add support for platform_profile
To:     Luke Jones <luke@ljones.dev>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20210813024201.9518-1-luke@ljones.dev>
 <35JRXQ.1ZW8QHWM1YRG@ljones.dev>
 <9cceb3cb-f6d3-ade4-b219-87b2bbce5798@redhat.com>
 <R1ORXQ.WGLIPS8I54X63@ljones.dev>
 <5b503320-c1a3-2653-b269-ba8d40568edf@redhat.com>
 <4HRRXQ.EDZWS3NOU3J32@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2628a594-88f7-61c5-3559-1954811259b4@redhat.com>
Date:   Fri, 13 Aug 2021 10:57:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4HRRXQ.EDZWS3NOU3J32@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/13/21 10:27 AM, Luke Jones wrote:
> 
> 
> On Fri, Aug 13 2021 at 09:40:25 +0200, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi,
>>
>> On 8/13/21 9:13 AM, Luke Jones wrote:
>>>
>>>
>>>  On Fri, Aug 13 2021 at 09:03:04 +0200, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>  Hi,
>>>>
>>>>  On 8/13/21 7:27 AM, Luke Jones wrote:
>>>>>   I'm unsure of how to update the existing code for fn+f5 (next thermal profile) used by laptops like the TUF series that have keyboard over i2c. I was thinking of the following:
>>>>>
>>>>>   static int throttle_thermal_policy_switch_next(struct asus_wmi *asus)
>>>>>   {
>>>>>   struct platform_profile_handler *handler = &asus->platform_profile_handler; // added
>>>>>   u8 new_mode = asus->throttle_thermal_policy_mode + 1;
>>>>>
>>>>>   if (new_mode > ASUS_THROTTLE_THERMAL_POLICY_SILENT)
>>>>>    new_mode = ASUS_THROTTLE_THERMAL_POLICY_DEFAULT;
>>>>>
>>>>>   // asus->throttle_thermal_policy_mode = new_mode;
>>>>>   // return throttle_thermal_policy_write(asus);
>>>>>   return handler->profile_set(&asus->platform_profile_handler, new_mode); // added
>>>>>   }
>>>>>
>>>>>   * two lines added, two commented
>>>>
>>>>  I was going to say it is best to just send a key-press event to userspace
>>>>  (we can define a new EV_KEY_.... code for this) and then let userspace
>>>>  handle things. But I see that this is currently already handled by the kernel,
>>>>  so that is not really an option.
>>>>
>>>>>   I'm not able to test this though, and there are very few active people in my discord with TUF/i2c laptops to ask for testing also.
>>>>>
>>>>>   My concern here is to get the platform_profile correctly updated. Simply updating asus->throttle_thermal_policy_mode isn't going to achieve what we'll want.
>>>>
>>>>  Right, there is no need to go through handler->profile_set() you have defined
>>>>  profile_set yourself after all and it does not do anything different then the
>>>>  old code you are replacing here.
>>>>
>>>>  The trick is to call platform_profile_notify() after throttle_thermal_policy_write()
>>>>  this will let userspace, e.g. power-profiles-daemon know that the profile has
>>>>  been changed and it will re-read it then, resulting in a call to
>>>>  handler->profile_get()
>>>>
>>>>  So the new throttle_thermal_policy_switch_next() would look like this:
>>>>
>>>>  static int throttle_thermal_policy_switch_next(struct asus_wmi *asus)
>>>>  {
>>>>          u8 new_mode = asus->throttle_thermal_policy_mode + 1;
>>>>      int err; // new
>>>>
>>>>          if (new_mode > ASUS_THROTTLE_THERMAL_POLICY_SILENT)
>>>>                  new_mode = ASUS_THROTTLE_THERMAL_POLICY_DEFAULT;
>>>>
>>>>          asus->throttle_thermal_policy_mode = new_mode;
>>>>
>>>>          err = throttle_thermal_policy_write(asus); // changed
>>>>      if (err == 0)                              // new
>>>>          platform_profile_notify();         // new
>>>>
>>>>      return err;                                // new
>>>>  }
>>>>
>>>>  As you can see the only new thing here is the
>>>>  platform_profile_notify() call on a successful write,
>>>>  which is such a small change that I'm not overly worried about
>>>>  not being able to test this.
>>>>
>>>>  I hope this helps.
>>>>
>>>>  Regards,
>>>>
>>>>  Hans
>>
>> <snip>
>>
>>>  Hi Hans,
>>>
>>>  Very helpful, thanks. I'd completely failed to notice platform_profile_notify in the platform_profile.h :| I've now put that in throttle_thermal_policy_write() just after sysfs_notify().
>>
>> That means that the notify will also happen when the setting is
>> changed through handler->profile_set() this is not necessarily
>> a bad thing since there could be multiple user-space
>> processes accessing the profile and then others will be
>> notified when one of the processes makes a change.
>>
>> But ATM the other drivers which use platform_profile_notify()
>> only do this when the profile is changed from outside of
>> userspace. Specifically by a hotkey handled directly by the
>> embedded-controller, this in kernel turbo-key handling is
>> very similar to that.
>>
>> So if you add the platform_profile_notify() to
>> throttle_thermal_policy_write() then asus-wmi will behave
>> differently from the other existing implementations.
>>
>> So I think we need to do a couple of things here:
>>
>> 1. Decided what notify behavior is the correct behavior.
>> Bastien, since power-profiles-daemon is the main consumer,
>> what behavior do you want / expect?  If we make the assumption
>> that there will only be 1 userspace process accessing the
>> profile settings (e.g. p-p-d) then the current behavior
>> of e.g. thinkpad_acpi to only do the notify (send POLLPRI)
>> when the profile is changed by a source outside userspace
>> seems to make sense. OTOH as I mentioned above if we
>> assume there might be multiple userspace processes touching
>> the profile (it could even be an echo from a shell) then
>> it makes more sense to do the notify on all changes so that
>> p-p-d's notion of the active profile is always correct.
>>
>> Thinking more about this always doing the notify seems
>> like the right thing to do to me.
>>
>> 2. Once we have an answer to 1. we need to documented the
>> expected behavior in Documentation/ABI/testing/sysfs-platform_profile
>>
>> 3. If we go for doing a notify on any change, then we need
>> to update the existing drivers to do this.
>>
>> Regards,
>>
>> Hans
> 
> My thinking for it was ensuring that a process that wrote to /sys/devices/platform/asus-nb-wmi/throttle_thermal_policy would force an update across all. I think perhaps I should move the notify to throttle_thermal_policy_store() instead which only activates when the path is written.

We definitely want the notify when the change is done by the kernel
itself through the hotkey, which would not happen when the
notify call gets moved to store.

The question which I had was if we should also notify on store-s
(writes to the sysfs file from userspace processes). The current
drivers don't do a notify on store, but that seems wrong. Also
see my other somewhat long email.

Thinking more about this I think we should actually do the notify
from the platform_profile_store() function inside
drivers/acpi/platform_profile.c, that way all drivers will
consistently do the notify after a store.

This does mean that the asus-wmi code should only call
platform_profile_notify() in the hotkey path as I suggested
in my original proposal, so that we don't call notify twice
for a single store.

###

So summarizing my current thoughts on this:

1. The asus-wmi code should only call platform_profile_notify()
in the hotkey path, to be consistent with other existing drivers.

2. We should document the POLLPRI stuff in
Documentation/ABI/testing/sysfs-platform_profile
This documentation should say that POLLPRI will be raised on
any changes, independent of those changes coming from a userspace
write; or coming from another source (typically a hotkey
triggered profile change handled either directly by the embedded-controller
or fully handled inside the kernel).

3. We should make platform_profile_store() function inside
drivers/acpi/platform_profile.c call platform_profile_notify()
on a successful store to make all the drivers consistently do
a notify after a store.

And I think it might make sense to fold 2. + 3. into a single
patch. I'll put writing that patch on my to do list.

Regards,

Hans

