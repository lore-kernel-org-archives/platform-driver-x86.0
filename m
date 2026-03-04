Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3DC34EEE6
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 16:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772640734; cv=none; b=JEYNN8ZVpjbSPvixzUpDBa7gK5V6uBfUI32CZU0spJIkZqS6WNUkLmbsWzOv4HWkKKSxCyBub3hJLNW8alUyPCDq+HwaV1CGZ8yRQlT2xB8eXeEl9L9XBBzhrkKsbsdj9yQJahJsVI5D212NJepO8tjLF0V7ItsgfL4+4NMVryQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772640734; c=relaxed/simple;
	bh=xYsJzU1dmsSFwD0vSaoyOtw1KMCz/KdpbeFonCurhRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgVGqUtvJJX2dyRt3wnvd1VewJ92h76VJskunVUYIJ3/xszD9iPcnmzA07/ckup5ehNpx/er+4w6kMdCtLECZfvMsnokmCiu3xPPQ0V11zr8lMN1/6C4l8lQ87f+GvrtzG57oXwI8UtxWCTM2v40p4A5jL8bC6KeViFDtP13u9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5PRkcNr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5PRkcNr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-483487335c2so58328245e9.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Mar 2026 08:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772640732; x=1773245532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EWWdCJuQGlN7X7iTx+gVa+1b409IvnSuR7fQE4Mf/lA=;
        b=G5PRkcNrzZZ9KIXuELKD359VGbICZzTsmVQDYAOwDVQOci8oK2Ua7SXD2d94l6x78r
         4VnJeG5vP4pn25LfvytUGoT1goiORdOoHZ0xS19TLWqyXWdVvSQA1DqAafE7KrIfwMA4
         mrnev2rbGuqyYxRb0wnR8UViYSPxHC+TDro3FldlRraCVHjz+T9nMu2lLfJ4H8SJM3Ui
         XZnxmsWFHvShOQaaR4spCkyBf1AYYW4oaiY5QHnFGE0c/3Nkhfu6d3IBLMjWaFCNTE+k
         yATCYPPb7f2o83Bs9kkjXsKRGmJ8r8k0tct7vg3YW8+T4AcfdWvN2AZe6Lji4ECy4k0l
         rpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772640732; x=1773245532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWWdCJuQGlN7X7iTx+gVa+1b409IvnSuR7fQE4Mf/lA=;
        b=phKOFTZ7bzi15mw1IZz1IAoCjMI1e9FfBV5Ea5uBakyHppZi316XtyBLR4itP4L1sb
         m8vSGoMdlJOxZ5sgq9RoGBfPgnvu0fY46PAYehIlQDxLn8zOCctQB6gsNutqNjP9t58Z
         C4jF2kKsBW9OpK+EpcRjzjnaWJQvbYO0gj6DIpUbVIcEDJtB7Z/5sfqhm/bB8s80Imxx
         Ufq6xdOMSautzS+fQFwA3Y4pIszSlnrE5VGSCilQwBkfdaB4d5DyAEW1n0SLPQIQW40X
         RoqinSKhU2t3RF+ngUaB552H9iEK8BMGANJ1HroFCin7zJrQqb2GG18H6fsCEJB6YXEP
         DaQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT56HY27NRkzhhZV85eAzqX383MsStR/HiyTIIyohnFVodx7QjFUbmDA8DaT4eN4EyyhQ2v2vgNWnDcAodK/7L31Cg@vger.kernel.org
X-Gm-Message-State: AOJu0YxeVSHu+fNbvWrxqjv37G4HWzOmSXpethboRdf6NjIIVlyHEnBY
	pBjBDZ/UL+x0TrB0Izgz1rp4VwMhfcknHJU+kMUOcCjcTtq7tKoofzqG
X-Gm-Gg: ATEYQzyYmrmbzLApiJ4LtJTeHswuIN4V/CWLKjYCUhaOmEXZGA9NHNt2kmZ0QJPagII
	Pm75mnlTr4um0EXHhCyN66TkhPkVc1vwDt9OISuZpoaNyRqJBC/uHeEHXzQb+1aPx71iTswSdh1
	SP60Lo26MNTmtQm2TWYMmyR/eKyegB8FIKekEOvfzzEAusLqkYH+czRDTX6AaZdI61PboUom8el
	6HGZH0vgY/ePpSfsXt0THD4uuaeFp489wcoL5RYI99lfSRKg/C6EO9BxqWOSokqTvcdrUDyuBf8
	GMOwo4hU7omvIeQknyqUM0aDG88++lsEEW4u0uWSIUJDjP0+f8huqjlOEg+i3CUUpo5Qhl1Wj9e
	vgoCgS0cTSQDuVHHeJpLcQ/nGrNp4oxeTst6BiXv3LcjoFR1FBwmCle3+c21rkz4xPBRXvzywvR
	jMfAdshZZ5/gw+FhOkM2TLJqDF6X2PaWYtb4aDvnQpht4I
X-Received: by 2002:a05:600c:6099:b0:480:4ae2:def1 with SMTP id 5b1f17b1804b1-48519847dedmr50273295e9.13.1772640731303;
        Wed, 04 Mar 2026 08:12:11 -0800 (PST)
Received: from [192.168.1.121] ([151.61.18.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485187bf2fcsm62564985e9.4.2026.03.04.08.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 08:12:10 -0800 (PST)
Message-ID: <b48bc9a7-7424-4e6b-afb8-7c8504fe5101@gmail.com>
Date: Wed, 4 Mar 2026 17:12:10 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-wmi: do not enforce a battery charge
 threshold
To: Antheas Kapenekakis <lkml@antheas.dev>,
 Denis Benato <denis.benato@linux.dev>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Luke D . Jones" <luke@ljones.dev>,
 Derek John Clark <derekjohn.clark@gmail.com>
References: <20260304132608.33815-1-denis.benato@linux.dev>
 <CAGwozwGhr6hwRz5jBkDGQrmJf9oK8FDE3dCE9_sAAChP5qrTGQ@mail.gmail.com>
 <a934337f-9055-40b8-93ef-294fd5f0a0f6@linux.dev>
 <CAGwozwHcABWyYRM8_n=3o2FsLBfswN4ajHOB65VNEHoOJ+Soyg@mail.gmail.com>
 <a9182a2e-feb0-4d5a-a32f-8de56ee66030@linux.dev>
 <CAGwozwH9uCev1bCZTVJ7fYt-iaST5hq+_PoZr6LNrEYg2=xz1Q@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwH9uCev1bCZTVJ7fYt-iaST5hq+_PoZr6LNrEYg2=xz1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 3/4/26 17:07, Antheas Kapenekakis wrote:
> On Wed, 4 Mar 2026 at 14:52, Denis Benato <denis.benato@linux.dev> wrote:
>>
>> On 3/4/26 14:39, Antheas Kapenekakis wrote:
>>> On Wed, 4 Mar 2026 at 14:37, Denis Benato <denis.benato@linux.dev> wrote:
>>>> On 3/4/26 14:30, Antheas Kapenekakis wrote:
>>>>> On Wed, 4 Mar 2026 at 14:26, Denis Benato <denis.benato@linux.dev> wrote:
>>>>>> Users are complaining for the battery limit being reset at 100% during
>>>>>> the boot process while the general consensus appears to not apply
>>>>>> unsolecited hardware changes, therefore stop resetting the battery
>>>>> *unsolicited. But I would rephrase to using this causes the device to
>>>>> reset its limits on boot, which might have been set by e.g. windows so
>>>>> if userspace is not aware to restore them, this causes a functionality
>>>>> degradation. This is the case with the current implementation by KDE.
>>>>>
>>>>>> charge limit at boot and return -ENODATA on charge_end_threshold to
>>>>>> signal for an unknown limit.
>>>>>>
>>>>>> Suggested-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>>> Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>>>>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>>>>>> ---
>>>>>>  drivers/platform/x86/asus-wmi.c | 13 ++++++++-----
>>>>>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>>>>>> index 6ba49bd375df..dc330a8ee2f2 100644
>>>>>> --- a/drivers/platform/x86/asus-wmi.c
>>>>>> +++ b/drivers/platform/x86/asus-wmi.c
>>>>>> @@ -1557,7 +1557,10 @@ static ssize_t charge_control_end_threshold_show(struct device *device,
>>>>>>                                                  struct device_attribute *attr,
>>>>>>                                                  char *buf)
>>>>>>  {
>>>>>> -       return sysfs_emit(buf, "%d\n", charge_end_threshold);
>>>>>> +       if ((charge_end_threshold >= 0) && (charge_end_threshold <= 100))
>>>>>> +               return sysfs_emit(buf, "%d\n", charge_end_threshold);
>>>>>> +
>>>>>> +       return -ENODATA;
>>>>> Please verify this does not cause KDE to display a warning and block
>>>>> modifying the energy consumption. If it does as has been my
>>>>> experience, communicate with KDE devs or Gnome (if it has a similar
>>>>> issue) and block this from merging until there is a solution from
>>>>> their side.
>>>> KDE doesn't yet allow to modify that value as upower is not picking up batteries
>>>> with only end_threshold by default. Discussion is ongoing:
>>>>
>>>> https://gitlab.freedesktop.org/upower/upower/-/merge_requests/308
>>> I have tested this exact patch you posted on my Z13 last November. KDE
>>> does pick it up and display a warning.
>> Displaying a warning about the current limit not being recognised is what
>> is expected and correct behavior, not an ABI change: software isn't breaking.
>>
>> You talked about setting (as in writing) the limit and that, as of now
>> (at least in KDE) is not possible.
> This is not true. Powerdevil supports the Asus driver and has done so
> for at least a year.
>
> The setting is under "Power Management -> Advanced Power Settings". On
> mainline it works properly but resets after every reboot due to this
> bug.

I never noticed it... Interesting... well thank you.

> With your patch applied, at least with -ENODATA there is no error. KDE
> defaults to 50%. So perhaps this could be doable to merge, -EIO made
> it fail. If you verify Gnome works properly or just does not support
> battery limits, but actually verify it mind you, this should be good
> to merge.
Alright I will test gnome and cosmic and will let you know. Thanks
for covering KDE!
> Antheas
>
>
> Antheas
>
>> There already exists widely in use software that changes the battery
>> level when started setting it to the previous value, so that warning
>> is not to be seen; moreover said class of software is going to earn
>> a new entry so I don't see any problem here.
>>
>> Perhaps Ilpo has some more insights on the matter.
>>
>> In addition to that, after the removal from the kernel of acpi_platform
>> asus-wmi ABI are going to change anyway, regardless of what I do.
>>> Which is why I settled with sending a fake 100 value instead and never
>>> upstreamed it.
>>>
>>> Antheas
>>>
>>>> since it has never worked there is nothing to break.
>>>>> Returning an error from this function when there is proper function is
>>>>> a slight ABI change compared to current drivers that implement this
>>>>> method.
>>>>>
>>>>> Thanks,
>>>>> Antheas
>>>>>
>>>>>>  }
>>>>>>
>>>>>>  static DEVICE_ATTR_RW(charge_control_end_threshold);
>>>>>> @@ -1580,11 +1583,11 @@ static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_batter
>>>>>>                 return -ENODEV;
>>>>>>
>>>>>>         /* The charge threshold is only reset when the system is power cycled,
>>>>>> -        * and we can't get the current threshold so let set it to 100% when
>>>>>> -        * a battery is added.
>>>>>> +        * and we can't read the current threshold, however the majority of
>>>>>> +        * platforms retains it, therefore signal the threshold as unknown
>>>>>> +        * until user explicitly sets it to a new value.
>>>>>>          */
>>>>>> -       asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, 100, NULL);
>>>>>> -       charge_end_threshold = 100;
>>>>>> +       charge_end_threshold = -1;
>>>>>>
>>>>>>         return 0;
>>>>>>  }
>>>>>> --
>>>>>> 2.53.0
>>>>>>
>>>>>>
