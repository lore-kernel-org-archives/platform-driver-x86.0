Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07688315D3E
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632323; cv=none; b=XY6aRWGhujUFSI5yPpHmTARPQz+gIMnD8rdH3GwsMn+lQqVdxvhJnUigME7vmbA9yZ/9y0G85ez3BIEq7KqTVNd8XMGQBK7unTGjFyqD+a7N4Bxj+sbYIrO28WQN5DCsf1o+238BUb3t6NPWH8Mo+EyOyUFD5UIDI2+Pmyqc/Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632323; c=relaxed/simple;
	bh=ym74P4R6CyFGqMcLl3GtlBbhr7HYppR+Np1EqayYcCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DQ2+XxQPRjLUPsvUOxb8rCgo7FjqLbKUJizPFs7ihZUVs+fmSyBx1RfVig6qXyjTnloIt1Jjxe8LNyPWux/uHKcS7YpaTFU4revaMbqjOCU9ZcAl0BK+hrdkxpWMuEIlYH4QzlyShMSuKLkSZ4RTOmRjPMnVLnD+CXuGsjMuHtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dVlhdmI7; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dVlhdmI7"
Message-ID: <a9182a2e-feb0-4d5a-a32f-8de56ee66030@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772632318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z4cSU+znW+H1vm+zxbgwIgiIbv6Tc5UCO22yK7wUo7E=;
	b=dVlhdmI7OO0AcYT4evyyx6NoXIzBlWICYJ9Xjo+v2gr8EcNqD8+KUh/VxBiabLOYauniQ9
	wIE7MM05weI66R8WjgEV3YQDDMMA59hqxcCv8wOSka+7dVutURfmx9O1x73pBV04EXBtSl
	2uzNSGLp2FYLpBDX/lYgiyNpkz6Fna4=
Date: Wed, 4 Mar 2026 14:51:52 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] platform/x86: asus-wmi: do not enforce a battery charge
 threshold
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Luke D . Jones" <luke@ljones.dev>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Denis Benato <benato.denis96@gmail.com>
References: <20260304132608.33815-1-denis.benato@linux.dev>
 <CAGwozwGhr6hwRz5jBkDGQrmJf9oK8FDE3dCE9_sAAChP5qrTGQ@mail.gmail.com>
 <a934337f-9055-40b8-93ef-294fd5f0a0f6@linux.dev>
 <CAGwozwHcABWyYRM8_n=3o2FsLBfswN4ajHOB65VNEHoOJ+Soyg@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <CAGwozwHcABWyYRM8_n=3o2FsLBfswN4ajHOB65VNEHoOJ+Soyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 3/4/26 14:39, Antheas Kapenekakis wrote:
> On Wed, 4 Mar 2026 at 14:37, Denis Benato <denis.benato@linux.dev> wrote:
>>
>> On 3/4/26 14:30, Antheas Kapenekakis wrote:
>>> On Wed, 4 Mar 2026 at 14:26, Denis Benato <denis.benato@linux.dev> wrote:
>>>> Users are complaining for the battery limit being reset at 100% during
>>>> the boot process while the general consensus appears to not apply
>>>> unsolecited hardware changes, therefore stop resetting the battery
>>> *unsolicited. But I would rephrase to using this causes the device to
>>> reset its limits on boot, which might have been set by e.g. windows so
>>> if userspace is not aware to restore them, this causes a functionality
>>> degradation. This is the case with the current implementation by KDE.
>>>
>>>> charge limit at boot and return -ENODATA on charge_end_threshold to
>>>> signal for an unknown limit.
>>>>
>>>> Suggested-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>> Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>>>> ---
>>>>  drivers/platform/x86/asus-wmi.c | 13 ++++++++-----
>>>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>>>> index 6ba49bd375df..dc330a8ee2f2 100644
>>>> --- a/drivers/platform/x86/asus-wmi.c
>>>> +++ b/drivers/platform/x86/asus-wmi.c
>>>> @@ -1557,7 +1557,10 @@ static ssize_t charge_control_end_threshold_show(struct device *device,
>>>>                                                  struct device_attribute *attr,
>>>>                                                  char *buf)
>>>>  {
>>>> -       return sysfs_emit(buf, "%d\n", charge_end_threshold);
>>>> +       if ((charge_end_threshold >= 0) && (charge_end_threshold <= 100))
>>>> +               return sysfs_emit(buf, "%d\n", charge_end_threshold);
>>>> +
>>>> +       return -ENODATA;
>>> Please verify this does not cause KDE to display a warning and block
>>> modifying the energy consumption. If it does as has been my
>>> experience, communicate with KDE devs or Gnome (if it has a similar
>>> issue) and block this from merging until there is a solution from
>>> their side.
>> KDE doesn't yet allow to modify that value as upower is not picking up batteries
>> with only end_threshold by default. Discussion is ongoing:
>>
>> https://gitlab.freedesktop.org/upower/upower/-/merge_requests/308
> I have tested this exact patch you posted on my Z13 last November. KDE
> does pick it up and display a warning.
Displaying a warning about the current limit not being recognised is what
is expected and correct behavior, not an ABI change: software isn't breaking.

You talked about setting (as in writing) the limit and that, as of now
(at least in KDE) is not possible.

There already exists widely in use software that changes the battery
level when started setting it to the previous value, so that warning
is not to be seen; moreover said class of software is going to earn
a new entry so I don't see any problem here.

Perhaps Ilpo has some more insights on the matter.

In addition to that, after the removal from the kernel of acpi_platform
asus-wmi ABI are going to change anyway, regardless of what I do.
> Which is why I settled with sending a fake 100 value instead and never
> upstreamed it.
>
> Antheas
>
>> since it has never worked there is nothing to break.
>>> Returning an error from this function when there is proper function is
>>> a slight ABI change compared to current drivers that implement this
>>> method.
>>>
>>> Thanks,
>>> Antheas
>>>
>>>>  }
>>>>
>>>>  static DEVICE_ATTR_RW(charge_control_end_threshold);
>>>> @@ -1580,11 +1583,11 @@ static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_batter
>>>>                 return -ENODEV;
>>>>
>>>>         /* The charge threshold is only reset when the system is power cycled,
>>>> -        * and we can't get the current threshold so let set it to 100% when
>>>> -        * a battery is added.
>>>> +        * and we can't read the current threshold, however the majority of
>>>> +        * platforms retains it, therefore signal the threshold as unknown
>>>> +        * until user explicitly sets it to a new value.
>>>>          */
>>>> -       asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, 100, NULL);
>>>> -       charge_end_threshold = 100;
>>>> +       charge_end_threshold = -1;
>>>>
>>>>         return 0;
>>>>  }
>>>> --
>>>> 2.53.0
>>>>
>>>>
