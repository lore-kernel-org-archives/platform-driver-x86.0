Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AACD2980A8
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Apr 2025 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362295; cv=none; b=X5toEf4AAG1RA3t5IaTRzs4Nb7rAOfLwJARuaiNj9rbGFZ/fqSIr6SNxFQu20kBgl5q5VV0nK+chdq42UAf5JBjHCYx69FUD3uDIuC4hoI56mV78fNc5lhv4g2KxMOElM9xP7iMl9G2cVCOXod6igl7SUns9AodJTvwmi5lZ7BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362295; c=relaxed/simple;
	bh=KFO3BDVhpvS+l3rn6mb+9gfxN5lLzHhWxQU19VNMRxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TNRr2PtUtITWGtKgkxsVosayOMmx7U53eWcrZl0464f0KhvBJvGrlkN8XzavNyaEnarTXxP85uXXXcG8qlDL7+VjBbIOCXxEHDnCknpAFOz47LYa6OyhBsf0MxXRK7WS07F8OdoyhAFxH5H36bddc2QldUGu7X9BoVvmoR4ZBBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvFMe4US; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvFMe4US"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5568355ffso151523485a.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Apr 2025 02:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744362291; x=1744967091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bYcJIR4aAuR5lVMMqkgn0XJNd1hlz2S9ObgYWC7XAYA=;
        b=YvFMe4USVRTVZmudbSivW1gweEphbNqfuv9t60h2bfpYO0GtXJ1fu3jeAQ/pPM+rPt
         lHo1IEy9zzj9j9DobMMfpcBM+wqFNAssMtEjkhy2qSkAVsmGmBcYg49ZgUw187YTmmGG
         VKk/5u+tMw9CGyLgh2baaEBkqfIbT12yTbPNpVxrsdQt9KpeLLoAsIkwEQa58NtKrYuO
         rvMzDYlkOtBK5KxPmLL0uA3lON0w4AH6JSz9KJZW3CZRCt4QNxf1U23PYRhL0WNHx6Aj
         T/2RKqL5odGwAl4cEw2XH8tnziNC+lzkbuZkrwPkPT07IqAGIaQfTkerVykdBISsH4nX
         zdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744362291; x=1744967091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bYcJIR4aAuR5lVMMqkgn0XJNd1hlz2S9ObgYWC7XAYA=;
        b=w4BZ+KuL0w3ISkdSiPGqyTph7FUcGl0SMTgkddjE6mo63mO7eMt6/s1S8ofXR3eN26
         QQ8gKXU2oZ4smrYdXKXdUuc+c4gEM7b7F03Snb5g5e4+ftbYBRMg0g4/w3GY82rxFgPI
         hgsQ6Pv3BYNvFiZdl+guN4T0HZKFu8Oilp34BX0Jk12TNYVnxxrGVezjGD0D/yzzWPVt
         Mwc4AAMrQikZClFZ4H4e6gLx0NMDGgDkMNac3BuNXtn82rKY1qObFpWYhi+CZydPSRyI
         AuFhXeiF/P0B0b1g9bm7gGA6NuZLhqi1l67dkmMTRtYTiGbwzqsFmDDMf5PY7wHcw+ji
         siTw==
X-Gm-Message-State: AOJu0Yxd8erYo0W+e2xLhUjw98Z/rB6D/CYpdFx1v3mr8wQCYqJk6Ev+
	HwbOnGFTQ/nWyy/sirhl5BZ/dZj2/Qpkh1RpOsTQVfITg28Zi9Uy
X-Gm-Gg: ASbGncsWknQnWiHtDV7jl4W+2tlG5ldFvVk7ogDQ2nR5MKvEFWWfxjNtnzID+rnN0nH
	UUReATaQdUZnfWZO7DVqxfZ2LJjXl7e6Dtr0Id5vMj7wvZCRSAsxQecj2BmVVpucuVM79fNBN5Y
	/zuVGDGCqGcFWJGcmbjavinEp1cBn/bHOyTpNV96gUvo55xcUbuP9jsQ1e5Fa0XVFWJEJzrUOs8
	18wQoJ757xhmucgG+iYtvFAD9ARNoSbH96Omcbd7sNKkvIXy/DGbDb5nJNLv0EX97u7AXjnZwAJ
	yvnqOc1MBsaJCTnb4k7arb2WkVz4YHEU/YABLHlogOaV4qdnEwQPzBAWlfbsuqLVI9pf7Mss2sK
	EiGd0Hj1IvmeknKrcsFQ=
X-Google-Smtp-Source: AGHT+IEPWBDjZxLgX93/KYwK13hnjOGFdO72L0gh5NZ2mkf4rp46U8wAEFGzBK74Ry3vKpH0ytavrw==
X-Received: by 2002:a05:620a:8009:b0:7c5:3d85:728f with SMTP id af79cd13be357-7c7af0e2355mr387913085a.25.1744362291065;
        Fri, 11 Apr 2025 02:04:51 -0700 (PDT)
Received: from [10.131.178.61] (zz20234032476F6CA7C6.userreverse.dion.ne.jp. [111.108.167.198])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a0de38sm231678785a.102.2025.04.11.02.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:04:50 -0700 (PDT)
Message-ID: <414df5c8-738a-4941-a8af-06b466958389@gmail.com>
Date: Fri, 11 Apr 2025 18:02:31 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: Add support for new hotkey
 for camera shutter switch
To: Hans de Goede <hdegoede@redhat.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net,
 Nitin Joshi1 <njoshi1@lenovo.com>
References: <20250403053127.4777-1-nitjoshi@gmail.com>
 <dbb95bde-8163-4799-8414-c60ba1c69aa5@redhat.com>
 <cf577f4d-ebfe-4b23-b918-2d59d9e81271@gmail.com>
 <f3f53d44-379a-42a4-9638-9e8532a83624@redhat.com>
 <0b0f51ab-667e-4497-8f24-2b9433427d1c@gmail.com>
 <255bb094-ad3a-4711-866f-659b2687c929@app.fastmail.com>
 <f9256d26-6d74-4526-8ec8-3ea7edd01792@gmail.com>
 <c56025c9-da1a-428f-b5cf-4c3f0f9f51d6@redhat.com>
Content-Language: en-US
From: Nitin Joshi <nitjoshi@gmail.com>
In-Reply-To: <c56025c9-da1a-428f-b5cf-4c3f0f9f51d6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Hans,

Thank you for your comments.
I am still confirming details and Sorry, its taking some time .
I will reply below message after confirming.

Thanks & Regards,
Nitin Joshi

On 4/7/25 22:24, Hans de Goede wrote:
> Hi Nitin,
> 
> On 7-Apr-25 05:27, Nitin Joshi wrote:
>> Hello Mark,
>>
>> On 4/5/25 04:23, Mark Pearson wrote:
>>> Hi Nitin,
>>>
>>> On Fri, Apr 4, 2025, at 5:02 AM, Nitin Joshi wrote:
>>>> Hello Hans,
>>>>
>>>> On 4/4/25 16:25, Hans de Goede wrote:
>>>>> Hi Nitin,
>>>>>
>>>>> On 4-Apr-25 8:44 AM, Nitin Joshi wrote:
>>>>>> Hello Hans,
>>>>>>
>>>>>> Thank you for reviewing patch.
>>>>>>
>>>>>> On 4/3/25 19:34, Hans de Goede wrote:
>>>>>>> Hi Nitin,
>>>>>>>
>>>>>>> On 3-Apr-25 7:31 AM, Nitin Joshi wrote:
>>>>>>>> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
>>>>>>>> has new shortcut on F9 key i.e to switch camera shutter and it
>>>>>>>> send a new 0x131b hkey event when F9 key is pressed.
>>>>>>>>
>>>>>>>> This commit adds support for new hkey 0x131b.
>>>>>>>> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
>>>>>>>
>>>>>>> Does the EC also actually enable/disable the camera in response to
>>>>>>> this new hotkey, or is this purely a request to userspace / the OS
>>>>>>> to enable/disable the camera
>>>>>> Enable/disable is actually being done by EC. Camera enablement for these products are still in testing phase.
>>>>>> ?
>>>>>
>>>>> Ok, I assume we can also get the state (enabled vs disabled)
>>>>> e.g. from the event? In that case the events should be reported using
>>>>> EV_SW, SW_CAMERA_LENS_COVER and we should also get the initial
>>>>> state and set the switch to the initial state before registering
>>>>> the input device.
>>>> Enable/Disable status will be determine in IPU side which receives
>>>> notification from EC. So, the only way to determine the status would be
>>>> to determine the status in IPU side.
>>>> So, purpose of this patch will only to avoid "unhandled hkey event"
>>>> error from thinkpad_acpi driver.
>>>> Please let me know, if i am missing something.
> 
> We don't want to just avoid the "unhandled hkey event" message,
> we also want to send an event to userspace that the camera has
> been enabled or disabled, including information if it is
> being enabled or being disabled. This way userspace can show an OSD
> indicating that the camera has been enabled/disabled similar to how
> we do this when e.g. the mic is muted.
> 
> This must be reported to userspace using SW_CAMERA_LENS_COVER, which is
> what all kernel code which reports camera shutter state
> (be it a true shutter or hw blacking out of the image) is using now.
> 
> Or maybe the IPU6 driver itself can report SW_CAMERA_LENS_COVER,
> assuming the IPU6 driver also receives an event when the camera
> shutter status changes ?
> 
>>> I hadn't thought about this - but we need to be able to track the status to make sure (eventually) that the right status gets displayed in userspace. It would be bad if it was out of sync with the IPU.
>>>
>>> Is the initial status always going to be disabled, or do we need a mechanism from Intel to probe the current status?
>>
>> I need to check regarding this but AFAIK, we don't have any other mechanism to probe current status. Also , there was some security concern involved in this which i need to clarify.
> 
> I don't see how userspace knowing if the shutter is in open/closed
> state impacts security. Userspace still cannot control the shutter.
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
>>>>>>>> ---
>>>>>>>>      drivers/platform/x86/thinkpad_acpi.c | 2 ++
>>>>>>>>      1 file changed, 2 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>>>>>>>> index 0384cf311878..80f77f9c7a58 100644
>>>>>>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>>>>>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>>>>>>> @@ -182,6 +182,7 @@ enum tpacpi_hkey_event_t {
>>>>>>>>                                 * directly in the sparse-keymap.
>>>>>>>>                                 */
>>>>>>>>          TP_HKEY_EV_AMT_TOGGLE        = 0x131a, /* Toggle AMT on/off */
>>>>>>>> +    TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
>>>>>>>>          TP_HKEY_EV_DOUBLETAP_TOGGLE    = 0x131c, /* Toggle trackpoint doubletap on/off */
>>>>>>>>          TP_HKEY_EV_PROFILE_TOGGLE    = 0x131f, /* Toggle platform profile in 2024 systems */
>>>>>>>>          TP_HKEY_EV_PROFILE_TOGGLE2    = 0x1401, /* Toggle platform profile in 2025 + systems */
>>>>>>>> @@ -3271,6 +3272,7 @@ static const struct key_entry keymap_lenovo[] __initconst = {
>>>>>>>>           * after switching to sparse keymap support. The mappings above use translated
>>>>>>>>           * scancodes to preserve uAPI compatibility, see tpacpi_input_send_key().
>>>>>>>>           */
>>>>>>>> +    { KE_KEY, TP_HKEY_EV_CAMERASHUTTER_TOGGLE, { KEY_CAMERA_ACCESS_TOGGLE } },
>>>>>>>>          { KE_KEY, 0x131d, { KEY_VENDOR } }, /* System debug info, similar to old ThinkPad key */
>>>>>>>>          { KE_KEY, 0x1320, { KEY_LINK_PHONE } },
>>>>>>>>          { KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
>>>>>>>
>>>>>>
>>>>>
>>
> 

