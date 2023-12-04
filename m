Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B8yC1YV2"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC39CA
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Dec 2023 07:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701702438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fG9A8JCvQQgr4Rvg/D3WA4iebHtK5oz9DLnZrepiNlQ=;
	b=B8yC1YV2BYqwbO7M5x+5Y8OB+pECRwQjjpOeJE+V3elYxi1NvnbDgOJGCNrGi+WHwLW2+y
	/Ww1yNu2H8I99J8kyXpPT1aulvNHiT9hSUQZp+1k0ElYmVskVWvpBUttA2ia0HQEjysbK6
	ya+oMDr+VC18mlsPo1mVM+0jUO0XLXc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-tbeZM0CsPQi7Ali4J7LrwA-1; Mon, 04 Dec 2023 10:07:14 -0500
X-MC-Unique: tbeZM0CsPQi7Ali4J7LrwA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-542fe446d45so3401234a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Dec 2023 07:07:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701702433; x=1702307233;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fG9A8JCvQQgr4Rvg/D3WA4iebHtK5oz9DLnZrepiNlQ=;
        b=M7D1GOUCv+tu6BP2i9kmL90dWEVV83kBhD+hBgrF2IRIKIhm8v8k/jQIzQ1si2FKcM
         gGfd8NxiJhxJZozsT5tqF3aAkr/OlB/uq2f+4oHFFKvB8QNA4FPw5K+/0UERMI1CogdE
         R/mMeqxsAjYsGQ/DYhlGxxVLe09lVfckOy/GCc6I8EV9l59BbdY52EO5cHDze+juBDkp
         DRgNtTWw+vb09o5voPzAND9/4jlm8P08NIB2Wx3q2YMMWUhn7Bz6SuzDmDGBkBzUdfUF
         vMpT0QqgUdouNAevoKIQqHwfruSZMsn17gkT16vTTTbm30Qt1LXbauC/ChZmwKdygh3c
         6riA==
X-Gm-Message-State: AOJu0YzcrMD8l/GVZLie9ewo8NXU2yLclM243M1ALVT5FyZICfrw1/6l
	SyZbX7Q7RVyarPeMqKFLeecjsnIb1hb7ioX1F2h+HGSqm81bqEdSurMiLifX7lTLlGUflMpKQ3q
	Th7UrSw/Pza+HQHQulB/qLslPTC4filcQvQ==
X-Received: by 2002:a17:906:3f4f:b0:a02:38a2:4d79 with SMTP id f15-20020a1709063f4f00b00a0238a24d79mr2890787ejj.41.1701702433154;
        Mon, 04 Dec 2023 07:07:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxoLufXL5GNtE02MlcqAYYXgOnw8rrVcozvyFP04sleGlPCRr9DticqnXJuUjjRvX/YyWyJw==
X-Received: by 2002:a17:906:3f4f:b0:a02:38a2:4d79 with SMTP id f15-20020a1709063f4f00b00a0238a24d79mr2890779ejj.41.1701702432709;
        Mon, 04 Dec 2023 07:07:12 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id h14-20020a170906398e00b009d2eb40ff9dsm5419349eje.33.2023.12.04.07.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 07:07:11 -0800 (PST)
Message-ID: <5c18af28-e032-4677-bf3d-b868462c2414@redhat.com>
Date: Mon, 4 Dec 2023 16:07:10 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug Report] intel/vbtn: Dell Inspiron 7352 has unreliable
 tablet-mode switch
Content-Language: en-US
To: Arnold Gozum <arngozum@gmail.com>, AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org
References: <87271a74-c831-4eec-b7a4-1371d0e42471@gmail.com>
 <CAFv23Qm+-p7U5N8JpJmqNxHnN7bTT3fxQJ5O0ainRrqnvrmB7g@mail.gmail.com>
 <c6402969-a372-44ad-a540-79d4ee60e190@gmail.com>
 <674140cc-fb03-4751-9bdf-13e86a6d39cc@redhat.com>
 <b9bdfcbf-e263-42f9-9ddb-c7101348b18e@redhat.com>
 <f833cd1b-3d2f-46e6-ad44-347a05c0ffa1@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f833cd1b-3d2f-46e6-ad44-347a05c0ffa1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/4/23 03:43, Arnold Gozum wrote:
> Hi Hans,
> 
> Thanks for writing this patch, I've just tested it and the wrong state
> issue is fixed. The switch is in the correct state after suspending no
> matter the state before suspending. I've seen forums posts of people
> experiencing the same issue on other models, so I'm sure it will help them
> as well.
> 
> For the issue where the switch stops responding, it did happen once but
> after rebooting I can't get it to happen again. It's hard to know for sure
> since it happens randomly, or maybe I didn't have the patched module
> actually loaded when it did occur. I'm guessing it probably should have
> happened by now, but I can report back if it eventually happens again.
> 
> I really appreciate you taking the time to work on this.

Thank you for reporting back the testing results.

I have now submitted the patch upstream so that it can
be merged as a fix soon(ish).

Regards,

Hans




> On 2023-12-03 10:41, Hans de Goede wrote:
>> Hi Arnold,
>>
>> I was wondering what the status of this is.
>>
>> Did you manage to find some time to test the patch
>> which I attached to my previous results ?
>>
>> And if yes, what were the results?
>>
>> Regards,
>>
>> Hans
>>
>>
>> On 11/20/23 15:18, Hans de Goede wrote:
>>> Hi Arnold,
>>>
>>> Thank you for reporting this.
>>>
>>> Unfortunately removing the Dell Inspiron 7352 from
>>> the dmi_switches_allow_list will not help.
>>>
>>> The intel-vbtn driver now a days also creates an input-device
>>> with a tablet-switch upon receiving the first tablet-switch
>>> related event, to avoid needing to maintain an ever growing
>>> list of devices on the allow-list.
>>>
>>> And since the Dell Inspiron 7352 does have a somewhat working
>>> tablet-mode-switch it does send such events. So removing it
>>> from the allow-list will only result in the creation of
>>> an input-device for the tablet-mode-switch being delayed till
>>> the first event.
>>>
>>> Now we could add a dmi_switches_deny_list for this purpose,
>>> but first lets see if we can fix things.
>>>
>>> On 10/29/23 20:52, Arnold Gozum wrote:
>>>> Hi, sorry for the delayed reply. Your patch doesn't seem to work, I
>>>> still have the issue where the switch is in the wrong state after
>>>> suspend/resume.
>>>
>>> Ok, so this does sound like the issue where the switch completely
>>> stops reporting state-changes is fixed with the addition of
>>> the extra "VBDL" call ?
>>>
>>> I think that the wrong mode after suspend/resume is just a matter
>>> of manually checking the mode after a suspend/resume.
>>>
>>> Can you give the attached patch a try and see if that fixes things ?
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>>
>>>
>>>> And yes, it's been a while, and I believe the issues did exist during
>>>> that time however it was easy to ignore/forget since I'm on X11 where
>>>> libinput doesn't respond to tablet mode switches, so I neglected to
>>>> report the issue for a while. Also, about the BIOS, I'm a little
>>>> hesistant to update it since I don't have a battery. I have version A11
>>>> and the newest is A15, but Dell's update notes only mention security
>>>> fixes, so maybe it doesn't matter.
>>>>
>>>> On 2023-10-17 22:05, AceLan Kao wrote:
>>>>> Arnold Gozum <arngozum@gmail.com> 於 2023年10月18日 週三 上午8:53寫道：
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> In Linux 5.11, Dell Inspiron 7352 was added to the
>>>>>> dmi_switches_allow_list as it is a 2-in-1 which reports a chassis type
>>>>>> 10 (actually it was me who submitted the patch).
>>>>>>
>>>>>> However, the tablet mode switch can be unreliable. Randomly, switch
>>>>>> events stop being reported and SW_TABLET_MODE will by stuck at 1 or 0,
>>>>>> which I have tested by running evtest while flipping the device to and
>>>>>> from tablet mode. This is fixed after a reboot, or a suspend followed by
>>>>>> unloading and reloading the intel-vbtn module. It can also sometimes be
>>>>>> the case that upon resume, SW_TABLET_MODE does not reflect the actual
>>>>>> state of the device, which is fixed by physically flipping the screen
>>>>>> back and forth to update the state.
>>>>>>
>>>>>> Because of these issues, I think this model should be removed from the
>>>>>> allow list, unless more investigation should be done.
>>>>> Hi Arnold,
>>>>>
>>>>> It's been a long time since you submitted the patch. Did those issues
>>>>> not occur during that time?
>>>>> Have you tried updating the BIOS to see if it helps?
>>>>>
>>>>> From your description, I think calling VBDL might reset the status.
>>>>> You might want to try it below.
>>>>>
>>>>> diff --git a/drivers/platform/x86/intel/vbtn.c
>>>>> b/drivers/platform/x86/intel/vbtn.c
>>>>> index 6fa1735ad7a49..681650f52ff22 100644
>>>>> --- a/drivers/platform/x86/intel/vbtn.c
>>>>> +++ b/drivers/platform/x86/intel/vbtn.c
>>>>> @@ -198,6 +198,8 @@ static void notify_handler(acpi_handle handle, u32
>>>>> event, void *context)
>>>>>        autorelease = val && (!ke_rel || ke_rel->type == KE_IGNORE);
>>>>>
>>>>>        sparse_keymap_report_event(input_dev, event, val, autorelease);
>>>>> +
>>>>> +       acpi_evaluate_object(handle, "VBDL", NULL, NULL);
>>>>> }
>>>>>
>>>>> /*
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Arnold
>>>>
>>
> 

