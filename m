Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7282E62B6
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Apr 2025 07:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743751563; cv=none; b=uhsGoikgrFsTgheJsJCoRZ6d/NFZeK35T+OMpjUTTtfYDkTmN231wJKk+llRXbnR0ZZyf4GFCvE+WoG/GW4tS66/few6cq24F/dYSncoZu2VJYRQ8VhJlU+aiy+qS+X5A/BGwsnHZyHvxJaVNSWHUi9lB1kqrlaKE6vsFKxrQIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743751563; c=relaxed/simple;
	bh=Yh43vxbzsp8Tbqr3BUMyC+y4vAqASwCO84Y2nsnK5Qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=csXWM2do6Zn5eT/6ibXJeZkCYktpsoYSqIk+N3lgKOzsqaI7K6aOkClDa2hkWtx+AYxsGpBHXo2es0C6KWuqfspgACVTjx1IoROBrZHJl1la6UNkE8G1hjhNq+kTVU2vb/BiWIQqEsELwqMV3Ws1c4YJHehJ4CrcsXXL1cdBzDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N5tL8pC7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N5tL8pC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743751560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6E6a0zcxJzbzPV5Gn2TbrJkt+nY4haYA/0m6ZvbKEjQ=;
	b=N5tL8pC7dN1My7XO6SDT989QSPok4Cqj8MW4tQFOFomDOCsCRODrSvRfi1+zAIoTg92xlF
	QJhqI4igFP/HW6mc5FKgaaj6d6CSvHL9Yw6xVWX6fDfKEIeG0Lq7zskqq0FqdrGyMnQ0h9
	+pEr1Zz9RisZ9688jfSgVB02MjdSmH4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-amt5yj7NOTak2UV-lcYniQ-1; Fri, 04 Apr 2025 03:25:58 -0400
X-MC-Unique: amt5yj7NOTak2UV-lcYniQ-1
X-Mimecast-MFC-AGG-ID: amt5yj7NOTak2UV-lcYniQ_1743751557
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac3e0c1336dso124925766b.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Apr 2025 00:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743751557; x=1744356357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6E6a0zcxJzbzPV5Gn2TbrJkt+nY4haYA/0m6ZvbKEjQ=;
        b=VcV38uvbnQZecAdCOG7l4oGNa2SbS4fAkrFa61e2rs3Spba8fdaRtIAQIzGKyeuzEH
         z1CUFsAk2plDCcqKd48NyQF8UHviaBl01+9bRm1wuqh6Rdwh60Ftgff+ph2itlgrhHdq
         30laYOSL4QoFFNr5eO6MxmPjBvWhq5zS9BqpKBofFDT32E1ZbLNlX8bkysiERQeV7Kxe
         V8lhmx1EN2FNSOVJAnrvU7boPaVQCb5lelNDFLvad9YQf0L702t8bzHSHncdmRZUPu3i
         iQU+COLjWs7V1VXwleU0Vl+giZq3PgBV+F7lsKq2Y5BKgb1N/25qEm4odMXY8GORRI3j
         oY/w==
X-Gm-Message-State: AOJu0Yykgt1PijBfqp7LYcenacC2UV1INhFqGQEvKH87x3TUhC9m5Bgb
	foxWzDlK2hXTva3xq1Pt8ktPMfVC6bzXV5KiLpWzUeV38I8LG/bKx8Rw9LcFCRoASAMnIcVyPqK
	89NZ+dAmh8S5Rsvlwg8wYn7oGbLT1i3tlzWl142WAlByhW53HB/2CVJSnxPMXJCM4kJlXleQ=
X-Gm-Gg: ASbGncuCBBTqE1Sk5+px8pQP62lpbUVzV/nX8VaecflgdtmzcWwzffCBd8yunwWjuKR
	r0j6pr0vjm9EfhVuP+aE0qMyxPgJ2KrMZX3R07/b8SzPQOMIHO2khKSLhlztlgSsGxUut/IcQiB
	K8oTTjRDRqGz95QsqUYIaVWkS0t0N6AmF1+xjI/fqDxd5sqoLa+M3csTHWrwu8jbaZvbsZFvYGf
	NKbcKFVI+L8X04jXeseUOcHkXVohSUDLB7faGzoIxRTy171h2pQCNSfv8S/gr6MUPUOxHFvjy1k
	Qu1/rToDR0thODqksNZm7OUU1r08ibYJ2ABqICvj8UoHI45mwrpWKIr/8Zm8Au8E4BxrBZ1eM6U
	ejcX/jfp354Gf1jsk5ngbjQ1wccNqlrZqJtVnOErec8kcg4jHnb27v94uzK493P8blA==
X-Received: by 2002:a17:907:6e90:b0:ac3:121e:f2cb with SMTP id a640c23a62f3a-ac7d16bc073mr221566966b.1.1743751557430;
        Fri, 04 Apr 2025 00:25:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3xX6cJ0ZuIBD0jeNhqgsPhwmbj5rfBAgKK+ofJXZ7lsbB8oxwIRwRWyGI5aXrOiRqZ5jBnQ==
X-Received: by 2002:a17:907:6e90:b0:ac3:121e:f2cb with SMTP id a640c23a62f3a-ac7d16bc073mr221565166b.1.1743751557047;
        Fri, 04 Apr 2025 00:25:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d6absm212679766b.16.2025.04.04.00.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 00:25:56 -0700 (PDT)
Message-ID: <f3f53d44-379a-42a4-9638-9e8532a83624@redhat.com>
Date: Fri, 4 Apr 2025 09:25:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: Add support for new hotkey
 for camera shutter switch
To: Nitin Joshi <nitjoshi@gmail.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com,
 mpearson-lenovo@squebb.ca
References: <20250403053127.4777-1-nitjoshi@gmail.com>
 <dbb95bde-8163-4799-8414-c60ba1c69aa5@redhat.com>
 <cf577f4d-ebfe-4b23-b918-2d59d9e81271@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <cf577f4d-ebfe-4b23-b918-2d59d9e81271@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nitin,

On 4-Apr-25 8:44 AM, Nitin Joshi wrote:
> Hello Hans,
> 
> Thank you for reviewing patch.
> 
> On 4/3/25 19:34, Hans de Goede wrote:
>> Hi Nitin,
>>
>> On 3-Apr-25 7:31 AM, Nitin Joshi wrote:
>>> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
>>> has new shortcut on F9 key i.e to switch camera shutter and it
>>> send a new 0x131b hkey event when F9 key is pressed.
>>>
>>> This commit adds support for new hkey 0x131b.
>>> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
>>
>> Does the EC also actually enable/disable the camera in response to
>> this new hotkey, or is this purely a request to userspace / the OS
>> to enable/disable the camera
> Enable/disable is actually being done by EC. Camera enablement for these products are still in testing phase.
> ?

Ok, I assume we can also get the state (enabled vs disabled)
e.g. from the event? In that case the events should be reported using
EV_SW, SW_CAMERA_LENS_COVER and we should also get the initial
state and set the switch to the initial state before registering
the input device.

Regards,

Hans




>>> ---
>>>   drivers/platform/x86/thinkpad_acpi.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>>> index 0384cf311878..80f77f9c7a58 100644
>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>> @@ -182,6 +182,7 @@ enum tpacpi_hkey_event_t {
>>>                              * directly in the sparse-keymap.
>>>                              */
>>>       TP_HKEY_EV_AMT_TOGGLE        = 0x131a, /* Toggle AMT on/off */
>>> +    TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
>>>       TP_HKEY_EV_DOUBLETAP_TOGGLE    = 0x131c, /* Toggle trackpoint doubletap on/off */
>>>       TP_HKEY_EV_PROFILE_TOGGLE    = 0x131f, /* Toggle platform profile in 2024 systems */
>>>       TP_HKEY_EV_PROFILE_TOGGLE2    = 0x1401, /* Toggle platform profile in 2025 + systems */
>>> @@ -3271,6 +3272,7 @@ static const struct key_entry keymap_lenovo[] __initconst = {
>>>        * after switching to sparse keymap support. The mappings above use translated
>>>        * scancodes to preserve uAPI compatibility, see tpacpi_input_send_key().
>>>        */
>>> +    { KE_KEY, TP_HKEY_EV_CAMERASHUTTER_TOGGLE, { KEY_CAMERA_ACCESS_TOGGLE } },
>>>       { KE_KEY, 0x131d, { KEY_VENDOR } }, /* System debug info, similar to old ThinkPad key */
>>>       { KE_KEY, 0x1320, { KEY_LINK_PHONE } },
>>>       { KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
>>
> 

