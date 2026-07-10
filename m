Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B7A425CF7
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 12:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688082; cv=none; b=NPygQHq9iz5VticQz0+slnw3MwINekz6G3L5LQAW05jVI9NqgKIjDHRDEhntSPDr1+LhXKeRIUX+scapjuFcdlsfmTmuGpoIaeNX4k4nQr4cZLmr6DgS2mzrnhca8hIGQxZl7tLhNVBF1LA13H6/vTPWd/fIofCzSCpVOMFh67w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688082; c=relaxed/simple;
	bh=SRAj9AK+XuyjUQ94I+jmo2euB8RSF0Q4hWhU4G5s2Uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JdZoW+4Nhqtr/KR2NeqSzeDBE7ReW2IqWS3mqhLrtS+3GCdqxMCT81eVk9VnGrIYSfAo6IPyTLCS5+GXgb9JKgPy7J1pvX0kuphF6AIO7yleTHcUunO6Y9YnRSXwPjfBLw0/zdIzRNRLgFy9WE2VLxinbaJRCb7KDj/7QqYddTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=v8omxtr/; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="v8omxtr/"
Message-ID: <55b49ea7-6f1b-4a6a-af8a-1df66a41d05f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783688076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SRAj9AK+XuyjUQ94I+jmo2euB8RSF0Q4hWhU4G5s2Uo=;
	b=v8omxtr/Ppu9yne4JOnzEDHNkKJrRMAO+EbJgDWtMsTE6lZaelNQRpCBXh4dKBGk6KwKHt
	wnajHCu/bfOTOlQ9rUBnmeiZBzB9ZnCho7jfXDtomu2qX1yWRx+cVJPbVVfEx/Y/EsiIsn
	0agwWPmr747F7kHGT3G+ntbcZKM5xmk=
Date: Fri, 10 Jul 2026 14:54:13 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] platform/x86: asus-wmi: temporarily revert to setting a
 charge limit
To: Kate Hsuan <hpa@redhat.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 "Luke D . Jones" <luke@ljones.dev>, Denis Benato <benato.denis96@gmail.com>,
 Travers Biddle <traversbiddle@gmail.com>
References: <20260630230940.612532-1-denis.benato@linux.dev>
 <5db117b7-aad1-437f-a3d4-ba7b29fc68b3@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <5db117b7-aad1-437f-a3d4-ba7b29fc68b3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 7/9/26 05:52, Kate Hsuan wrote:
> Hi Denis,
>
> Upower 1.91.3 has been released, including a fix for issue #347 [1]. This release addresses the -ENODATA  encountered when accessing charge limits on Asus laptops, which previously caused UPower and GNOME to incorrectly report charge threshold support as unavailable. The fix updates the udev rule to verify file existence rather than reading the attribute directly. The corresponding commit can be found at:
>
> https://gitlab.freedesktop.org/upower/upower/-/commit/83f86c75d28a57854a4b5986cbfb701249a5b6ad
>
> [1] https://gitlab.freedesktop.org/upower/upower/-/work_items/347
>
> Thank you :) 
>
Thank you very much Hsuan!

Ilpo: what do we do now? I am preparing the fixed patch to revert this for stable and will soon send it.

How much do we wait to revert the revert? Or do I simply Cc stable and you don't pick the revert
in the newer kernel? In any case just say what I need to do and I'll do it.

Thanks,
Denis

> On 6/30/26 7:09 PM, Denis Benato wrote:
>> A userspace regression has been observed leaving the battery charging
>> threshold unconfigured, so while the situation is being sorted revert
>> the change keeping the infrastructure in place to return to the
>> preferred behaviour whenever possible.
>>
>> Link: https://gitlab.freedesktop.org/upower/upower/-/work_items/347
>> Closes: https://lore.kernel.org/all/CABsFS_g+V_Owum6knLhenhM15EXJRrsF0FcLiw30WZxarsTpUA@mail.gmail.com/
>>
>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>> ---
>>   drivers/platform/x86/asus-wmi.c | 26 +++++++++++++++++++++++---
>>   1 file changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 3c9ef826551d..e835779b6f5f 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -1618,6 +1618,8 @@ static DEVICE_ATTR_RW(charge_control_end_threshold);
>>     static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_battery_hook *hook)
>>   {
>> +    int ret, rv;
>> +
>>       /* The WMI method does not provide a way to specific a battery, so we
>>        * just assume it is the first battery.
>>        * Note: On some newer ASUS laptops (Zenbook UM431DA), the primary/first
>> @@ -1635,12 +1637,30 @@ static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_batter
>>         /* The charge threshold is only reset when the system is power cycled,
>>        * and we can't read the current threshold, however the majority of
>> -     * platforms retains it, therefore signal the threshold as unknown
>> -     * until user explicitly sets it to a new value.
>> +     * platforms retains it.
>> +     *
>> +     * Setting a negative value would signal the threshold as unknown
>> +     * until user explicitly sets it to a new value, however to avoid
>> +     * regressing userspace, we initialize it to a value of 100.
>>        */
>> -    charge_end_threshold = -1;
>> +    charge_end_threshold = 100;
>> +    ret = asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, charge_end_threshold, &rv);
>> +    if (ret) {
>> +        pr_err("Failed to reset battery charge threshold\n");
>> +        goto asus_wmi_battery_add_err;
>> +    }
>> +
>> +    if (rv != 1) {
>> +        pr_err("Error in battery charge threshold reset\n");
>> +        ret = -EIO;
>> +        goto asus_wmi_battery_add_err;
>> +    }
>>         return 0;
>> +asus_wmi_battery_add_err:
>> +    device_remove_file(&battery->dev,
>> +               &dev_attr_charge_control_end_threshold);
>> +    return ret;
>>   }
>>     static int asus_wmi_battery_remove(struct power_supply *battery, struct acpi_battery_hook *hook)
>
