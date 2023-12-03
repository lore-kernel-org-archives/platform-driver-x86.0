Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FuNDv99D"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112FAF2
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 Dec 2023 07:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701618087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrLiHxpmPiS7OvUiG7PaRbDSX6/6tc0/PC7JobLnjgM=;
	b=FuNDv99DnOYD76kSKiTPWVX0/2ytUh9hMx1LXcWCMIuVr06lDBhyauhx+fZ35yZlBJ6kQh
	SQkx/CGuSMDy1Q51N/Z12byPjoWRd4BemoJWWd62RMmy1cOu0osNryToNuzltfHDEswrx4
	eEG2lisgzYxSxbOtxrCtuBQsUqi4FdQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-Y9zcubAIM0CwKDm-sf1bMA-1; Sun, 03 Dec 2023 10:41:25 -0500
X-MC-Unique: Y9zcubAIM0CwKDm-sf1bMA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a1a4bc50361so154084366b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 03 Dec 2023 07:41:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701618084; x=1702222884;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lrLiHxpmPiS7OvUiG7PaRbDSX6/6tc0/PC7JobLnjgM=;
        b=f42CIL9/uvLbxQlJA8TzdumufV00pTQmXloJVgO8UJp8p6xiBbbbovak5KRtbdzEjl
         jYnT9uxXBXR63YnkS/sZZLPiebi8Z/+0Z0SpcNxmbB/WhyEjf50X+yos1oDgRGGuR+D1
         xmaMfjDG/xd1ERG9PnfeUPGyBrCXohwKrftng2VDbiWGdJHbLmHG2I3AWToedSe/l1lY
         79g0ZDn9vQxesxJvhCq2gWK4joy5+ox44txlSQ6XGwOBYqKBPkftP34awmkt+NLxq3mg
         o/XW0/KU9HGBSge57ix8p4K5hrN9F4j6U3dhXwvn0F/uCy9miad3jM81aPkOat/G9RgI
         iFvQ==
X-Gm-Message-State: AOJu0Yw/IJWxA5gknC1VvgFGhVNmeMGoYM1Rkls8bzXvj2Vc5bcFicYa
	6jRIchI5JfhGXPB9Xnc0NpkcimdJnC9bonx4OrEJi6uSynUibVMw7rlnFI9mdFY1bke+1OqPTuq
	BLk5HSbSE2oSHwhEwoPP45QxfwNAeId7LSQ==
X-Received: by 2002:a17:906:73d5:b0:9e6:7f83:6547 with SMTP id n21-20020a17090673d500b009e67f836547mr2513160ejl.48.1701618084626;
        Sun, 03 Dec 2023 07:41:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMnEejdYRRAqC+Exu01HFTwcy9zuH0Dlqnlxj5uJALoZtqbFlIjZ40ypnzgmj470Nhta2sig==
X-Received: by 2002:a17:906:73d5:b0:9e6:7f83:6547 with SMTP id n21-20020a17090673d500b009e67f836547mr2513152ejl.48.1701618084206;
        Sun, 03 Dec 2023 07:41:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q19-20020a1709060e5300b009a19701e7b5sm4248084eji.96.2023.12.03.07.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Dec 2023 07:41:23 -0800 (PST)
Message-ID: <b9bdfcbf-e263-42f9-9ddb-c7101348b18e@redhat.com>
Date: Sun, 3 Dec 2023 16:41:22 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug Report] intel/vbtn: Dell Inspiron 7352 has unreliable
 tablet-mode switch
From: Hans de Goede <hdegoede@redhat.com>
To: Arnold Gozum <arngozum@gmail.com>, AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org
References: <87271a74-c831-4eec-b7a4-1371d0e42471@gmail.com>
 <CAFv23Qm+-p7U5N8JpJmqNxHnN7bTT3fxQJ5O0ainRrqnvrmB7g@mail.gmail.com>
 <c6402969-a372-44ad-a540-79d4ee60e190@gmail.com>
 <674140cc-fb03-4751-9bdf-13e86a6d39cc@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <674140cc-fb03-4751-9bdf-13e86a6d39cc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Arnold,

I was wondering what the status of this is.

Did you manage to find some time to test the patch
which I attached to my previous results ?

And if yes, what were the results?

Regards,

Hans


On 11/20/23 15:18, Hans de Goede wrote:
> Hi Arnold,
> 
> Thank you for reporting this.
> 
> Unfortunately removing the Dell Inspiron 7352 from
> the dmi_switches_allow_list will not help.
> 
> The intel-vbtn driver now a days also creates an input-device
> with a tablet-switch upon receiving the first tablet-switch
> related event, to avoid needing to maintain an ever growing
> list of devices on the allow-list.
> 
> And since the Dell Inspiron 7352 does have a somewhat working
> tablet-mode-switch it does send such events. So removing it
> from the allow-list will only result in the creation of
> an input-device for the tablet-mode-switch being delayed till
> the first event.
> 
> Now we could add a dmi_switches_deny_list for this purpose,
> but first lets see if we can fix things.
> 
> On 10/29/23 20:52, Arnold Gozum wrote:
>> Hi, sorry for the delayed reply. Your patch doesn't seem to work, I
>> still have the issue where the switch is in the wrong state after
>> suspend/resume.
> 
> Ok, so this does sound like the issue where the switch completely
> stops reporting state-changes is fixed with the addition of
> the extra "VBDL" call ?
> 
> I think that the wrong mode after suspend/resume is just a matter
> of manually checking the mode after a suspend/resume.
> 
> Can you give the attached patch a try and see if that fixes things ?
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
>> And yes, it's been a while, and I believe the issues did exist during
>> that time however it was easy to ignore/forget since I'm on X11 where
>> libinput doesn't respond to tablet mode switches, so I neglected to
>> report the issue for a while. Also, about the BIOS, I'm a little
>> hesistant to update it since I don't have a battery. I have version A11
>> and the newest is A15, but Dell's update notes only mention security
>> fixes, so maybe it doesn't matter.
>>
>> On 2023-10-17 22:05, AceLan Kao wrote:
>>> Arnold Gozum <arngozum@gmail.com> 於 2023年10月18日 週三 上午8:53寫道：
>>>>
>>>> Hi,
>>>>
>>>> In Linux 5.11, Dell Inspiron 7352 was added to the
>>>> dmi_switches_allow_list as it is a 2-in-1 which reports a chassis type
>>>> 10 (actually it was me who submitted the patch).
>>>>
>>>> However, the tablet mode switch can be unreliable. Randomly, switch
>>>> events stop being reported and SW_TABLET_MODE will by stuck at 1 or 0,
>>>> which I have tested by running evtest while flipping the device to and
>>>> from tablet mode. This is fixed after a reboot, or a suspend followed by
>>>> unloading and reloading the intel-vbtn module. It can also sometimes be
>>>> the case that upon resume, SW_TABLET_MODE does not reflect the actual
>>>> state of the device, which is fixed by physically flipping the screen
>>>> back and forth to update the state.
>>>>
>>>> Because of these issues, I think this model should be removed from the
>>>> allow list, unless more investigation should be done.
>>> Hi Arnold,
>>>
>>> It's been a long time since you submitted the patch. Did those issues
>>> not occur during that time?
>>> Have you tried updating the BIOS to see if it helps?
>>>
>>> From your description, I think calling VBDL might reset the status.
>>> You might want to try it below.
>>>
>>> diff --git a/drivers/platform/x86/intel/vbtn.c
>>> b/drivers/platform/x86/intel/vbtn.c
>>> index 6fa1735ad7a49..681650f52ff22 100644
>>> --- a/drivers/platform/x86/intel/vbtn.c
>>> +++ b/drivers/platform/x86/intel/vbtn.c
>>> @@ -198,6 +198,8 @@ static void notify_handler(acpi_handle handle, u32
>>> event, void *context)
>>>        autorelease = val && (!ke_rel || ke_rel->type == KE_IGNORE);
>>>
>>>        sparse_keymap_report_event(input_dev, event, val, autorelease);
>>> +
>>> +       acpi_evaluate_object(handle, "VBDL", NULL, NULL);
>>> }
>>>
>>> /*
>>>
>>>>
>>>> Thanks,
>>>> Arnold
>>

