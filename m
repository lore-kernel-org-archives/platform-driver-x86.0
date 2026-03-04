Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE9B39769D
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 13:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772631433; cv=none; b=A74lrNxlfy5iIHj0iCW1fLTV0q3cSU2jE4m114GYPxS/IKrKOOyGg6vPT3cEfEFhhf/KnoOFsiWpAQu4IHQTGRm+O6SHSkFlMdF2sAhA6Te197lLhHyNdnHpGxbIjSAr6lAavcwmvwlHp3FOetLd8xOqV1ZG38SR62O95dV9PDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772631433; c=relaxed/simple;
	bh=zkjSsOBsL2BSpYn+aQE7AI3TMi+qLRLVddFYIVLMl2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AFZRee+0obRVOuTcoDCkI5VP/f/LKawuHmbPShmtoRIuM6nD7j570k6bMqjLQxFRXt/y8YtcqzjUmHj4yGhGPFGX/vB4aXAijO2Og0thlofoeGbB4OnWE/oDZAax24XIosJYg9w/EjjSK5a0bLS0RPs4wuwoOZ3VeEMssUoml9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=t2QQ5J/3; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="t2QQ5J/3"
Message-ID: <a934337f-9055-40b8-93ef-294fd5f0a0f6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772631418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EIj9XLBcfTDcgaXVrpNLzw13xcJ4Pj1kurSh3pRWHCA=;
	b=t2QQ5J/3TgtgDhxgrGGFMULWR04ru/dFW+PKnycVFS09ptDLHymXQEkyCjNFVZfJQUnZ1p
	taDJ9Kfdzu6NcjfAiyX0YC/njeZR8IkCR154vvULKMswiHF6G+yJRORzQU9J4Uxa/gL1we
	n4dOpQQf2bYhRDrnce7xOwkUtBW37c4=
Date: Wed, 4 Mar 2026 14:36:49 +0100
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
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <CAGwozwGhr6hwRz5jBkDGQrmJf9oK8FDE3dCE9_sAAChP5qrTGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 3/4/26 14:30, Antheas Kapenekakis wrote:
> On Wed, 4 Mar 2026 at 14:26, Denis Benato <denis.benato@linux.dev> wrote:
>> Users are complaining for the battery limit being reset at 100% during
>> the boot process while the general consensus appears to not apply
>> unsolecited hardware changes, therefore stop resetting the battery
> *unsolicited. But I would rephrase to using this causes the device to
> reset its limits on boot, which might have been set by e.g. windows so
> if userspace is not aware to restore them, this causes a functionality
> degradation. This is the case with the current implementation by KDE.
>
>> charge limit at boot and return -ENODATA on charge_end_threshold to
>> signal for an unknown limit.
>>
>> Suggested-by: Antheas Kapenekakis <lkml@antheas.dev>
>> Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>> ---
>>  drivers/platform/x86/asus-wmi.c | 13 ++++++++-----
>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 6ba49bd375df..dc330a8ee2f2 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -1557,7 +1557,10 @@ static ssize_t charge_control_end_threshold_show(struct device *device,
>>                                                  struct device_attribute *attr,
>>                                                  char *buf)
>>  {
>> -       return sysfs_emit(buf, "%d\n", charge_end_threshold);
>> +       if ((charge_end_threshold >= 0) && (charge_end_threshold <= 100))
>> +               return sysfs_emit(buf, "%d\n", charge_end_threshold);
>> +
>> +       return -ENODATA;
> Please verify this does not cause KDE to display a warning and block
> modifying the energy consumption. If it does as has been my
> experience, communicate with KDE devs or Gnome (if it has a similar
> issue) and block this from merging until there is a solution from
> their side.
KDE doesn't yet allow to modify that value as upower is not picking up batteries
with only end_threshold by default. Discussion is ongoing:

https://gitlab.freedesktop.org/upower/upower/-/merge_requests/308

since it has never worked there is nothing to break.
> Returning an error from this function when there is proper function is
> a slight ABI change compared to current drivers that implement this
> method.
>
> Thanks,
> Antheas
>
>>  }
>>
>>  static DEVICE_ATTR_RW(charge_control_end_threshold);
>> @@ -1580,11 +1583,11 @@ static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_batter
>>                 return -ENODEV;
>>
>>         /* The charge threshold is only reset when the system is power cycled,
>> -        * and we can't get the current threshold so let set it to 100% when
>> -        * a battery is added.
>> +        * and we can't read the current threshold, however the majority of
>> +        * platforms retains it, therefore signal the threshold as unknown
>> +        * until user explicitly sets it to a new value.
>>          */
>> -       asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, 100, NULL);
>> -       charge_end_threshold = 100;
>> +       charge_end_threshold = -1;
>>
>>         return 0;
>>  }
>> --
>> 2.53.0
>>
>>
