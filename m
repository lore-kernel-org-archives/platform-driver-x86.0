Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZV6JKgf"
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB4BE5
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 Dec 2023 18:44:00 -0800 (PST)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-4647d236e92so348672137.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 03 Dec 2023 18:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701657839; x=1702262639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I4DaGir+tGJWf444PEz1us7Hwl1/3n0dJXp2DJSga30=;
        b=lZV6JKgfNzBLlNhdpUHEKDVdv/2T1QKKvot/U6nOCmplUt5FrjhKnyEc221c8im1eK
         kZjFh2YUhkNmvbuQi0I7GR0iZ86Tm4gqkgS6ARZj+e4VqmTQ6DfxIpfTd+/9kCyrPLT4
         snJ2l3m0jRvgfEceT8e+bmQlW80ezHWz7u1sAJ5egB7N8mcSbdAJGzaSKTN/cH6bixUA
         1if3X+pW2KMkRQbnz8W9CgLHgtUdr/LY8SDyALc2gO5kbyQ4Fp/7zjMwmExABdjQm2Nq
         gn03YFKrbixuijFIpcN9QYEG1exg1X4PedXsdexctS2hBuqGhnPisNkf9GCnMjzu+Mmu
         e37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701657839; x=1702262639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4DaGir+tGJWf444PEz1us7Hwl1/3n0dJXp2DJSga30=;
        b=NkqVTkFnxTu5LS45iIFpMjrjDQnOWwbefGqr59TiIqOSFft/7JJ3SkziOovNFKgdjG
         oUWFKu7+D6Izig9FNSmJIPdoFssal/71hlFQBh9Ddp11JCdTReFder+T2WsVFX2jy/0h
         OdegNYDWKc091OiRYgSpVTjEnowQs8bGbnyTvM06ZIufzdRN71v1CN0kPLM2MF0g3A4i
         k2vrXxSg/QJYriFIXnoTM++I1XLl13qe1UJ93FJtITNJ4ezZk86r+Yaolo9G2P/6Qw3k
         s5VYV+tQELKYk8de+yx1WLYb1nsIbJkOJWo8+e4CSipxhZBjuih41oJudUVI5UR+Wew3
         jovA==
X-Gm-Message-State: AOJu0YwM4/0wOMWoTjcOMAk2idCnlbdjnoJtGeVnH+zbjIkNP67fLYsS
	CaMyXBoLR2HBm6aiieXvD2NFtv9W0KsOjruT
X-Google-Smtp-Source: AGHT+IEbCqAOCAoHK+nx9sUAmidKlPPYD2ZxT/gex8Kd3bvOezfqQaRaxSZugwHT5mrEK7PeeaH3ig==
X-Received: by 2002:a67:b60b:0:b0:464:4518:ba73 with SMTP id d11-20020a67b60b000000b004644518ba73mr1375213vsm.8.1701657838865;
        Sun, 03 Dec 2023 18:43:58 -0800 (PST)
Received: from ?IPV6:2607:fea8:4adc:2480::ee29? ([2607:fea8:4adc:2480::ee29])
        by smtp.gmail.com with ESMTPSA id x18-20020ad440d2000000b0067aa860b1f9sm2023630qvp.122.2023.12.03.18.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Dec 2023 18:43:58 -0800 (PST)
Message-ID: <f833cd1b-3d2f-46e6-ad44-347a05c0ffa1@gmail.com>
Date: Sun, 3 Dec 2023 21:43:57 -0500
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
To: Hans de Goede <hdegoede@redhat.com>, AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org
References: <87271a74-c831-4eec-b7a4-1371d0e42471@gmail.com>
 <CAFv23Qm+-p7U5N8JpJmqNxHnN7bTT3fxQJ5O0ainRrqnvrmB7g@mail.gmail.com>
 <c6402969-a372-44ad-a540-79d4ee60e190@gmail.com>
 <674140cc-fb03-4751-9bdf-13e86a6d39cc@redhat.com>
 <b9bdfcbf-e263-42f9-9ddb-c7101348b18e@redhat.com>
From: Arnold Gozum <arngozum@gmail.com>
In-Reply-To: <b9bdfcbf-e263-42f9-9ddb-c7101348b18e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Hans,

Thanks for writing this patch, I've just tested it and the wrong state
issue is fixed. The switch is in the correct state after suspending no
matter the state before suspending. I've seen forums posts of people
experiencing the same issue on other models, so I'm sure it will help them
as well.

For the issue where the switch stops responding, it did happen once but
after rebooting I can't get it to happen again. It's hard to know for sure
since it happens randomly, or maybe I didn't have the patched module
actually loaded when it did occur. I'm guessing it probably should have
happened by now, but I can report back if it eventually happens again.

I really appreciate you taking the time to work on this.

Thanks,
Arnold

On 2023-12-03 10:41, Hans de Goede wrote:
> Hi Arnold,
> 
> I was wondering what the status of this is.
> 
> Did you manage to find some time to test the patch
> which I attached to my previous results ?
> 
> And if yes, what were the results?
> 
> Regards,
> 
> Hans
> 
> 
> On 11/20/23 15:18, Hans de Goede wrote:
>> Hi Arnold,
>>
>> Thank you for reporting this.
>>
>> Unfortunately removing the Dell Inspiron 7352 from
>> the dmi_switches_allow_list will not help.
>>
>> The intel-vbtn driver now a days also creates an input-device
>> with a tablet-switch upon receiving the first tablet-switch
>> related event, to avoid needing to maintain an ever growing
>> list of devices on the allow-list.
>>
>> And since the Dell Inspiron 7352 does have a somewhat working
>> tablet-mode-switch it does send such events. So removing it
>> from the allow-list will only result in the creation of
>> an input-device for the tablet-mode-switch being delayed till
>> the first event.
>>
>> Now we could add a dmi_switches_deny_list for this purpose,
>> but first lets see if we can fix things.
>>
>> On 10/29/23 20:52, Arnold Gozum wrote:
>>> Hi, sorry for the delayed reply. Your patch doesn't seem to work, I
>>> still have the issue where the switch is in the wrong state after
>>> suspend/resume.
>>
>> Ok, so this does sound like the issue where the switch completely
>> stops reporting state-changes is fixed with the addition of
>> the extra "VBDL" call ?
>>
>> I think that the wrong mode after suspend/resume is just a matter
>> of manually checking the mode after a suspend/resume.
>>
>> Can you give the attached patch a try and see if that fixes things ?
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>> And yes, it's been a while, and I believe the issues did exist during
>>> that time however it was easy to ignore/forget since I'm on X11 where
>>> libinput doesn't respond to tablet mode switches, so I neglected to
>>> report the issue for a while. Also, about the BIOS, I'm a little
>>> hesistant to update it since I don't have a battery. I have version A11
>>> and the newest is A15, but Dell's update notes only mention security
>>> fixes, so maybe it doesn't matter.
>>>
>>> On 2023-10-17 22:05, AceLan Kao wrote:
>>>> Arnold Gozum <arngozum@gmail.com> 於 2023年10月18日 週三 上午8:53寫道：
>>>>>
>>>>> Hi,
>>>>>
>>>>> In Linux 5.11, Dell Inspiron 7352 was added to the
>>>>> dmi_switches_allow_list as it is a 2-in-1 which reports a chassis type
>>>>> 10 (actually it was me who submitted the patch).
>>>>>
>>>>> However, the tablet mode switch can be unreliable. Randomly, switch
>>>>> events stop being reported and SW_TABLET_MODE will by stuck at 1 or 0,
>>>>> which I have tested by running evtest while flipping the device to and
>>>>> from tablet mode. This is fixed after a reboot, or a suspend followed by
>>>>> unloading and reloading the intel-vbtn module. It can also sometimes be
>>>>> the case that upon resume, SW_TABLET_MODE does not reflect the actual
>>>>> state of the device, which is fixed by physically flipping the screen
>>>>> back and forth to update the state.
>>>>>
>>>>> Because of these issues, I think this model should be removed from the
>>>>> allow list, unless more investigation should be done.
>>>> Hi Arnold,
>>>>
>>>> It's been a long time since you submitted the patch. Did those issues
>>>> not occur during that time?
>>>> Have you tried updating the BIOS to see if it helps?
>>>>
>>>> From your description, I think calling VBDL might reset the status.
>>>> You might want to try it below.
>>>>
>>>> diff --git a/drivers/platform/x86/intel/vbtn.c
>>>> b/drivers/platform/x86/intel/vbtn.c
>>>> index 6fa1735ad7a49..681650f52ff22 100644
>>>> --- a/drivers/platform/x86/intel/vbtn.c
>>>> +++ b/drivers/platform/x86/intel/vbtn.c
>>>> @@ -198,6 +198,8 @@ static void notify_handler(acpi_handle handle, u32
>>>> event, void *context)
>>>>        autorelease = val && (!ke_rel || ke_rel->type == KE_IGNORE);
>>>>
>>>>        sparse_keymap_report_event(input_dev, event, val, autorelease);
>>>> +
>>>> +       acpi_evaluate_object(handle, "VBDL", NULL, NULL);
>>>> }
>>>>
>>>> /*
>>>>
>>>>>
>>>>> Thanks,
>>>>> Arnold
>>>
> 
